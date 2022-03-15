/// Сущность данных для доступа
class AccessData {
  String? get accessToken => _accessToken;
  int? get userId => _userId;

  String? _accessToken;
  int? _userId;

  AccessData() {
    _accessToken = _userId = null;
  }

  @override
  String toString() {
    return 'AccessData: {\n accessToken: $_accessToken, userId: $_userId,\n}';
  }

  bool isInitialized() => _accessToken != null && _userId != null;

  void clean() {
    _accessToken = _userId = null;
  }

  void initialize({required String acessToken, required int userId}) {
    _accessToken = acessToken;
    _userId = userId;
  }
}
