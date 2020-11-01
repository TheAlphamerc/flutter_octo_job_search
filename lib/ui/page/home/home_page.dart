import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_octo_job_search/bloc/job/job_bloc.dart';
import 'package:flutter_octo_job_search/ui/page/home/widget/filter_dialog.dart';
import 'package:flutter_octo_job_search/ui/page/home/widget/job_tile.dart';
import 'package:flutter_octo_job_search/ui/page/settings.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';
import 'package:flutter_octo_job_search/ui/widget/erorr_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  ValueNotifier<bool> isFullTime = ValueNotifier<bool>(false);
  TextEditingController location;
  TextEditingController description;
  @override
  ScrollController _controller;
  void initState() {
    BlocProvider.of<JobBloc>(context)..add(LoadJobsList());
    location = TextEditingController();
    description = TextEditingController();
    _controller = ScrollController()..addListener(listener);
    super.initState();
  }

  void listener() {
    if (_controller.position.maxScrollExtent - _controller.offset < 100 && !_controller.position.outOfRange) {
      BlocProvider.of<JobBloc>(context)..add(SearchNextJobs(description.text, isFullTime.value, location.text, isLoadNextJobs: true));
    }
  }

  void displayFilterJob() async {
    description.clear();
    await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: 210,
            alignment: Alignment.center,
            child: FilterDialog(
              isFullTime: isFullTime,
              controller: location,
              onSearchTap: (loc) {
                print("Call api");
                FocusManager.instance.primaryFocus.unfocus();
                BlocProvider.of<JobBloc>(context)..add(SearchJobBy(description.text, isFullTime.value, loc));
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("  Octo Job Search"),
        actions: [
          IconButton(
            icon: Icon(Icons.dehaze_outlined),
            onPressed: () {
              Navigator.push(context, SettingsPage.getPageRoute());
            },
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 35,
                    width: double.infinity,
                    color: theme.primaryColor,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: theme.cardColor,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: theme.primaryColor),
                        Expanded(
                          child: TextField(
                            controller: description,
                            decoration:
                                InputDecoration(border: InputBorder.none, hintText: "Search by title, expertise, companies,"),
                          ),
                        ),
                        Icon(Icons.filter_alt).p(8).ripple(() {
                          displayFilterJob();
                        }),
                        // SizedBox(width:8),
                        Container(
                          color: theme.primaryColor,
                          child: Icon(Icons.search, color: theme.colorScheme.onPrimary).p(8),
                        ).cornerRadius(5).ripple(() {
                          if (description.text.isEmpty) return;
                          FocusManager.instance.primaryFocus.unfocus();
                          BlocProvider.of<JobBloc>(context)..add(SearchJobBy(description.text, null, null));
                        })
                      ],
                    ),
                  ),
                )
              ],
            ),
            BlocBuilder<JobBloc, JobState>(
              builder: (context, state) {
                if ((state is OnJobLoading)) {
                  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(height: 120),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(theme.primaryColor),
                      strokeWidth: 4,
                    ),
                  ]);
                } else if (state is ErrorJobListState) {
                  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GErrorContainer(
                      title: "Server down :(",
                      description: "Try again in some time",
                    ),
                  ]);
                }
                if (state is LoadedJobsList) {
                  if (state.isNotNullEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GErrorContainer(
                          title: "No job found",
                          description: description.text.isEmpty ? "Try again in sometime" : "Try again with other keyword",
                        ),
                      ],
                    );
                  }
                  return ListView.builder(
                    controller: _controller,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemCount: state.jobs.length + 1,
                    itemBuilder: (_, index) {
                      if (index == state.jobs.length) {
                        if (state is OnNextJobLoading) {
                          return Container(
                              height: 40,
                              width: 40,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor: AlwaysStoppedAnimation(theme.primaryColor),
                              ));
                        }
                        return SizedBox.shrink();
                      }
                      return JobTile(model: state.jobs[index]);
                    },
                  ).extended;
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(theme.primaryColor),
                  strokeWidth: 4,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
