
//Demo text field (for email/name/etc.)
    TextFieldContainer(
          child: TextField(
            onChanged: (value) {},
            cursorColor: Colors.black,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Email',
              border: InputBorder.none,
            ),
          ),
        ),

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: pSecondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}


----------------------------------------/\/\/\/\/\/\/\/\/\/\/\/\----------------------------------------------------

//Dummy Password text-field : 
    
TextFieldContainer(
      child: TextField(
        obscureText: _isHidden,
        onChanged: (value) {},
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          suffixIcon: InkWell(
                onTap: _togglePasswordView,
                child: Icon(
                        _isHidden 
                        ? Icons.visibility 
                        : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
          border: InputBorder.none,
        ),
      ),
    ),

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: pSecondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

----------------------------------------/\/\/\/\/\/\/\/\/\/\/\/\----------------------------------------------------

//Multi-line Textfield in flutter
TextField(
    keyboardType: TextInputType.multiline,
    minLines: 1,//Normal textInputField will be displayed
    maxLines: 5,// when user presses enter it will adapt to it
    );

----------------------------------------/\/\/\//\/\/\/\/\/\/\/\/\----------------------------------------------------
    
