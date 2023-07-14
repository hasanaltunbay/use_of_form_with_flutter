import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var formKey=GlobalKey<FormState>();
  var textFieldKullaniciAdi=TextEditingController();
  var textFieldSifre=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Form Kullanımı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textFieldKullaniciAdi,
                      decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                      validator: (textFieldAlinanDeger){
                        if(textFieldAlinanDeger!.isEmpty){
                          return "Kullanıcı Adı Giriniz";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: textFieldSifre,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Şifre"),
                      validator: (textFieldAlinanDeger){
                        if(textFieldAlinanDeger!.isEmpty){
                          return "Şifre Giriniz";
                        }
                        if(textFieldAlinanDeger.length<6){
                          return "Şifre en az 6 hane olmalıdır.";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      child: Text("Giriş"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: (){
                        bool sonuc=formKey.currentState!.validate();
                        if(sonuc){
                          String kullaniciAdi=textFieldKullaniciAdi.text;
                          String sifre=textFieldSifre.text;
                          print("Kullanıcı Adı: $kullaniciAdi - Sifre: $sifre");
                        }
                      },
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
