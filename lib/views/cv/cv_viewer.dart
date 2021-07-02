import 'package:androiker/core_packages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class AppCvViewer extends StatefulWidget {
  const AppCvViewer({Key? key}) : super(key: key);

  @override
  _AppCvViewerState createState() => _AppCvViewerState();
}

class _AppCvViewerState extends State<AppCvViewer> {
  late PdfController pdfController;

  int page = 1;
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    pdfController = PdfController(
      document: PdfDocument.openAsset('assets/raw/phuc-cv-2021.pdf'),
      viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: Insets.lg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
                iconSize: IconSizes.med,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Expanded(
          child: PdfView(
            controller: pdfController,
            onDocumentLoaded: (document) {
              setState(() {
                loaded = true;
              });
            },
            onPageChanged: (val) {
              setState(() {
                page = val;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: Insets.lg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: isPrevPageBtnEnabled() ? onPrevPage : null,
                icon: const Icon(Icons.arrow_left),
                iconSize: IconSizes.med,
                color: Colors.white,
              ),
              if (loaded)
                Text(
                  "$page / ${pdfController.pagesCount}",
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              IconButton(
                onPressed: isNextPageBtnEnabled() ? onNextPage : null,
                icon: const Icon(Icons.arrow_right),
                iconSize: IconSizes.med,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool isPrevPageBtnEnabled() => page > 1 && loaded;
  bool isNextPageBtnEnabled() => loaded && page < pdfController.pagesCount;

  void onPrevPage() {
    pdfController.previousPage(duration: Times.fast, curve: Curves.easeOut);
  }

  void onNextPage() {
    pdfController.nextPage(duration: Times.fast, curve: Curves.easeOut);
  }
}
