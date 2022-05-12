import 'package:flutter/material.dart';

import '../components/main_text_field.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MainTextField(
                placeholder: 'Only Text',
                textEditingController: TextEditingController(),
                onTraillingTapped: () {
                  debugPrint('Pressed');
                },
              ),
              const SizedBox(height: 16),
              MainTextField(
                placeholder: 'Text and leading',
                textEditingController: TextEditingController(),
                leading: const Icon(Icons.location_on),
                onTraillingTapped: () {
                  debugPrint('Pressed');
                },
              ),
              const SizedBox(height: 16),
              MainTextField(
                placeholder: 'Text and trailling',
                textEditingController: TextEditingController(),
                trailing: const Icon(Icons.delete),
                onTraillingTapped: () {
                  debugPrint('Pressed');
                },
              ),
              const SizedBox(height: 16),
              MainTextField(
                placeholder: 'Text, leading and trailling',
                textEditingController: TextEditingController(),
                trailing: const Icon(Icons.delete),
                leading: const Icon(Icons.location_on),
                onTraillingTapped: () {
                  debugPrint('Pressed');
                },
              ),
              const SizedBox(height: 16),
              MainTextField(
                placeholder: 'Obscure',
                isObscure: true,
                textEditingController: TextEditingController(),
                trailing: const Icon(Icons.delete),
                leading: const Icon(Icons.location_on),
                onTraillingTapped: () {
                  debugPrint('Pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
