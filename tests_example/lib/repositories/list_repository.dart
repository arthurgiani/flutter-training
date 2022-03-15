class ListRepository {
  /// Throw [Exception] to test an error on screen
  Future<List<String>> getStringList() async {
    await Future.delayed(const Duration(seconds: 2));
    //throw Exception();
    return List.generate(100, (index) => 'User $index');
  }
}
