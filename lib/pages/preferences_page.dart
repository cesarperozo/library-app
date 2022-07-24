import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_app/Providers/preferences_form_provider.dart';
import 'package:library_app/share_preferences/prefrences.dart';
import 'package:library_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final preferenceProvider = Provider.of<PreferencesFormProvider>(context);

    final List<Map<String, dynamic>> items = [
      {
        'value': 'Masculino',
        'label': 'Masculino',
        'icon': const Icon(
          Icons.man_sharp,
        )
      },
      {
        'value': 'Femenino',
        'label': 'Femenino',
        'icon': const Icon(Icons.woman),
      },
    ];

    void _saveForm() {
      if (!formKey.currentState!.validate()) return;
      formKey.currentState!.save();
      Navigator.of(context).pushNamed('preferencesDetails');
    }

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Preferencias'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(color: AppTheme.textColor),
                  decoration: const InputDecoration(
                    hintText: "Ingresa sus nombres",
                    labelText: "Nombres",
                  ),
                  initialValue: Preferences.names,
                  onChanged: (value) => Preferences.names = value,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z \u00C0-\u00FF ]"),
                    ),
                  ],
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    }
                    return "Campo requerido";
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: const TextStyle(color: AppTheme.textColor),
                  decoration: const InputDecoration(
                    hintText: "Ingresa sus apellidos",
                    labelText: "Apellidos",
                  ),
                  initialValue: Preferences.lastNames,
                  onChanged: (value) {
                    Preferences.lastNames = value;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z \u00C0-\u00FF ]"),
                    ),
                  ],
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    }
                    return "Campo requerido";
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: const TextStyle(color: AppTheme.textColor),
                  decoration: const InputDecoration(
                    hintText: "Ingresa su teléfono",
                    labelText: "Teléfono",
                  ),
                  initialValue: Preferences.phone,
                  onChanged: (value) => Preferences.phone = value,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    }
                    return "Campo requerido";
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: const TextStyle(color: AppTheme.textColor),
                  decoration: const InputDecoration(
                    hintText: "Escribe tu correo electrónico",
                    labelText: 'Correo Electronico',
                  ),
                  initialValue: Preferences.email,
                  onChanged: (value) => Preferences.email = value,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El correo no es correcto';
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  readOnly: true,
                  initialValue: preferenceProvider.dateOfBirth != ''
                      ? preferenceProvider.dateOfBirth
                      : Preferences.dateOfBirth,
                  onTap: () {
                    preferenceProvider.chooseDate(context);
                  },
                  style: const TextStyle(color: AppTheme.textColor),
                  decoration: const InputDecoration(
                    hintText: "Selecciona tu Fecha de nacimiento",
                    labelText: 'Fecha de nacimiento',
                  ),
                  onSaved: (newValue) {
                    Preferences.dateOfBirth = newValue!;
                  },
                ),
                if (preferenceProvider.dateOfBirth.isNotEmpty ||
                    Preferences.dateOfBirth.isNotEmpty) ...[
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: preferenceProvider.age == 0
                        ? Preferences.age
                        : preferenceProvider.age.toString(),
                    style: const TextStyle(color: AppTheme.textColor),
                    decoration: const InputDecoration(
                      labelText: 'Edad',
                    ),
                    onSaved: (newValue) {
                      Preferences.age = newValue!;
                    },
                  ),
                ],
                const SizedBox(
                  height: 30,
                ),
                SelectFormField(
                  style: const TextStyle(color: AppTheme.textColor),
                  hintText: 'Seléccione su genero',
                  initialValue: Preferences.gender,
                  labelText: 'Genero',
                  items: items,
                  onChanged: (value) => Preferences.gender = value,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _saveForm,
          child: const Icon(
            Icons.save_outlined,
            color: AppTheme.baseColor,
            size: 35,
          ),
        ),
      ),
    );
  }
}
