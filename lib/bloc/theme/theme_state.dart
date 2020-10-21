part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}
class ChangingTheme extends ThemeState{}
class LoadedTheme extends ThemeState {
  final ThemeType type;
  LoadedTheme({this.type = ThemeType.DARK});
  
  @override
  String toString() => 'LoadedTheme';
}
