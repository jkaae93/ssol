import 'package:http/http.dart' as http;
import 'package:ssol/http/endpoints.dart';
import 'package:ssol/tools/logger.dart';

class HttpRequest {
  static final Map<String, String> _headers = {};
  static dynamic post(String url, dynamic body) async {
    var resp = await http.post(Uri.parse(url), body: body, headers: _headers);
    Log.d(
        "HttpRequest",
        {
          "type": "post",
          "legnth": resp.contentLength,
          "statusCode": resp.statusCode,
          "url": url,
          "body:": body,
        }.toString());
    return resp;
  }

  static dynamic get(String url) async {
    var resp = await http.get(Uri.parse(url), headers: _headers);

    Log.d(
        "HttpRequest",
        {
          "type": "get",
          "legnth": resp.contentLength,
          "statusCode": resp.statusCode,
          "url": url,
        }.toString());
    return resp;
  }

  static dynamic patch(String url, dynamic body) async {
    var resp = await http.patch(Uri.parse(url), body: body, headers: _headers);

    Log.d(
        "HttpRequest",
        {
          "type": "patch",
          "legnth": resp.contentLength,
          "statusCode": resp.statusCode,
          "url": url,
          "body:": body,
        }.toString());
    return resp;
  }

  static dynamic delete(String url, dynamic body) async {
    var resp = await http.delete(Uri.parse(url), body: body, headers: _headers);

    Log.d(
        "HttpRequest",
        {
          "type": "delete",
          "legnth": resp.contentLength,
          "statusCode": resp.statusCode,
          "url": url,
          "body:": body,
        }.toString());
    return resp;
  }

  static dynamic put(String url, dynamic body) async {
    var resp = await http.put(Uri.parse(url), body: body, headers: _headers);

    Log.d(
        "HttpRequest",
        {
          "type": "put",
          "legnth": resp.contentLength,
          "statusCode": resp.statusCode,
          "url": url,
          "body:": body,
        }.toString());
    return resp;
  }

  static dynamic read(String url) async {
    var resp = await http.read(Uri.parse(url), headers: _headers);

    Log.d(
        "HttpRequest",
        {
          "type": "read",
          "url": url,
        }.toString());
    return resp;
  }

  static dynamic head(String url) async {
    var resp = await http.head(Uri.parse(url), headers: _headers);

    Log.d(
        "HttpRequest",
        {
          "type": "head",
          "url": url,
        }.toString());
    return resp;
  }
}

/// if has response, build response class
/// please refer to json to dart from google or next link.
/// https://docs.flutter.dev/development/data-and-backend/json
class Requests {
  /// api example and templeat. it is not real api.
  Future<dynamic> login(String id, String pw) async {
    dynamic request;
    var resp = await HttpRequest.post(Endpoints.login, request);
    return resp;
  }
}
