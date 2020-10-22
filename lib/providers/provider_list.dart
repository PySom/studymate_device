import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'app_data_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<AppData>(create: (_) => AppData()),
];
