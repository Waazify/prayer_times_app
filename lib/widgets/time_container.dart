import 'package:flutter/material.dart';

class TimeContainer extends StatelessWidget {
  TimeContainer({super.key, required this.prayer, required this.time});
  String prayer;
  String time;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: FractionallySizedBox(
      widthFactor: 0.90,
      heightFactor: 0.6,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(
            width: 0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(children: [
          Text(
            "$prayer",
            style: const TextStyle(
                fontStyle: FontStyle.italic, fontSize: 20, color: Colors.black),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text(
              "$time",
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
        ]),
      ),
    ));
  }
}
