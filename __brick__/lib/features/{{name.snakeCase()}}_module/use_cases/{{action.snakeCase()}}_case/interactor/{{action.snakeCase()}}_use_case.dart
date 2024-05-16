

import '../input_output/{{action.snakeCase()}}_use_case_input.dart';
import '../input_output/{{action.snakeCase()}}_use_case_output.dart';

abstract class  {{#pascalCase}}{{action}}{{/pascalCase}}UseCase {
  Future<{{#pascalCase}}{{action}}{{/pascalCase}}Output?> {{#camelCase}}{{action}}{{/camelCase}}( {{#pascalCase}}{{action}}{{/pascalCase}}Input inputId);
}
