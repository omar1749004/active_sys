import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/ModernTable/custom_row_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomModernTable extends StatefulWidget {
  const CustomModernTable({
    super.key,
    required this.data,
    required this.widths,
    required this.header,
    required this.nameOfGlobalID,
    required this.onRowTap,
    this.thisPageIsHomePage = false,
    required this.showDialog,
  });

  final List<List<String>> data;
  final List<double> widths;
  final List<String> header;
  final String nameOfGlobalID;
  final void Function() onRowTap;
  final void Function() showDialog;
  final bool thisPageIsHomePage;
  @override
  State<CustomModernTable> createState() => _CustomModernTableState();
}

class _CustomModernTableState extends State<CustomModernTable> {
  final ScrollController hscrollController = ScrollController();
  final ScrollController vscrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scrollbar(
        thickness: 6,
        thumbVisibility: true,
        trackVisibility: true,
        controller: hscrollController,
        child: SingleChildScrollView(
          controller: hscrollController,
          scrollDirection: Axis.horizontal,
          child: Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.right,
            thickness: 6,
            interactive: true,
            thumbVisibility: true,
            trackVisibility: true,
            controller: vscrollController,
            child: SingleChildScrollView(
              controller: vscrollController,
              child: Column(
                children: [
                  CustomRowTable(
                    dataCell: widget.header,
                    widths: widget.widths,
                    isClickable: false,
                    align: Alignment.center,
                    nameOfVar: "",
                    ind: -1,
                    OnTap: () {},
                    showDialog: () {},
                  ),
                  Column(
                    children: List.generate(
                      widget.data.length,
                      (index) => CustomRowTable(
                        dataCell: widget.data[index],
                        widths: widget.widths,
                        ind: index,
                        nameOfVar: widget.nameOfGlobalID,
                        OnTap: widget.onRowTap,
                        thisPageIsHomePage: widget.thisPageIsHomePage,
                        showDialog: widget.showDialog,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
