// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_assets.dart';
import 'package:smart_pay_by_apex/src/views/utils/app_dimentions.dart';
import 'package:smart_pay_by_apex/src/views/utils/helpers/image_view_helper.dart';

class NumericKeyboard extends StatefulWidget {
  final double space;
  final int length;
  final double maxWidth;
  final void Function(String)? onChange;
  final VoidCallback? onAsterics;
  final bool enableBiometric;
  final Widget? iconBiometric;
  final Widget? iconBackspace;
  final Color? iconBackspaceColor;
  final Color? iconBiometricColor;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextEditingController? controller;

  const NumericKeyboard({
    super.key,
    this.space = 63,
    required this.length,
    required this.onChange,
    this.onAsterics,
    this.enableBiometric = false,
    this.iconBiometric,
    this.maxWidth = 350,
    this.iconBackspaceColor,
    this.iconBiometricColor,
    this.textColor,
    this.fontSize = 30,
    this.fontWeight = FontWeight.bold,
    this.iconBackspace,
    this.controller,
  });

  @override
  _NumericKeyboardState createState() => _NumericKeyboardState();
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  String _pinCode = '';

  @override
  void initState() {
    _restListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: widget.maxWidth,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NumberWidget(
                widget: widget,
                number: '1',
                onPress: _handleTabNumber,
              ),
              AppDimentions.XYSpace(),
              _NumberWidget(
                widget: widget,
                number: '2',
                onPress: _handleTabNumber,
              ),
              AppDimentions.XYSpace(),
              _NumberWidget(
                widget: widget,
                number: '3',
                onPress: _handleTabNumber,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NumberWidget(
                widget: widget,
                number: '4',
                onPress: _handleTabNumber,
              ),
              AppDimentions.XYSpace(),
              _NumberWidget(
                widget: widget,
                number: '5',
                onPress: _handleTabNumber,
              ),
              AppDimentions.XYSpace(),
              _NumberWidget(
                widget: widget,
                number: '6',
                onPress: _handleTabNumber,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NumberWidget(
                widget: widget,
                number: '7',
                onPress: _handleTabNumber,
              ),
              AppDimentions.XYSpace(),
              _NumberWidget(
                widget: widget,
                number: '8',
                onPress: _handleTabNumber,
              ),
              AppDimentions.XYSpace(),
              _NumberWidget(
                widget: widget,
                number: '9',
                onPress: _handleTabNumber,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _AstericsIconWidget(
                widget: widget,
                onPress: _handleTabAsterrics,
              ),
              AppDimentions.XYSpace(),
              _NumberWidget(
                widget: widget,
                number: '0',
                onPress: _handleTabNumber,
              ),
              AppDimentions.XYSpace(),
              _BackspaceIconWidget(
                widget: widget,
                onPress: _handleTabBackspace,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleTabNumber(String number) {
    if (_pinCode.length < widget.length) {
      _pinCode += number;
      if (widget.onChange != null) {
        widget.onChange!(_pinCode);
      }

      // Giving way to edit
      // if (_pinCode.length == widget.length) {
      //   if (widget.onConfirm != null) {
      //     widget.onConfirm!(_pinCode);
      //   }
      //   if (widget.controller == null) {
      //     _pinCode = '';
      //   }
      // }
    }
  }

  void _handleTabAsterrics() {
    if (widget.onAsterics != null) {
      widget.onAsterics!();
    }
  }

  void _handleTabBackspace() {
    _pinCode = '';
    widget.controller?.clear();
    setState(() {});
  }

  void _restListener() {
    widget.controller?.addListener(() {
      _pinCode = '';
      if (widget.onChange != null) {
        widget.onChange!('');
      }
    });
  }
}

class _BackspaceIconWidget extends StatelessWidget {
  final NumericKeyboard widget;
  final VoidCallback onPress;

  const _BackspaceIconWidget({
    required this.widget,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) => _ImageWidget(
        widget: widget,
        icon: widget.iconBackspace ??
            const ImageViewer(imagePath: AppAsset.backSpace),
        onPress: onPress,
      );
}

class _AstericsIconWidget extends StatelessWidget {
  final NumericKeyboard widget;
  final VoidCallback onPress;

  const _AstericsIconWidget({
    required this.widget,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    if (widget.enableBiometric) {
      return _ImageWidget(
        widget: widget,
        icon: widget.iconBiometric ??
            const ImageViewer(imagePath: AppAsset.astericsIcon),
        onPress: onPress,
      );
    } else {
      return SizedBox(
        height: widget.space,
        width: widget.space,
      );
    }
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.widget,
    required this.icon,
    required this.onPress,
  });

  final NumericKeyboard widget;
  final Widget icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.space),
        ),
        child: SizedBox(
          height: widget.space,
          width: widget.space,
          child: Center(child: icon),
        ),
        onTap: () {
          onPress();
        },
      );
}

class _NumberWidget extends StatelessWidget {
  const _NumberWidget({
    required this.widget,
    required this.number,
    required this.onPress,
  });

  final NumericKeyboard widget;
  final String number;
  final void Function(String p1) onPress;

  @override
  Widget build(BuildContext context) => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.space),
        ),
        child: SizedBox(
          height: widget.space,
          width: widget.space,
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor ?? const Color(0xff6f6f6f),
                fontWeight: widget.fontWeight,
              ),
            ),
          ),
        ),
        onTap: () {
          onPress(number);
        },
      );
}
