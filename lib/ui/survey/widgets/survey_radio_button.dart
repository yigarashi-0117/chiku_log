import 'package:flutter/material.dart';


class SurveyRadioButton extends StatefulWidget {
  final int id;
  int score = 0;
  bool isSelected = false;
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
              child: Center(child: Text("${score.toString()}点", style: Theme.of(context).textTheme.bodySmall,)),
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
      child: Center(child: Text("${score.toString()}点", style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        numberIcon(1),
        numberIcon(2),
        numberIcon(3),
        numberIcon(4),
        numberIcon(5),
      ],
    );
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
