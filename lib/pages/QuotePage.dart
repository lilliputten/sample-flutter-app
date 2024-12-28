import 'package:flutter/material.dart';

import 'package:flaming_quotes/features/Quote/widgets/QuoteBuilder.dart';
import 'package:flaming_quotes/features/Quote/widgets/QuoteButtons.dart';

// @see https://docs.flutter.dev/cookbook/networking/fetch-data

class QuotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          spacing: 20.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuoteBuilder(),
            QuoteButtons(),
          ],
        ),
      ),
    );
  }
}
