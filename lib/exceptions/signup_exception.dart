class SignUpException implements Exception{
  final String messege;

  SignUpException(this.messege);

  @override
  String toString() {
    return messege;
  }
}