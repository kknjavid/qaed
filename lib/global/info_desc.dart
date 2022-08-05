import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var descText = [
  customText("به نام آفریننده"),
  const Text(
    "\n«ما آن بزرگوار و انسان والا و مقتدا و قائد را ستایش می کنیم تا خودمان را به او نزدیک کنیم و راهش را ادامه دهیم» \nمقام معظم رهبری",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 12),
  ),
  customText(
      "\nنرم افزار پیش رو مجموعه بیانات مقام معظم رهبری دام ظله از سال ۶۸ تا پایان تیرماه ۱۴۰۱ می باشد؛ که به روش برنامه نویسی از سایت رسمی مقام معظم رهبری دام ظله استخراج گردیده است."),
  customText(
      "\nاساتید و محققین و سخنرانان و طلاب می توانند بدون نیاز به اینترنت از آن بهره برداری نمایند."),
  customText(
      "\nنکته: فاصله قبل و بعد از کلید واژه ها در هنگام جستجو در نتایج اثرگذار خواهد بود."),
  customText("\nاللهم وفقنا لما تحب و ترضی."),
  const SizedBox(
    height: 5,
  ),
  // customText("مولف و برنامه نویس"),
];

Text customText(String text) {
  return Text(
    text,
    textAlign: TextAlign.center,
  );
}
