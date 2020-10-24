import 'package:flutter/material.dart';

class GErrorContainer extends StatelessWidget {
  const GErrorContainer(
      {Key key,
      this.onPressed,
      this.description,
      this.icon,
      this.title = "Seems like into trouble"})
      : super(key: key);
  final GestureTapCallback onPressed;
  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height ,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 120),
          SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 24,
          ),
          // GFlatButton(
          //   isLoading: ValueNotifier(false),
          //   label: "Reload",
          //   onPressed: onPressed ?? () {},
          //   isWraped: true,
          // ),
        ],
      ),
    );
  }
}
