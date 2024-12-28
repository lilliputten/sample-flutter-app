import 'package:flaming_quotes/core/helpers/fetchGoogleImage.dart';
import 'package:flutter/material.dart';

import 'package:flaming_quotes/features/Quote/types/Quote.dart';

class QuoteImage extends StatefulWidget {
  const QuoteImage({
    super.key,
    required this.quote,
  });

  final Quote quote;

  @override
  State<QuoteImage> createState() => _QuoteImageState();
}

class _QuoteImageState extends State<QuoteImage> {
  late Future<String> foundImageUrl;

  @override
  void initState() {
    super.initState();
    foundImageUrl = fetchGoogleImage(widget.quote.author);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: foundImageUrl,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // var url = snapshot.data!;
          return QuoteImageWidget(url: snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator(strokeWidth: 2);
      },
    );
  }
}

class QuoteImageWidget extends StatelessWidget {
  const QuoteImageWidget({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
