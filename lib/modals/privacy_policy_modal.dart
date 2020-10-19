import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkwell/linkwell.dart';

class EngagePrivacyPartner {
  String name;
  String details;
  String company;
  String optOut;
  String optOutHref;
  String more;
}

class EngagePrivacyPolicy extends StatelessWidget {
  String legalName;
  String url;
  String mobile;
  DateTime effective;
  List<Map> contacts;
  List<String> covers;
  List<String> personalData;

  /* Services */
  bool kitchenSink = false;
  bool facebook = false;
  bool googleAnalytics = false;
  bool googleAdSense = false;
  bool googleAdmob = false;
  bool googleAdWords = false;
  bool twitter = false;
  bool appleStore = false;
  bool googleStore = false;
  bool stripe = false;
  bool paypal = false;
  bool braintree = false;
  bool firebase = false;

  /* Custom Services*/
  List<EngagePrivacyPartner> analytics = [];
  List<EngagePrivacyPartner> advertising = [];
  List<EngagePrivacyPartner> remarketing = [];
  List<EngagePrivacyPartner> payments = [];
  List<EngagePrivacyPartner> storage = [];

  EngagePrivacyPolicy({
    Key key,
    this.legalName = 'DevEngage LLC',
    this.url = 'devengage.io',
    this.mobile = 'DevEngage',
    this.effective,
    this.contacts = const [
      {
        'type': 'email',
        'value': 'info@devengage.io',
      }
    ],
    this.covers = const ['Website'],
    this.personalData = const [
      'Email address',
      'First name and last name',
      'Phone number',
      'Address, State, Province, ZIP/Postal code, City',
      'Cookies and Usage Data',
      'Location Data',
    ],
    this.kitchenSink = false,
    this.facebook = false,
    this.googleAnalytics = false,
    this.googleAdSense = false,
    this.googleAdmob = false,
    this.googleAdWords = false,
    this.twitter = false,
    this.appleStore = false,
    this.googleStore = false,
    this.stripe = false,
    this.paypal = false,
    this.braintree = false,
    this.firebase = false,
    this.analytics = const [],
    this.advertising = const [],
    this.remarketing = const [],
    this.payments = const [],
    this.storage = const [],
  }) : super(key: key) {
    effective ??= DateTime.now();
  }

  close(context) {
    Navigator.pop(context);
  }

