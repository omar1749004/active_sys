import 'package:active_system/core/constant/color.dart';
import 'package:active_system/core/shared/ModernTable/functions.dart';
import 'package:flutter/material.dart';

// class CustomRowTable extends StatefulWidget {
//   const CustomRowTable({
//     super.key,
//     required this.dataCell,
//     required this.widths,
//     this.isClickable = true,
//     this.align = Alignment.centerRight,
//     required this.nameOfVar,
//     required this.ind,
//     required this.onTap,
//     this.thisPageIsHomePage = false,
//     required this.showDialog,
//     required this.selectedRowIndex, // New property to hold the selected row index
//   });

//   final int ind;
//   final List<String> dataCell;
//   final List<double> widths;
//   final bool isClickable;
//   final Alignment align;
//   final String nameOfVar;
//   final void Function() onTap;
//   final void Function() showDialog;
//   final bool thisPageIsHomePage;
//   final int selectedRowIndex; // New property to hold the selected row index

//   @override
//   State<CustomRowTable> createState() => _CustomRowTableState();
// }

// class _CustomRowTableState extends State<CustomRowTable> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onDoubleTap: () {
//         setValueInGlobalVariable(widget.nameOfVar, widget.ind);
//         widget.showDialog();
//       },
//       onTap: () {
//         // Update the selected row index when tapped
//         setState(() {
//           setValueInGlobalVariable(widget.nameOfVar, widget.ind);
//         });
//         widget.onTap(); // Trigger the onTap callback
//       },
//       child: ElevatedButton(
//         style: ButtonStyle(
//           foregroundColor: widget.isClickable
//               ? MaterialStateProperty.all(ColorApp.thirdColor)
//               : MaterialStateProperty.all(ColorApp.kPrimaryColor),
//           padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
//           shape: MaterialStateProperty.all(const BeveledRectangleBorder()),
//           backgroundColor: MaterialStateProperty.resolveWith((states) {
//             // Check if this row is the selected row and return blue color
//             return widget.ind == widget.selectedRowIndex
//                 ? Colors.blue
//                 : Colors.transparent;
//           }),
//         ),
//         onPressed: widget.isClickable ? null : () {}, // Disable button if not clickable
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: 1),
//           color: !widget.thisPageIsHomePage
//               ? const Color.fromARGB(255, 234, 234, 234)
//               : widget.dataCell[widget.dataCell.length - 1] == '1' &&
//                       widget.dataCell[widget.dataCell.length - 2] == '1'
//                   ? Colors.orange
//                   : widget.dataCell[widget.dataCell.length - 1] == '0' &&
//                           widget.dataCell[widget.dataCell.length - 2] == '1'
//                       ? const Color.fromARGB(255, 190, 171, 0)
//                       : widget.dataCell[widget.dataCell.length - 1] == '1' &&
//                               widget.dataCell[widget.dataCell.length - 2] == '0'
//                           ? Colors.red
//                           : const Color.fromARGB(255, 234, 234, 234),
//           //dataCell[dataCell.length - 1] = isclosed on attend model
//           //dataCell[dataCell.length - 2] = isowed on attend model
//           child: Row(
//             children: List.generate(
//               widget.thisPageIsHomePage
//                   ? widget.dataCell.length - 2
//                   : widget.dataCell.length,
//               (index) {
//                 return Container(
//                   alignment: widget.align,
//                   height: 40,
//                   width: widget.widths[index],
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                   decoration: const BoxDecoration(
//                     border: Border(
//                       left: BorderSide(width: 1),
//                     ),
//                   ),
//                   child: Text(
//                     widget.dataCell[index] == 'null' ? '-' : widget.dataCell[index],
//                     overflow: TextOverflow.ellipsis,
//                     textDirection: TextDirection.rtl,
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class CustomRowTable extends StatefulWidget {
  const CustomRowTable({
    super.key,
    required this.dataCell,
    required this.widths,
    this.isClickable = true,
    this.align = Alignment.centerRight,
    required this.nameOfVar,
    required this.ind,
    required this.onTap,
    this.thisPageIsHomePage = false,
    required this.showDialog,
    this.color = Colors.black,
  });

  final int ind;
  final List<String> dataCell;
  final List<double> widths;
  final bool isClickable;
  final Alignment align;
  final String nameOfVar;
  final void Function() onTap;
  final void Function() showDialog;
  final bool thisPageIsHomePage;
  final Color color;

  @override
  State<CustomRowTable> createState() => _CustomRowTableState();
}

class _CustomRowTableState extends State<CustomRowTable> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setValueInGlobalVariable(widget.nameOfVar, widget.ind);
        widget.showDialog();
      },
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: widget.isClickable
                ? MaterialStateProperty.all(ColorApp.thirdColor)
                : MaterialStateProperty.all(ColorApp.kPrimaryColor),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            shape: MaterialStateProperty.all(const BeveledRectangleBorder())),
        onPressed: widget.isClickable
            ? () {
                //for store index of row that clicked
                setValueInGlobalVariable(widget.nameOfVar, widget.ind);

                //for any acion want to happen in the row when click
                widget.onTap();
                setState(() {});
              }
            : null,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 1),
          color: widget.color != Colors.black
              ? widget.color
              : !widget.thisPageIsHomePage
                  ? const Color.fromARGB(255, 234, 234, 234)
                  : widget.dataCell[widget.dataCell.length - 1] ==
                              1.toString() &&
                          widget.dataCell[widget.dataCell.length - 2] ==
                              1.toString()
                      ? Colors.orange
                      : widget.dataCell[widget.dataCell.length - 1] ==
                                  0.toString() &&
                              widget.dataCell[widget.dataCell.length - 2] ==
                                  1.toString()
                          ? const Color.fromARGB(255, 190, 171, 0)
                          : widget.dataCell[widget.dataCell.length - 1] ==
                                      1.toString() &&
                                  widget.dataCell[widget.dataCell.length - 2] ==
                                      0.toString()
                              ? Colors.red
                              : const Color.fromARGB(255, 234, 234, 234),
          //dataCell[dataCell.length - 1] = isclosed on attend model
          //dataCell[dataCell.length - 2] = isowed on attend model
          child: Row(
            children: List.generate(
                widget.thisPageIsHomePage
                    ? widget.dataCell.length - 2
                    : widget.dataCell.length, (index) {
              return Container(
                alignment: widget.align,
                height: 40,
                width: widget.widths[index],
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1),
                  ),
                ),
                child: Text(
                  widget.dataCell[index] == "null"
                      ? "-"
                      : widget.dataCell[index],
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
