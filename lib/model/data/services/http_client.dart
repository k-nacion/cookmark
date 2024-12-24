import 'package:http/http.dart';

abstract class HttpClient {
  Future<String> read(Uri uri);
}

class HttpClientImpl implements HttpClient {
  final Client client;

  const HttpClientImpl({
    required this.client,
  });

  @override
  Future<String> read(Uri uri) async {
    return await client.read(uri);
  }
}
