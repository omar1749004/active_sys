import 'package:active_system/controller/create_pdf_controller.dart';
import 'package:active_system/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CreatePdf extends StatelessWidget {
  const CreatePdf({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PdfController());
    return Scaffold(
      body:
      GetBuilder<PdfController>(builder: (controller) => 
      controller.pdf != null ?
       Center(
         child: SizedBox(
          height: 1000,
          width: 1000,
              child: SfPdfViewer.network(
                  "$linkPDFs/${controller.pdf}"),),
       ): const Text(""),),
              );
  }
}