import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_octo_job_search/app_delegate.dart';
import 'package:flutter_octo_job_search/ui/app.dart';
import 'package:flutter_octo_job_search/ui/page/home/home_page.dart';

void main() {
  Bloc.observer = AppBlocDelegate();
  var app = OctoApp(home: HomePage());
  runApp(app);
}
