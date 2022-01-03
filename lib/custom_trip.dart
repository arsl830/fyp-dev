import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(DateRanges());
String Location = '';
String Individuals = '';
String check() {
  return Individuals;
}

class DateRanges extends StatefulWidget {
  @override
  SelectedDateRange createState() => SelectedDateRange();
}

List<String> views = <String>["Month"];

class SelectedDateRange extends State<DateRanges> {
  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd, MMMM yyyy').format(today).toString();
    _endDate = DateFormat('dd, MMMM yyyy')
        .format(today.add(Duration(days: 3)))
        .toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Request For Custom Trip',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  height: 20,
                  child: Text('Start Date:' '$_startDate')),
              Container(height: 15, child: Text('End Date:' '$_endDate')),
              Card(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: SfDateRangePicker(
                  controller: _controller,
                  selectionMode: DateRangePickerSelectionMode.range,
                  onSelectionChanged: selectionChanged,
                  allowViewNavigation: false,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        labelText: 'Location'),
                    onChanged: (value) => Location = value,
                  )),
              Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: new TextField(
                    decoration: new InputDecoration(
                        labelText: "Enter your Indivual Count"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) =>
                        Individuals = value, // Only numbers can be entered
                  )),
              SizedBox(height: 20),
              Container(
                  width: 300.0,
                  height: 50.0,
                  child: OutlinedButton(
                      child: Text('Request Trip'),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: check)),
            ],
          ),
        ),
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('dd, MMMM yyyy').format(args.value.startDate).toString();
      _endDate = DateFormat('dd, MMMM yyyy')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
  }
}
