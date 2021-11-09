//Date time field demo

DateTimeFormField(            
    mode: DateTimeFieldPickerMode.date,
    decoration: const InputDecoration(
      hintStyle: TextStyle(color: Colors.black45),
      errorStyle: TextStyle(color: Colors.redAccent),
      border: OutlineInputBorder(),
      suffixIcon: Icon(Icons.event_note,color: Colors.black,),
      labelStyle:TextStyle(fontSize: 20,color: Colors.grey,letterSpacing: 1.2),
      labelText: 'Date of birth',
    ),
    // autovalidateMode: AutovalidateMode.always,
    // validator: (e) =>
    //     (e?.day ?? 0) == 1 ? 'Please not the first day ' : null,
    onDateSelected: (DateTime value) {
      print(value);
    },
 ),
