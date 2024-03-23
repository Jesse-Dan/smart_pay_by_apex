// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/logic/handler/handlers/error_handler.dart';
import 'package:smart_pay_by_apex/src/logic/handler/handlers/loading_handler.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/views/app/home/logout/index.dart';
import 'package:smart_pay_by_apex/src/views/app/secret_history_view.dart';
import 'package:smart_pay_by_apex/src/views/auth/signin/bloc/index.dart';
import 'package:smart_pay_by_apex/src/views/auth/signin/signin_view.dart';

import '../../../logic/services/local_storage_service.dart';
import '../../auth/models/auth_response.dart';
import '../../auth/signin/sign_in_with_pin.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_dimentions.dart';
import '../../utils/components/app_button.dart';
import '../../utils/components/header_widget.dart';
import '../../utils/constants.dart';
import '../../utils/enums.dart';
import '../../utils/helpers/image_view_helper.dart';
import '../../utils/style/app_colors.dart';
import 'bloc/index.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/HomeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _homeBloc = HomeBloc(const InitialHomeState());

  final _authBloc = SignInBloc(const InitialAuthState());

  final _logoutBloc = LogoutBloc(const UnLogoutState());

  @override
  void initState() {
    _homeBloc.add(LoadBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      bloc: _authBloc,
      listener: (BuildContext context, SignInState state) {},
      builder: (context, authState) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.kprimary,
            onPressed: () {
              _homeBloc.add(LoadBlocEvent());
            },
            label: Text('Get new secret',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.20000000298023224,
                    color: AppColors.kgrey900)),
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimentions.k16,
                vertical: AppDimentions.k12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: ImageViewer(
                        height: 80,
                        width: 80,
                        imagePath: AppAsset.recoveryPerson),
                  ),
                  AppDimentions.verticalSpace(AppDimentions.k26),
                  HeaderWidget(
                    centerItems: true,
                    context,
                    title:
                        'Welcome ${User.getPresentUser()?.fullName ?? 'error fetching Full Name'}',
                    subTitleWidget: Text.rich(
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.20000000298023224,
                          color: AppColors.kgrey500),
                      textAlign: TextAlign.left,
                      TextSpan(
                        children: [
                          const TextSpan(text: 'Registered email: '),
                          TextSpan(
                            text:
                                '(${User.getPresentUser()?.email ?? 'error fetching Email'})',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.20000000298023224,
                                    color: AppColors.kprimary),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocConsumer<HomeBloc, HomeState>(
                      bloc: _homeBloc,
                      listener: (context, state) {
                        // Use null-aware operators for safe navigation
                        var secret = (state is LoadedHomeState)
                            ? state.response.data?.secret
                            : null;

                        var allSecrets = LocalStorageService.getList(
                          Constants.secretHistory(User.getPresentUser()?.email),
                        );

                        if (secret != null && allSecrets.isEmpty) {
                          LocalStorageService.setList(
                              Constants.secretHistory(
                                  User.getPresentUser()?.email),
                              [secret]);
                        } else {
                          if (secret != null) {
                            allSecrets.add(secret);
                            LocalStorageService.setList(
                              Constants.secretHistory(
                                  User.getPresentUser()?.email),
                              allSecrets,
                            );
                          }
                        }

                        Logger.log(
                            tag: Tag.DEBUG,
                            message: 'All Secret: ' + allSecrets.toString());
                      },
                      builder: (context, state) {
                        var isLoading = state is LoadinglHomeState;

                        var secret = (state is LoadedHomeState)
                            ? state.response.data?.secret
                            : null;
                        if (isLoading) {
                          return SecretCard(
                              onPressed: () {}, secret: 'Loading...');
                        }

                        return SecretCard(
                          onPressed: () {},
                          secret: secret ?? 'Failed to get new Secret',
                        );
                      }),
                  AppDimentions.verticalSpace(AppDimentions.k26 * 3.5),
                  AppButton(
                    buttonType: ButtonType.LONG_BTN,
                    flex: true,
                    applyMargin: true,
                    btnText: 'View Secret History',
                    onTap: () {
                      Go(context).to(routeName: SecretHistoryView.routeName);
                    },
                  ),
                  AppDimentions.verticalSpace(AppDimentions.k10 - 4),
                  BlocListener<LogoutBloc, LogoutState>(
                    bloc: _logoutBloc,
                    listener: (context, state) {
                      if (state is LoadingLogoutState) {
                        LoadingHandler(context: context);
                      }

                      if (state is ErrorLogoutState) {
                        Go(context).pop();
                        ErrorHandler(
                            context: context,
                            message: state.errorMessage,
                            handlerBtnCount: HandlerBtnCount.one,
                            callBackTextOne: 'Okay');
                      }

                      if (state is InLogoutState) {
                        Go(context).pop();
                        String? previousUserPin = LocalStorageService.getString(
                            Constants.securePin(User.getPresentUser()?.email));
                        String? userBearerToken = LocalStorageService.getString(
                            Constants.bearerToken);
                        User? user = User.getPresentUser();
                        if (!(previousUserPin.isEmpty &&
                            userBearerToken.isEmpty &&
                            user != null)) {
                          Go(context).toAndReplaceAllNamedRoute(
                              routeName: SignInWithPincodeView.routeName);
                        } else {
                          Go(context).to(routeName: SigninView.routeName);
                        }
                      }
                    },
                    child: AppButton(
                      buttonType: ButtonType.LONG_BTN,
                      flex: true,
                      applyMargin: true,
                      btnText: 'Logout',
                      onTap: () {
                        _logoutBloc.add(LoadLogoutEvent());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SecretCard extends StatelessWidget {
  final String secret;
  final void Function()? onPressed;
  const SecretCard({
    super.key,
    required this.secret,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kgrey200,
          borderRadius: BorderRadius.circular(AppDimentions.k16)),
      padding: EdgeInsets.all(AppDimentions.k18),
      margin: EdgeInsets.only(top: AppDimentions.k10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  !secret.contains('-') ? 'Loading...' : secret.split(' - ')[1],
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.20000000298023224,
                      color: AppColors.kgrey900),
                ),
                Text(
                  !secret.contains('-') ? 'Loading...' : secret.split('-')[0],
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.20000000298023224,
                      color: AppColors.kgrey500),
                ),
              ],
            ),
          ),
          AppDimentions.horizontalSpace(),
          onPressed == null
              ? IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.delete,
                    size: 20,
                  ))
              : const ImageViewer(
                  height: 20, width: 20, imagePath: AppAsset.check)
        ],
      ),
    );
  }
}
