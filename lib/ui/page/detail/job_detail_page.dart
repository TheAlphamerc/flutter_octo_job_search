import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_octo_job_search/bloc/job/job_model.dart';
import 'package:flutter_octo_job_search/bloc/theme/theme_bloc.dart';
import 'package:flutter_octo_job_search/ui/page/detail/widget/company_card.dart';
import 'package:flutter_octo_job_search/ui/page/detail/widget/html_view.dart';
import 'package:flutter_octo_job_search/ui/page/detail/widget/job_description_card.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class JobDatailPage extends StatelessWidget {
  JobDatailPage({Key key, this.model}) : super(key: key);
  final JobModel model;
  final ScrollController controller = ScrollController();
  static MaterialPageRoute getPageRoute({JobModel model}) {
    return MaterialPageRoute(builder: (_) => JobDatailPage(model: model));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("Octo Job Search"),
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
        controller: controller,
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
                  CompanyCard(model: model),
                ],
              ),
            ),
            SizedBox(height: 16),
            JobDescriptionCard(
                model: model,
                onApplyTap: () {
                  controller.animateTo(controller.position.maxScrollExtent,
                      duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
                }),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: theme.primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How to apply", style: theme.textTheme.headline6.copyWith(color: theme.colorScheme.onPrimary)).hP8,
                  // Text(model.howToApply, style: theme.textTheme.bodyText1),
                  HtmlView(
                    htmlData: model.howToApply,
                    isOnPrimaryText: true,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
