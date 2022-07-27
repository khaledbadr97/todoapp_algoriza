abstract class AppStates {}

class AppInitialState extends AppStates {}

class NotificationAppState extends AppStates {}

class SelectedDateLineValueState extends AppStates {}

class AppCreateDataBaseState extends AppStates {}

class AppDataBaseTableCreatedState extends AppStates {}

class AppInsertDataBaseState extends AppStates {}

class AppGetDataBaseState extends AppStates {}

class AppGetDataBaseLoadingState extends AppStates {}

class AppDeleteItemState extends AppStates {}

class AppMoveDataBaseScreenState extends AppStates {}

class AppMarkIsCompletedState extends AppStates {}

class AppSetFavLoadingState extends AppStates {}

class AppSetFavSuccessfulState extends AppStates {}

class AppSetFavErrorState extends AppStates
{
  final String error;

  AppSetFavErrorState(this.error);
}
class AppSetCheckedSuccess extends AppStates
{
  final bool value;

  AppSetCheckedSuccess(this.value);
}