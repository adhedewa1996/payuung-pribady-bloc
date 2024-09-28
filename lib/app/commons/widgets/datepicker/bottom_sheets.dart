import 'package:flutter/material.dart';
import 'package:get/get.dart';

void bottomSheetNormal({
  required String title,
  required List<String> list,
  double paddingTop = 0.0,
  double paddingBottom = 0.0,
  double paddingRight = 0.0,
  double paddingLeft = 0.0,
  required String selected,
  required Function(String) callback,
  required bool showLeading,
}) {
  Get.bottomSheet(
    enableDrag: true,
    persistent: true,
    isScrollControlled: false,
    Selection(
      title: title,
      list: list,
      paddingTop: paddingTop,
      paddingBottom: paddingBottom,
      paddingRight: paddingRight,
      paddingLeft: paddingLeft,
      selected: selected,
      showLeading: showLeading,
      callback: (text) {
        callback(text);
      },
    ),
  );
}

class Selection extends StatefulWidget {
  const Selection({
    super.key,
    required this.title,
    required this.list,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingRight = 0.0,
    this.paddingLeft = 0.0,
    required this.selected,
    required this.callback,
    required this.showLeading,
  });

  final String title;
  final List<String> list;
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final double paddingLeft;
  final String selected;
  final Function(String) callback;
  final bool showLeading;

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  String selected = '';
  int? selectedIndex;

  @override
  void initState() {
    selected = widget.selected;
    setState(() {
      selectedIndex = widget.list.indexOf(selected);
    });
    super.initState();
  }

  void updateWidget(String value, int index) {
    setState(() {
      selected = value;
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 475,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: EdgeInsets.only(
        top: widget.paddingTop,
        bottom: widget.paddingBottom,
        right: widget.paddingRight,
        left: widget.paddingLeft,
      ),
      child: Column(
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.close,
                color: Colors.white,
              ),
              const SizedBox(),
              Text(
                widget.title,
                style: context.theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.highlight_remove_rounded,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.list.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = widget.list[index];
                return customRadio(
                  index: index,
                  selectedIndex: selectedIndex!,
                  title: item,
                  showLeading: widget.showLeading,
                  callback: () {
                    widget.callback(item);
                    updateWidget(item, index);
                    // print(selected == item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget customRadio({
    required int index,
    required int selectedIndex,
    required Function() callback,
    required String title,
    bool showLeading = false,
  }) {
    return Padding(
      padding: EdgeInsets.zero,
      child: ListTile(
        visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
        onTap: () {
          callback.call();
        },
        leading: showLeading
            ? Radio(
                value: index,
                groupValue: selectedIndex,
                onChanged: (value) {
                  callback.call();
                },
                activeColor: context.theme.primaryColor,
              )
            : null,
        title: Text(
          title,
          style: context.theme.textTheme.titleMedium!.copyWith(
            color: title == selected ? context.theme.primaryColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
