import 'package:http/http.dart';
import 'package:track_it/data/data.dart';
import 'package:track_it/infra/adapters/http_adapter.dart';

HttpClient makeHttpClientAdapter() {
  final httpClient = Client();

  return HttpClientAdapter(client: httpClient);
}
