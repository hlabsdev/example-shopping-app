import 'package:assigame_market/logic/managers/managers.dart';
import 'package:assigame_market/ui/styles/styles.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AppPages.register,
      key: ValueKey(AppPages.register),
      child: const RegisterPage(),
    );
  }

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextStyle focusedStyle = TextStyle(color: AppColors.mainColor);
  final TextStyle unfocusedStyle = TextStyle(color: AppColors.assigameGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          // shrinkWrap: true,
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: WrapCrossAlignment.center,
          // alignment: WrapAlignment.center,
          children: [
            const SizedBox(height: 30),
            const SizedBox(
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(35.0),
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            buildTextfield("🕵🏾‍♂  " + AppLang.of(context)!.username, false),
            const SizedBox(height: 10),
            buildTextfield("🔐  " + AppLang.of(context)!.password, true),
            const SizedBox(height: 10),
            buildTextLink(context),
            const SizedBox(height: 15),
            buildButton(context),
          ],
        ),
      ),
    );
  }

  Padding buildTextLink(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(AppLang.of(context)!.notYetRegistered)),
          TextButton(
              onPressed: () {},
              child: Text(AppLang.of(context)!.forgetPassword)),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 55,
        child: MaterialButton(
          color: AppColors.mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Text(
            AppLang.of(context)!.login,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            /* Provider.of<AppState>(context, listen: false)
                .login('ABALOKOSSI', 'Giefemmes@2022')
                .then((value) {
              if (Provider.of<AppState>(context, listen: false).error) {
                var message =
                    Provider.of<AppState>(context, listen: false).message;
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              } else {
                // User user = fromJson(jsonDecode(UserPreferences().user));
                // Provider.of<SettingManager>(context, listen: false).setUser(user);
              }
            });*/
            Provider.of<AppState>(context, listen: false)
                .login('ABALOKOSSI', 'Giefemmes@2022');
          },
        ),
      ),
    );
  }

  Widget buildTextfield(String hintText, bool isPassword) {
    bool visible = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        cursorColor: AppColors.mainColor,
        textInputAction: TextInputAction.next,
        obscureText: isPassword ? visible : false,
        keyboardType:
            isPassword ? TextInputType.visiblePassword : TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 1.0,
            ),
          ),
          // helperText: hintText,
          labelText: hintText,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(height: 0.5),
        ),
      ),
    );
  }
}
