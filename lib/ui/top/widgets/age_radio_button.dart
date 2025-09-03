import 'package:flutter/material.dart';

enum Age {
  none(0),
  under20(20),
  under30(30),
  under40(40),
  under50(50),
  over50(60);

  final int value;
  const Age(this.value);
}

class AgeRadioButton extends StatefulWidget {
  Age _age = Age.none;
  Function(Age)? onRadioChanged;
  AgeRadioButton({super.key, this.onRadioChanged});

  @override
  State<AgeRadioButton> createState() => _AgeRadioButtonState();
}

class _AgeRadioButtonState extends State<AgeRadioButton> {
  Widget _customRadio(Age value, String title) {
    return Flexible(
      child: Column(
        children: [
          Radio(
            value: value,
            activeColor: Colors.black,
            groupValue: widget._age,
            onChanged: (value) {
              setState(() {
                widget._age = value ?? Age.none;
                widget.onRadioChanged?.call(value ?? Age.none);
              });
            },
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _customRadio(Age.under20, "~20代"),
          _customRadio(Age.under30, "30代"),
          _customRadio(Age.under40, "40代"),
          _customRadio(Age.under50, "50代"),
          _customRadio(Age.over50, "60代~"),
        ],
      ),
    );
  }
}
