import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.bodyLarge!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Material(
      child: Opacity(
        opacity: .5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.primary.withValues(
                alpha: 1,
              )),
            ),
            SizedBox(height: 40),
            Text(
              "Loading...",
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
