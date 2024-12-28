// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyAppState.dart';

import 'Quote/Quote.dart';

// @see https://docs.flutter.dev/cookbook/networking/fetch-data

class QuotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var theme = Theme.of(context);
    var style = theme.textTheme.bodyMedium!.copyWith(
        // color: theme.colorScheme.onPrimary,
        );

    if (!appState.quoteInitialized) {
      appState.loadQuote();
    }

    // var futureQuote = appState.futureQuote;
    // var futureImgUrl = appState.futureImgUrl;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          spacing: 20.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(appState.imgUrl),
            if (appState.imgUrlInitialized)
              FutureBuilder<String>(
                future: appState.futureImgUrl,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var url = snapshot.data!;
                    return Image.network(url);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator(strokeWidth: 2);
                },
              ),
            // SizedBox(width: 20),
            FutureBuilder<Quote>(
              future: appState.futureQuote,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // return Text(snapshot.data!.content);
                  var data = snapshot.data!;
                  return MergeSemantics(
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // direction: Axis.vertical,
                      children: [
                        Text(
                          data.content,
                          style: style.copyWith(
                            // fontWeight: FontWeight.w200,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          data.author,
                          style: style.copyWith(
                            // fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator(strokeWidth: 2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
