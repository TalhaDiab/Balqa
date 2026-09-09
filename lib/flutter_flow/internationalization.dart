import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'h7gtgjr2': {
      'ar': 'رحلات',
      'en': 'Trips',
    },
    'bhlqtedi': {
      'ar': 'احجز رحلتك',
      'en': 'Book your trip',
    },
    'e1enemyh': {
      'ar': 'من',
      'en': 'from',
    },
    'u1dstct5': {
      'ar': 'بحث...',
      'en': 'Search...',
    },
    'z6dgmu5k': {
      'ar': 'إلى',
      'en': 'to',
    },
    '6ztyjki6': {
      'ar': 'بحث...',
      'en': 'Search...',
    },
    'vqoxvbn1': {
      'ar': 'دمشق',
      'en': '',
    },
    'vmyh7kcs': {
      'ar': 'حمص',
      'en': '',
    },
    'mvol2vls': {
      'ar': 'حلب',
      'en': '',
    },
    'ylsw3arp': {
      'ar': 'حماه',
      'en': '',
    },
    'xz8cy8yz': {
      'ar': 'إدلب',
      'en': '',
    },
    '97ip089w': {
      'ar': 'اللاذقية',
      'en': '',
    },
    'mqrrp1tt': {
      'ar': 'دير الزور',
      'en': '',
    },
    'n1v0kjm8': {
      'ar': 'البوكمال',
      'en': '',
    },
    'lea3svj3': {
      'ar': 'درعا',
      'en': '',
    },
    'v9kqb08s': {
      'ar': 'مطار دمشق',
      'en': '',
    },
    'phuwi7yv': {
      'ar': 'مطار حلب',
      'en': '',
    },
    'z3nc4uyn': {
      'ar': 'شحن',
      'en': 'shipping',
    },
    'q9vce6e4': {
      'ar': 'تسليم خلال ساعات',
      'en': 'Delivery within hours',
    },
    'fvgcn4re': {
      'ar': 'إرسال',
      'en': 'send',
    },
    '3h4yxkrk': {
      'ar': 'طلب خاص',
      'en': 'Custom',
    },
    'hwef8cxh': {
      'ar': 'بلقاء معك ',
      'en': 'Balqaa with you',
    },
    'l82e1cl8': {
      'ar': 'رحلة خاصة',
      'en': 'Special trip',
    },
    'ivpnih1m': {
      'ar': 'رحلة خاصة ',
      'en': 'Special trip',
    },
    '76vok5oo': {
      'ar': 'VIP',
      'en': 'VIP',
    },
    'izci5ouz': {
      'ar': 'رحلة خاصة',
      'en': 'Special trip',
    },
    'cgb5q8gh': {
      'ar': 'رافعة سطحة',
      'en': 'Flatbed crane',
    },
    'oakdiqwk': {
      'ar': 'تحميل وتفريغ',
      'en': 'Loading goods',
    },
    'h37j4ix6': {
      'ar': 'التذاكر',
      'en': 'Tickets',
    },
    'p330vmxy': {
      'ar': 'حجوزاتك معنا',
      'en': 'Your bookings',
    },
    'z09ql2qe': {
      'ar': 'حسابي',
      'en': 'My account',
    },
    'qzd1z2sr': {
      'ar': 'طابت أوقاتكم',
      'en': 'Good times',
    },
    'isgo2l7p': {
      'ar': ' ',
      'en': ' ',
    },
    '9hwtrvz0': {
      'ar': 'مظهر فاتح',
      'en': 'Light Mode',
    },
    'c9bh2tay': {
      'ar': 'مظهر داكن',
      'en': 'Dark Mode',
    },
    'r1bdjk15': {
      'ar': 'تعديل المعلومات الشخصية',
      'en': 'Edit personal information',
    },
    '5onp0k8v': {
      'ar': 'رقم الهاتف الجديد',
      'en': 'New phone number',
    },
    '9mcrj7dt': {
      'ar': 'تحقق',
      'en': 'verification',
    },
    'n0qb8n36': {
      'ar': 'تقديم شكوى أو استفسار:',
      'en': 'Submit a complaint or inquiry:',
    },
    '0kby43lq': {
      'ar': 'إرسال',
      'en': 'Send',
    },
    '5aqze5x8': {
      'ar': 'أقترح تطوير الخدمة من خلال ...',
      'en': 'I suggest developing the service by...',
    },
    'ycd7bcfe': {
      'ar': 'تسجيل الخروج',
      'en': 'Log out',
    },
    'gcmi4jw8': {
      'ar': 'حذف الحساب',
      'en': 'Delete account',
    },
    'qcngxw3b': {
      'ar': 'تقدمه',
      'en': 'By',
    },
    'eou0o7la': {
      'ar': 'VALOR',
      'en': 'VALOR',
    },
    'lpzl4k5x': {
      'ar': 'للبرمجيات',
      'en': 'For software',
    },
    '8svv3wnt': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // signup
  {
    'icmeyvuu': {
      'ar': 'إنشاء حساب',
      'en': 'Sign Up',
    },
    'z75v26sq': {
      'ar': 'الاسم الكامل',
      'en': 'Full name',
    },
    '6rfof8js': {
      'ar': '',
      'en': '',
    },
    'ni8g4cjj': {
      'ar': 'الاسم الثلاثي',
      'en': 'Full name',
    },
    'n75me87x': {
      'ar': 'رقم الهاتف',
      'en': 'WhatsApp phone number',
    },
    'o8ey2eqp': {
      'ar': 'أوافق على',
      'en': 'I agree',
    },
    'xanjhtsl': {
      'ar': ' ',
      'en': ' ',
    },
    '4jj5wq2j': {
      'ar': ' الشروط',
      'en': 'Terms',
    },
    'gtz2mgrp': {
      'ar': ' و ',
      'en': ' & ',
    },
    '3gv5ajh0': {
      'ar': 'الخصوصية',
      'en': 'privacy',
    },
    'sb6wu5eb': {
      'ar': '',
      'en': '',
    },
    'mv5j826o': {
      'ar': 'أنشئ حساب',
      'en': 'Create an account',
    },
    'j6rqippc': {
      'ar': 'هل لديك حساب بالفعل؟',
      'en': 'Already have an account?',
    },
    '55vaeli4': {
      'ar': 'تسجيل الدخول',
      'en': 'Sign In',
    },
    'n1zcv8cv': {
      'ar': 'Home',
      'en': 'balqa.sy',
    },
  },
  // code
  {
    'pohu1lqd': {
      'ar': 'أدخل رمز التحقق',
      'en': 'Enter the verification code',
    },
    'e11uwdph': {
      'ar': 'أرسلنا رمز التحقق عبر واتساب إلى',
      'en': 'We sent the verification code via WhatsApp to',
    },
    'i79diceo': {
      'ar': 'تحقق من الرمز',
      'en': 'Check the code',
    },
    'b9tz5iud': {
      'ar': 'ستنتهي صلاحية الرمز خلال ',
      'en': 'The code will expire within',
    },
    'cqj67tha': {
      'ar': 'تغيير رقم الهاتف',
      'en': 'Change phone number',
    },
    'sxhalbxb': {
      'ar': 'إعادة إرسال الرمز',
      'en': 'Resend code',
    },
    '3le58z5b': {
      'ar': 'تجربة جديدة في سوريا الجديدة 🇸🇾',
      'en': 'A new experience in New SYRIA 🇸🇾',
    },
    'per37vv9': {
      'ar': 'Home',
      'en': '',
    },
  },
  // service
  {
    'qm1iddh5': {
      'ar': 'شارك',
      'en': 'Share',
    },
    'n3m1zg3y': {
      'ar': 'احجز الآن',
      'en': 'Book now',
    },
    '6zv8zdct': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // tripPay
  {
    'mtdyjh11': {
      'ar': 'تعديل الحجز',
      'en': 'Modify booking',
    },
    '6awucqh5': {
      'ar': 'عدد الركاب',
      'en': 'Number of passengers',
    },
    'bbjl0fv4': {
      'ar': 'المقاعد المحجوزة:',
      'en': 'Reserved seats:',
    },
    '4xd69lsi': {
      'ar': 'تأكيد التعديل',
      'en': 'Confirm the modification',
    },
    'o1onba90': {
      'ar': 'تأكيد الحجز',
      'en': 'Booking confirmation',
    },
    'fuwtfn4l': {
      'ar': 'طريقة الدفع',
      'en': 'payment method',
    },
    'a9dtyg87': {
      'ar': 'شام كاش',
      'en': 'Sham cash',
    },
    'xter0i9b': {
      'ar': 'انقر على الأيقونة لنسخ رقم الحساب',
      'en': 'Click to copy Sham Cash ID',
    },
    'skm46kfg': {
      'ar': 'الكوبونات',
      'en': 'Coupons',
    },
    '8g7qfs70': {
      'ar': 'أدخل كود الخصم',
      'en': 'Enter the discount code',
    },
    'e5q91c8k': {
      'ar': 'أدخل معرف عملية الدفع',
      'en': 'Enter the payment transaction ID',
    },
    '9wsfwhg9': {
      'ar': 'أدخل معرف عملية الدفع',
      'en': 'Enter the payment transaction ID',
    },
    'sa92h553': {
      'ar':
          'يُلغى الحجز تلقائياً إذا لم يتم تأكيده قبل ساعتين من موعد انطلاق الرحلة.',
      'en':
          'The booking will be automatically cancelled if it is not confirmed two hours before the trip time.',
    },
    'lkr12jop': {
      'ar': 'الرحلات التي قبل 8 ص التثبيت قبل 8 م',
      'en': 'Trips before 8 AM, check-in before 8 PM',
    },
    '6nnc40lr': {
      'ar': 'إلغاء الحجز',
      'en': 'Cancel booking',
    },
    '5yzh2s1q': {
      'ar': 'تتبع الرحلة',
      'en': 'Track the trip',
    },
    'ikaz6azo': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    '2884cyq0': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // shippingInfo
  {
    '1vyh10j2': {
      'ar': 'المرسل إليه',
      'en': 'Recipient',
    },
    'kg0d0pup': {
      'ar': 'اسم المرسل إليه',
      'en': 'Name of recipient',
    },
    '1am81db1': {
      'ar': 'هاتف المرسل إليه',
      'en': 'Recipient\'s phone number',
    },
    'ki43h5lm': {
      'ar': 'الشحنة',
      'en': 'Shipment',
    },
    'zei7nabo': {
      'ar': 'محتويات معرضة للتلف أو حساسة؟',
      'en': 'Sensitive contents?',
    },
    '6k9kqp8d': {
      'ar': 'شحن مباشر؟',
      'en': 'Direct shipping?',
    },
    'e8m8kwpw': {
      'ar': 'تنطبق رسوم إضافية',
      'en': 'Additional fees apply',
    },
    'sma6kjjy': {
      'ar': '(اختياري)',
      'en': '(optional)',
    },
    'gqz04jrd': {
      'ar': 'حجم الشحنة',
      'en': 'Shipment size',
    },
    'sf1gtrit': {
      'ar': 'شحنة ورقية',
      'en': '',
    },
    'zkhng1hh': {
      'ar': 'طرد صغير 25*25 cm',
      'en': '',
    },
    'ifcv44p8': {
      'ar': 'طرد وسط 50*50 cm',
      'en': '',
    },
    'e6yavo6u': {
      'ar': 'طرد كبير حتى 1*1 متر',
      'en': '',
    },
    '4hftjos1': {
      'ar': 'عدد الطرود:',
      'en': 'Number of boxes:',
    },
    '4mfxvdq1': {
      'ar': 'المحتويات',
      'en': 'Contents',
    },
    'qocflv5z': {
      'ar': 'يرجى وصف محتويات الشحنة',
      'en': 'Please describe the contents of shipment.',
    },
    'aqnvqp0m': {
      'ar': 'ملاحظات:',
      'en': 'comments:',
    },
    '3bywugh9': {
      'ar': '(اختياري)',
      'en': '(optional)',
    },
    'fnfe1daf': {
      'ar': 'قابلة للكسر .. ضعها بشكل أفقي ...',
      'en': 'Fragile... Place it horizontally...',
    },
    'ylp3tjm5': {
      'ar': 'معلومات الدفع',
      'en': 'Payment information',
    },
    '7tjim4tn': {
      'ar': 'الأجور من:',
      'en': 'Wages from:',
    },
    'v9oph9cn': {
      'ar': 'المرسل (أنا)',
      'en': 'Sender (me)',
    },
    '1wwbc1pb': {
      'ar': 'المرسل إليه',
      'en': 'Recipient',
    },
    'm94aw6pb': {
      'ar': 'حوالة ضد الدفع؟',
      'en': 'against paymen?',
    },
    'vceytl2p': {
      'ar': 'القيمة المطلوب تحصيلها',
      'en': 'The amount to be collected',
    },
    'wpp9ar50': {
      'ar': '* لا تشمل أجور الشحن',
      'en': 'Shipping fees are not included.',
    },
    '3vy0opka': {
      'ar': '000',
      'en': '000',
    },
    'v5ljoszn': {
      'ar': 'ليرة سورية',
      'en': 'Syrian pound',
    },
    '3pwelgwr': {
      'ar': 'دولار',
      'en': 'USD',
    },
    'z8wlm238': {
      'ar': 'يورو',
      'en': 'Euro',
    },
    '7qxhznh6': {
      'ar': 'ليرة سورية',
      'en': 'S.P',
    },
    'sg9hwf8x': {
      'ar': 'الموقع',
      'en': 'Location',
    },
    'g4e8ajys': {
      'ar': 'اختر موقعك',
      'en': 'Choose your location',
    },
    'c35joa4q': {
      'ar': 'موقع المرسل إليه',
      'en': 'Recipient\'s location',
    },
    'epyzrx0g': {
      'ar': 'تسليم في فروعنا',
      'en': 'Delivery at our branches',
    },
    'usrnxuh4': {
      'ar': 'المحافظة',
      'en': 'Governorate',
    },
    'k4ozs9l4': {
      'ar': '',
      'en': '',
    },
    'm7jee8rh': {
      'ar': 'اختر المحافظة',
      'en': 'Choose the governorate',
    },
    'tijric92': {
      'ar': 'الفئة',
      'en': 'Category',
    },
    '9ogao7d7': {
      'ar': 'إلكترونيات',
      'en': 'electronics',
    },
    '79b4ay6h': {
      'ar': 'منزل',
      'en': 'home',
    },
    'l4rqcy6n': {
      'ar': 'أزياء',
      'en': 'Fashion',
    },
    'j7spqsjc': {
      'ar': 'أخرى',
      'en': 'Other',
    },
    '0kfb45uz': {
      'ar': '',
      'en': '',
    },
    'udmyk8bk': {
      'ar': 'اختر مركز التسليم',
      'en': 'Choose a delivery center',
    },
    'q0rfp7r6': {
      'ar': 'الفئة',
      'en': '',
    },
    '643qlkqr': {
      'ar': 'إلكترونيات',
      'en': '',
    },
    '4s32ot0h': {
      'ar': 'منزل',
      'en': '',
    },
    'h7oiha7x': {
      'ar': 'أزياء',
      'en': '',
    },
    'sbct651k': {
      'ar': 'أخرى',
      'en': '',
    },
    'zrvy7fh1': {
      'ar':
          'نعتذر عن شحن أي نوع من الأسلحة أو الذخائر أو الأدوية أوالمشروبات الكحولية أو التبغ أو السجائر العادية أو الإلكترونية لأي ظرف كان.',
      'en':
          'We apologize for not shipping any type of weapons, ammunition, medicines, alcoholic beverages, tobacco, regular or electronic cigarettes under any circumstances.',
    },
    'y4tm2hkq': {
      'ar': '*يرجى مراجعة الشروط والأحكام',
      'en': 'See the Terms of Use',
    },
    'tesyg7k2': {
      'ar': 'المرسل إليه',
      'en': 'Recipient',
    },
    'ifew1cdx': {
      'ar': 'نوع الشحنة',
      'en': 'Shipment size',
    },
    'h5dr2chn': {
      'ar': 'من',
      'en': 'From',
    },
    '1ts3xs2n': {
      'ar': 'إلى',
      'en': 'To',
    },
    '023dlf6p': {
      'ar': 'عدد الطرود',
      'en': 'Number of boxes',
    },
    '582u1mvs': {
      'ar': 'تكلفة الشحن',
      'en': 'Shipping cost',
    },
    '31cni4wo': {
      'ar': 'التوصيل من موقعك',
      'en': 'Delivery from your location',
    },
    'iskboi3z': {
      'ar': 'التوصيل إلى موقع المرسل إليه',
      'en': 'Delivery to the recipient\'s location',
    },
    '1z6a0ro5': {
      'ar': 'المبلغ المطلوب تحصيله',
      'en': 'Amount to be collected',
    },
    'm97hxyoo': {
      'ar': 'العمولة على المبلغ (ضد الدفع)',
      'en': 'Commission on the amount (against payment)',
    },
    'njgy3al7': {
      'ar': 'الإجمالي:',
      'en': 'Total:',
    },
    'dpr4belr': {
      'ar': 'طريقة الدفع',
      'en': 'payment method',
    },
    'toxpdvja': {
      'ar': 'الدفع عند وصول المندوب',
      'en': 'Pay upon delivery',
    },
    'n91lpj9e': {
      'ar': 'الدفع مسبقاً',
      'en': 'Prepayment',
    },
    'me2641d1': {
      'ar': 'شام كاش',
      'en': 'Sham Cash',
    },
    'bbyltb8c': {
      'ar': 'انقر لنسخ رقم الحساب',
      'en': 'Click to copy account number',
    },
    'm5p8iwcs': {
      'ar': 'أدخل رمز عملية التحويل',
      'en': 'Enter the payment code',
    },
    '77yvhpy5': {
      'ar': '📌 ملاحظات:',
      'en': '📌 Notes:',
    },
    's6ineerg': {
      'ar':
          'لضمان أفضل جودة للخدمة، قد يتم ترحيل الشحنات المستلمة بعد الساعة 7:00 مساءً إلى اليوم التالي وفقًا لجدول التشغيل.',
      'en':
          'To ensure the best quality of service, shipments received after 7:00 PM may be rolled over to the next day according to the operating schedule.',
    },
    'koztqkbh': {
      'ar': 'إرسال',
      'en': 'Send',
    },
    'uqp9m9jr': {
      'ar': 'أدخل معلومات الشحنة',
      'en': 'Enter shipment information',
    },
    'jdw3guje': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // shipmentTracking
  {
    'kcey3w0w': {
      'ar': 'موعد التسليم المتوقع',
      'en': 'Expected delivery date',
    },
    '53p4pfsm': {
      'ar': '  ',
      'en': '',
    },
    'hmxfho05': {
      'ar': '14,Sept. 2021',
      'en': '14,Sept. 2026',
    },
    'ml5rixpz': {
      'ar': 'استلام',
      'en': 'receive',
    },
    'upzpcs1k': {
      'ar': '  ',
      'en': '',
    },
    '1c3ttu6q': {
      'ar': '14, Sept. 2021',
      'en': '14,Sept. 2026',
    },
    '2l5taawg': {
      'ar': 'استلم المندوب الشحنة',
      'en': 'The representative received the shipment',
    },
    'l2j6ob0x': {
      'ar': '  ',
      'en': '',
    },
    'vqo5qo9c': {
      'ar': '14, Sept. 2021',
      'en': '14,Sept. 2026',
    },
    'obhn0iv1': {
      'ar': 'تم استلامها في مركز الانطلاق',
      'en': 'It was received at the launch center.',
    },
    'hj656o17': {
      'ar': '  ',
      'en': '',
    },
    'eqt86uqm': {
      'ar': '14, Sept. 2021',
      'en': '',
    },
    'w036j3z3': {
      'ar': 'في الطريق إلى الوجهة',
      'en': 'On the way to the destination',
    },
    '7bsrrzaz': {
      'ar': '  ',
      'en': '',
    },
    'u78r0n5z': {
      'ar': '14, Sept. 2021',
      'en': '',
    },
    'm2qyqmo0': {
      'ar': 'وصلت إلى مركز الوجهة',
      'en': 'Arrived at the destination center',
    },
    'mo188anc': {
      'ar': '  ',
      'en': '',
    },
    'd3vodkya': {
      'ar': '14, Sept. 2021',
      'en': '',
    },
    'jz6dfpvq': {
      'ar': 'خرجت للتسليم',
      'en': 'Went out to deliver',
    },
    '3c42fmji': {
      'ar': '  ',
      'en': '',
    },
    'nxurtf5j': {
      'ar': '14, Sept. 2021',
      'en': '',
    },
    'l3ivatzd': {
      'ar': 'تم التسليم',
      'en': 'Delivered',
    },
    '13t8fly6': {
      'ar':
          'لا تتحمل الشركة أي مسؤولية عن الشحنة بعد استلامها ومشاركة رمز التأكيد، أو بعد مضي شهر على عدم استلامها أو استردادها.',
      'en':
          'The company assumes no responsibility for the shipment after it has been received and the confirmation code has been shared, or after one month has passed since it was not received or refunded.',
    },
    'uvd3a5zp': {
      'ar': 'تتبع الشحنة',
      'en': 'Shipment tracking',
    },
    'iacq3zfw': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // trip
  {
    'si2sbqf4': {
      'ar': ' - ',
      'en': ' - ',
    },
    '2f85uemw': {
      'ar': '',
      'en': '',
    },
    'jbvuj7ou': {
      'ar': ': ',
      'en': ': ',
    },
    '7u6t29ey': {
      'ar': '',
      'en': '',
    },
    'i8e49hqu': {
      'ar': 'الوصول',
      'en': 'الوصول',
    },
    'x4okr4e6': {
      'ar': ': ',
      'en': ': ',
    },
    'nftxglbl': {
      'ar': '',
      'en': '',
    },
    'hg01vcac': {
      'ar': '',
      'en': '',
    },
    'fnlu4g25': {
      'ar': 'ل.س',
      'en': 'S.P',
    },
    'hpia7xff': {
      'ar': ' متوفر',
      'en': 'ready',
    },
    'ttx5lqbj': {
      'ar': 'VIP',
      'en': 'VIP',
    },
    '0716b2f7': {
      'ar': 'صعود في ',
      'en': 'Rise in',
    },
    'z3xo7rpo': {
      'ar': 'Hello World',
      'en': '',
    },
    'iq0sq3p3': {
      'ar': 'من باب البيت؟',
      'en': 'From location?',
    },
    'qm1nx6e8': {
      'ar': 'Option 1',
      'en': '',
    },
    'rtc3lhkd': {
      'ar': 'Option 2',
      'en': '',
    },
    '2brp55tf': {
      'ar': 'Option 3',
      'en': '',
    },
    'oqy6pt0p': {
      'ar': 'نزول في ',
      'en': 'Down in',
    },
    '285hn8el': {
      'ar': 'Hello World',
      'en': '',
    },
    'iys1i0ta': {
      'ar': 'وجهة مخصصة؟',
      'en': 'specific destination?',
    },
    'wdzrbxsk': {
      'ar': 'Option 1',
      'en': '',
    },
    'x2yb48k4': {
      'ar': 'Option 2',
      'en': '',
    },
    'i1q27lox': {
      'ar': 'Option 3',
      'en': '',
    },
    'ape5y60r': {
      'ar': 'أضف ملاحظة...',
      'en': 'Add a note...',
    },
    'ahpq39n0': {
      'ar': 'احجز الآن',
      'en': 'Book now',
    },
    '1lq9gfbd': {
      'ar': 'تفاصيل الرحلة',
      'en': 'Trip details',
    },
    'moxgw0tv': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // terms
  {
    'ln0n3kyu': {
      'ar': 'الشروط والخصوصية',
      'en': 'Terms and Privacy',
    },
    'n26gp7pq': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // shippingAcc
  {
    'ntu1rad3': {
      'ar': 'معلومات الدفع',
      'en': 'Payment information',
    },
    'j184wu51': {
      'ar': 'طريقة الدفع',
      'en': 'payment method',
    },
    '3ob4cfsb': {
      'ar': 'شام كاش',
      'en': 'Sham Cash',
    },
    'kjbr1o67': {
      'ar': 'انقر على الأيقونة لنسخ رقم الحساب',
      'en': 'Click on the icon to copy ID',
    },
    'gd8tzzo6': {
      'ar': 'الكوبونات',
      'en': 'coupons',
    },
    '543qcyac': {
      'ar': 'أدخل كود الخصم',
      'en': 'Enter the discount code',
    },
    '4nt09rsp': {
      'ar': 'أدخل معرف عملية الدفع',
      'en': 'Enter the payment transaction ID',
    },
    'sx3vsasw': {
      'ar': 'أدخل معرف عملية الدفع',
      'en': 'Enter the payment transaction ID',
    },
    '384zj7c4': {
      'ar': 'سيتم اقتطاع الأجور في حال التراجع عن الشحن',
      'en': 'Wages will be deducted if the shipment is cancelled.',
    },
    'g3z0zsml': {
      'ar':
          'لسنا مسؤولين عن محتويات الشحنة وحالتها بعد الاستلام ومسح الرمز أو مرور شهر دون استلامها أو استردادها',
      'en':
          'We are not responsible for the contents or condition of the shipment after receipt, scanning of the code, or if a month has passed without receipt or refund.',
    },
    'drh8l5ca': {
      'ar': 'إلغاء الشحنة',
      'en': 'Cancel shipment',
    },
    'iou11fvo': {
      'ar': 'تتبع الشحنة',
      'en': 'Shipment tracking',
    },
    'rt3rq6li': {
      'ar': 'الرئيسية',
      'en': 'Home',
    },
    'vr1qbigd': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // SplashPage
  {
    'il7kb6qx': {
      'ar': 'بلقاء لوجستيك',
      'en': 'بلقاء لوجستيك',
    },
    'vm9556ow': {
      'ar': 'للنقل والشحن',
      'en': 'للنقل والشحن',
    },
    'uriv5ykx': {
      'ar': 'تجربة جديدة في سوريا الجديدة 🇸🇾',
      'en': 'A new experience in New SYRIA 🇸🇾',
    },
  },
  // order
  {
    'qt782gx4': {
      'ar': 'اطلب أي منتج من أي محافظة',
      'en': 'Order any product from any governorate',
    },
    'qf0cujo4': {
      'ar': 'سنشتري المنتج ثم نشحنه إليك.',
      'en': 'We will purchase the product and then ship it to you.',
    },
    'idrq5j5f': {
      'ar': 'معلومات المنتج',
      'en': 'Product Information',
    },
    '5x823g2o': {
      'ar': 'فئة المنتج',
      'en': 'Product category *',
    },
    '1bdb18uj': {
      'ar': 'إلكترونيات',
      'en': '',
    },
    'yi5t64lz': {
      'ar': 'إلكترونيات',
      'en': '',
    },
    'btt7qnw9': {
      'ar': 'الفئة',
      'en': 'Category',
    },
    'hz3o3v5f': {
      'ar': 'إلكترونيات',
      'en': 'electronics',
    },
    '6217jq2z': {
      'ar': 'منزل',
      'en': 'house',
    },
    'hvx354q1': {
      'ar': 'أزياء',
      'en': 'Fashion',
    },
    'j3rsft3l': {
      'ar': 'أخرى',
      'en': 'Other',
    },
    'ckp5111d': {
      'ar': 'الكمية',
      'en': 'Quantity',
    },
    '9h8ffgb8': {
      'ar': 'اسم المنتج',
      'en': 'Product Name',
    },
    'l42jgdyj': {
      'ar': 'مكنسة كهربائية',
      'en': 'vacuum cleaner',
    },
    '9id07p0w': {
      'ar': 'السعر الإجمالي',
      'en': 'Total price',
    },
    'nipd5xrp': {
      'ar': 'أدخل السعر المتوقع',
      'en': 'Enter the expected price',
    },
    'oomd26it': {
      'ar': 'العملة',
      'en': 'Currency',
    },
    'zvdxb7vj': {
      'ar': 'ليرة سورية',
      'en': 'Syrian pound',
    },
    'smnff1x6': {
      'ar': 'دولار أمريكي',
      'en': 'USD',
    },
    '7m8s2gtv': {
      'ar': 'يورو',
      'en': 'Euro',
    },
    '3cymirx0': {
      'ar': 'ليرة سورية',
      'en': 'Syrian pound',
    },
    'afcsxzk8': {
      'ar': 'حجم المنتج',
      'en': 'Product size',
    },
    'g2vncuyi': {
      'ar': 'ليرة سورية',
      'en': 'S.P',
    },
    'e9qvv35x': {
      'ar': 'دولار أمريكي',
      'en': 'USD',
    },
    '6fhk95c7': {
      'ar': 'يورو',
      'en': 'Euro',
    },
    'mol6p882': {
      'ar': 'وصف المنتج',
      'en': 'Product Description',
    },
    '12a710pv': {
      'ar': 'اكتب وصفًا تفصيليًا للمنتج (الماركة، اللون، المقاس، الموديل...)',
      'en':
          'Write a detailed description of the product (brand, color, size, model...)',
    },
    '8uv2xvrs': {
      'ar': 'تواجد المنتج',
      'en': 'Product availability',
    },
    'd5ys8lu4': {
      'ar': 'متجر فعلي',
      'en': 'physical store',
    },
    'mggaqjw9': {
      'ar': 'رابط إلكتروني',
      'en': 'E-Store or Link',
    },
    '8ybzg4g7': {
      'ar': 'اسم المتجر',
      'en': 'Store name',
    },
    '9plfr32x': {
      'ar': 'وكالة ......',
      'en': 'Agency ......',
    },
    'kbqkf75x': {
      'ar': 'رقم الهاتف',
      'en': 'Phone number',
    },
    '164im818': {
      'ar': '0900000000',
      'en': '0900000000',
    },
    'xva6l9fi': {
      'ar': 'المحافظة',
      'en': 'Governorate',
    },
    'uzyclht3': {
      'ar': '',
      'en': '',
    },
    'bmcf3y7n': {
      'ar': 'اختر المحافظة',
      'en': 'Choose the governorate',
    },
    '37t3mkbd': {
      'ar': 'الفئة',
      'en': 'Category',
    },
    'd3neutgn': {
      'ar': 'إلكترونيات',
      'en': '',
    },
    'zsrgo7ob': {
      'ar': 'منزل',
      'en': '',
    },
    'whifo5b0': {
      'ar': 'أزياء',
      'en': '',
    },
    '93x00byj': {
      'ar': 'أخرى',
      'en': '',
    },
    '1hc2remm': {
      'ar': 'رابط متجر أو مقطع ريلز',
      'en': 'reels or e-store link',
    },
    '8it9pqil': {
      'ar': 'معلومات التوصيل',
      'en': 'Delivery information',
    },
    'q2l68hgv': {
      'ar': 'فروعنا',
      'en': 'Our branches',
    },
    '72blmyvy': {
      'ar': 'موقع مخصص',
      'en': 'Dedicated location',
    },
    'ss7jxcwd': {
      'ar': 'المحافظة',
      'en': 'Governorate',
    },
    'q6t5y7a5': {
      'ar': '',
      'en': '',
    },
    'mc5x8jde': {
      'ar': 'اختر المحافظة',
      'en': 'Choose the governorate',
    },
    '0mhnj4g5': {
      'ar': 'الفئة',
      'en': 'Category',
    },
    '48hbau0i': {
      'ar': 'إلكترونيات',
      'en': '',
    },
    '011n4k9k': {
      'ar': 'منزل',
      'en': '',
    },
    'obklo7jo': {
      'ar': 'أزياء',
      'en': '',
    },
    'bm0wj4ne': {
      'ar': 'أخرى',
      'en': '',
    },
    'bcv80p16': {
      'ar': 'المحافظة',
      'en': 'Governorate',
    },
    'yfqnehii': {
      'ar': '',
      'en': '',
    },
    'z1miecqq': {
      'ar': 'اختر المحافظة',
      'en': 'Choose the governorate',
    },
    'hm5onjmi': {
      'ar': 'الفئة',
      'en': 'Category',
    },
    '8emwc673': {
      'ar': 'إلكترونيات',
      'en': '',
    },
    '4xgd2shz': {
      'ar': 'منزل',
      'en': '',
    },
    'dci0w1cs': {
      'ar': 'أزياء',
      'en': '',
    },
    'cwjcsri4': {
      'ar': 'أخرى',
      'en': '',
    },
    '7v6ocs2q': {
      'ar': 'اختر مركز التسليم',
      'en': 'Choose a branch',
    },
    'rsgpbb9r': {
      'ar': 'Search...',
      'en': '',
    },
    'ueiwxudl': {
      'ar': 'Option 1',
      'en': '',
    },
    'gch8oelv': {
      'ar': 'Option 2',
      'en': '',
    },
    '6za0nye3': {
      'ar': 'Option 3',
      'en': '',
    },
    'rznfao65': {
      'ar':
          'نعتذر عن شحن أي نوع من الأسلحة أو الذخائر أو الأدوية أوالمشروبات الكحولية أو التبغ أو السجائر (العادية أو الإلكترونية) لأي ظرف كان.',
      'en':
          'We apologize for not shipping any type of weapons, ammunition, medicines, alcoholic beverages, tobacco, or cigarettes (regular or electronic) under any circumstances.',
    },
    'a042lkcj': {
      'ar': '*يرجى مراجعة الشروط والأحكام',
      'en': 'See the Terms of Use',
    },
    '6erp5eax': {
      'ar': 'المصدر',
      'en': 'Recipient',
    },
    '1tl6fj5o': {
      'ar': 'اسم المنتج',
      'en': 'Product Name',
    },
    'aur9srj8': {
      'ar': 'عدد الطرود',
      'en': 'Number of boxes',
    },
    'uzm6re7g': {
      'ar': 'نوع الشحنة',
      'en': 'Shipment size',
    },
    'cxa4ngt0': {
      'ar': 'من',
      'en': 'From',
    },
    'oxt38k9v': {
      'ar': 'إلى',
      'en': 'To',
    },
    'oqt2lobh': {
      'ar': 'سيتم تأكيد السعر النهائي قبل عملية الشراء.',
      'en': 'The final price will be confirmed before the purchase.',
    },
    'u83ks0c9': {
      'ar': '📌 ملاحظة:',
      'en': '📌 Note:',
    },
    '5std6kys': {
      'ar':
          'لضمان أفضل جودة للخدمة، قد يتم ترحيل الشحنات المستلمة بعد الساعة 7:00 مساءً إلى اليوم التالي وفقًا لجدول التشغيل.',
      'en':
          'To ensure the best quality of service, shipments received after 7:00 PM may be rolled over to the next day according to the operating schedule.',
    },
    'x4flrcjl': {
      'ar': 'اطلبلي',
      'en': 'Order',
    },
    'ywd6oswc': {
      'ar': 'اطلبلي',
      'en': 'Order',
    },
  },
  // spicealTrip
  {
    'r4p78f1q': {
      'ar': 'فان H1',
      'en': 'H1 van',
    },
    'm61sb404': {
      'ar': 'سيارة حديثة',
      'en': 'Modern car',
    },
    'jmj3p0gn': {
      'ar': ' كم',
      'en': 'Km',
    },
    '7vmtt13m': {
      'ar': 'التكلفة التقديرية',
      'en': 'Estimated cost',
    },
    '5esiuvri': {
      'ar': 'ل.س',
      'en': 'S.P',
    },
    'tscbt09y': {
      'ar': 'السعر النهائي يؤكد بعد مراجعة الطلب',
      'en': 'The final price is confirmed after order review.',
    },
    'rd60b678': {
      'ar': 'احجز الآن',
      'en': 'Book now',
    },
  },
  // tracking
  {
    'octiqkhd': {
      'ar': ' - ',
      'en': ' - ',
    },
    '296phupt': {
      'ar': 'Trip to Maadi',
      'en': 'Trip to Damascous',
    },
    '4qm1xevu': {
      'ar': ' - ',
      'en': ' - ',
    },
    'dumxpu5y': {
      'ar': ' راكب',
      'en': 'passenger',
    },
    'tcchqxiw': {
      'ar': ' - ',
      'en': ' - ',
    },
    '9hxt5rab': {
      'ar': ' راكب',
      'en': 'passenger',
    },
    '17all8nu': {
      'ar': ' - ',
      'en': ' - ',
    },
    'pf1ydjny': {
      'ar': 'السائق',
      'en': 'Driver',
    },
    'ohhl636b': {
      'ar': 'مشاركة',
      'en': 'share',
    },
    'a2o0bjkq': {
      'ar': 'اتصل بالطوارئ',
      'en': 'Call emergency',
    },
    'ela3bz1x': {
      'ar': 'رافقتكم السلامة',
      'en': 'May you be safe.',
    },
  },
  // tripShared
  {
    'fju9wyxy': {
      'ar': ' - ',
      'en': ' - ',
    },
    '89zbh4md': {
      'ar': '',
      'en': '',
    },
    'rmhfsb2s': {
      'ar': ': ',
      'en': ': ',
    },
    'ysfpryx6': {
      'ar': '',
      'en': '',
    },
    '1ddntj7w': {
      'ar': 'الوصول',
      'en': 'Arrival',
    },
    'i5b6vse7': {
      'ar': ': ',
      'en': ': ',
    },
    '2kuoesrp': {
      'ar': '',
      'en': '',
    },
    '7q3mao9z': {
      'ar': '',
      'en': '',
    },
    'fweve1pc': {
      'ar': 'ل.س',
      'en': 'S.P',
    },
    '0p84857k': {
      'ar': ' متوفر',
      'en': 'ready',
    },
    'lpg9tcpr': {
      'ar': 'VIP',
      'en': 'VIP',
    },
    'rah6y1yo': {
      'ar': 'صعود في ',
      'en': 'Rise in',
    },
    'c5dmimj0': {
      'ar': 'Hello World',
      'en': 'Hello World',
    },
    'xsscbtu5': {
      'ar': 'من باب البيت؟',
      'en': 'From lcation?',
    },
    'j5mgv2ce': {
      'ar': 'Option 1',
      'en': '',
    },
    'ce2dveiz': {
      'ar': 'Option 2',
      'en': '',
    },
    'saa214mp': {
      'ar': 'Option 3',
      'en': '',
    },
    'e91xoavl': {
      'ar': 'نزول في ',
      'en': 'Descent into',
    },
    '1n5w27vu': {
      'ar': 'Hello World',
      'en': '',
    },
    'eznxgp5n': {
      'ar': 'وجهة مخصصة؟',
      'en': 'A specific destination?',
    },
    'syvn03xp': {
      'ar': 'Option 1',
      'en': '',
    },
    'k7kx0f97': {
      'ar': 'Option 2',
      'en': '',
    },
    'kft640x8': {
      'ar': 'Option 3',
      'en': '',
    },
    '25an4f4d': {
      'ar': 'أضف ملاحظة...',
      'en': 'Add a note...',
    },
    'e04j8cyd': {
      'ar': 'احجز الآن',
      'en': 'Book now',
    },
    '3jo7ju08': {
      'ar': 'تفاصيل الرحلة',
      'en': 'Trip details',
    },
    'jo6g0a1s': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // TripResolver
  {
    'yyh2i44j': {
      'ar': 'بلقاء لوجستيك',
      'en': 'بلقاء لوجستيك',
    },
    'i5308oqf': {
      'ar': 'للنقل والشحن',
      'en': 'للنقل والشحن',
    },
    'zf95mwv8': {
      'ar': 'تجربة جديدة في سوريا الجديدة 🇸🇾',
      'en': 'A new experience in New SYRIA 🇸🇾',
    },
  },
  // signin
  {
    '5lsqzgcb': {
      'ar': 'تسجيل الدخول',
      'en': 'Sign In',
    },
    'w1r5un00': {
      'ar': 'رقم الهاتف',
      'en': 'WhatsApp phone number',
    },
    'clzf9auu': {
      'ar': 'رقم الهاتف',
      'en': 'phone number',
    },
    'leinpddf': {
      'ar': 'تسجيل الدخول',
      'en': 'Sign In',
    },
    '67llka00': {
      'ar': 'Home',
      'en': 'balqa.sy',
    },
  },
  // notify
  {
    'sfat0qx8': {
      'ar': 'الكل',
      'en': 'all',
    },
    'gq1kea9x': {
      'ar': 'الرحلات',
      'en': 'trips',
    },
    'k3umcxp2': {
      'ar': 'الشحن',
      'en': 'shipping',
    },
    'ff1zq890': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // ticket
  {
    'qhpj900v': {
      'ar': ' - ',
      'en': ' - ',
    },
    'sq7fcnjy': {
      'ar': '',
      'en': '',
    },
    'jsmdibim': {
      'ar': ' - ',
      'en': ' - ',
    },
    'svl6339l': {
      'ar': 'دوار النخلة ',
      'en': '',
    },
    '4m93s014': {
      'ar': ' ركاب',
      'en': 'Passengers',
    },
    'hhni6sbi': {
      'ar': 'تم التثبيت',
      'en': '',
    },
    '8wcvo7t9': {
      'ar': ' ل.س',
      'en': 'S.P',
    },
    '3non92s9': {
      'ar': '\$25.40',
      'en': '',
    },
  },
  // trip_card
  {
    'v70jmy64': {
      'ar': ' - ',
      'en': ' - ',
    },
    '3wz5kc77': {
      'ar': 'حمص',
      'en': '',
    },
    '8xqvrm65': {
      'ar': ' : ',
      'en': ' : ',
    },
    'o9y54qo8': {
      'ar': 'حمص',
      'en': '',
    },
  },
  // empty
  {
    'xemrqn7s': {
      'ar': 'قد تتوفر رحلات لاحقاً',
      'en': 'Trips may become available later.',
    },
  },
  // cardShipping
  {
    'q36i6io5': {
      'ar': ' - ',
      'en': ' - ',
    },
    '0u759lno': {
      'ar': 'ورقيات لا تزيد عن ظرف قياس A',
      'en': '',
    },
  },
  // ticketCard
  {
    'wenatg8g': {
      'ar': 'الاسم الكريم',
      'en': '',
    },
    'qm7bgjbb': {
      'ar': ' - ',
      'en': ' - ',
    },
    '8geshu0o': {
      'ar': ' ',
      'en': ' ',
    },
    'x4o5tz2x': {
      'ar': '، ',
      'en': '، ',
    },
    'wzwmkfsi': {
      'ar': '',
      'en': '',
    },
    '5ml6rnai': {
      'ar': '، ',
      'en': '، ',
    },
    'uo7y4x0w': {
      'ar': '',
      'en': '',
    },
    'i0endggb': {
      'ar': ' - ',
      'en': ' - ',
    },
    '8x56kq5m': {
      'ar': '',
      'en': '',
    },
    'ag29c3ve': {
      'ar': ' - ',
      'en': ' - ',
    },
    '6zautbb9': {
      'ar': '',
      'en': '',
    },
    '9i4y32c2': {
      'ar': 'رقم التذكرة: ',
      'en': 'Ticket number:',
    },
    'p4vaoyi7': {
      'ar': 'يرجى إظهار التذكرة عند الركوب',
      'en': 'Please show your ticket when boarding.',
    },
    'qdzp7yk1': {
      'ar': 'يرجى التواجد عند الموقف المحدد قبل موعد الرحلة',
      'en': 'Please be at the designated location before the departure time.',
    },
    'cdza8ctz': {
      'ar': 'ب ',
      'en': 'In ',
    },
    'p2up89md': {
      'ar': '15 دقيقة',
      'en': '15 minutes',
    },
    'qbx5lgc3': {
      'ar': 'ب 15 دقيقة',
      'en': 'In 15 minutes',
    },
  },
  // emptyShipping
  {
    't9a7j5dj': {
      'ar': 'لسا ما جربت الشحن معنا؟',
      'en': 'Haven\'t you tried shipping with us yet?',
    },
  },
  // shippingCard
  {
    '9ca8ol13': {
      'ar': 'الاسم الكريم',
      'en': '',
    },
    '0c3uqquv': {
      'ar': '',
      'en': '',
    },
    'f74zoz1l': {
      'ar': 'المبلغ: ',
      'en': 'Amount:',
    },
    '2c2xgops': {
      'ar': ' \$',
      'en': ' \$',
    },
    '3n9oo2g8': {
      'ar': ' - ',
      'en': ' - ',
    },
    '8yoys5z6': {
      'ar': 'العمولة: ',
      'en': 'Commission:',
    },
    'lrd4k65s': {
      'ar': ' \$',
      'en': ' \$',
    },
    'w5ln57n6': {
      'ar': 'الأجور:  ',
      'en': 'Wages:',
    },
    'q976h0h3': {
      'ar': '  ل.س',
      'en': 'S.P',
    },
    'e89fdft7': {
      'ar': 'يرجى إظهار البوليصة الالكترونية عند الاستلام',
      'en': 'Please show the e-bill of lading upon receipt.',
    },
    'n3ltd6eh': {
      'ar': 'رقم البوليصة: ',
      'en': 'Bill number:',
    },
    'ubkz38gp': {
      'ar': 'يرجى إظهار التذكرة عند الركوب',
      'en': 'Please show your ticket when boarding.',
    },
  },
  // shippingPay
  {
    '2tllkvqv': {
      'ar': 'المبلغ: ',
      'en': 'Amount:',
    },
    'xi93i3hf': {
      'ar': ' \$',
      'en': ' \$',
    },
    'tv4ue0fr': {
      'ar': 'العمولة: ',
      'en': 'Commission:',
    },
    's0jpbix0': {
      'ar': ' \$',
      'en': ' \$',
    },
    '37riu5ds': {
      'ar': 'الشحن: ',
      'en': 'shipping:',
    },
    'f35pioyf': {
      'ar': ' ل.س',
      'en': 'S.P',
    },
    'v5ljnqde': {
      'ar': 'التوصيل: ',
      'en': 'Delivery:',
    },
    'g9wjtgnu': {
      'ar': ' ل.س',
      'en': 'S.P',
    },
    'm28dikeh': {
      'ar': 'شام كاش',
      'en': 'Sham Cash',
    },
    'u101wubp': {
      'ar': 'انقر لنسخ رقم الحساب',
      'en': 'Click to copy Sham Cash ID',
    },
    '9hhpgkhb': {
      'ar': 'أدخل رمز عملية التحويل',
      'en': 'Enter the payment code',
    },
  },
  // emptyTickets
  {
    'b3s2qeu2': {
      'ar': 'عم تتعذب بالسفر وما حجزت؟',
      'en': 'Haven\'t you booked with us yet?',
    },
  },
  // phone
  {
    '1ldiwn9r': {
      'ar': 'اسم الدولة',
      'en': 'Country name',
    },
    'ytpp7mci': {
      'ar': 'Option 1',
      'en': '',
    },
    'kv4zvwzi': {
      'ar': 'تم',
      'en': 'Done',
    },
  },
  // mapy
  {
    'ph1mzveh': {
      'ar': 'اختر موقعاً أو ابحث عن عنوان',
      'en': 'Choose or search for an address',
    },
    'prxmkfef': {
      'ar': 'اختر موقعاً',
      'en': 'Choose a location',
    },
    'ewounkpd': {
      'ar': 'حفظ الموقع',
      'en': 'Save location',
    },
  },
  // socialmedia
  {
    'q8pqtaqr': {
      'ar': 'بلقاء',
      'en': 'بلقاء',
    },
    'av9angtb': {
      'ar': 'balqa.sy',
      'en': 'balqa.sy',
    },
    'ygjpcwn0': {
      'ar': 'balqa.sy',
      'en': 'balqa.sy',
    },
  },
  // cardAshipp
  {
    'tdforovm': {
      'ar': 'خدمة اطلبلي من المحافظات',
      'en': 'Order from governorates',
    },
  },
  // cardspi
  {
    'k6nmvzg8': {
      'ar': 'رحلات خاصة لك ولعائلتك',
      'en': 'Private trips for your family',
    },
  },
  // update
  {
    'a6f37tkx': {
      'ar': 'تحديث جديد متوفر',
      'en': 'New update available',
    },
    'qkoq1mkl': {
      'ar': 'نسخة جديدة من تطبيق بَلقاء لوجستيك',
      'en': 'A new version of the Balqa Logistics app',
    },
    'at7z6r8q': {
      'ar': 'تحسينات على الأداء وإصلاح بعض المشاكل',
      'en': 'Performance improvements and bug fixes',
    },
    'jhescxrj': {
      'ar': 'التحديث من متجر Play',
      'en': 'Update from Play Store',
    },
    'juaaeatd': {
      'ar': 'التحديث من App Store',
      'en': 'Update from App Store',
    },
  },
  // VehicleCard2
  {
    't6k0myae': {
      'ar': 'حتى ',
      'en': 'until ',
    },
    'maf4qfjk': {
      'ar': ' ركاب',
      'en': 'Passengers',
    },
  },
  // customTrip
  {
    'w6lu6f2s': {
      'ar': 'ذهاب فقط',
      'en': 'Go only',
    },
    'fshvlemw': {
      'ar': 'ذهاب وإياب',
      'en': 'With return',
    },
    'l86vkd4o': {
      'ar': 'من',
      'en': 'From',
    },
    'md4wcti0': {
      'ar': 'إلى',
      'en': 'To',
    },
    'by7px1jy': {
      'ar': 'تاريخ',
      'en': 'Date',
    },
    'rr6u7d1v': {
      'ar': 'وقت',
      'en': 'Time',
    },
    '6vlhiwc9': {
      'ar': 'تاريخ العودة',
      'en': 'Return Date',
    },
    'izosq6bg': {
      'ar': 'وقت العودة',
      'en': 'Time Date',
    },
  },
  // notifications
  {
    '108enb1k': {
      'ar': 'New',
      'en': '',
    },
    'zszv3mmt': {
      'ar': 'New Product View',
      'en': '',
    },
    '6uxvzycl': {
      'ar': 'Sally Mandrus, viewed your product',
      'en': '',
    },
    '5u3bucs9': {
      'ar': '3m ago',
      'en': '',
    },
    'flmz9c9f': {
      'ar': 'All',
      'en': '',
    },
    'ezmc1n2j': {
      'ar': 'New Product View',
      'en': '',
    },
    'b15426ih': {
      'ar': 'Sally Mandrus, viewed your product',
      'en': '',
    },
    '9idrxg31': {
      'ar': '3m ago',
      'en': '',
    },
    'pq9ubtkp': {
      'ar': 'New Product View',
      'en': '',
    },
    'yvw6w4li': {
      'ar': 'Sally Mandrus, viewed your product',
      'en': '',
    },
    '3z6s7wi9': {
      'ar': '3m ago',
      'en': '',
    },
    'vyyleyfn': {
      'ar': 'New Product View',
      'en': '',
    },
    'b3dakrgy': {
      'ar': 'Sally Mandrus, viewed your product',
      'en': '',
    },
    'go6dmncn': {
      'ar': '3m ago',
      'en': '',
    },
    'pwlzl4a4': {
      'ar': 'New Product View',
      'en': '',
    },
    '8pos3qmr': {
      'ar': 'Sally Mandrus, viewed your product',
      'en': '',
    },
    '26zg193x': {
      'ar': '3m ago',
      'en': '',
    },
    't5ced7a2': {
      'ar': 'New Product View',
      'en': '',
    },
    'hdhx4rko': {
      'ar': 'Sally Mandrus, viewed your product',
      'en': '',
    },
    'f7c07d8o': {
      'ar': '3m ago',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'pyee8im5': {
      'ar': 'للقيام بمسح رمز QR؛ يرجى السماح للتطبيق بالوصول إلى الكاميرا',
      'en': 'To scan a QR code, please allow the app access to your camera.',
    },
    'bqcohvqr': {
      'ar': ' يرجى السماح للتطبيق بالوصول لموقعك الجغرافي',
      'en': '',
    },
    'c0voijmn': {
      'ar': 'يرجى تفعيل الموقع الجغرافي في الجهاز.',
      'en': 'Please enable location services on your device.',
    },
    '8goe8g6n': {
      'ar': 'لتجربة أفضل يرجى السماح لبلقاء بإظهار الإشعارات',
      'en':
          'For a better experience, please allow the app to show notifications.',
    },
    'pqotght5': {
      'ar': '',
      'en': '',
    },
    '176y8gy4': {
      'ar': '',
      'en': '',
    },
    'lj4xjbzf': {
      'ar': '',
      'en': '',
    },
    '3doq1zdt': {
      'ar': '',
      'en': '',
    },
    'njndx78e': {
      'ar': '',
      'en': '',
    },
    '8j4eoyke': {
      'ar': '',
      'en': '',
    },
    'am2c84v2': {
      'ar': '',
      'en': '',
    },
    'yu9cc68x': {
      'ar': '',
      'en': '',
    },
    '80uajwi0': {
      'ar': '',
      'en': '',
    },
    'zq8uhi7d': {
      'ar': '',
      'en': '',
    },
    '9d1i6qx5': {
      'ar': '',
      'en': '',
    },
    'b7n9yskp': {
      'ar': '',
      'en': '',
    },
    'ukpbdk7u': {
      'ar': '',
      'en': '',
    },
    'j5xn2qh4': {
      'ar': '',
      'en': '',
    },
    'nezg0trr': {
      'ar': '',
      'en': '',
    },
    'ooi8jz2w': {
      'ar': '',
      'en': '',
    },
    'n53dzxht': {
      'ar': '',
      'en': '',
    },
    'x6n40lql': {
      'ar': '',
      'en': '',
    },
    '8o71ilyw': {
      'ar': '',
      'en': '',
    },
    'y58xghhz': {
      'ar': '',
      'en': '',
    },
    'y22ryoh1': {
      'ar': '',
      'en': '',
    },
    'gzg7bc27': {
      'ar': '',
      'en': '',
    },
    'g6t7ac9l': {
      'ar': '',
      'en': '',
    },
    'ex8174ua': {
      'ar': '',
      'en': '',
    },
    's1dwsd86': {
      'ar': '',
      'en': '',
    },
    'hv63gmit': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
