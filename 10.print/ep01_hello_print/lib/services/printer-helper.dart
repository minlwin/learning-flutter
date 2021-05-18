import 'package:blue_thermal_printer/blue_thermal_printer.dart';

class PrinterHelper {
  BlueThermalPrinter _printer;

  PrinterHelper(BlueThermalPrinter printer) {
    this._printer = printer;
  }

  printHeader(String header) {
    _printer.printCustom(header, 3, 1);
  }

  printCenter(String message) {
    _printer.printCustom(message, 1, 1);
  }

  printData(String label, int value) {
    _printer.printLeftRight(
        label.padRight(24, ' '), value.toString().padLeft(8, ' '), 1);
  }

  printLine() {
    _printer.printCustom('______________________________________', 1, 1);
  }

  printDate() {
    _printer.printCustom(DateTime.now().printDate, 1, 1);
  }

  printEnd() {
    _printer.paperCut();
  }
}

extension DateHelper on DateTime {
  get d4year => year.toString().padLeft(4, '0');
  get d2month => month.toString().padLeft(2, '0');
  get d2day => day.toString().padLeft(2, '0');
  get d2hour => hour.toString().padLeft(2, '0');
  get d2minute => minute.toString().padLeft(2, '0');

  get printDate => "$d2day-$d2month-$d4year $d2hour:$d2minute";
}
