// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_navigator/go.dart';
import 'package:smart_pay_by_apex/src/logic/logger/logger.dart';
import 'package:smart_pay_by_apex/src/views/auth/signup/set_pincode_view.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_button.dart';
import 'package:smart_pay_by_apex/src/views/utils/components/app_text_field.dart';
import 'package:smart_pay_by_apex/src/views/utils/enums.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';
import 'package:smart_pay_by_apex/src/views/utils/style/app_colors.dart';

import '../../../utils/components/back_button.dart';
import '../../../utils/components/header_widget.dart';

class AboutSelfView extends StatefulWidget {
  static const String routeName = '/AboutSelfView';
  const AboutSelfView({super.key});

  @override
  State<AboutSelfView> createState() => _AboutSelfViewState();
}

class _AboutSelfViewState extends State<AboutSelfView> {
  final firstNameCtl = TextEditingController();
  final userNameCtl = TextEditingController();
  final countryCtl = TextEditingController();
  final passwordCtl = TextEditingController();
  final searchCtl = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool showPassword = true;

  Country? selctedCountry;

  Countries searchedCountries = [];

  List<Country> _buildSearchList(String userSearchTerm) {
    Logger.log(tag: Tag.DEBUG, message: 'Searching...');
    Logger.log(tag: Tag.DEBUG, message: 'Searching... Val: $userSearchTerm');
    List<Country> searchList = [];

    for (int i = 0; i < Country.countries.length; i++) {
      String name = Country.countries[i].country;
      if (name.toLowerCase().contains(userSearchTerm.toLowerCase())) {
        searchList.add(Country.countries[i]);
      }
    }
    Logger.log(
        tag: Tag.DEBUG, message: 'Searching Result: ${searchList.toString()}');
    return searchList;
  }

