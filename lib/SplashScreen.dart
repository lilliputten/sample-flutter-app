import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // @override
  // SplashScreen createState() => _SplashScreen();
  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  // var animationController = AnimationController(duration: new Duration(seconds: 2), vsync: this);

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.bodySmall!.copyWith(
      // color: theme.colorScheme.primary,
    );
    var size = 60.0;
    var strokeWidth = 2.0;

    return Material(
      child: Opacity(
        opacity: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size,
              width: size,
              child: CircularProgressIndicator(
                strokeWidth: strokeWidth,
                valueColor: animationController.drive(
                    ColorTween(begin: Colors.blueAccent, end: Colors.red)),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Starting...",
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
