import 'package:design_system_example/design_system_example.dart';
import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();
  final textController5 = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextField')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MainTextField(
                textController: textController1,
                hintText: 'No leading / trailling',
              ),
              const SizedBox(height: 16),
              MainTextField(
                textController: textController2,
                hintText: 'Leading',
                leading: const Icon(Icons.location_city),
              ),
              const SizedBox(height: 16),
              MainTextField(
                textController: textController3,
                hintText: 'Trailling',
                trailling: const Icon(Icons.person_search_rounded),
                onTraillingPressed: () {
                  debugPrint('Pressed');
                },
              ),
              const SizedBox(height: 16),
              MainTextField(
                textController: textController4,
                hintText: 'With leading / trailling',
                leading: const Icon(Icons.location_city),
                trailling: const Icon(Icons.clear),
                onTraillingPressed: () {
                  textController4.clear();
                },
              ),
              const SizedBox(height: 16),
              MainTextField(
                textController: textController5,
                hintText: 'Obscure',
                isObscure: isObscure,
                trailling: const Icon(Icons.password),
                onTraillingPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
