import 'dart:io';

import 'package:http/http.dart' as http;
import '../../views/utils/enums.dart';


// Define a mixin for HTTP request methods
mixin ClientInterface {
  Future<http.Response> makeRequest(
    String url, {
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final uri = Uri.parse(url).replace(queryParameters: queryParams);

    switch (method) {
      case HttpMethod.get:
        return await http.get(uri, headers: headers);
      case HttpMethod.post:
        return await http.post(uri, headers: headers, body: body);
      case HttpMethod.put:
        return await http.put(uri, headers: headers, body: body);
      case HttpMethod.patch:
        return await http.patch(uri, headers: headers, body: body);
      case HttpMethod.delete:
        return await http.delete(uri, headers: headers);
    }
  }

  Future<http.Response> uploadFile(String url, File file,
      {Map<String, dynamic>? queryParams,
      Map<String, String>? headers,
      String fieldName = 'file'}) async {
    final uri = Uri.parse(url).replace(queryParameters: queryParams);
    final request = http.MultipartRequest('POST', uri)
      ..headers.addAll(headers ?? {})
      ..files.add(await http.MultipartFile.fromPath(fieldName, file.path));

    final response = await request.send();
    return http.Response.fromStream(response);
  }

  Future<void> downloadFile(String url, String savePath,
      {Map<String, dynamic>? queryParams, Map<String, String>? headers}) async {
    final uri = Uri.parse(url).replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final File file = File(savePath);
      await file.writeAsBytes(response.bodyBytes);
    } else {
      throw Exception('Failed to download file: ${response.reasonPhrase}');
    }
  }
}
