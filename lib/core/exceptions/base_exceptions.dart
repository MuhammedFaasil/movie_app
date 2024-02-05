class BaseExceptions {
  final String message;
  BaseExceptions(this.message);
  @override
  String toString() {
    return message;
  }
}
