import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:library_app/theme/app_theme.dart';

class PreferencesFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  String dateOfBirth = '';
  int age = 0;

  chooseDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      keyboardType: TextInputType.number,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 2),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Selécciona tu fecha de naciemiento',
      cancelText: 'Cancelar',
      confirmText: 'Aceptar',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      builder: (context, child) {
        return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                onPrimary: Colors.black, // selected text color
                primary: AppTheme.primary, // circle color
                onSurface: Colors.white,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: 'Quicksand'),
                  primary: Colors.black, // color of button's letters
                  backgroundColor: AppTheme.primary, // Background color
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            child: child!);
      },
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      dateOfBirth =
          Date.parse(pickedDate.toString()).format('dd/MM/yyyy', 'es');
      age = (pickedDate.year - DateTime.now().year).abs();
      notifyListeners();
    }
  }
}
