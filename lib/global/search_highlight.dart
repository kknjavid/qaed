import 'package:flutter/material.dart';

List<TextSpan> highlightOccurrences(String source, String query) {
  // ignore: unnecessary_null_comparison
  if (query == null || query.isEmpty || !source.contains(query)) {
    return [TextSpan(text: source)];
  }
  final matches = query.allMatches(source);

  int lastMatchEnd = 0;

  final List<TextSpan> children = [];
  for (var i = 0; i < matches.length; i++) {
    // print(matches);
    final match = matches.elementAt(i);
    // print(match);

    if (match.start != lastMatchEnd) {
      // print(match.start);
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, match.start),
      ));
    }

    children.add(TextSpan(
      text: source.substring(match.start, match.end),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        backgroundColor: Colors.red,
        color: Colors.white,
      ),
    ));

    if (i == matches.length - 1 && match.end != source.length) {
      children.add(TextSpan(
        text: source.substring(match.end, source.length),
      ));
    }

    lastMatchEnd = match.end;
  }
  return children;
}
