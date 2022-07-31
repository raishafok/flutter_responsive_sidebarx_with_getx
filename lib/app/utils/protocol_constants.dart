

class ProtocolConstants{

  const ProtocolConstants._();
  static const String baseUrl = 'https://yourapi/';
  static const String login = "auth/login";
  static const String user = "userdata";

  static const Duration timeout = Duration(seconds: 30);

  static const String token = 'authToken';
}

enum LoadDataState { initialize, loading, loaded, error, timeout, unknownerror }