  headerText(String header, [double fontSize = 18]) {
    return Text(
      '$header',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  contentText(String content, [double fontSize = 16, double spacingUnit = 10]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LinkWell(
          content,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.black87,
          ),
        ),
        spacing(spacingUnit),
      ],
    );
  }

  listItem(String header, String content) {
    return Column(
      children: <Widget>[
        ListTile(
          title: header != null ? headerText(header, 15) : null,
          subtitle: contentText(content ?? '', 14, 4),
        ),
      ],
    );
    // return Column(
    //   children: <Widget>[
    //     if (header != null) headerText(header),
    //     contentText(content),
    //   ],
    // );
  }

  listItemSingle(String content) {
    return contentText("-" + content ?? '');
  }

  /*Advertising*/
  renderGoogleAnalytics() {
    if (!this.googleAnalytics && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Google Analytics'),
        contentText(
            'Google Analytics is a web analytics service offered by Google that tracks and reports website traffic. Google uses the data collected to track and monitor the use of our Service. This data is shared with other Google services. Google may use the collected data to contextualize and personalize the ads of its own advertising network.'),
        contentText(
            'For more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: https://policies.google.com/privacy?hl=en'),
      ],
    );
  }

  renderGoogleAdsense() {
    if (!this.googleAdSense && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Google AdSense & DoubleClick Cookie'),
        contentText(
            "Google, as a third party vendor, uses cookies to serve ads on our Service. Google's use of the DoubleClick cookie enables it and its partners to serve ads to our users based on their visit to our Service or other websites on the Internet."),
        contentText(
            'You may opt out of the use of the DoubleClick Cookie for interest-based advertising by visiting the Google Ads Settings web page: http://www.google.com/ads/preferences/'),
      ],
    );
  }

  renderGoogleAdmob() {
    if (!this.googleAdmob && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('AdMob by Google'),
        contentText("AdMob by Google is provided by Google Inc."),
        contentText(
            "You can opt-out from AdMob by Google service by following the instructions described by Google: https://support.google.com/ads/answer/2662922?hl=en"),
        contentText(
            "For more information on how Google uses the collected information, please visit the \"How Google uses data when you use our partners' sites or app\" page: http://www.google.com/policies/privacy/partners/ or visit the Privacy Policy of Google: http://www.google.com/policies/privacy/"),
      ],
    );
  }

  /* Remarketing */
  renderGoogleAdwords() {
    if (!this.googleAdWords && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Google AdWords'),
        contentText(
            "Google AdWords remarketing service is provided by Google Inc."),
        contentText(
            "You can opt-out of Google Analytics for Display Advertising and customize the Google Display Network ads by visiting the Google Ads Settings page: http://www.google.com/settings/ads"),
        contentText(
            "Google also recommends installing the Google Analytics Opt-out Browser Add-on - https://tools.google.com/dlpage/gaoptout - for your web browser. Google Analytics Opt-out Browser Add-on provides visitors with the ability to prevent their data from being collected and used by Google Analytics."),
        contentText(
            "For more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: https://policies.google.com/privacy?hl=en"),
      ],
    );
  }

  renderFacebookRemarketing() {
    if (!this.facebook && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Facebook'),
        contentText(
            "Facebook remarketing service is provided by Facebook Inc."),
        contentText(
            "You can learn more about interest-based advertising from Facebook by visiting this page: https://www.facebook.com/help/164968693837950"),
        contentText(
            "To opt-out from Facebook's interest-based ads follow these instructions from Facebook: https://www.facebook.com/help/568137493302217"),
        contentText(
            """Facebook adheres to the Self-Regulatory Principles for Online Behavioral Advertising established by the Digital Advertising Alliance. You can also opt-out from Facebook and other participating companies
            through the Digital Advertising Alliance in the USA http://www.aboutads.info/choices/, the Digital Advertising Alliance of Canada in Canada
            http://youradchoices.ca/ or the European Interactive Digital Advertising Alliance in Europe http://www.youronlinechoices.eu/,
            or opt-out using your mobile device settings."""),
        contentText(
            "For more information on the privacy practices of Facebook, please visit Facebook's Data Policy: https://www.facebook.com/privacy/explanation"),
      ],
    );
  }

  renderTwitterRemarketing() {
    if (!this.twitter && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Twitter'),
        contentText("Twitter remarketing service is provided by Twitter Inc."),
        contentText(
            "You can opt-out from Twitter's interest-based ads by following their instructions: https://support.twitter.com/articles/20170405"),
        contentText(
            "You can learn more about the privacy practices and policies of Twitter by visiting their Privacy Policy page: https://twitter.com/privacy"),
      ],
    );
  }

  /* Payments */
  renderAppleStorePayment() {
    if (!this.appleStore && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Apple Store In-App Payments'),
        contentText(
            "Their Privacy Policy can be viewed at https://www.apple.com/legal/privacy/en-ww/"),
      ],
    );
  }

  renderGoogleStorePayment() {
    if (!this.appleStore && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Google Play In-App Payments'),
        contentText(
            "Their Privacy Policy can be viewed at https://www.google.com/policies/privacy/"),
      ],
    );
  }

  renderStripePayment() {
    if (!this.stripe && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Stripe'),
        contentText(
            "Their Privacy Policy can be viewed at https://stripe.com/us/privacy"),
      ],
    );
  }

  renderPaypalBriantreePayment() {
    if (!this.stripe && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('PayPal or Braintree'),
        contentText(
            "Their Privacy Policy can be viewed at https://www.paypal.com/webapps/mpp/ua/privacy-full"),
      ],
    );
  }

  /* FULL SERVICE AKA FIREBASE*/
  renderFirebaseService() {
    if (!this.firebase && !this.kitchenSink) return SizedBox();
    return Column(
      children: <Widget>[
        headerText('Firebase'),
        contentText("Firebase is provided by Google Inc."),
        contentText(
            "Firebase stores and manages data for users and the customer that can be used for analytics, authentication, push notifications, testing, hosting, and linking."),
        contentText(
            "For more information on the privacy practices of Google, please visit the Google Privacy & Terms web page: https://firebase.google.com/support/privacy/"),
      ],
    );
  }

  renderPartnerList(List<EngagePrivacyPartner> list) {
    return Column(
      children: <Widget>[
        for (EngagePrivacyPartner partner in list)
          Column(
            children: <Widget>[
              headerText('${partner.name}'),
              if (partner?.details != null) contentText("${partner.details}"),
              if (partner?.optOut != null)
                contentText(
                    "${partner.optOut} ${partner.optOutHref != null ? partner.optOutHref : ''}"),
              contentText(
                  "For more information on the privacy practices and data collection of ${partner.company}, please visit the ${partner.company} Privacy & Terms web page: ${partner.more}"),
            ],
          )
      ],
    );
  }

  getDateTime(DateTime date) {
    return '${date.month}-${date.day}-${date.year}';
  }

  spacing([double by = 10.0]) {
    return SizedBox(
      height: by,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            /*<h1>Privacy Policy</h1>*/

            contentText(
                "Effective date: ${getDateTime(effective)}"), // {this.getMonth(this.effective.getMonth())} {this.effective.getDate()}, {this.effective.getFullYear()}
            contentText(
                """$legalName ("us", "we", or "our") operates the $url website ${mobile != null ? 'and the $mobile mobile application' : ''} (the "Service")."""),
            contentText(
                """This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data."""),
            contentText(
                """We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our Terms and Conditions."""),
            headerText('Definitions'),
            listItem('Service',
                "Service means the devengage.io website and the Games Revealed mobile application operated by $legalName"),
            listItem('Personal Data',
                "Personal Data means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession)."),
            listItem('Usage Data',
                "Usage Data is data collected automatically either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit)."),
            listItem('Cookies',
                "Cookies are small pieces of data stored on your device (computer or mobile device)."),
            listItem('Data Controller',
                "Data Controller means the natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal information are, or are to be, processed. For the purpose of this Privacy Policy, we are a Data Controller of your Personal Data."),
            listItem('Data Processors (or Service Providers)',
                "Data Processor (or Service Provider) means any natural or legal person who processes the data on behalf of the Data Controller. We may use the services of various Service Providers in order to process your data more effectively."),
            listItem('Data Subject (or User)',
                "Data Subject is any living individual who is using our Service and is the subject of Personal Data."),

            headerText('Information Collection And Use'),
            contentText(
                """We collect several different types of information for various purposes to provide and improve our Service to you."""),

            headerText('Types of Data Collected', 16),
            headerText('Personal Data', 14),
            contentText(
                """While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally identifiable information may include, but is not limited to:"""),
            for (String data in personalData) contentText("-" + data),

            headerText('Usage Data', 14),
            contentText(
                """We may also collect information that your browser sends whenever you visit our Service or when you access the Service by or through a mobile device ("Usage Data")."""),
            contentText(
                """This Usage Data may include information such as your computer's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data."""),
            contentText(
                """When you access the Service by or through a mobile device, this Usage Data may include information such as the type of mobile device you use, your mobile device unique ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browser you use, unique device identifiers and other diagnostic data."""),

            headerText('Location Data', 14),
            contentText(
                """We may use and store information about your location if you give us permission to do so (“Location Data”). We use this data to provide features of our Service, to improve and customize our Service."""),
            contentText(
                """You can enable or disable location services when you use our Service at any time, through your device settings."""),

            headerText('Tracking & Cookies Data', 14),
            contentText(
                """We use cookies and similar tracking technologies to track the activity on our Service and hold certain information."""),
            contentText(
                """Cookies are files with small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Tracking technologies also used are beacons, tags, and scripts to collect and track information and to improve and analyze our Service."""),
            contentText(
                """You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service."""),
            contentText("""Examples of Cookies we use:"""),
            listItem('Session Cookies.',
                "We use Session Cookies to operate our Service."),
            listItem('Preference Cookies.',
                "We use Preference Cookies to remember your preferences and various settings."),
            listItem('Security Cookies.',
                "We use Security Cookies for security purposes."),
            listItem('Advertising Cookies.',
                "Advertising Cookies are used to serve you with advertisements that may be relevant to you and your interests."),

            headerText('Use of Data'),
            contentText(
                """$legalName uses the collected data for various purposes:"""),
            listItemSingle("To provide and maintain the Service"),
            listItemSingle("To notify you about changes to our Service"),
            listItemSingle(
                "To allow you to participate in interactive features of our Service when you choose to do so"),
            listItemSingle("To provide customer care and support"),
            listItemSingle(
                "To provide analysis or valuable information so that we can improve the Service"),
            listItemSingle("To monitor the usage of the Service"),
            listItemSingle("To detect, prevent and address technical issues"),
            listItemSingle(
                """To provide you with news, special offers and general information about other goods, services and events
            which we offer that are similar to those that you have already purchased or enquired about unless you have
            opted not to receive such information"""),

            /* European Economic Area (EEA) */
            headerText(
                'Legal Basis for Processing Personal Data Under General Data Protection Regulation (GDPR)'),
            contentText(
                """If you are from the European Economic Area (EEA), $legalName legal basis for collecting and using the
          personal information described in this Privacy Policy depends on the Personal Data we collect and the
          specific context in which we collect it."""),
            contentText(
                """$legalName may process your Personal Data because:"""),
            listItemSingle("We need to perform a contract with you"),
            listItemSingle("You have given us permission to do so"),
            listItemSingle(
                "The processing is in our legitimate interests and it's not overridden by your rights"),
            listItemSingle("For payment processing purposes"),
            listItemSingle("To comply with the law"),

            headerText('Retention of Data'),
            contentText(
                """$legalName will retain your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies."""),
            contentText(
                """$legalName will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of our Service, or we are legally obligated to retain this data for longer time periods."""),

            headerText('Transfer Of Data'),
            contentText(
                """Your information, including Personal Data, may be transferred to — and maintained on — computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction."""),
            contentText(
                """If you are located outside United States and choose to provide information to us, please note that we transfer the data, including Personal Data, to United States and process it there."""),
            contentText(
                """Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer."""),
            contentText(
                """$legalName will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of your data and other personal information."""),

            headerText('Disclosure Of Data'),
            headerText('Business Transaction', 16),
            contentText(
                """If $legalName is involved in a merger, acquisition or asset sale, your Personal Data may be transferred. We will provide notice before your Personal Data is transferred and becomes subject to a different Privacy Policy."""),

            headerText('Disclosure for Law Enforcement', 16),
            contentText(
                """Under certain circumstances, $legalName may be required to disclose your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency)."""),

            headerText('Legal Requirements', 16),
            contentText(
                """$legalName may disclose your Personal Data in the good faith belief that such action is necessary to:"""),
            listItemSingle("To comply with a legal obligation"),
            listItemSingle(
                "To protect and defend the rights or property of $legalName"),
            listItemSingle(
                "To prevent or investigate possible wrongdoing in connection with the Service"),
            listItemSingle(
                "To protect the personal safety of users of the Service or the public"),
            listItemSingle("To protect against legal liability"),

            headerText('Security Of Data'),
            contentText(
                """The security of your data is important to us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security."""),

            headerText(
                '"Do Not Track" Signals Under California Online Privacy Protection Act (CalOPPA)'),
            contentText(
                """We do not support Do Not Track ("DNT"). Do Not Track is a preference you can set in your web browser to inform websites that you do not want to be tracked."""),
            contentText(
                """You can enable or disable Do Not Track by visiting the Preferences or Settings page of your web browser."""),

            headerText(
                'Your Data Protection Rights Under General Data Protection Regulation (GDPR)'),
            contentText(
                """If you are a resident of the European Economic Area (EEA), you have certain data protection rights. $legalName aims to take reasonable steps to allow you to correct, amend, delete, or limit the use of your Personal Data."""),
            contentText(
                """If you wish to be informed what Personal Data we hold about you and if you want it to be removed from our systems, please contact us."""),
            contentText(
                """In certain circumstances, you have the following data protection rights:"""),
            listItem(
                'The right to access, update or to delete the information we have on you.',
                "Whenever made possible, you can access, update or request deletion of your Personal Data directly within your account settings section. If you are unable to perform these actions yourself, please contact us to assist you."),
            listItem('The right of rectification.',
                "You have the right to have your information rectified if that information is inaccurate or incomplete."),
            listItem('The right to object.',
                "You have the right to object to our processing of your Personal Data."),
            listItem('The right of restriction.',
                "You have the right to request that we restrict the processing of your personal information."),
            listItem('The right to data portability.',
                "You have the right to be provided with a copy of the information we have on you in a structured, machine-readable and commonly used format."),
            listItem('The right to withdraw consent.',
                "You also have the right to withdraw your consent at any time where $legalName relied on your consent to process your personal information."),
            contentText(
                """Please note that we may ask you to verify your identity before responding to such requests."""),
            contentText(
                """You have the right to complain to a Data Protection Authority about our collection and use of your Personal Data. For more information, please contact your local data protection authority in the European Economic Area (EEA)."""),

            headerText('Service Providers'),
            contentText(
                """We may employ third party companies and individuals to facilitate our Service ("Service Providers"), to provide the Service on our behalf, to perform Service-related services or to assist us in analyzing how our Service is used."""),
            contentText(
                """These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose."""),

            /*1. Analytics*/
            headerText('Analytics', 16),
            contentText(
                """We may use third-party Service Providers to monitor and analyze the use of our Service."""),
            renderGoogleAnalytics(),
            renderPartnerList(analytics),

            /*2. Advertising*/
            headerText('Advertising', 16),
            contentText(
                """We may use third-party Service Providers to show advertisements to you to help support and maintain our Service."""),
            renderGoogleAdsense(),
            renderGoogleAdmob(),
            renderPartnerList(advertising),

            /*3. Behavioral Remarketing*/
            headerText('Behavioral Remarketing', 16),
            contentText(
                """$legalName uses remarketing services to advertise on third party websites to you after you visited our Service. We and our third-party vendors use cookies to inform, optimize and serve ads based on your past visits to our Service."""),
            renderGoogleAdwords(),
            renderTwitterRemarketing(),
            renderFacebookRemarketing(),
            renderPartnerList(remarketing),

            /*4. Payments*/
            headerText('Payments', 16),
            contentText(
                """We may provide paid products and/or services within the Service. In that case, we use third-party services for payment processing (e.g. payment processors)."""),
            contentText(
                """We will not store or collect your payment card details. That information is provided directly to our third-party payment processors whose use of your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, Mastercard, American Express and Discover. PCI-DSS requirements help ensure the secure handling of payment information."""),
            contentText("""The payment processors we work with are:"""),
            renderAppleStorePayment(),
            renderGoogleStorePayment(),
            renderStripePayment(),
            renderPaypalBriantreePayment(),
            renderPartnerList(payments),

            /*5. Database and File Storage*/
            headerText('Databases and File Storage', 16),
            contentText(
                """We may collect data inputted by you and store it in database and/or file storage for later use by you or other users. we might use the data to improve the user experience."""),
            contentText(
                """We will not store or collect your sensitive information with out taking proper measure to secure it. we will either use a server or service to store the data."""),
            contentText("""The third-party service we work with are:"""),
            renderFirebaseService(),
            renderPartnerList(storage),

            headerText('Links To Other Sites'),
            contentText(
                """Our Service may contain links to other sites that are not operated by us. If you click on a third party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy of every site you visit."""),
            contentText(
                """We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services."""),

            headerText("Children's Privacy"),
            contentText(
                """Our Service does not address anyone under the age of 18 ("Children")."""),
            contentText(
                """We do not knowingly collect personally identifiable information from anyone under the age of 18. If you are a parent or guardian and you are aware that your Children has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from children without verification of parental consent, we take steps to remove that information from our servers."""),

            headerText("Changes To This Privacy Policy"),
            contentText(
                """We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page."""),
            contentText(
                """We will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update the "effective date" at the top of this Privacy Policy."""),
            contentText(
                """You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page."""),

            headerText("Contact Us"),
            for (Map contact in contacts)
              contentText('By ${contact["type"]}: ${contact["value"]}'),
          ],
        ),
      ),
    );
  }
}

