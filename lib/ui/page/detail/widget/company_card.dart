import 'package:flutter/material.dart';
import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/helper/utility.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key key, this.model}) : super(key: key);
  final JobModel model;
  Widget _companyInitial(ThemeData theme) {
    return Center(
      child: Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: KDarkColors.randomColor(model.company), borderRadius: BorderRadius.circular(12)),
        child: Text(
          model.company.substring(0, 1),
          style: theme.textTheme.headline3.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 5) + EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 24, right: 16, bottom: 24, top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: theme.cardColor,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  model.company,
                  style: theme.textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                if (model.companyUrl != null) ...[
                  Text(
                    model.companyUrl,
                    style: theme.textTheme.subtitle1.copyWith(fontSize: 16),
                    maxLines: 1,
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Visit",
                      style: theme.textTheme.button.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
                    ),
                  ).ripple(() {
                    Utility.launchURL(context, model.companyUrl);
                  })
                ],
              ],
            ),
          ),
          _companyInitial(theme)
        ],
      ),
    );
  }
}
