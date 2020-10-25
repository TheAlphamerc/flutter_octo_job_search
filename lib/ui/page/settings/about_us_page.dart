import 'package:flutter/material.dart';
import 'package:flutter_octo_job_search/helper/config.dart';
import 'package:flutter_octo_job_search/helper/icons.dart';
import 'package:flutter_octo_job_search/helper/utility.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class AboutUsPage extends StatelessWidget {
  static MaterialPageRoute getPageRoute() {
    return MaterialPageRoute(builder: (_) => AboutUsPage());
  }
  const AboutUsPage({Key key}) : super(key: key);
  Widget _getUtilRos(context, String text,
      {Function onPressed,
      IconData icon = GIcons.chevron_right_24,
      String selectedText = ""}) {
    return Row(
      children: <Widget>[
        SizedBox(width: 16, height: 50),
        if (icon != null)
          Icon(
            icon,
            color: Theme.of(context).textTheme.subtitle2.color,
            size: 18,
          ),
        SizedBox(width: 14),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 14, fontWeight: FontWeight.bold)
        ),
        Text(
          selectedText,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Spacer(),
        Icon(
          GIcons.chevron_right_24,
          color: Theme.of(context).colorScheme.onSurface,
          size: 18,
        ),
        SizedBox(width: 8, height: 50)
      ],
    ).ripple(onPressed ??
        () {
          // Underdevelopment.displaySnackbar(context, key: scaffoldKey);
        });
  }

  Widget _section2(context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getUtilRos(context, "Twitter", icon: GIcons.twitter, onPressed: () {
            launch("https://twitter.com/TheAlphamerc");
          }),
          Divider(height: 0),
          _getUtilRos(context, "LinkedIn", icon: GIcons.linkedin,
              onPressed: () {
            launch("https://www.linkedin.com/in/thealphamerc/");
          }),
          Divider(height: 0),
          _getUtilRos(context, "Facebook", icon: GIcons.facebook,
              onPressed: () {
            launch("https://facebook.com/TheAlphaMerc");
          }),
          Divider(height: 0),
          _getUtilRos(context, "Github", icon: GIcons.github_2, onPressed: () {
            launch("https://github.com/TheAlphamerc");
          }),
          Divider(height: 0),
          _getUtilRos(context, "Youtube", icon: GIcons.youtube_play,
              onPressed: () {
            launch("https://www.youtube.com/user/sonusharma045sonu");
          }),
          Divider(height: 0),
          _getUtilRos(context, "Blog", icon: GIcons.link_external_24,
              onPressed: () {
            launch("https://dev.to/thealphamerc");
          }),
        ],
      ),
    );
  }

  Widget _section1(context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getUtilRos(context, "App", icon: GIcons.link_external_24,
              onPressed: () {
            launch(Config.appLink);
          }),
          Divider(height: 0),
          _getUtilRos(context, "Project", icon: GIcons.link_external_24,
              onPressed: () {
            launch("https://github.com/TheAlphamerc/flutter_octo_job_search");
          }),
        ],
      ),
    );
  }

  void launch(String url) {
    Utility.launchTo(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
         title: Title(title: "About us", child: Text("About us"), color: Theme.of(context).textTheme.bodyText1.color),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8),
            _section1(context),
            SizedBox(height: 20),
            SizedBox(height: 8),
            _section2(context),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
