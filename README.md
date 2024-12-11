<!-- Author: Nguyen Van Bien -->
<!-- Email: nvbien2000@gmail.com -->

# unit_tree_flutter

## TRANSFER ANNOUNCEMENT !!
Due to copyright, I won't use the name **recursive_tree_flutter** anymore, and this repo will change the status to read-only. The new name is **unit_tree_flutter**, and new repo is [https://github.com/nvbien2000/unit_tree_flutter](https://github.com/nvbien2000/unit_tree_flutter).

------------

Customize your tree UI with no limit! By mainly focusing on **data structure**, you can customize the tree UI with various styles.

<img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/VNUnit2.png" width="300"/>



## Table of contents

- [recursive\_tree\_flutter](#unit_tree_flutter)
  - [Table of contents](#table-of-contents)
  - [Demonstration](#demonstration)
    - [1. Stack widgets](#1-stack-widgets)
    - [2. Expanded widgets](#2-expanded-widgets)
  - [Quick Start](#quick-start)
    - [1. Introduce tree data structure](#1-introduce-tree-data-structure)
    - [2. With eager loading style](#2-with-eager-loading-style)
    - [3. With lazy loading style](#3-with-lazy-loading-style)
  - [Ask: I want to customize the UI?](#ask-i-want-to-customize-the-ui)
  - [Ask: I want to customize the UI even MOREEEE!!](#ask-i-want-to-customize-the-ui-even-moreeee)

## Demonstration
By default, you can apply **8** basic variants from this package: `Stack/Expanded widgets` X `Multiple-choice/Single-choice` X `Eager-loading/Lazy-loading`.

### 1. Stack widgets
- 1.1. `MStackWidget`: Multiple choice, eager loading.
- 1.2. `MLazyStackWidget`: Multiple choice, lazy loading.
- 1.3. `SStackWidget`: Single choice, eager loading.
- 1.4. `SLazyStackWidget`: Single choice, lazy loading.

<img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/MStackWidget.gif" width="250"/> <img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/MLazyStackWidget.gif" width="250"/> 

<img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/SStackWidget.gif" width="250"/> <img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/SLazyStackWidget.gif" width="250"/> 

### 2. Expanded widgets
- 2.1. `MExpandedWidget`: Multiple choice, eager loading.
- 2.2. `MLazyExpandedWidget`: Multiple choice, lazy loading.
- 2.3. `SExpandedWidget`: Single choice, eager loading.
- 2.4. `SLazyExpandedWidget`: Single choice, lazy loading.

<img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/MExpandedWidget.gif" width="250"/> <img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/MLazyExpandedWidget.gif" width="250"/> 

<img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/SExpandedWidget.gif" width="250"/> <img src="https://github.com/nvbien2000/unit_tree_flutter/raw/main/readme_files/SLazyExpandedWidget.gif" width="250"/> 

## Quick Start

### 1. Introduce tree data structure

Tree data structure & algorithms is taken from this package: [unit_tree_data_structure](https://pub.dev/packages/unit_tree_data_structure).

The property `isUnavailable` is defined by default as: If a branch doesn't contains any leaf, it is unavailable (or un-chosenable).

### 2. With eager loading style

Use `TreeType.fromJson()` to parse data from `Map` to `TreeType`. **REMEMBER** to call `updateAllUnavailableNodes(tree)` before return:

```dart
TreeType<EasyNodeType> sampleData() {
  Map<String, dynamic> data = {
    "data": {
      "id": 0,
      "title": "Root: Level 0",
    },
    "children": [
      {
        "data": {
          "id": 11,
          "title": "(Inner) Ex title: Level 1.1",
        },
        "children": [
          {
            "data": {
              "id": 21,
              "title": "(Inner) Ex title: Level 2.1",
            },
            "children": [
              {
                "data": {
                  "id": 31,
                  "title": "(Leaf) Ex title: Level 3.1",
                  "isInner": false,
                },
              },
              {
                "data": {
                  "id": 32,
                  "title": "(Leaf) Ex title: Level 3.2",
                  "isInner": false,
                },
              },
              {
                "data": {
                  "id": 33,
                  "title": "(Leaf) Ex title: Level 3.3",
                  "isInner": false,
                },
              },
            ],
          },
          {
            "data": {
              "id": 22,
              "title": "(Inner) Ex title: Level 2.2",
            },
            "children": [
              {
                "data": {
                  "id": 34,
                  "title": "(Leaf) Ex title: Level 3.4",
                  "isInner": false,
                },
              },
            ],
          },
          {
            "data": {
              "id": 23,
              "title": "(Inner) Ex title: Level 2.3",
            },
          },
        ],
      },
      {
        "data": {
          "id": 12,
          "title": "(Inner) Ex title: Level 1.2",
        },
      },
    ],
  };

  var tree = TreeType.fromJson<EasyNodeType>(
    json: data,
    parent: null,
    implFromJson: EasyNodeType.fromJson,
  );

  // it is VERY important to call this function
  updateAllUnavailableNodes(tree);

  return tree;
}
```

Then, simply put that data into your widgets: 
```dart
initData = sampleData();

return MExpandedWidget(initData); // or
return SExpandedWidget(initData)`. // or
return MStackWidget([initData]); // or
return SStackWidget([initData]);
```

### 3. With lazy loading style

Lazy loading widgets receive a `Future` function to get the children nodes every click:

```dart
Future<List<TreeType<T>>> Function(TreeType<T> parent) fGetChildrenFunc;
```

You can read the example source code here:
[MLazyExpandedScreen](example/lib/screens/expanded_variant/multiple_choice/m_lazy_expanded_screen.dart#L43).

```dart
root = createRoot();

Future<List<TreeType<EasyNodeType>>> fGetChildrenFunc(
    TreeType<EasyNodeType> parent) async {
  List<TreeType<EasyNodeType>> newChildren;
  setState(() => isLoading = true);
  
  newChildren = implementationXYZ(parent);

  await Future.delayed(const Duration(seconds: 1));
  setState(() => isLoading = false);
  return newChildren;
}

return MLazyExpandedWidget(
  root,
  fGetChildrenFunc: fGetChildrenFunc,
); // or

return SLazyExpandedWidget(
  root,
  fGetChildrenFunc: fGetChildrenFunc,
); // or

return MLazyStackWidget
  [root],
  fGetChildrenFunc: fGetChildrenFunc,
); // or

return SLazyStackWidget(
  [root],
  fGetChildrenFunc: fGetChildrenFunc,
);
```

## Ask: I want to customize the UI?

You can use the [UIProperties](lib/utils/ui_properties.p.dart) to customize several parts of UI.

## Ask: I want to customize the UI even MOREEEE!!

Like I said from the beginning, the strength of this package is it mainly focuses on **tree data structure & algorithms**. Therefore, as long as you keep the current logic & use functions correctly, you can make any UI that you want!

Just Copy-Paste the widget most similar to your desired UI. Don't hesitate to do it! Source code is very short & easy to read. If you face any problem, you can create an issue in GitHub.
