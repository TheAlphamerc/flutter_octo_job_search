import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/bloc/theme/theme_bloc.dart';
import 'package:flutter_octo_job_search/ui/page/detail/widget/company_card.dart';
import 'package:flutter_octo_job_search/ui/page/detail/widget/job_description_card.dart';
import 'package:flutter_octo_job_search/ui/page/home/widget/job_tile.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class JobDatailPage extends StatelessWidget {
  const JobDatailPage({Key key, this.model}) : super(key: key);
  final JobModel model;

  static MaterialPageRoute getPageRoute({JobModel model}) {
    return MaterialPageRoute(builder: (_) => JobDatailPage(model: model));
  }
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("Home"),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(Icons.lightbulb),
                onPressed: () {
                  if (state is LoadedTheme) {
                    var type = state.type == ThemeType.DARK ? ThemeType.LIGHT : ThemeType.DARK;
                    BlocProvider.of<ThemeBloc>(context)..add(OnThemeChange(type));
                  }
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 65,
                      width: double.infinity,
                      color: theme.primaryColor,
                    ),
                  ),
                  CompanyCard(model:model),
                ],
              ),
            ),
            SizedBox(height: 16),
            JobDescriptionCard(model:model)
          ],
        ),
      ),
    );
  }
}
