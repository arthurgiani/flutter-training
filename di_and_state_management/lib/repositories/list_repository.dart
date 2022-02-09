class ListRepository {
  Future<List<String>> getStringList() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(100, (index) => 'User $index');
  }
}
