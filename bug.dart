```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://example.com/data'));
    if (response.statusCode == 200) {
      // Process the data here
      final data = jsonDecode(response.body);
      // Use the data
      print(data);
    } else {
      // Handle error
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exception
    print('Error: $e');
    // Rethrow the exception to be handled higher up the call stack.
    rethrow; 
  }
}
```