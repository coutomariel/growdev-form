import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormCadastro extends StatefulWidget {
  @override
  _FormCadastroState createState() => _FormCadastroState();
}

class _FormCadastroState extends State<FormCadastro> {
  final _formKey = GlobalKey<FormState>();
  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskCep = MaskTextInputFormatter(
      mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nome completo",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if(value.isEmpty) return "Campo não pode ser vazio";
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        bool isValid = EmailValidator.validate(value);
                        if (!isValid) {
                          return "Email inválido";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "CPF",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [maskCpf],
                      validator: (value) {
                        final CPF_DEFAULT_LENGTH = 14;

                        if(value.isEmpty) return "Campo não pode ser vazio";
                        if(value.length < CPF_DEFAULT_LENGTH) return "CPF inválido";

                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "CEP",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [maskCep],
                            validator: (value) {
                              final CEP_DEFAULT_LENGTH = 9;

                              if(value.isEmpty) return "Campo não pode ser vazio";
                              if(value.length < CEP_DEFAULT_LENGTH) return "CEP inválido";

                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: IconButton(
                            icon: Icon(Icons.search),
                          ),
                        ),
                        Text("Buscar CEP"),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Rua",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if(value.isEmpty) return "Campo não pode ser vazio";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Número",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if(value.isEmpty) return "Campo não pode ser vazio";
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Bairro",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if(value.isEmpty) return "Campo não pode ser vazio";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Cidade",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if(value.isEmpty) return "Campo não pode ser vazio";
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "UF",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if(value.isEmpty) return "Campo não pode ser vazio";
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "País",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if(value.isEmpty) return "Campo não pode ser vazio";
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 0),
              child: OutlineButton(
                child: Text("CADASTRAR"),
                textColor: Theme.of(context).primaryColor,
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Enviando dados para o servidor"),
                      duration: Duration(seconds: 3),
                    ));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
