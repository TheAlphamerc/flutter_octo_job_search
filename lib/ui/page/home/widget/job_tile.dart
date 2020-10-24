import 'package:flutter/material.dart';
import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/helper/utility.dart';
import 'package:flutter_octo_job_search/ui/page/detail/job_detail_page.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class JobTile extends StatelessWidget {
  const JobTile({Key key, this.model}) : super(key: key);
  final JobModel model;
  Widget _companyInitial(ThemeData theme) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: KDarkColors.randomColor(model.company), borderRadius: BorderRadius.circular(12)),
      child: Text(
        model.company.substring(0, 1),
        style: theme.textTheme.bodyText1.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
      ),
    );
  }

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
            padding: EdgeInsets.only(left: 24, right: 16, bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: theme.cardColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  child: FlatButton.icon(
                      onPressed: () {
                        Navigator.push(context, JobDatailPage.getPageRoute(model:model));
                      },
                      icon: Icon(Icons.remove_red_eye_outlined, color: theme.primaryColor),
                      label: Text(
                        "VIEW DETAILS",
                        style: theme.textTheme.bodyText2.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold),
                      )),
                ),
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
          _companyInitial(theme)
        ],
      ),
    );
  }
}
