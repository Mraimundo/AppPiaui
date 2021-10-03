import 'package:flutter_tts/flutter_tts.dart';
import 'package:html/parser.dart';

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

class Tts {
  FlutterTts flutterTts = FlutterTts();
  speak(text) async {
    var i = 0;
    while (i < text.split("\n").length) {
      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.setLanguage("pt-BR");
      await flutterTts.speak(_parseHtmlString(text.split("\n")[i]));
      i++;
    }
  }

  stop() async {
    await flutterTts.stop();
  }
}
