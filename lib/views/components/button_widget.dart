import 'package:e_commercee/constant/const.dart';
import 'package:flutter/material.dart';

//primary button
class ButtonWidget extends StatefulWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  final double height;
  final double minWidth;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = const Color(0xff1c903c), // Default color is blue
    this.height = 50,
    this.minWidth = double.infinity,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: widget.height,
      minWidth: widget.minWidth,
      color: widget.color,
      onPressed: widget.onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      highlightColor: HOVER_COLOR,
      hoverElevation: 0.5,
      child: Text(
        widget.text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//social media auth button
class SocialAuthButtonWidget extends StatefulWidget {
  final String text;
  final ImageProvider image;
  final VoidCallback? onTap;
  final Color color;
  final Color textColor;
  final double height;
  final double imgHeight;
  final double minWidth;
  final Color borderColor;

  const SocialAuthButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.image,
    this.borderColor = const Color(0x00FFFFFF),
    this.imgHeight = 30.0,
    this.textColor = Colors.black,
    this.color = Colors.white,
    this.height = 60.0,
    this.minWidth = double.infinity,
  });

  @override
  State<SocialAuthButtonWidget> createState() => _SocialAuthButtonWidgetState();
}

class _SocialAuthButtonWidgetState extends State<SocialAuthButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.minWidth,
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(color: widget.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: widget.image,
              height: widget.imgHeight,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: widget.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
