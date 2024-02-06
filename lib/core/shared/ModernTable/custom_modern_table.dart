import 'package:active_system/core/shared/global_variable.dart';
import 'package:active_system/core/shared/ModernTable/custom_row_table.dart';
import 'package:flutter/material.dart';

class CustomModernTable extends StatefulWidget {
  const CustomModernTable({
    super.key,
    required this.data,
    required this.widths,
    required this.header,
  });

  final List<List<String>> data;
  final List<double> widths;
  final List<String> header;

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
                    isPressed: false,
                    align: Alignment.center,
                  ),
                  Column(
                    children: List.generate(
                        widget.data.length,
                        (index) => CustomRowTable(
                              dataCell: widget.data[index],
                              widths: widget.widths,
                            )),
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
