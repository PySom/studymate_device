import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AppData extends ChangeNotifier {
  static AppData provider(BuildContext context, {bool listen = false}) =>
      Provider.of<AppData>(context, listen: listen);
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
