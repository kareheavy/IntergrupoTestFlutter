import 'dart:io';
import 'package:http/http.dart' as http;


class ApiClient extends http.BaseClient {
  final http.Client _inner;
//  SharedPreferences _prefs;

  final timeout = Duration(minutes: 1);

  ApiClient(this._inner);

  Future<http.StreamedResponse> send(http.BaseRequest request) async {
//    request = await _loadToken(request);
//    request = await _loadTenantId(request);
    return _inner.send(request);
  }

//  Future<http.BaseRequest> _loadToken(http.BaseRequest request) async {
//    var token = await _getToken();
//    if (token != null) {
//      request.headers[HttpHeaders.authorizationHeader] = 'bearer $token';
//    }
//    return request;
//  }
//
//  Future<String> _getToken() async {
//    if (_prefs == null) {
//      _prefs = await SharedPreferences.getInstance();
//    }
//    return _prefs.getString(Constants.TOKEN);
//  }
//
//  Future<http.BaseRequest> _loadTenantId(http.BaseRequest request) async {
//    var tenantId = await _getTenantId();
//    if (tenantId != null) {
//      request.headers['tenant-id'] = tenantId.toString();
//    }
//    return request;
//  }
//
//  Future<int> _getTenantId() async {
//    if (_prefs == null) {
//      _prefs = await SharedPreferences.getInstance();
//    }
//    return _prefs.getInt(Constants.TENANT_ID);
//  }
}
