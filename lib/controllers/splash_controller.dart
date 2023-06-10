import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  RxInt selectedPage = 0.obs;
  final IndexController controller = IndexController();
  changePage(int index) {
    controller.move(index);
    if(index == 0){
      Get.delete<SplashController>();
    }
  }
}