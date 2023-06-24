import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:prayer_times_app/models/prayer_times_model.dart";
import "package:prayer_times_app/screens/login_screen.dart";
import "package:slide_digital_clock/slide_digital_clock.dart";
import "package:prayer_times_app/widgets/time_container.dart";
import 'package:prayer_times_app/API/api_fetch.dart';

// ignore: must_be_immutable
class TimesScreen extends StatelessWidget {
  TimesScreen({super.key});

  DateTime now = DateTime.now();
  var formatter = DateFormat("dd MM yyyy");

  @override
  Widget build(BuildContext context) {
    String today = formatter.format(now);
    final splitted = today.split(' ');
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: FutureBuilder<Timings>(
          future: ApiFetch().fetchPrayerTimes(
              int.parse(splitted[0]), splitted[1], splitted[2]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/tawqeet.png",
                    height: 60,
                    width: 60,
                  ),
                  const Text("Tawqeet",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black)),
                  const Text(
                    "ٱلسَّلَامُ عَلَيْكُمْ",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(height: 27),
                  const Text(
                    'Current time',
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
                      time: snapshot.data!.toJson()["Dhuhr"].toString()),
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
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                ),
                              },
                          child: const Text("Logout")))
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
