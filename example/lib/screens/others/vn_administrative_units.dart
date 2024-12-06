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
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    "- Vietnam has 63 provinces, 705 districts & 10,598 wards."
                    "\n- Total: 11,366 administrative units."
                    "\n- Because of this huge number, the tree data structure may take"
                    " a lot of memory, and the traversal/update functions may take a lot of time.",
                    style: TextStyle(fontSize: 15, height: 2),
                  ),
                  const SizedBox(height: 100),
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
            _buildLoading(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    if (isLoading) {
      return Container(
        color: Colors.black.withOpacity(0.3),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
