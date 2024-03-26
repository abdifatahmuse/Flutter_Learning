import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  final textController = TextEditingController();
  final fullNameController = TextEditingController();
  final pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TextField(
          controller: textController,
          textInputAction: TextInputAction.next,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            wordSpacing: 0.4,
          ),
          decoration: InputDecoration(
            hintText: "Text Field",
            labelText: "Text Field",
            filled: true,
            fillColor: Colors.brown.shade50,
            contentPadding: const EdgeInsets.only(
              left: 15,
              right: 10,
              bottom: 18,
              top: 18,
            ),
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              letterSpacing: 1.2,
            ),
            enabledBorder: const OutlineInputBorder(
              gapPadding: 10,
              borderSide: BorderSide(
                color: Colors.transparent,
                // width: 2.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.brown,
                // color: orange,
                width: 2.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade200,
                // color: orange,
                width: 2.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade500,
                // color: orange,
                width: 2.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: fullNameController,
                  onChanged: (value) => _formKey.currentState!.validate(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your User Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    contentPadding: const EdgeInsets.only(
                      left: 15,
                      right: 10,
                      bottom: 18,
                      top: 18,
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      letterSpacing: 1.2,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      gapPadding: 10,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        // width: 2.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.brown,
                        // color: orange,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.shade200,
                        // color: orange,
                        width: 2.5,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red.shade500,
                        // color: orange,
                        width: 2.5,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  obscureText: _visible,
                  controller: pinController,
                  // keyboardType: TextInputType.number,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Pin';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    print("Submitted, ${pinController.text.trim()}");
                  },
                  decoration: InputDecoration(
                    hintText: "Pin",
                    prefixIcon: const Icon(
                      Icons.person,
                      size: 25,
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        _visible
                            ? CupertinoIcons.eye_slash_fill
                            : CupertinoIcons.eye_fill,
                        size: 22,
                      ),
                      onTap: () {
                        setState(() {
                          _visible = !_visible;
                        });
                      },
                    ),
                  ),
                )
              ],
            )),
      ],
    ));
  }
}
