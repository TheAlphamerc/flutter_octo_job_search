import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_octo_job_search/bloc/theme/theme_bloc.dart';
import 'package:flutter_octo_job_search/helper/config.dart';
import 'package:flutter_octo_job_search/helper/utility.dart';
import 'package:flutter_octo_job_search/ui/page/settings/about_us_page.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class SettingsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SettingsPage({Key key}) : super(key: key);

  static MaterialPageRoute getPageRoute() {
    return MaterialPageRoute(builder: (_) => SettingsPage());
  }

  Widget _getUtilRos(context, String text,
      {Function onPressed, IconData icon = Icons.keyboard_arrow_right_outlined, String selectedText = ""}) {
    return Row(
      children: <Widget>[
        SizedBox(width: 16, height: 50),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 14, fontWeight: FontWeight.bold)
        ),
        Spacer(),
        Text(
          selectedText,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        if (icon != null)
          Icon(
            icon,
            color: Theme.of(context).textTheme.subtitle2.color,
            size: 18,
          ),
        SizedBox(width: 8, height: 50)
      ],
    ).ripple(onPressed ?? () {});
  }

  Widget _section1(context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getUtilRos(context, "About us", onPressed: () {
            Navigator.push(context,AboutUsPage.getPageRoute());
          }),
          Divider(height: 0),
          _getUtilRos(context, "Share App", selectedText: "  ", onPressed: () {
            Utility.share(Config.appLink);
          }),
          Divider(height: 0),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              String theme;
               if (state is LoadedTheme) {
                  theme = state.type == ThemeType.DARK ? "Dark Mode" : "Light Mode";
               }
              return _getUtilRos(context, "Appearence", selectedText: theme, onPressed: () {
                if (state is LoadedTheme) {
                  var type = state.type == ThemeType.DARK ? ThemeType.LIGHT : ThemeType.DARK;
                  BlocProvider.of<ThemeBloc>(context)..add(OnThemeChange(type));
                }
                // _changeTheme(context, CustomTheme.instanceOf(context).toggle);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _section2(context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getUtilRos(context, "Share Feedback", icon: Icons.edit, onPressed: () {
            final Uri _emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'sonu.sharma045@gmail.com',
              queryParameters: {'subject': 'Feedback for Git connect app'},
            );

            Utility.launchTo(_emailLaunchUri.toString());
          }),
        ],
      ),
    );
  }

  Widget _section3(context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getUtilRos(context, "Report Issue", onPressed: (){ Utility.launchTo("https://github.com/TheAlphamerc/flutter_octo_job_search/issues");}),
          Divider(height: 0),
          _getUtilRos(context, "Support Project",onPressed: (){ Utility.launchTo("https://www.paypal.com/paypalme/thealphamerc");}),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Title(title: "Settings", child: Text("Settings"), color: Theme.of(context).textTheme.bodyText1.color),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: <Widget>[
            _section1(context),
            SizedBox(height: 20),
            _section2(context),
            SizedBox(height: 20),
            _section3(context),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
