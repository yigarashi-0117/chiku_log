import 'package:flutter/material.dart';

enum Amount {
  one(1),
  two(2),
  three(3),
  four(4),
  five(5),
  none(0);

  final int value;
  const Amount(this.value);
}

class SurveyRadioButton extends StatefulWidget {
  final int id;
  int score = 0;
  bool isSelected = false;
  Amount _amount = Amount.none;
  final Function(int)? onRadioChanged;
  SurveyRadioButton({super.key, required this.id, this.onRadioChanged});

  @override
  State<SurveyRadioButton> createState() => _SurvayRadioButtonState();
}

class _SurvayRadioButtonState extends State<SurveyRadioButton> {
  final double _iconSize = 45;

  Widget numberIcon(int score) {
    return widget.score == score
        ? numberIconSelected(score)
        : InkWell(
            child: Container(
              width: _iconSize,
              height: _iconSize,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                // border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  "${score.toString()}点",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                widget.isSelected = true;
                widget.score = score;
                widget.onRadioChanged?.call(widget.score);
              });
            },
          );
  }

  Widget numberIconSelected(int score) {
    return Container(
      width: _iconSize,
      height: _iconSize,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        border: null,
      ),
      child: Center(
        child: Text(
          "${score.toString()}点",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _customRadio(Amount value, String title) {
    return Flexible(
      child: Column(
       
        children: [
          
          Radio(
            value: value,
            activeColor: Colors.black,
            groupValue: widget._amount,
            onChanged: (value) {
              setState(() {
                widget._amount = value ?? Amount.none;
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
      width: double.infinity,
      // height: 100,
      margin:EdgeInsets.only(bottom:16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _customRadio(Amount.one, "1点"),
          _customRadio(Amount.two, "2点"),
          _customRadio(Amount.three, "3点"),
          _customRadio(Amount.four, "4点"),
          _customRadio(Amount.five, "5点"),
        ],
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     numberIcon(1),
    //     numberIcon(2),
    //     numberIcon(3),
    //     numberIcon(4),
    //     numberIcon(5),
    //   ],
    // );
  }
}

// class SurveyRadioButtonState extends State<SurvayRadioButton> {
//   final int id;
//   const SurveyRadioButton({super.key, required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         ElevatedButton(onPressed: () {}, child: const Icon(Icons.check)),
//         ElevatedButton(onPressed: () {}, child: const Icon(Icons.check)),
//         ElevatedButton(onPressed: () {}, child: const Icon(Icons.check)),
//         ElevatedButton(onPressed: () {}, child: const Icon(Icons.check)),
//         ElevatedButton(onPressed: () {}, child: const Icon(Icons.check)),
//       ],
//     );
//   }
// }
