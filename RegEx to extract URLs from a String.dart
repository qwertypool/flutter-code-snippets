void main() {
  final text = """My website url: https://blasanka.github.io/
Google search using: www.google.com, social media is facebook.com, http://example.com/method?param=flutter
stackoverflow.com is my greatest website. DartPad share: https://github.com/dart-lang/dart-pad/wiki/Sharing-Guide see this example and edit it here https://dartpad.dev/3d547fa15849f9794b7dbb8627499b00""";

  RegExp exp = new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
  Iterable<RegExpMatch> matches = exp.allMatches(text);

  matches.forEach((match) {
    print(text.substring(match.start, match.end));
  });
}
