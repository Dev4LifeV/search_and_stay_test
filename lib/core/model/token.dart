class Token {
  Token({String? token}) : _token = token;

  final String? _token;

  String? get token => _token ?? "";
}
