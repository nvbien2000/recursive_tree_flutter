import 'package:example/data/others/vn_data.dart';
import 'package:example/models/vn_region_node.dart';
import 'package:example/screens/others/vn_expanded_screen.dart';
import 'package:example/widgets/btn1.dart';
import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

class OtherScreen extends StatefulWidget {
  const OtherScreen({super.key});

  @override
  State<OtherScreen> createState() => _OtherScreenState();
}

class _OtherScreenState extends State<OtherScreen> {
  late TreeType<VNRegionNode> initData;
  bool isLoading = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      initData = await sampleVNData();
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deeply customized UI")),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 300, width: double.infinity),
              FutureBuilder(
                future: Future.delayed(const Duration(milliseconds: 500)),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Btn1(
                      screen: VnExpandedScreen(initData),
                      title: "LET'S GO!",
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
