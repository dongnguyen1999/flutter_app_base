part of 'common_bloc.dart';

class CommonState extends Equatable {
  final bool isLightTheme;

  const CommonState({this.isLightTheme = true});

  CommonState copyWith({bool? isLightTheme}) {
    return CommonState(isLightTheme: isLightTheme ?? this.isLightTheme);
  }

  @override
  List<Object?> get props => [isLightTheme];
}
