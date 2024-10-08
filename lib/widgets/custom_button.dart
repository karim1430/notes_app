import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constant.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, this.onTap, this.islouding = false});
  final void Function()? onTap;
  final bool islouding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor,
        ),
        child: Center(
          child: islouding
              ? CircularProgressIndicator(
                  color: Colors.black,
                )
              : Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
