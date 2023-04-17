enum HttpError {
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  conflict,
  serverError,
  invalidData,
  unknown,
}

extension HttpErrorUtils on HttpError {
  static HttpError getErrorByStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return HttpError.badRequest;
      case 401:
        return HttpError.unauthorized;
      case 403:
        return HttpError.forbidden;
      case 404:
        return HttpError.notFound;
      case 409:
        return HttpError.conflict;
      default:
        return HttpError.serverError;
    }
  }
}
