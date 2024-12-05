```dart
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  @override
  String toString() => "NetworkException: $message";
}

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
    } else {
      throw NetworkException('Failed to load data: ${response.statusCode}');
    }
  } on NetworkException catch (e) {
    // Handle NetworkException specifically
    print('Network Error: ${e.message}');
    // Implement retry logic or other specific handling here.
  } catch (e) {
    // Handle other unexpected exceptions
    print('Unexpected Error: $e');
    rethrow; // Rethrow other exceptions for higher-level handling
  }
}
```