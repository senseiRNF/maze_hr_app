import 'package:flutter/material.dart';
import 'package:maze_hr_app/core_pages/login_page_core.dart';
import 'package:maze_hr_app/services/local/static_variables.dart';

class LoginDisplay extends StatelessWidget {
  final LoginCore core;

  const LoginDisplay({
    super.key,
    required this.core,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Text(
                  StaticVariables.appName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                'Silahkan login untuk melanjutkan',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: core.emailCTRL,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: core.passwordCTRL,
                obscureText: core.isObscurePassword,
                decoration: InputDecoration(
                  hintText: 'Kata Sandi',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  prefixIcon: Icon(
                    Icons.key,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  suffixIcon: InkWell(
                    onTap: () => core.onObscurityPressed(),
                    customBorder: const CircleBorder(),
                    child: Icon(
                      core.isObscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => core.onLogin(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0,),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => core.onForgotPasswordPressed(),
                    borderRadius: BorderRadius.circular(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Lupa kata sandi?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}