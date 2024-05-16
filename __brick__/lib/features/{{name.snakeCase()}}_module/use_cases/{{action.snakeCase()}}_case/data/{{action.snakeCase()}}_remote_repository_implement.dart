

import '../input_output/{{action.snakeCase()}}_use_case_input.dart';
import '../input_output/{{action.snakeCase()}}_use_case_output.dart';
import '../repositories/{{action.snakeCase()}}_remote_repository.dart';
import '../../../../../abstractions/http_client.dart';

class {{#pascalCase}}{{action}}{{/pascalCase}}RemoteRepositoryImplement
    implements {{#pascalCase}}{{action}}{{/pascalCase}}RemoteRepository {
  final String _baseUrl;
  final HttpClient _httpClient;
  static const String _{{#camelCase}}{{action}}{{/camelCase}}EndpointUrl = '/{{#camelCase}}{{endpointUrl}}{{/camelCase}}';

  {{#pascalCase}}{{action}}{{/pascalCase}}RemoteRepositoryImplement({
    required String baseUrl,
    required HttpClient httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient;
  @override
  Future<{{#pascalCase}}{{action}}{{/pascalCase}}Output?> {{#camelCase}}{{action}}{{/camelCase}}( {{#pascalCase}}{{action}}{{/pascalCase}}Input imput) async {
    var url = "$_baseUrl$_{{#camelCase}}{{action}}{{/camelCase}}EndpointUrl";

    var response = await _httpClient.get(
      url,
    );

    if (response.isOk()) {
      return {{#pascalCase}}{{action}}{{/pascalCase}}Output.fromJson(response.data);
    } else {
      return null;
    }
  }
}

