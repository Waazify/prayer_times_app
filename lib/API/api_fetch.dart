import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prayer_times_app/models/prayer_times_model.dart';

class ApiFetch {
  final url =
      "https://api.aladhan.com/v1/calendarByCity/2023/6?city=Kuala%20Lumpur&country=Malaysia&method=2";

  Future<Timings> fetchPrayerTimes(int Day, String month, String year) async {
    final response = await http
        .get(Uri.parse(
            "https://api.aladhan.com/v1/calendarByCity/$year/$month?city=Kuala%20Lumpur&country=Malaysia&method=2"))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      dynamic jsonMap = jsonDecode(response.body);
      List<dynamic> itemList = jsonMap["data"];
      dynamic todayTimings = itemList[Day - 1];
      return Timings.fromJson(todayTimings["timings"]);
    } else {
      throw Exception("Some error occured");
    }
  }
}
