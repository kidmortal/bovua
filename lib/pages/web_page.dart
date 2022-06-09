import 'package:bovua/services/global_config_service.dart';
import 'package:bovua/widgets/page_app_bar.dart';
import 'package:bovua/widgets/web_view.dart';
import 'package:flutter/material.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  static const routeName = 'web';

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    String url = arguments['search_url'];
    print("url: $url");
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PageAppBar(pageName: "Web page"),
        body: Center(
          child: WebViewWidget(
            url: url,
          ),
        ),
      ),
    );
  }
}
