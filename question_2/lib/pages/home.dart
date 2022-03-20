import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:question_2/controllers/app_controller.dart';
import 'package:question_2/models/person.dart';
import 'package:question_2/pages/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('All Friends'),
      ),
      child: SafeArea(
        child: GetBuilder<AppController>(
          builder: (_) => _.loading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: Get.theme.cupertinoOverrideTheme!.primaryColor,
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: _.people.value.length,
                  itemBuilder: (c, i) {
                    var _person = _.people.value[i];
                    return PersonCard(
                      key: Key(_person.id),
                      person: _person,
                    );
                  },
                  separatorBuilder: (c, i) => const SizedBox(height: 8),
                ),
        ),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  final Person person;
  const PersonCard({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () => Get.to(() => DetailPage(person: person)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black12,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: Image.network(
                    person.picture,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  Text(
                    person.name.first,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
