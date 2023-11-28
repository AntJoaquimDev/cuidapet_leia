import 'package:cuidapet_leia/app/core/life_cycle/controller_life_cycle.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {

@override
  void onInit([Map<String, dynamic>? params]) {
    print('onit Chamado');
    print(params);
   
  }

  @override
  void onReady() {
     print('onitReady Chamado');
    
  }

}