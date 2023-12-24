import 'package:active_system/core/constant/styles.dart';
import 'package:flutter/material.dart';

ScrollController controller = ScrollController();

class CustomTable extends StatelessWidget {
  const CustomTable({super.key, required this.columnsHeader, required this.rowInfo});
 final List<Widget> columnsHeader ;
 final List rowInfo ;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 10,
      controller: controller,
      thumbVisibility: true,
      trackVisibility: true,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            border: TableBorder.all(color: Colors.black),
            
            
            headingTextStyle: Styles.style20,
            columns: List.generate(
              columnsHeader.length,
              (index) => DataColumn(
                label: columnsHeader[index]
              ),
            ),
            rows: List.generate(
              rowInfo.length,
              (index) => DataRow(
                cells: List.generate(
                  columnsHeader.length,
                  (cellIndex) => DataCell(
                    Text('${rowInfo[index]}'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
