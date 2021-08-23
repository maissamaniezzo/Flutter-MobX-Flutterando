import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
    _ItemModelBase({this.title = '', this.check = false}); // construtor

    @observable
    String title;

    @observable
    bool check;

    @action
    setTitle(String value) => title = value;

    @action
    setCheck(bool? value) => value == null ? check = false : check = value;
}
