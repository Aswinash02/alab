import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String? _userName;
  final List<String> _price = ["20", "30", "50", "Other"];
  int _isSelectedPrice = 1;
  bool _isChecked = true;
  bool _isFav = false;

  String? get userName => _userName;

  List<String> get price => _price;

  int get isSelectedPrice => _isSelectedPrice;

  bool get isChecked => _isChecked;

  bool get isFav => _isFav;

  void selectedPrice(int index) {
    _isSelectedPrice = index;
    update();
  }

  void onChangeCheckBox() {
    _isChecked = !_isChecked;
    update();
  }

  void addToFav() {
    _isFav = !_isFav;
    update();
  }

  void fetchUserName() {
    final user = FirebaseAuth.instance.currentUser;
    _userName = user?.displayName;
    update();
  }
}
