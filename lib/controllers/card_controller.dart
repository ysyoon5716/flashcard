import 'package:get/get.dart';
import '../models/card.dart';
import '../services/card_service.dart';


class CardController extends GetxController {
  final CardService _cardService = CardService();
  final RxList<Card> cards = <Card>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCards();
  }

  Future<void> getCards() async {
    cards.value = await _cardService.getCards();
  }

  Future<void> createCard({required String front, required String back}) async {
    Card newCard = await  _cardService.createCard(Card(front: front, back: back));
    cards.add(newCard);
  }

  Future<void> updateCard({required String id, required String front, required String back}) async {
    Card updatedCard = await _cardService.updateCard(Card(id: id, front: front, back: back));
    final index = cards.indexWhere((card) => card.id == id);
    cards[index] = updatedCard;
  }

  Future<void> deleteCard(String id) async {
    await _cardService.deleteCard(id);
    cards.removeWhere((card) => card.id == id);
  }
}