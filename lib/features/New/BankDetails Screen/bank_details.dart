import 'package:asteron/Core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../Core/CommenWidgets/custom_text_field.dart';
import 'bank_controller.dart';

class Details extends ConsumerStatefulWidget {
  const Details({super.key});

  @override
  ConsumerState<Details> createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<Details> {
  final TextEditingController _acName = TextEditingController();
  final TextEditingController _iban = TextEditingController();
  final TextEditingController _ifsc = TextEditingController();
  final TextEditingController _swift = TextEditingController();
  final TextEditingController _bankName = TextEditingController();
  final TextEditingController _branch = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _holderName = TextEditingController();
  final ScrollController _controller = ScrollController();
  @override
  void dispose() {
    _acName.dispose();
    _iban.dispose();
    _ifsc.dispose();
    _swift.dispose();
    _bankName.dispose();
    _branch.dispose();
    _city.dispose();
    _country.dispose();
    _holderName.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8.v),
          height: SizeUtils.height,
          width: SizeUtils.width,
          color: appTheme.mainBlue,
          child: SingleChildScrollView(
            controller: _controller,
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
                Consumer(
                  builder: (context, ref1, child) => ref1
                      .watch(bankDetailsProvider)
                      .when(
                        data: (data) {
                          if (data.length != 0) {
                            return SizedBox(
                              height: SizeUtils.height * 0.65,
                              width: SizeUtils.width * 0.93,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final bank = data[index];
                                  _acName.text = bank?.AccountNumber ?? "";
                                  _holderName.text = bank?.holderName ?? "";
                                  _iban.text = bank?.IBANCode ?? "";
                                  _ifsc.text = bank?.IFSCcode ?? "";
                                  _swift.text = bank?.SWIFTcode ?? "";
                                  _bankName.text = bank?.bankName ?? "";
                                  _branch.text = bank?.branch ?? "";
                                  _city.text = bank?.city ?? "";
                                  _country.text = bank?.country ?? "";

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(12.h),
                                      height: SizeUtils.height * 0.8,
                                      width: SizeUtils.width * 0.93,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.v),
                                        color: Colors.black54,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _acName,
                                              label: "Account Number"),
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _iban,
                                              label: "IBAN"),
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _ifsc,
                                              label: "IFSC"),
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _swift,
                                              label: "Swift"),
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _bankName,
                                              label: "Bank Name"),
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _branch,
                                              label: "Branch Name"),
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _city,
                                              label: "City"),
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _country,
                                              label: "Country"),
                                          CustomTextField(
                                              readOnly: true,
                                              controller: _holderName,
                                              label: "Holder Name"),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container(
                              child: Text(
                                "No bankdetails!",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                        },
                        error: (error, stackTrace) {
                          return Center(
                            child: Text("Something went wrong"),
                          );
                        },
                        loading: () => SizedBox(
                          height: SizeUtils.height * 0.68,
                          width: SizeUtils.width * 0.93,
                          // padding: EdgeInsets.all(8.v),
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Container(
                                  padding: EdgeInsets.all(12.h),
                                  height: SizeUtils.height * 0.65,
                                  width: SizeUtils.width * 0.93,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.v),
                                    color: appTheme.gold,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _acName,
                                          label: "Account Number"),
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _iban,
                                          label: "IBAN"),
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _ifsc,
                                          label: "IFSC"),
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _swift,
                                          label: "Swift"),
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _bankName,
                                          label: "Bank Name"),
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _branch,
                                          label: "Branch Name"),
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _city,
                                          label: "City"),
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _country,
                                          label: "Country"),
                                      CustomTextField(
                                          readOnly: true,
                                          controller: _holderName,
                                          label: "Holder Name"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
