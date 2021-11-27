import 'package:http/http.dart';

const API_PLACEHOLDER = "https://jsonplaceholder.typicode.com";

Future<Response> deleteAlbum(String id) async {
  final response = await delete(
    Uri.parse("$API_PLACEHOLDER/albums/$id"),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UTF-8",
    },
  );
  return response;
}
