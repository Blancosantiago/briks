
import 'package:go_router/go_router.dart';
import '../input_output/{{action.snakeCase()}}_use_case_input.dart';
import '../input_output/{{action.snakeCase()}}_use_case_output.dart';
import '../repositories/{{action.snakeCase()}}_remote_repository.dart';
abstract class {{#pascalCase}}{{name}}{{/pascalCase}}Module {
  static const String {{name.snakeCase()}}page = '/{{name.snakeCase()}}page';
  static List<GoRoute> generateRoutes() {
    return [
      GoRoute(
        name: {{name.snakeCase()}}page ,
        path: {{name.snakeCase()}}page ,
        pageBuilder: (context, state) =>
            NavigatorGoRouteApp.buildPageWithDefaultTransition(
                context: context, state: state, child: const {{name.pascalCase()}}Page()),
        builder: (context, state) => const {{name.pascalCase()}}Page(),
      ),
    ];
  }

  static void registerDependencies(Injector injector) {
    _register{{#pascalCase}}{{action}}{{/pascalCase}}Feature(injector);
  }

  static void _register{{#pascalCase}}{{action}}{{/pascalCase}}Feature(Injector injector) {
    injector.registerFactory< {{#pascalCase}}{{action}}{{/pascalCase}}Repository>(
      () =>  {{#pascalCase}}{{action}}{{/pascalCase}}RepositoryImpl(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );
    injector.registerFactory< {{#pascalCase}}{{action}}{{/pascalCase}}UseCase>(
      () => {{#pascalCase}}{{action}}{{/pascalCase}}UseCaseImpl(
        remoteRepository: injector.resolve<{{#pascalCase}}{{action}}{{/pascalCase}}Repository>(),
      ),
    );

    injector.registerFactory< {{#pascalCase}}{{action}}{{/pascalCase}}RemoteRepository>(
      () => {{#pascalCase}}{{action}}{{/pascalCase}}RemoteRepositoryImplement(
        httpClient: injector.resolve<HttpClient>(),
        baseUrl: injector.resolveByName('baseUrl'),
      ),
    );
   

    injector.registerFactory<{{name.pascalCase()}}Cubit>(
      () => {{name.pascalCase()}}Cubit(
        getListTeamUseCase: injector.resolve<GetLinkStreamUseCaseImpl>(),
        getCalendarGamesUseCase: injector.resolve<CalendarGamesUseCase>(),
      ),
    );
  }
}
