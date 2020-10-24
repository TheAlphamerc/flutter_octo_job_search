import 'package:flutter/material.dart';
import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/helper/utility.dart';
import 'package:flutter_octo_job_search/ui/page/detail/widget/html_view.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class JobDescriptionCard extends StatelessWidget {
  const JobDescriptionCard({Key key, this.model, this.onApplyTap}) : super(key: key);
  final JobModel model;
  final Function onApplyTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: theme.cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Utility.jobTimeCreatedAt(model.createdAt),
                  style: theme.textTheme.bodyText1.copyWith(
                    color: theme.textTheme.subtitle1.color,
                  )),
              Text(
                model.type,
                style: theme.textTheme.bodyText1.copyWith(
                  color: theme.textTheme.subtitle1.color,
                ),
              ),
            ],
          ).pR(16),
          SizedBox(height: 12),
          Text(model.title, style: theme.textTheme.headline6.copyWith(fontSize: 16, fontWeight: FontWeight.bold)).pR(16),
          SizedBox(height: 12),
          Text(
            model.location,
            style: theme.textTheme.bodyText2.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold),
          ),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(5)),
            child: Text(
              "Apply",
              style: theme.textTheme.button.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
            ),
          ).ripple(() {
            onApplyTap();
          }).vP16,
          HtmlView(htmlData: model.description)
          // Text(
          //   model.description,
          //   style: theme.textTheme.bodyText1.copyWith(color: theme.colorScheme.onSurface, fontWeight: FontWeight.bold),
          // ),
        ],
      ),
    );
  }
}
