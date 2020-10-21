import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_octo_job_search/bloc/theme/theme_bloc.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class OctoApp extends StatefulWidget {
  final Widget home;

  const OctoApp({
    Key key,
    @required this.home,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<OctoApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeData theme = AppTheme.lightTheme;
          if (state is LoadedTheme) {
            theme = state.type == ThemeType.DARK ? AppTheme.darkTheme : AppTheme.lightTheme;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (BuildContext context) => "",
            theme: theme,
            home: widget.home,
          );
        },
      ),
    );
  }
}
