import 'package:dio/dio.dart';

import 'api_network_constants.dart';

// A class responsible for configuring and providing the Dio instance for network operations.
class NetworkModule {
  Dio get dio {
    // Creating a Dio instance with base options, including the base URL and status validation.
    final dio = Dio(
      BaseOptions(
          baseUrl: APINetworkConstants.baseURL,
          headers: APINetworkConstants.headers,
          validateStatus: (_) => true),
    );

    // Returning the configured Dio instance.
    return dio;
  }

  // Method to create and configure the Dio instance.
}
