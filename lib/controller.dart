import 'package:fluttermobx/models/client.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store{
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null && validateCpf() == null;
  }

  validateName(){
    if(client.name.isEmpty) {
      return "Este campo é obrigatório";
    }
    return null;
  }

  validateEmail(){
    if(client.email.isEmpty) {
      return "Este campo é obrigatório";
    } else if(!client.email.contains("@")) {
      return "Esse não é um email válido";
    }
    return null;
  }

  validateCpf(){
    if(client.cpf.isEmpty) {
      return "Este campo é obrigatório";
    } else if(client.cpf.length < 11) {
      return "Esse não é um cpf válido";
    }
    return null;
  }
}