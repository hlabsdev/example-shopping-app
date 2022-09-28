import 'package:assigame_market/logic/managers/managers.dart';
import 'package:assigame_market/ui/styles/app_colors.dart';

class AppMessageType {
  static const int info = 0;
  static const int succes = 1;
  static const int waring = 2;
  static const int error = 3;
}

class AppMessage extends ChangeNotifier {
  List<String> _notifs = [];
  List<String> _reads = [];
  int _index = 0;

  List<String> get notifs => _notifs;

  List<String> get reads => _reads;

  int get index => _index;

  set index(int index) {
    _index = index;
    notifyListeners();
  }

  addNotif(String) {}

  readNotif(String) {}

  deleteNotif(String) {}

  clearNotif(String) {}

  Color? renderbackGroundColor(BuildContext context, int? type) {
    Color? returnColor;
    if (type == 0 /* || type == null*/) {
      returnColor = Theme.of(context).cardColor.withOpacity(0.6);
    } else if (type == 1) {
      returnColor = AppColors.assigameGreen.withOpacity(0.6);
    } else if (type == 2) {
      returnColor = AppColors.assigameRed.withOpacity(0.8);
    } else if (type == 3) {
      returnColor = AppColors.assigameRed.withOpacity(0.6);
    }
    return returnColor;
  }

  void _showToast(BuildContext context, int? type, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: renderbackGroundColor(context, type),
      ),
    );
  }
}
