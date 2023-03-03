import 'package:app_base/data/di/config.dart';
import 'package:app_base/data/source/local_storage/cache_keys.dart';
import 'package:app_base/data/source/local_storage/local_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'common_event.dart';
part 'common_state.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(const CommonState()) {
    on<ThemeToggled>(_onThemeChanged);
    on<ThemeLoaded>(_onThemeLoaded);
  }

  void _onThemeChanged(ThemeToggled event, Emitter<CommonState> emit) {
    getIt<LocalStorage>()
        .putBoolean(key: CacheKey.theme, value: !state.isLightTheme);
    emit(state.copyWith(isLightTheme: !state.isLightTheme));
  }

  void _onThemeLoaded(ThemeLoaded event, Emitter<CommonState> emit) {
    bool cachedTheme = getIt<LocalStorage>().getBoolean(key: CacheKey.theme) ??
        state.isLightTheme;
    if (cachedTheme != state.isLightTheme) {
      emit(state.copyWith(isLightTheme: cachedTheme));
    }
  }
}
