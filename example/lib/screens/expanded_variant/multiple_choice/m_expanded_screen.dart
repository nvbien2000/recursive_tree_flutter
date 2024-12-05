import 'package:example/data/expanded_variant/expanded_data.dart';
import 'package:example/helpers/ex_traversal_func.dart';
import 'package:example/models/ex.dart';
import 'package:example/widgets/btn2.dart';
import 'package:example/widgets/btn3.dart';
import 'package:example/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:recursive_tree_flutter/recursive_tree_flutter.dart';

class MExpandedScreen extends StatefulWidget {
  const MExpandedScreen({super.key});

  @override
  State<MExpandedScreen> createState() => _MExpandedScreenState();
}

class _MExpandedScreenState extends State<MExpandedScreen> {
  late TreeType<EasyNodeType> root;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    root = sampleExpandedData();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text("ExpandedWidget (multiple choice)")),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: MExpandedWidget(root),
              ),
              divider,
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 4.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                children: [
                  Btn2(
                    title: "Chosen leaves",
                    onTap: () => chosenLeaves(context, root),
                  ),
                  Btn2(
                    title: "Chosen nodes",
                    onTap: () => chosenNodes(context, root),
                  ),
                  Btn3(
                    title: "Insert leaf to root",
                    onTap: () {
                      var newLeaf = Ex.sampleRandomLeaf();

                      try {
                        insertNode(root, newLeaf);
                        setState(() {});
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                  ),
                  Btn3(
                    title: "Delete tree with id=34",
                    onTap: () {
                      try {
                        deleteBranchByID(root, 34);
                        setState(() {});
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                  ),
                ],
              ),
              divider,
              Container(
                color: Colors.amber.withOpacity(0.3),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Text is transformed to lowercase before searching.",
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Search by title - Press Enter to update",
                      ),
                      onFieldSubmitted: (value) {
                        updateTreeWithSearchingTitle(root, value);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Colors.blue.withOpacity(0.1),
                child: const Text(
                  "- Q: Can I make the tree expanded by default?"
                  "\n- A: Yes. Just set the 'isExpanded' property to 'true'.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
