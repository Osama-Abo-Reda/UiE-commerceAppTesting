import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/modules/welcomes_screens/login_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

Widget defaultButton({
  required String title,
  Color? color,
  required void Function() onPressed,
}) =>
    Container(
      width: 270,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget defaultTextField({
  required FormFieldValidator<String> validator,
  required TextEditingController controller,
  required TextInputType textType,
  required String label,
  required IconData prefix,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  bool isPasswordShow = false,
  IconData? suffix,
  void Function()? suffixPressed,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: textType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: isPasswordShow,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
      ),
    );

Widget defaultTextButton({
  required Function() onPressed,
  required String title,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(title),
    );

Widget defaultDivider({required BuildContext context}) => SizedBox(
      width: 300,
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              height: 9,
              thickness: 1.5,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'OR',
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Divider(
              height: 9,
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );

Widget socialMediaIconButton() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Image(
            image: AssetImage(
              'assets/icons/icons8-facebook-48.png',
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Image(
            image: AssetImage(
              'assets/icons/icons8-google-48.png',
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Image(
            image: AssetImage(
              'assets/icons/icons8-twitter-48.png',
            ),
          ),
        ),
        const Spacer(),
      ],
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

void showToast({
  required String msg,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) navigateAndFinish(context, LoginScreen());
  });
}
// class BoxTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final FormFieldValidator<String> validator;
//   final bool obsecure;
//   final bool readOnly;
//   final VoidCallback onTap;
//   final VoidCallback onEditingCompleted;
//   final TextInputType keyboardType;
//   final ValueChanged<String> onChanged;
//   final bool isMulti;
//   final bool autofocus;
//   final bool enabled;
//   final String errorText;
//   final String label;
//   final Widget suffix;
//   final Widget prefix;

//   BoxTextField(
//       {Key key,
//       this.controller,
//       this.validator,
//       this.keyboardType = TextInputType.text,
//       this.obsecure = false,
//       this.onTap,
//       this.isMulti = false,
//       this.readOnly = false,
//       this.autofocus = false,
//       this.errorText,
//       @required this.label,
//       this.suffix,
//       this.prefix,
//       this.enabled = true,
//       this.onEditingCompleted,
//       this.onChanged})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 4),
//       child: TextFormField(
//           onChanged: onChanged,
//           onEditingComplete: onEditingCompleted,
//           autofocus: autofocus,
//           minLines: isMulti ? 4 : 1,
//           maxLines: isMulti ? null : 1,
//           onTap: onTap,
//           enabled: enabled,
//           readOnly: readOnly,
//           obscureText: obsecure,
//           keyboardType: keyboardType,
//           controller: controller,
//           decoration: InputDecoration(
//             errorText: errorText,
//             prefixIcon: prefix,
//             suffixIcon: suffix,
//             labelStyle: TextStyle(fontSize: lableFontSize()),
//             labelText: label,
//             hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
//             contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
//             enabledBorder: textFieldfocused(),
//             border: textFieldfocused(),
//             focusedBorder: textFieldfocused(),
//             errorBorder: errorrTextFieldBorder(),
//             focusedErrorBorder: errorrTextFieldBorder(),
//           ),
//           validator: validator),
//     );
//   }
// }