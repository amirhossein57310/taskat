import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomChaeckBox extends StatefulWidget {
  final int index;
  bool isCheched;
  CustomChaeckBox(this.index, this.isCheched, {super.key});

  @override
  State<CustomChaeckBox> createState() => _CustomChaeckBoxState();
}

class _CustomChaeckBoxState extends State<CustomChaeckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isCheched = !widget.isCheched;
        });
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: widget.isCheched
                ? const Color(0xff18DAA3)
                : const Color(0xffBFC3C8),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: (widget.isCheched)
            ? const Icon(
                Icons.check,
                color: Color(0xff18DAA3),
                size: 16,
              )
            : null,
      ),
    );
  }
}
