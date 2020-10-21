part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  
  @override
  List<Object> get props => [];
}

class OnThemeChange extends ThemeEvent {
  final ThemeType type;
  OnThemeChange(this.type);

  @override
  List<Object> get props => ["Select theme type: $type"];

  @override
  String toString() => 'OnThemeChange';
}