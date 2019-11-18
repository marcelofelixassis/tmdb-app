import 'package:tmdb_app/state/app_reducer.dart';
import 'package:tmdb_app/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Store<AppState> appStore = Store<AppState>(
  appReducer,
  initialState: AppState.initialState(),
  middleware: [thunkMiddleware],
);