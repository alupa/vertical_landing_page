import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  final routeName = params['page']!.first;
  if (routeName != '/') {
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    pageProvider.createScrollController(routeName);
    return HomePage();
  }
});
