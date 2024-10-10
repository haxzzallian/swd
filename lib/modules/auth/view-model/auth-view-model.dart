import 'package:swd_app/common/view-models/base-view-model.dart';
import 'package:swd_app/common/widgets/common/locator.dart';
import 'package:swd_app/modules/auth/service/auth-service.dart';

class AuthViewModel extends BaseViewModel {
  AuthService authService = locator<AuthService>();
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
//signup button logic
}
