import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_model/auth_view_model.dart';
import '../../widgets/auth_screen_widgets/custom_dialogue_box.dart';
import '../../widgets/auth_screen_widgets/password_rules_widget.dart';
import '../../widgets/auth_screen_widgets/custom_elevated_button.dart';
import '../../widgets/auth_screen_widgets/custom_textfield.dart';

class SinUpScreen extends StatefulWidget {
  const SinUpScreen({super.key});

  @override
  State<SinUpScreen> createState() => _SinUpScreenState();
}

class _SinUpScreenState extends State<SinUpScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController couponController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController dummyController = TextEditingController();

  String? degree;
  String? year;
  String? imagePath;
  String? receiptPath;

  // Pick Image
  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() => imagePath = result.files.single.path);
    }
  }

  // Pick Receipt
  Future<void> pickReceipt() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      setState(() => receiptPath = result.files.single.path);
    }
  }

  // Called only when all validations pass
  void registerUser() {
    // At this point all validations already passed in onPressed
    debugPrint("First Name: ${firstNameController.text}");
    debugPrint("Last Name: ${lastNameController.text}");
    debugPrint("Email: ${emailController.text}");
    debugPrint("Password: ${passwordController.text}");
    debugPrint("Degree: $degree");
    debugPrint("Year: $year");
    debugPrint("Image Path: $imagePath");
    debugPrint("Receipt Path: $receiptPath");

    // TODO: replace with real API call
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const CustomDialogueBox(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 40),
            Text("Create Account", style: GoogleFonts.jost(fontSize: 24, fontWeight: FontWeight.w600, color: const Color(0xff202244))),
            const SizedBox(height: 10),
            Center(child: Image.asset("assets/images/logo2.png", height: 150)),
            const SizedBox(height: 20),

            // First & last name
            Text("Enter your full name", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xff202244))),
            const SizedBox(height: 8),
            CustomTextField(
              controller: firstNameController,
              hintText: "First Name",
              validator: (v) => (v == null || v.trim().isEmpty) ? "First name is required" : null,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: lastNameController,
              hintText: "Last Name",
              validator: (v) => (v == null || v.trim().isEmpty) ? "Last name is required" : null,
            ),
            const SizedBox(height: 15),

            // Email
            Text("Enter your Email", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xff202244))),
            const SizedBox(height: 8),
            CustomTextField(
              controller: emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined, color: Color(0xff434343), size: 22),
              validator: (v) {
                if (v == null || v.trim().isEmpty) return "Email is required";
                final emailReg = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                if (!emailReg.hasMatch(v.trim())) return "Enter a valid email";
                return null;
              },
            ),
            const SizedBox(height: 15),

            // Coupon (optional) label + field
            Row(children: [
              Text('Coupon Code ', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xff202244))),
              Text("(optional)", style: const TextStyle(color: Color(0xff677079))),
            ]),
            const SizedBox(height: 8),
            CustomTextField(
              controller: couponController,
              hintText: 'Coupon code',
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(Icons.confirmation_num_outlined, color: Color(0xff434343), size: 22),
            ),
            const SizedBox(height: 15),

            // Passwords
            Text("Password", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xff202244))),
            const SizedBox(height: 8),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff434343), size: 22),
              suffixIcon: const Icon(Icons.visibility_off_outlined, color: Color(0xff434343), size: 22),
              validator: (v) => (v == null || v.trim().isEmpty) ? "Password is required" : null,
              onChanged: (value) {
                // update strength flags
                authVM.checkPasswordStrength(value);
                // auto-hide rules when password becomes strong
                if (authVM.isPasswordStrong && authVM.showRules) {
                  authVM.setShowRules(false);
                }
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Icons.lock_outline, color: Color(0xff434343), size: 22),
              suffixIcon: const Icon(Icons.visibility_off_outlined, color: Color(0xff434343), size: 22),
              validator: (v) => (v == null || v.trim().isEmpty) ? "Confirm password is required" : null,
            ),
            const SizedBox(height: 15),

            // Password rules container (only after user attempted create and password is weak)
            if (authVM.showRules && !authVM.isPasswordStrong)  PasswordRulesWidget(),
            const SizedBox(height: 15),

            // Degree dropdown
            Text("Degree", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xff202244))),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              width: 360,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffFFFFFF),
                  hintText: 'Degree',
                  hintStyle: TextStyle(fontFamily: GoogleFonts.mulish().fontFamily, color: const Color(0xff505050), fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xff505050), width: 1)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xff505050), width: 1)),
                ),
                items: ["MBBS", "BDS", "BS"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) => setState(() => degree = value),
                validator: (value) => value == null ? "Select degree" : null,
              ),
            ),
            const SizedBox(height: 15),

            // Year dropdown
            Text("Year", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xff202244))),
            const SizedBox(height: 8),
            SizedBox(
              height: 50,
              width: 360,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffFFFFFF),
                  hintText: 'Year',
                  hintStyle: TextStyle(fontFamily: GoogleFonts.mulish().fontFamily, color: const Color(0xff505050), fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xff505050), width: 1)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xff505050), width: 1)),
                ),
                items: ["1", "2", "3", "4"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) => setState(() => year = value),
                validator: (value) => value == null ? "Select year" : null,
              ),
            ),
            const SizedBox(height: 15),

            // Upload fields (image + receipt)
            GestureDetector(
              onTap: pickImage,
              child: CustomTextField(hintText: "Choose Image", suffixIcon: const Icon(Icons.upload, color: Color(0xff434343), size: 22), controller: dummyController),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: pickReceipt,
              child: CustomTextField(hintText: "Choose Receipt", suffixIcon: const Icon(Icons.upload, color: Color(0xff434343), size: 22), controller: dummyController),
            ),
            const SizedBox(height: 20),

            // Bank details (no change)
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(border: Border.all(color: const Color(0xff0961F5)), borderRadius: BorderRadius.circular(8), color: const Color(0xffF0F9FF)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("Bank Account",
                      style: GoogleFonts.mulish(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff0961F5))),
                  Text("Account Title", style: GoogleFonts.mulish(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff0961F5))),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("Allied Bank", style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w600, color: const Color(0xff656565))),
                  Text("Shehzab Iqbal",
                      style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w600, color: const Color(0xff656565))),
                ]),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("Account Number", style: GoogleFonts.mulish(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff0961F5))),
                  Text("IBAN", style: GoogleFonts.mulish(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff0961F5))),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("093401018421002013", style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w600, color: const Color(0xff656565))),
                  Text("PK18ABPA001064210820013", style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w600, color: const Color(0xff656565))),
                ]),
              ]),
            ),
            const SizedBox(height: 25),

            // Create button: validate everything, show rules container when weak, show snackbars for other errors
            CustomElevatedButton(
              text: 'Create Account',
              onPressed: () async {
                // Validate form fields and dropdowns
                if (_formKey.currentState == null || !_formKey.currentState!.validate()) return;

                // Password checks
                final pwd = passwordController.text.trim();
                final confirm = confirmPasswordController.text.trim();
                if (!authVM.isPasswordStrong) { authVM.setShowRules(true); return; }
                if (pwd != confirm) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match"))); return; }

                // // uploads
                // if (imagePath == null) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please upload an image"))); return; }
                // if (receiptPath == null) { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please upload a receipt"))); return; }

                // call signup on the VM
                final ok = await authVM.signup(
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  email: emailController.text.trim(),
                  password: pwd,
                  degree: degree ?? '',
                  year: year ?? '',
                  imagePath: imagePath,
                  receiptPath: receiptPath,
                );

                if (ok) {
                  // success: show dialog and navigate or navigate immediately
                  showDialog(context: context, builder: (_) => const Dialog(child: CustomDialogueBox()));
                  // optionally, after a delay, navigate to login:
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushReplacementNamed(context, '/');
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(authVM.error ?? 'Signup failed')));
                }
              },

            ),
          ]),
        ),
      ),
    );
  }
}
