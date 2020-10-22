import 'package:flutter/material.dart';
import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/helper/utility.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class JobTile extends StatelessWidget {
  const JobTile({Key key, this.model}) : super(key: key);
  final JobModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                  vertical: 5,
                ) +
                EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16) + EdgeInsets.only(top: 20),
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
                ),
                SizedBox(height: 12),
                Text(model.title, style: theme.textTheme.headline6.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text(
                  model.company,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: theme.textTheme.subtitle1.color,
                  ),
                ),
                SizedBox(height: 36),
                Text(
                  model.location,
                  style: theme.textTheme.bodyText2.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: KDarkColors.randomColor(model.title), borderRadius: BorderRadius.circular(12)),
            child: Text(
              model.company.substring(0, 1),
              style: theme.textTheme.bodyText1.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
