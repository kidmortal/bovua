import 'package:mobx/mobx.dart';

part 'page_store.g.dart';

class PageStore = PageStoreBase with _$PageStore;

abstract class PageStoreBase with Store {
  // Only observable values can be used inside reaction functions
  @observable
  int page = 0;

  // Only actions can change the state
  @action
  void setPage(int value) => page = value;

  // Computed values are values that depends on state, shouldnt be directly manipulated
  @computed
  bool isFirstPage() => page == 0;
}
