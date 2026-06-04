import 'dart:html' as html;

void downloadCV() {
  html.AnchorElement anchorElement = html.AnchorElement(href: 'assets/cv.pdf')
    ..setAttribute("download", "Nazmul_CV.pdf")
    ..click();
}
