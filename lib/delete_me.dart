import 'package:flutter/material.dart';

class DeleteMe extends StatelessWidget {
   DeleteMe({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  var cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:
        [
          IconButton(onPressed: ()
          {
            if(formKey.currentState!.validate())
            {
              print("true");
            }
            print("false");
          }, icon: Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
             //keyboardType: TextInputType.multiline,
              maxLines: 50,
          validator: (value)
          {
            if(value!.isEmpty)
              return "Mustn't Be Empty" ;
            return null;
          },
        ),

        ]
        ),
      ),
    );
  }
}
