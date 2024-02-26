import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Sample ARCore Flutter"),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
      )
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addSphere(arCoreController);
    _addCylinder(arCoreController);
    _addCube(arCoreController);
  }

  void _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(color: const Color.fromARGB(120, 66, 134, 244));
    final sphere = ArCoreSphere(materials: [material], radius: 0.1);
    final node = ArCoreNode(shape: sphere, position: vector.Vector3(0, 0, -1.5));
    controller.addArCoreNode(node);
  }

  void _addCylinder(ArCoreController controller) {
    final material = ArCoreMaterial(color: Colors.red, reflectance: 1.0,);
    final cylinder = ArCoreCylinder(materials: [material], radius: 0.5, height: 0.3);
    final node = ArCoreNode(shape: cylinder, position: vector.Vector3(0.0, -0.5, -2.0));
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(color: const Color.fromARGB(120, 66, 134, 244), metallic: 1.0,);
    final cube = ArCoreCube(materials: [material], size: vector.Vector3(0.5, 0.5, 0.5),);
    final node = ArCoreNode(shape: cube, position: vector.Vector3(-0.5, 0.5, -3.5));
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
