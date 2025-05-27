import 'package:GoTravel/base/res/Style/app_style.dart';
import 'package:GoTravel/custom/custom_text_form.dart';
import 'package:GoTravel/provider/login_register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String nameIsValid = '';
  String phoneIsValid = '';
  String emailIsValid = '';
  String passwordIsValid = '';

  bool isLogin = true;
  bool isShowPassword = false;
  bool obscureText = true;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  bool startsWithOne(String number) {
    final regex = RegExp(r'^1');
    return regex.hasMatch(number);
  }

  bool buttonEnable(bool isLogin){
    if(isLogin){
      if(emailIsValid == '1' && emailController.text.isNotEmpty &&
          passwordIsValid == '1' && passwordController.text.isNotEmpty){
        return true;
      }else{
        return false;
      }
    }else{
      if(emailIsValid == '1' && nameIsValid == '1' && phoneIsValid == '1' &&
          passwordIsValid == '1' && emailController.text.isNotEmpty && passwordController.text.isNotEmpty
          && phoneController.text.isNotEmpty && nameController.text.isNotEmpty){
        return true;
      }else{
        return false;
      }
    }

  }

  void clearData(){
    setState(() {
      nameController.text = '';
      phoneController.text = '';
      emailController.text = '';
      passwordController.text = '';

      nameIsValid = '1';
      phoneIsValid = '1';
      emailIsValid = '1';
      passwordIsValid = '1';
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height / 11),
            child: AppBar(
              backgroundColor: AppStyle.bgColor,
              leading: const Padding(
                padding: EdgeInsets.only(top: 22),
                child: BackButton(),
              ),
              title: Container(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  (isLogin) ? AppLocalizations.of(context)!.login :
                  AppLocalizations.of(context)!.register,
                  style: AppStyle.headTextBig,
                ),
              ),
            )
        ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(!isLogin) Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.username,
                      style: const TextStyle(fontSize: 18),
                    ),
                    CustomTextFrom(
                      hintText: AppLocalizations.of(context)!.username,
                      controller: nameController,
                      errorText: (nameIsValid == '3') ? AppLocalizations.of(context)!.invalid_username :
                                ((nameIsValid == '2') ? AppLocalizations.of(context)!.short_name : null),
                      onChange: (name){
                        if(name.length >= 6){
                          setState(() {
                            nameIsValid = '1';
                          });
                        }else if(name.length == 0){
                          setState(() {
                            nameIsValid = '3';
                          });
                        }else{
                        setState(() {
                          nameIsValid = '2';
                        });
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Text(
                      AppLocalizations.of(context)!.phone_num,
                      style: const TextStyle(fontSize: 18),
                    ),
                    CustomTextFrom(
                      hintText: AppLocalizations.of(context)!.phone_num,
                      textInputType: TextInputType.number,
                      controller: phoneController,
                      maxLength: 9,
                      prefixLabel: "+60",
                      errorText: (phoneIsValid == '2') ? AppLocalizations.of(context)!.invalid_phone : null,
                      onChange: (phone){
                        if(startsWithOne(phone) && phone.length >= 9){
                          setState(() {
                            phoneIsValid = '1';
                          });
                        }else{
                          setState(() {
                            phoneIsValid = '2';
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.email,
                  style: const TextStyle(fontSize: 18),
                ),
                CustomTextFrom(
                  hintText: AppLocalizations.of(context)!.email,
                  controller: emailController,
                  errorText: (emailIsValid == '2') ? AppLocalizations.of(context)!.invalid_email : null,
                  onChange: (email){
                    if(isValidEmail(email)){
                      setState(() {
                        emailIsValid = '1';
                      });
                    }else{
                      setState(() {
                        emailIsValid = '2';
                      });
                    }
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  AppLocalizations.of(context)!.password,
                  style: const TextStyle(fontSize: 18),
                ),
                Stack(
                  children: [
                    CustomTextFrom(
                      maxLength: 12,
                      hintText: AppLocalizations.of(context)!.password,
                      obscureText: obscureText,
                      controller: passwordController,
                      errorText: (passwordIsValid == '3') ? AppLocalizations.of(context)!.short_password :
                              ((passwordIsValid == '2') ? AppLocalizations.of(context)!.invalid_password : null),
                      onChange: (password){
                        if(isValidPassword(password)){
                          setState(() {
                            passwordIsValid = '1';
                          });
                        }else if (password.length < 8){
                          setState(() {
                            passwordIsValid = '3';
                          });
                        }else{
                          setState(() {
                            passwordIsValid = '2';
                          });
                        }
                      },
                    ),
                    Positioned(
                      top: 17,
                      right: 10,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isShowPassword = !isShowPassword;
                            obscureText = !obscureText;
                          });
                        },
                        child: (isShowPassword) ? const Icon(
                          Icons.visibility,
                          size: 25,
                          color: Colors.grey,
                        ) : const Icon(
                          Icons.visibility_off,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      (isLogin) ? AppLocalizations.of(context)!.have_no_account:
                      AppLocalizations.of(context)!.got_account,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isLogin = !isLogin;
                          clearData();
                        });
                      },
                      child: Text(
                        (isLogin) ? AppLocalizations.of(context)!.register:
                        AppLocalizations.of(context)!.login,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          decorationThickness: 2,
                          fontSize: 18
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: (buttonEnable(isLogin)) ? Colors.blue : Colors.blue.shade100,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: (buttonEnable(isLogin)) ? () async{
                  final provider = Provider.of<LoginRegisterProvider>(context,listen: false);
                  if(isLogin){
                    await provider.login(
                        context,
                        emailController.text,
                        passwordController.text
                    );
                  }else{
                    await provider.register(
                      context,
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                      passwordController.text
                    );
                  }
                } : (){},
                child: Text(AppLocalizations.of(context)!.submit),
              ),
            ),
            const SizedBox(height: 35)
          ],
        ),
      ),

    );
  }
}
