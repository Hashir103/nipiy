import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/app_header.dart';
import '../widgets/app_text.dart';
import '../widgets/navbar.dart';

class TwitterEmbed extends StatefulWidget {
  const TwitterEmbed({Key? key}) : super(key: key);

  @override
  State<TwitterEmbed> createState() => _TwitterEmbedState();
}

class _TwitterEmbedState extends State<TwitterEmbed> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(textValue: "Always stay in the"),
        const AppHeaderText(
          textValue: "know.",
          textColor: Color.fromARGB(255, 82, 107, 172),
        ),
        const SizedBox(
          height: 35,
        ),
        Container(
            margin: const EdgeInsets.only(left: 15),
            width: 300,
            height: 530,
            color: Colors.transparent,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    child: WebView(
                      backgroundColor: Colors.transparent,
                      initialUrl: Uri.dataFromString(
                        getHtmlString(),
                        mimeType: 'text/html',
                        encoding: Encoding.getByName('utf-8'),
                      ).toString(),
                      javascriptMode: JavascriptMode.unrestricted,
                      javascriptChannels: <JavascriptChannel>{}..add(
                          JavascriptChannel(
                            name: 'Twitter',
                            onMessageReceived: (JavascriptMessage message) {
                              if (mounted) {
                                setState(() {
                                isLoaded = true;
                              });
                              }
                            },
                          ),
                        ),
                    ),
                  ),
                  if (!isLoaded)
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            )),
     ],
    );
  }
}

String getHtmlString() {
  return """
      <html>
      
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1">
        </head>
        <body>
            <div id="container"></div>
                
        </body>
        <script id="twitter-wjs" type="text/javascript" async defer src="https://platform.twitter.com/widgets.js" onload="createMyTweet()"></script>
        <script>
        
       
        function  createMyTweet() {  
          var twtter = window.twttr;
  
          twttr.widgets.createTimeline(
            {
              sourceType: "list",
              ownerScreenName: "NipiyApp",
              slug: "1640904222026747909",
              theme: "dark"
            },
            document.getElementById('container'),
          ).then (function ( el) {
            const widget = document.getElementById('container');
            Twitter.postMessage("loaded");
          });
        }
        </script>
        
      </html>
    """;
}
