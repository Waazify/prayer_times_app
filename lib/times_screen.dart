import "package:flutter/material.dart";
import "package:slide_digital_clock/slide_digital_clock.dart";

class TimesScreen extends StatelessWidget {
  TimesScreen({super.key});

  DateTime time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text('Current time is:', style: TextStyle(fontSize: 30)),
        DigitalClock(
          hourMinuteDigitTextStyle: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black),
          secondDigitTextStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.black),
          colon: Text(
            ":",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black, fontSize: 25),
          ),
        )
      ],
    );
  }
}
