import 'package:redux/redux.dart';
import 'package:video_app/redux/actions/dropMenu.dart';
import 'package:video_app/redux/reducers/dropMenu.dart';

/// combinerReducers通过TypeReducer将action和reducer关联
/// 然后将这个reducer,返回给Store
final switchDropMenuReducer = combineReducers<bool>([
  TypedReducer<bool,SwitchShowDropMenuAction>(switchShowDropMenuReducer)
]);