  Widget listItem(Country country, bool isSelected) {
    return Container(
      height: 64,
      width: double.infinity,
      margin: EdgeInsets.only(top: AppDimentions.k12),
      padding: EdgeInsets.all(AppDimentions.k16),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimentions.k16),
              color: AppColors.kgrey100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageViewer(imagePath: country.flagUrl),
          AppDimentions.horizontalSpace(),
          Text(country.tag,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.20000000298023224,
                  color: AppColors.kgrey300)),
          AppDimentions.horizontalSpace(),
          Expanded(
              child: Text(country.country,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.20000000298023224,
                      color: AppColors.kprimaryColor))),
          Visibility(
              visible: isSelected,
              child: ImageViewer(imagePath: AppAsset.selectedCountryMarker))
        ],
      ),
    );
  }

  Widget countriesList() {
    final Countries countriesToShow =
        searchedCountries.isEmpty ? Country.countries : searchedCountries;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: countriesToShow.length,
      itemBuilder: (ctx, i) => GestureDetector(
        onTap: () {
          setState(() => selctedCountry = Country.countries[i]);
          Go(context).pop();
        },
        child: listItem(
          countriesToShow[i],
          selctedCountry == countriesToShow[i],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    countryCtl.text = selctedCountry?.country ?? '';
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimentions.k16,
            vertical: AppDimentions.k12,
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                backButton(context),
                HeaderWidget(
                  context,
                  titleWidget: Text.rich(
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.20000000298023224,
                        color: AppColors.kgrey900),
                    TextSpan(
                      children: [
                        TextSpan(text: 'Hey there! tell us a bit about '),
                        TextSpan(
                          text: 'yourself',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.20000000298023224,
                                  color: AppColors.kprimary),
                        ),
                      ],
                    ),
                  ),
                ),
                AppTextField(hintText: 'Full name', controller: firstNameCtl),
                AppTextField(hintText: 'Username', controller: userNameCtl),
                AppTextField(
                    prefix: selctedCountry != null
                        ? Padding(
                            padding: EdgeInsets.all(AppDimentions.k10 - 2),
                            child: ImageViewer(
                                fit: BoxFit.fill,
                                height: 24,
                                width: 32,
                                imagePath: selctedCountry!.flagUrl),
                          )
                        : null,
                    hintText: 'Select Country',
                    controller: countryCtl,
                    readOnly: true,
                    onTap: () {
                      _contriesView(context);
                    },
                    suffix: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: ImageViewer(
                        height: 20,
                        width: 20,
                        imagePath: AppAsset.dropDownIcon,
                        color: AppColors.kgrey500,
                      ),
                    )),
                AppTextField(
                    obscureText: showPassword,
                    hintText: 'Password',
                    controller: passwordCtl,
                    textFieldType: TextFieldType.PASSWORD,
                    onSufficIconClicked: () =>
                        setState(() => showPassword = !showPassword),
                    onChanged: (p0) {
                      setState(() {});
                    },
                    fieldTextStyle: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(
                            color: AppColors.kprimaryColor,
                            fontSize: passwordCtl.text.isEmpty ? 14 : 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: passwordCtl.text.isEmpty ? 1 : 3)),
                AppDimentions.verticalSpace(AppDimentions.large),
                AppButton(
                  buttonType: ButtonType.LONG_BTN,
                  flex: true,
                  applyMargin: false,
                  btnText: 'Continue',
                  onTap: () {
                    Go(context).to(routeName: SetPincodeView.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _contriesView(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter useState) {
            return DraggableScrollableSheet(
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  padding: EdgeInsets.all(AppDimentions.k16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width - 36,
                        color: AppColors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: searchCtl,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      color: AppColors.kprimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                onChanged: (value) {
                                  useState(() {
                                    searchedCountries = _buildSearchList(value);
                                  });
                                },
                                decoration: InputDecoration(
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: AppColors.kgrey400,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    filled: true,
                                    fillColor: AppColors.kgrey100,
                                    prefixIcon: Padding(
                                      padding:
                                          EdgeInsets.all(AppDimentions.k10),
                                      child: ImageViewer(
                                          height: 20,
                                          width: 20,
                                          imagePath:
                                              AppAsset.searchFieldPrefix),
                                    ),
                                    hintText: 'Search',
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.kgrey100),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.kgrey100),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors.kgrey100),
                                        borderRadius:
                                            BorderRadius.circular(16))),
                              ),
                            ),
                            AppDimentions.horizontalSpace(),
                            TextButton(
                              onPressed: () {
                                searchedCountries.clear();
                                searchCtl.clear();
                                Go(context).pop();
                              },
                              child: Text('Cancel',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                        color: AppColors.kprimaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      )),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: searchedCountries.isNotEmpty
                              ? searchedCountries.length
                              : Country.countries.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                useState(() {
                                  Logger.log(
                                      tag: Tag.DEBUG,
                                      message: selctedCountry?.country ?? '');
                                  selctedCountry = searchedCountries.isNotEmpty
                                      ? searchedCountries[index]
                                      : Country.countries[index];
                                  Logger.log(
                                      tag: Tag.DEBUG,
                                      message: selctedCountry?.country ?? '');
                                });
                                setState(() {});
                                Go(context).pop();
                              },
                              child: listItem(
                                  searchedCountries.isNotEmpty
                                      ? searchedCountries[index]
                                      : Country.countries[index],
                                  selctedCountry ==
                                      (searchedCountries.isNotEmpty
                                          ? searchedCountries[index]
                                          : Country.countries[index])),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

typedef Countries = List<Country>;

class Country {
  String country;
  String tag;
  String flagUrl;

  Country({required this.country, required this.tag, required this.flagUrl});

  static final Countries countries = [
    Country(country: 'United States', tag: 'US', flagUrl: AppAsset.usFlag),
    Country(country: 'United Kingdom', tag: 'GB', flagUrl: AppAsset.gbFlag),
    Country(country: 'Singapore', tag: 'SG', flagUrl: AppAsset.sgFlag),
    Country(country: 'China', tag: 'CN', flagUrl: AppAsset.cnFlag),
    Country(country: 'Netherlands', tag: 'NL', flagUrl: AppAsset.nlFlag),
    Country(country: 'Indonesia', tag: 'ID', flagUrl: AppAsset.idFlag),
  ];
}
