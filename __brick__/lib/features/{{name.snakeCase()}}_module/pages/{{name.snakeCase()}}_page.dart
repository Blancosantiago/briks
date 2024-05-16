import 'package:flutter/material.dart';
import 'package:{{appName}}/features/new_module/components/presentation/new_components.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const  {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildHomePageComponents(context));
  }

   _buildHomePageComponents(BuildContext context) {
    return {{name.pascalCase()}}Components();
  }
}