showEngagePrivacyPolicy({
  legalName = 'DevEngage LLC',
  url = 'devengage.io',
  mobile = 'DevEngage',
  DateTime effective,
  List<Map> contacts = const [
    {
      'type': 'email',
      'value': 'info@devengage.io',
    }
  ],
  List<String> covers = const ['Website'],
  List<String> personalData = const [
    'Email address',
    'First name and last name',
    'Phone number',
    'Address, State, Province, ZIP/Postal code, City',
    'Cookies and Usage Data',
    'Location Data',
  ],
  kitchenSink = false,
  facebook = false,
  googleAnalytics = false,
  googleAdSense = false,
  googleAdmob = false,
  googleAdWords = false,
  twitter = false,
  appleStore = false,
  googleStore = false,
  stripe = false,
  paypal = false,
  braintree = false,
  firebase = false,
  List<EngagePrivacyPartner> analytics = const [],
  List<EngagePrivacyPartner> advertising = const [],
  List<EngagePrivacyPartner> remarketing = const [],
  List<EngagePrivacyPartner> payments = const [],
  List<EngagePrivacyPartner> storage = const [],
}) async {
  return Get.bottomSheet(
    Container(
      // height: queryData.size.height - 40,
      child: EngagePrivacyPolicy(
        legalName: legalName,
        url: url,
        mobile: mobile,
        effective: effective,
        contacts: contacts,
        covers: covers,
        personalData: personalData,
        kitchenSink: kitchenSink,
        facebook: facebook,
        googleAnalytics: googleAnalytics,
        googleAdSense: googleAdSense,
        googleAdmob: googleAdmob,
        googleAdWords: googleAdWords,
        twitter: twitter,
        appleStore: appleStore,
        googleStore: googleStore,
        stripe: stripe,
        paypal: paypal,
        braintree: braintree,
        firebase: firebase,
        analytics: analytics,
        advertising: advertising,
        remarketing: remarketing,
        payments: payments,
        storage: storage,
      ),
    ),
    isScrollControlled: true,
    // builder: (context) {
    //   MediaQueryData queryData = MediaQuery.of(context);
    //   return Container(
    //     // height: queryData.size.height - 40,
    //     child: EngagePrivacyPolicy(
    //       legalName: legalName,
    //       url: url,
    //       mobile: mobile,
    //       effective: effective,
    //       contacts: contacts,
    //       covers: covers,
    //       personalData: personalData,
    //       kitchenSink: kitchenSink,
    //       facebook: facebook,
    //       googleAnalytics: googleAnalytics,
    //       googleAdSense: googleAdSense,
    //       googleAdmob: googleAdmob,
    //       googleAdWords: googleAdWords,
    //       twitter: twitter,
    //       appleStore: appleStore,
    //       googleStore: googleStore,
    //       stripe: stripe,
    //       paypal: paypal,
    //       braintree: braintree,
    //       firebase: firebase,
    //       analytics: analytics,
    //       advertising: advertising,
    //       remarketing: remarketing,
    //       payments: payments,
    //       storage: storage,
    //     ),
    //   );
    // },
  );
}
