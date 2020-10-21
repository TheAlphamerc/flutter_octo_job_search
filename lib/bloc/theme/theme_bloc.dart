import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_octo_job_search/ui/theme/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LoadedTheme());

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is OnThemeChange) {
      yield ChangingTheme();
      yield LoadedTheme(type: event.type);
    } else {
      throw UnsupportedError('Unsupported event $event');
    }
  }
}
