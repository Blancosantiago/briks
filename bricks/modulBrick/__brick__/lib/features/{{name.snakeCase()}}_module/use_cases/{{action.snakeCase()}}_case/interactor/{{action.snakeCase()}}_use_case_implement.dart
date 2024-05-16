
import '../input_output/{{action.snakeCase()}}_use_case_input.dart';
import '../input_output/{{action.snakeCase()}}_use_case_output.dart';
import '../repositories/{{action.snakeCase()}}_remote_repository.dart';
import '{{action.snakeCase()}}_use_case.dart';


class  {{#pascalCase}}{{action}}{{/pascalCase}}UseCaseImpl implements  {{#pascalCase}}{{action}}{{/pascalCase}}UseCase {
  final  {{#pascalCase}}{{action}}{{/pascalCase}}RemoteRepository _remoteRepository;

   {{#pascalCase}}{{action}}{{/pascalCase}}UseCaseImpl({
    required  {{#pascalCase}}{{action}}{{/pascalCase}}RemoteRepository remoteRepository,
  }) : _remoteRepository = remoteRepository;

  @override
  Future< {{#pascalCase}}{{action}}{{/pascalCase}}Output?> {{#camelCase}}{{action}}{{/camelCase}}(
       {{#pascalCase}}{{action}}{{/pascalCase}}Input inputId) async {
    {{#pascalCase}}{{action}}{{/pascalCase}}Output? issues =
        await _remoteRepository.{{#camelCase}}{{action}}{{/camelCase}}(inputId);
    return issues;
  }
}
