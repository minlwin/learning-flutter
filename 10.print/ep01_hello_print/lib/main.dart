import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:ep01_hello_print/services/devices-state.dart';
import 'package:ep01_hello_print/services/printer-helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Printing"),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => DevicesHolder()),
          ],
          child: PrintDemo(),
        ),
      ),
    );
  }
}

class PrintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Text(
            "Print Demo",
            style: Theme.of(context).textTheme.headline4,
          ),
          Text("Available Device"),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              itemBuilder: (context, index) => ListTile(
                leading: Icon(
                    context.watch<DevicesHolder>().devices[index].connected
                        ? Icons.bluetooth_connected
                        : Icons.bluetooth_disabled),
                title: Text(context.watch<DevicesHolder>().devices[index].name),
                trailing: IconButton(
                  icon: Icon(
                      context.watch<DevicesHolder>().devices[index].connected
                          ? Icons.stop
                          : Icons.play_arrow),
                  onPressed: () async {
                    final device = context.read<DevicesHolder>().devices[index];
                    final printer = BlueThermalPrinter.instance;

                    final connected = await printer.isConnected;

                    if (connected) {
                      await printer.disconnect();
                      context.read<DevicesHolder>().disConnect();
                    } else {
                      await printer.connect(device);
                      context.read<DevicesHolder>().connect(device);
                    }
                  },
                ),
              ),
              itemCount: context.watch<DevicesHolder>().devices.length,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    _refresh(context);
                  },
                  child: Text("REFRESH"),
                ),
                SizedBox(
                  width: 4,
                ),
                ElevatedButton(onPressed: _print, child: Text("Print"))
              ],
            ),
          )
        ],
      ),
    );
  }

  _refresh(BuildContext context) async {
    final devices = await BlueThermalPrinter.instance.getBondedDevices();
    context.read<DevicesHolder>().changeState(devices);
  }

  _print() {
    final printer = BlueThermalPrinter.instance;

    printer.isConnected.then((connected) {
      if (connected) {
        PrinterHelper doc = PrinterHelper(printer);
        doc.printHeader("Smart Shop");
        doc.printCenter("အမှတ် ၁၁၀၊ ဗိိုလ်ချူပ်လမ်း၊ ဈေးရှေ့၊ ဘားအံ");

        doc.printLine();

        doc.printData('မြန်မာဘီယာဗူးရှည် 3 (2000)', 6000);
        doc.printData('အီလန်ဆပ်ပြာမှုန့် 3 (1500)', 4500);

        doc.printLine();
        doc.printData('စုစုပေါင်း', 10500);

        doc.printCenter("ဝယ်ယူအားပေးမှုအတွက် ကျေးဇူးအထူးတင်ရှိိပါတယ်ခင်ဗျာ");
        doc.printDate();
        doc.printEnd();
      }
    });
  }
}
