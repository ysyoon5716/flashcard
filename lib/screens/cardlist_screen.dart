import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/card_controller.dart';
import 'study_screen.dart';

class CardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardController cardController = Get.put(CardController());

    return Obx(
      () => ListView.separated(
        itemCount: cardController.cards.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final card = cardController.cards[index];
          return ListTile(
            title: Text(card.front),
            subtitle: Text(card.back),
            trailing: Wrap(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    final TextEditingController frontController = TextEditingController(text: card.front);
                    final TextEditingController backController = TextEditingController(text: card.back);

                    Get.defaultDialog(
                      title: 'Edit Card',
                      content: Column(
                        children: [
                          TextField(
                            controller: frontController,
                            decoration: const InputDecoration(labelText: 'Front'),
                          ),
                          TextField(
                            controller: backController,
                            decoration: const InputDecoration(labelText: 'Back'),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                            frontController.clear();
                            backController.clear();
                          },
                          child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cardController.updateCard(id: card.id!, front: frontController.text, back: backController.text);
                            Get.back();
                            frontController.clear();
                            backController.clear();
                          },
                          child: const Text('Update', style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Delete Card',
                      middleText: 'Are you sure you want to delete this card?',
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Cancel', style: TextStyle(color: Colors.red)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cardController.deleteCard(card.id!);
                            Get.back();
                          },
                          child: const Text('Delete', style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      )
    );
  }
}

class CardCreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardController cardController = Get.put(CardController());
    final TextEditingController frontController = TextEditingController();
    final TextEditingController backController = TextEditingController();

    return FloatingActionButton(
      onPressed: () {
        Get.defaultDialog(
          title: 'Create Card',
          content: Column(
            children: [
              TextField(
                controller: frontController,
                decoration: const InputDecoration(labelText: 'Front'),
              ),
              TextField(
                controller: backController,
                decoration: const InputDecoration(labelText: 'Back'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
                frontController.clear();
                backController.clear();
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                cardController.createCard(front: frontController.text, back: backController.text);
                Get.back();
                frontController.clear();
                backController.clear();
              },
              child: const Text('Create', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class CardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardController cardController = Get.put(CardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flashcard'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Get.to(() => StudyScreen());
            },
            child: Text('Study now'),
          ),
          Expanded(
            child: CardListView(),
          ),
        ],
      ),
      floatingActionButton: CardCreateButton(),
    );
  }
}