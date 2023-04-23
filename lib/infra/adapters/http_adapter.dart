import 'dart:convert';

import 'package:http/http.dart';
import 'package:track_it/data/data.dart';

class HttpClientAdapter extends HttpClient {
  HttpClientAdapter({required this.client});

  final Client client;

  Map<String, String> get headers => {
        'content-type': 'application/json',
        'accept': 'application/json',
      };

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
          clientResponse = await client.get(urlAsUri, headers: headers);
          break;

        case HttpMethod.post:
          clientResponse = await client.post(urlAsUri, body: encodedBody, headers: headers);
          break;

        case HttpMethod.put:
          clientResponse = await client.put(urlAsUri, body: encodedBody, headers: headers);
          break;

        case HttpMethod.delete:
          clientResponse = await client.delete(urlAsUri, body: encodedBody, headers: headers);
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

    switch (statusCode) {
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      case 409:
        throw HttpError.conflict;
      default:
        throw HttpError.serverError;
    }
  }
}
