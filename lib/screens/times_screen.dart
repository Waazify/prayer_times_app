import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get_storage/get_storage.dart";
import "package:intl/intl.dart";
import "package:prayer_times_app/models/prayer_times_model.dart";
import "package:prayer_times_app/screens/login_screen.dart";
import "package:slide_digital_clock/slide_digital_clock.dart";
import "package:prayer_times_app/widgets/time_container.dart";
import 'package:prayer_times_app/API/api_fetch.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prayer_times_app/models/prayer_times_model.dart';

class TimesScreen extends StatelessWidget {
  TimesScreen({super.key});

  DateTime now = DateTime.now();
  var formatter = DateFormat("yyyy-MM");
  String today = "";

  @override
  Widget build(BuildContext context) {
    today = formatter.format(now);
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: FutureBuilder<Timings>(
          future: ApiFetch().fetchPrayerTimes(24, "6", "2023"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Current time is:',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
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
                  ),
                  TimeContainer(
                    prayer: 'Fajr',
                    time: snapshot.data!.toJson()["Fajr"].toString(),
                  ),
                  const SizedBox(height: 20),
                  TimeContainer(
                      prayer: 'Duhr',
                      time: snapshot.data!.toJson()["Duhr"].toString()),
                  const SizedBox(height: 20),
                  TimeContainer(
                      prayer: 'Asr',
                      time: snapshot.data!.toJson()["Asr"].toString()),
                  const SizedBox(height: 20),
                  TimeContainer(
                      prayer: 'Maghrib',
                      time: snapshot.data!.toJson()['Maghrib'].toString()),
                  const SizedBox(height: 20),
                  TimeContainer(
                      prayer: 'Isha',
                      time: snapshot.data!.toJson()["Isha"].toString()),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () =>
                          // ignore: avoid_print
                          print(snapshot.data!.toJson().toString()),
                      child: const Text("Click me ")),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()))
                              },
                          child: const Text("Signout")))
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }
}
