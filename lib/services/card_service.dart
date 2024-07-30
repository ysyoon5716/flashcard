import 'package:dio/dio.dart';
import '../models/card.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CardService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['API_URL']!
    ),
  );

  Future<List<Card>> getCards() async {
    final Response response = await _dio.get('/cards');
    final List<dynamic> data = response.data as List<dynamic>;
    return data.map((dynamic e) => Card.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Card> createCard(Card card) async {
    final response = await _dio.post('/card', data: card.toJson());
    return Card.fromJson(response.data);
  }

  Future<Card> updateCard(Card card) async {
    final response = await _dio.put('/card/${card.id}', data: card.toJson());
    return Card.fromJson(response.data);
  }

  Future<void> deleteCard(String id) async {
    await _dio.delete('/card/$id');
  }

  Future<Card> getRandomCard() async {
    final response = await _dio.get('/test/random');
    return Card.fromJson(response.data);
  }
}