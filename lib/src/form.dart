import 'package:flutter/material.dart';

class AplicacionForm extends StatefulWidget {
  @override
  createState() => _AplicacionForm();
}

class _AplicacionForm extends State<AplicacionForm> {
  String operacion = 'Suma';
  String resultado = '';
  TextEditingController controladorNumero1 = TextEditingController();
  TextEditingController controladorNumero2 = TextEditingController();

  void calcularResultado() {
    double numero1 = double.parse(controladorNumero1.text);
    double numero2 = double.parse(controladorNumero2.text);
    double res;

    switch (operacion) {
      case 'Suma':
        res = numero1 + numero2;
        break;
      case 'Resta':
        res = numero1 - numero2;
        break;
      case 'Multiplicación':
        res = numero1 * numero2;
        break;
      case 'División':
        res = numero1 / numero2;
        break;
      default:
        res = 0;
    }

    setState(() {
      resultado = 'Resultado: $res';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: Form(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: controladorNumero1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Ingrese Primer Valor:",
                    suffixIcon: Icon(Icons.calculate),
                    border: OutlineInputBorder(),
                  )),
              const Divider(),
              TextFormField(
                controller: controladorNumero2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Ingrese Segundo Valor:",
                    suffixIcon: Icon(Icons.calculate),
                    border: OutlineInputBorder()),
              ),
              const Divider(),
              Row(
                children: <Widget>[
                  const Text('Operación:'),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: operacion,
                    items: <String>[
                      'Suma',
                      'Resta',
                      'Multiplicación',
                      'División'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(
                        () => operacion = value!,
                      );
                    },
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: calcularResultado,
                    child: const Icon(Icons.check),
                  ),
                ],
              ),
              const Divider(),
              TextFormField(
                controller: TextEditingController(text: resultado),
                readOnly: true,
                decoration: const InputDecoration(
                    labelText: "Resultado", border: OutlineInputBorder()),
              )
            ],
          ),
        )));
  }
}
