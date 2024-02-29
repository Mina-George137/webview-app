import 'package:easaac_project/home/url_not_found_widget.dart';
import 'package:easaac_project/home/webview_container.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreenBody extends StatefulWidget {
  late final String url;
  HomeScreenBody({Key? key, required this.url}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

bool isValidUri(String uriString) {
  // Regular expression pattern for a URI
  RegExp uriRegex = RegExp(
    r'^(?:http|https):\/\/(?:[\w\-.]+(?:\.[\w\-.]+)+)(?::\d+)?(?:\/[^\s]*)?$',
    caseSensitive: false,
  );

  // Check if the URI string matches the pattern
  return uriRegex.hasMatch(uriString);
}

class _HomeScreenBodyState extends State<HomeScreenBody> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: isValidUri(widget.url) == false
          ? const UrlNotFoundWidget()
          : WebViewContainer(url: widget.url),
    );
  }
}
