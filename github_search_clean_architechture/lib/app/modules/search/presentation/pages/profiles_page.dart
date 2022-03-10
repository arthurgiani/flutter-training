import 'package:flutter/material.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({Key? key}) : super(key: key);

  @override
  _ProfilesPageState createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles Pages'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, index) => const SizedBox(height: 8),
              itemCount: 100,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text('$index'),
                  subtitle: const Text('id'),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/45671820?v=4'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
