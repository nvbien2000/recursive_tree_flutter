part of 'ui_properties.dart';

/// Default values/widgets for [UIProperties]
class UIConst {
  static const title = "";

  static const titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const emptyWidget = const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.list_outlined, color: Colors.orange),
      SizedBox(height: 10),
      Text("Empty list"),
    ],
  );

  static const loadingWidget = const CircularProgressIndicator();

  static const errorWidget = const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(Icons.warning, color: Colors.red),
      const SizedBox(height: 10),
      Text("Error"),
    ],
  );
}

// class DefaultCheckBox extends StatelessWidget {
//   const DefaultCheckBox({
//     Key? key,
//     required this.isChecked,
//     required this.onChanged,
//   }) : super(key: key);

//   final bool isChecked;
//   final ValueChanged<bool> onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       tristate: true,
//       side: innerNode.data.isUnavailable
//           ? const BorderSide(color: Colors.grey, width: 1.0)
//           : BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
//       value: innerNode.data.isUnavailable ? false : innerNode.data.isChosen,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(4)),
//       ),
//       activeColor: innerNode.data.isUnavailable
//           ? Colors.grey
//           : Theme.of(context).primaryColor,
//       onChanged: innerNode.data.isUnavailable
//           ? null
//           : (value) {
//               setState(() => updateTreeMultipleChoice(innerNode, value));
//             },
//     );
//   }
// }
