import 'package:calculator/config/theme.dart';
import 'package:hive/hive.dart';

class Storage {
  Storage._();

  static Storage instance = Storage._();

  late Box box;

  Future init() async {
    box = await Hive.openBox('storage');
  }

  String theme() {
    String theme = box.get('theme') ?? AppTheme.darkTheme;
    return theme;
  }
}
