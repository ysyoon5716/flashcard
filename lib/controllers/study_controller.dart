import 'package:get/get.dart';
import '../models/card.dart';
import '../services/card_service.dart';

class StudyController extends GetxController {
  final CardService _cardService = CardService();
  final RxString id = ''.obs;
  final RxString front = ''.obs;
  final RxString back = ''.obs;
  final RxBool showBack = false.obs;

  @override
  void onInit() {
    super.onInit();
    getRandomCard();
  }

  Future<void> getRandomCard() async {
    final Card card = await _cardService.getRandomCard();
    id.value = card.id!;
    front.value = card.front;
    back.value = card.back;
    showBack.value = false;
  }
}