import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  static const routeName = '/next';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: const Center(
        child: Text('Next Page'),
      ),
    );
  }
}
