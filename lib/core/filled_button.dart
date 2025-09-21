import 'package:flutter/material.dart';

class CustomFilledButton extends StatefulWidget {
  final Widget child;
  final Function(Map<String, dynamic> param) onPress;
  final bool isFunctionFuture;
  final Map<String, dynamic> parameter;
  final Widget isLoadingWidget;
  final Color filledColor;
  final EdgeInsetsGeometry margins;
  final double borderRadius;
  final bool isExpanded;
  final double? elevation;
  const CustomFilledButton(
      this.margins,
      this.child,
      this.filledColor,
      this.onPress,
      this.isFunctionFuture,
      this.parameter,
      this.isLoadingWidget,
      this.borderRadius,
      this.isExpanded,
      {Key? key,
      this.elevation})
      : super(key: key);

  @override
  _CustomFilledButtonState createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  bool _isLoading = false;

  Future<void> _onPress() async {
    if (!_isLoading) {
      if (widget.isFunctionFuture) {
        setState(() {
          _isLoading = true;
        });

        await widget.onPress(widget.parameter);

        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        widget.onPress(widget.parameter);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(114, 26),
            elevation: widget.elevation,
            backgroundColor: widget.filledColor,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
          onPressed: () {
            _onPress();
          },
          child: widget.isExpanded
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: widget.margins,
                        child:
                            _isLoading ? widget.isLoadingWidget : widget.child),
                  ],
                )
              : Container(
                  margin: widget.margins,
                  child: _isLoading ? widget.isLoadingWidget : widget.child),
        ),
      ],
    );
  }
}
