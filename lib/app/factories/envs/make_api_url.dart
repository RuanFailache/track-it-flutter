import 'package:flutter_dotenv/flutter_dotenv.dart';

String makeApiUrl() => dotenv.env['API_URL']!;
