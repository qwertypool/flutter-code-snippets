TimeOfDay selectedTime = TimeOfDay.now();

Future<void> _selectTime(BuildContext context) async {
final TimeOfDay picked_s = await showTimePicker(
    context: context,
    initialTime: selectedTime, builder: (BuildContext context, Widget child) {
       return MediaQuery(
         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: child,
      );});

if (picked_s != null && picked_s != selectedTime )
  setState(() {
    selectedTime = picked_s;
  });
}
