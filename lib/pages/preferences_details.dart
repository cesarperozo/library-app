import 'package:flutter/material.dart';
import 'package:library_app/theme/app_theme.dart';

import '../share_preferences/prefrences.dart';

class PreferencesDetails extends StatelessWidget {
  const PreferencesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {Navigator.of(context).pop()},
            icon: Icon(
              Icons.edit_note_sharp,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
          )
        ],
        title: const Text('Preferencias de usaurio'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _infoPreferences(
                label: "Nombres",
                value: Preferences.names,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              ),
              _infoPreferences(
                label: "Apellidos",
                value: Preferences.lastNames,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              ),
              _infoPreferences(
                label: "Email",
                value: Preferences.email,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              ),
              _infoPreferences(
                label: "Teléfono",
                value: Preferences.phone,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              ),
              _infoPreferences(
                label: "Genero",
                value: Preferences.gender,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              ),
              _infoPreferences(
                label: "Fecha de nacimiento",
                value: Preferences.dateOfBirth,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              ),
              _infoPreferences(
                label: "Edad",
                value: Preferences.age,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _infoPreferences extends StatelessWidget {
  final String label;
  final String value;
  const _infoPreferences({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
                color: AppTheme.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(color: AppTheme.textColor, fontSize: 14),
          )
        ],
      ),
    );
  }
}
