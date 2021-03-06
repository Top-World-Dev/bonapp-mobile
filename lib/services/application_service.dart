import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_bonapp/models/application.dart';
import 'package:flutter_bonapp/config/graphql.dart';
import 'package:flutter_bonapp/api/queries/application_query.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

ApplicationQuery applicationQuery = ApplicationQuery();

class ApplicationService {

  Future<Application> getApplication() async {
    GraphQLClient _application = graphQLConfiguration.clientToQuery();
    QueryResult response = await _application.query(QueryOptions(documentNode: gql(applicationQuery.getApplicationData())));

    if (response.hasException) {
      throw new Exception('Could not get application data.');
    }

    final result = response.data;

    Application application =
        Application(name: result['application']['name'], version: result['application']['version'], environment: result['application']['environment'], year: result['application']['year']);

    return application;
  }
}
