import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_octo_job_search/bloc/theme/theme_bloc.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(Icons.lightbulb),
                onPressed: () {
                  if(state is LoadedTheme){
                    var type = state.type == ThemeType.DARK ? ThemeType.LIGHT : ThemeType.DARK;
                    BlocProvider.of<ThemeBloc>(context)..add(OnThemeChange(type));
                  }
                  
                },
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
