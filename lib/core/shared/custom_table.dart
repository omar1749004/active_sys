import 'package:active_system/core/constant/styles.dart';
import 'package:flutter/material.dart';


class CustomTable extends StatelessWidget {
   CustomTable({super.key, required this.columnsHeader, required this.rowInfo});
 final List<Widget> columnsHeader ;
 final List rowInfo ;
 final ScrollController hscrollController = ScrollController();
 final ScrollController vscrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scrollbar(
        thickness: 10,
        controller: hscrollController,
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          
          scrollDirection: Axis.horizontal,
          controller: hscrollController,
          child: Scrollbar(
            thickness: 10,
        controller: vscrollController,
        thumbVisibility: true,
        trackVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: vscrollController,
              child: DataTable(
                border: TableBorder.all(color:const Color.fromARGB(255, 56, 56, 56),),
                
                
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
        ),
      ),
    );
  }
}
