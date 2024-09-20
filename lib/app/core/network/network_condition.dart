// API RESPOSE STATUS CODE

bool isSuccess(int code) {
  final statusCodeList = [200];
  return statusCodeList.contains(code);
}

bool isClientError(int code) {
  return code <= 400 && code >= 499;
}

bool isServerError(int code) {
  return code <= 500 && code >= 599;
}
