import 'dart:convert';

import 'package:http/http.dart';
import 'package:track_it/data/data.dart';

class HttpClientAdapter extends HttpClient {
  HttpClientAdapter({required this.client});

  final Client client;

  @override
  Future<Map?> request({
    Map? body,
    required String url,
    required HttpMethod method,
  }) async {
    late Response clientResponse;

    final encodedBody = body != null ? jsonEncode(body) : null;
    final urlAsUri = Uri.parse(url);

    try {
      switch (method) {
        case HttpMethod.get:
          clientResponse = await client.get(urlAsUri);
          break;

        case HttpMethod.post:
          clientResponse = await client.post(urlAsUri, body: encodedBody);
          break;

        case HttpMethod.put:
          clientResponse = await client.put(urlAsUri, body: encodedBody);
          break;

        case HttpMethod.delete:
          clientResponse = await client.delete(urlAsUri, body: encodedBody);
          break;
      }
    } catch (err) {
      throw HttpError.unknown;
    }


    final statusCode = clientResponse.statusCode;

    if (statusCode == 204 || clientResponse.body.isEmpty) {
      return null;
    }

    if (statusCode >= 200 && statusCode < 300) {
      return jsonDecode(clientResponse.body);
    }

    throw HttpErrorUtils.getErrorByStatusCode(statusCode);
  }
}
