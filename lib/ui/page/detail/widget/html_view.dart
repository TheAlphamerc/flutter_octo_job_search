import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_octo_job_search/helper/utility.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class HtmlView extends StatefulWidget {
  HtmlView({Key key, this.htmlData, this.isOnPrimaryText = false}) : super(key: key);

  final String htmlData;
  final bool isOnPrimaryText;

  @override
  _HtmlViewState createState() => new _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = widget.isOnPrimaryText ? theme.colorScheme.onPrimary : KDarkColors.subtitleColor;//theme.textTheme.bodyText1.color;
    return Html(
      data: widget.htmlData,
      style: {
        "html": Style(backgroundColor: Colors.transparent),
        "p": Style(color: textColor, fontSize: FontSize(theme.textTheme.bodyText1.fontSize)),
        "li": Style(color: textColor, fontSize: FontSize(theme.textTheme.bodyText1.fontSize)),
        "a": Style(color: textColor, fontSize: FontSize(theme.textTheme.bodyText1.fontSize)),
        "table": Style(
          backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          padding: EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          padding: EdgeInsets.all(6),
        ),
        "var": Style(fontFamily: 'serif'),
      },
      customRender: {
        "flutter": (RenderContext context, Widget child, attributes, _) {
          return FlutterLogo(
            style: (attributes['horizontal'] != null) ? FlutterLogoStyle.horizontal : FlutterLogoStyle.markOnly,
            textColor: context.style.color,
            size: context.style.fontSize.size * 5,
          );
        },
      },
      onLinkTap: (url) {
        print("Opening $url...");
        if (url.contains("mailto")) {
          Utility.launchTo(url);
        } else {
          Utility.launchURL(context, url);
        }
      },
      onImageTap: (src) {
        print(src);
      },
      onImageError: (exception, stackTrace) {
        print(exception);
      },
    );
  }
}
