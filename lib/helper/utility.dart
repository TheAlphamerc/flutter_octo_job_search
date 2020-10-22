import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart' as custom;

class Utility {
  Utility._internal();

  static String toDMYformate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  static String toformattedDate2(DateTime date) {
    return DateFormat('dd-MMM-yyyy hh:mm a').format(date);
  }

  static launchTo(String link) async {
    final isOK = await canLaunch(link);
    if (isOK) {
      launch(link);
    }
  }

  static share(String message) {
    Share.share(
      message,
    );
  }
  static String jobTimeCreatedAt(String value){
    var list = value.split(" ");
    var yy = int.parse(list.last);
    var dt = int.parse(list[2]);
    var mm = toMonthIndex(list[1]);
    final date = DateTime(yy,mm,dt);
    return getPassedTime(date.toIso8601String());
  }
  static String getPassedTime(String date) {
    if (date == null || date.isEmpty) {
      return '';
    }
    String msg = '';
    var dt = DateTime.parse(date).toLocal();

    if (DateTime.now().toLocal().isBefore(dt)) {
      return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
    }

    var dur = DateTime.now().toLocal().difference(dt);
    if (dur.inDays > 0) {
      msg = '${dur.inDays}d ago';
      // return dur.inDays == 1 ? '1d' : DateFormat("dd MMM").format(dt);
    } else if (dur.inHours > 0) {
      msg = '${dur.inHours}h ago';
    } else if (dur.inMinutes > 0) {
      msg = '${dur.inMinutes}m ago';
    } else if (dur.inSeconds > 0) {
      msg = '${dur.inSeconds}s ago';
    } else {
      msg = 'now';
    }
    return msg;
  }

  static void launchURL(BuildContext context, String url) async {
    if (url == null) {
      return;
    }
    try {
      await custom.launch(
        url,
        option: new custom.CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          extraCustomTabs: <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }

  static int toMonthIndex(String value){
    switch (value) {
      case "Jan": return 1;
      case "Feb": return 2;
      case "Mar": return 3;
      case "Apr": return 4;
      case "May": return 5;
      case "Jun": return 6;
      case "Jul": return 7;
      case "Aug": return 8;
      case "Sep": return 9;
      case "Oct": return 10;
      case "Nov": return 11;
      case "Dec": return 12;
      default: return 1;
    }
  }
}
