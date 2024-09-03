import 'package:asteron/Core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8.v),
          height: SizeUtils.height,
          width: SizeUtils.width,
          color: appTheme.mainBlue,
          child: Column(
            children: [
              Image.asset(
                ImageConstants.logo,
                width: SizeUtils.width * 0.30,
              ),
              Text(
                DateFormat('MMM/dd/yyyy-h:mm:ss a').format(DateTime.now()),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeUtils.height * 0.02,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bank Details",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
              space(h: 30.v),
              Container(
                height: SizeUtils.height * 0.50,
                width: SizeUtils.width * 0.93,
                padding: EdgeInsets.all(8.v),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.v),
                  color: appTheme.whiteA700,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Holder Name",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Bank Name",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "City",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Account Number",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "IBAN",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "IFSC",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "SWIFT",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Branch",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Country",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Country",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Holder Name",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Bank Name",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "City",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Account Number",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "IBAN",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "IFSC",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "SWIFT",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Branch",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Country",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                        Text(
                          "Country",
                          style: CustomPoppinsTextStyles.bodyTextBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
