import 'package:flutter_test/flutter_test.dart';
import 'package:lol_app/app/repositories/summonerID_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:lol_app/app/repositories/summoner_info_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  SummonerInfoRepository repository;
  MockClient client;

  setUp(() {
    repository = SummonerInfoRepository();
    client = MockClient();
  });

  group('SummonerInfoRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<SummonerInfoRepository>());
    });

    test('returns a Post if the http call completes successfully', () async {
      when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
          .thenAnswer(
              (_) async => Response(data: {'title': 'Test'}, statusCode: 200));
      Map<String, dynamic> data = await repository.SummonerIDRepository(client);
      expect(data['title'], 'Test');
    });
  });
}
