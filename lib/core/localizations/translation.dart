import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'select_available_categories_in_your_property':
              'إختر التصنيفات المتوفرة في عقارك',
          'select_or_add_categories_in_your_property':
              'إختر التصنيفات المتوفرة في عقارك من القائمة أو قم بإضافة تصنيفات خاصة بك',
          'selected_categories': 'التصنيفات المختارة',
          'standard': 'ستاندرد',
          'deluxe': 'ديلوكس',
          'premier': 'بريمير',
          'already_added': 'تمت الإضافة مسبقاً',
          'category_already_added':
              'تمت إضافة التصنيف المحدد بالفعل إلى القائمة',
          'add_custom_category': 'إضافة تصنيف مخصص',
          'category_name_arabic': 'إسم التصنيف باللغة العربية',
          'category_name_english': ' إسم التصنيف باللغة الإنجليزية',
          'add': 'إضافة',
          'next': 'التالي',
          'unit_information': 'معلومات الوحدات',
          'categories': 'التصنيفات',
          'choose_unit_numbers_per_category':
              'اختر عدد الوحدات وأرقامها في كل تصنيف',
          'number_of_units': 'عدد الوحدات',
          'unit_numbers': 'أرقام الوحدات',
          'unit_number': 'وحدة رقم',
          'add_property_instructions':
              'في الخطوات التالية ستقوم بإضافة مواصفات التصنيف الأول فالتالي في ست خطوات لكل تصنيف. بإمكانك التوقف و العودة لإستكمال إضافة العقار بالعودة إلى قائمة المسودة. علماً أنه سيتم نسخ مواصفات التصنيف الأول للتصنيفات المتبقية بشكل تلقائي عند الإنتهاء من إدخال التفاصيل في التصنيف الأول وذلك لتسهيل إدخال المواصفات المكررة.',
          'category': 'تصنيف',
          'from': 'من',
          'property_location': 'موقع العقار',
          'please_select_property_location_on_map':
              'يرجى تحديد موقع العقار على الخريطة',
          'selected_location': 'الموقع الذي تم إختياره',
          'show_exact_location_before_booking':
              ' إظهار الموقع الدقيق قبل الحجز',
          'show_exact_location_on_map':
              'يمكنك إختيار إظهار موقعك الدقيق على الخريطة للضيوف المحتملين حتى قبل الحجز في حال كان عقارك للإستخدام التجاري ولا يوجد لديك أي تحفظ على إظهار موقعك الدقيق. إذا لم ترغب بهذا الخيار سيتم إظهار الموقع التقريبي لعقارك للضيوف المحتملين على أن يتم إظهار الموقع الدقيق بعد تأكيد الحجز.',
          'location_services_disabled':
              'خدمات تحديد الموقع معطلة. يرجى تفعيل الخدمات',
          'error': 'حدث خطأ ما',
          'location_permissions_denied': 'تم رفض إذن الموقع',
          'location_permissions_denied_permanently':
              'تم رفض أذونات الموقع بشكل دائم، لا يمكننا طلب الأذونات.',
          'unit_details': 'تفاصيل الوحدة',
          'unit_area': 'مساحة الوحدة',
          'direction': 'الاتجاه',
          'north': 'شمال',
          'west': 'غرب',
          'east': 'شرق',
          'south': 'جنوب',
          'youth': 'شباب',
          'families': 'عائلات',
          'and': 'و',
          'choose_youth_and_families':
              'يوصى بإختيار شباب وعائلات لزيادة فرصة حجز عقارك',
          'number_of_lounges': 'عدد المجالس/الجلسات',
          'lounge_number': 'مجلس/جلسة رقم',
          'delete_lounges': 'حذف المجلس/الجلسة',
          'type': 'نوع',
          'lounge1': 'مجلس',
          'lounge2': 'جلسة',
          'living_room': 'غرفة معيشة',
          'tent': 'خيمة',
          'private': 'خاص',
          'shared': 'مشترك',
          'or': 'أو',
          'indoor': 'داخلي',
          'outdoor': 'خارجي',
          'seats_capacity': 'عدد المقاعد يتسع ل',
          'amenities': 'مرافق',
          'lounge': 'المجلس/الجلسة',
          'air_conditioning': 'تكييف',
          'heating': 'تدفئة',
          'spray_mister': 'مرش رذاذ',
          'stove': 'موقد',
          'grill': 'مشوى',
          'television': 'تلفاز',
          'video_games': 'ألعاب إلكترونية',
          'swing': 'أرجوحة',
          'delete': 'حذف',
          'bedrooms_count': 'عدد غرف النوم',
          'bedroom_number': 'غرفة رقم',
          'bedroom': 'الغرفة',
          'double_beds_count': 'عدد الأسرة المزدوجة',
          'single_beds_count': 'عدد الأسرة الفردية',
          'sofa_beds_count': 'عدد أسرة الأريكة',
          'facilities': 'مرافق',
          'master_bedroom': 'غرفة ماستر',
          'jacuzzi': 'جاكوزي',
          'bathtub': 'حوض إستحمام',
          'desk': 'طاولة مكتب',
          'has_kitchen': 'هل يتوفر مطبخ؟',
          'yes': 'نعم',
          'no': 'لا',
          'dining_table_size': 'طاولة طعام تسع إلى',
          'kitchen_facilities': 'مرافق المطبخ',
          'refrigerator': 'ثلاجة',
          'oven': 'فرن',
          'cooking_utensils': 'أواني طبخ',
          'kettle': 'غلاية',
          'microwave': 'مايكروويف',
          'prices': 'الأسعار',
          'sunday': 'الأحد',
          'monday': 'الإثنين',
          'tuesday': 'الثلاثاء',
          'wednesday': 'الأربعاء',
          'thursday': 'الخميس',
          'friday': 'الجمعة',
          'weekend_prices': 'أسعار نهاية الأسبوع',
          'select_weekend_days': 'إختر أيام نهاية الأسبوع',
          'weekday_price': 'سعر أيام وسط الأسبوع',
          'currency': 'ر.س',
          'prices_title': 'الأسعار',
          'night': 'ليلة',
          'select_weekdays': 'إختر أيام وسط الأسبوع',
          'first_category_details_added_successfully':
              'لقد قمت بإضافة تفاصيل التصنيف @num1 بنجاح، بإمكانك الاستمرار ومتابعة إضافة تفاصيل التصنيف @num2 أو بإمكانك الخروج الآن والعودة لاحقًا لمتابعة إضافة عقارك عن طريق المسودة',
          'added_details_first_category': 'تم إضافة تفاصيل',
          "all_categories_details_added_successfully":
              "لقد قمت بإضافة تفاصيل جميع التصنيفات بنجاح، بإمكانك الاستمرار وإضافة شروط الحجز الخاصة بعقارك، أو يمكنك الخروج الآن والعودة لاحقًا لمتابعة إضافة عقارك عن طريق المسودة.",
          'choose_or_add_category': 'اختر تصنيفًا أو أضف واحدًا مخصصًا',
          'first': 'الأول',
          'second': 'الثاني',
          'third': 'الثالث',
          'fourth': 'الرابع',
          'fifth': 'الخامس',
          'sixth': 'السادس',
          'seventh': 'السابع',
          'eighth': 'الثامن',
          'ninth': 'التاسع',
          'tenth': 'العاشر',
          "addition_results": "نتائج الإضافة",
        },
        'en': {
          'select_available_categories_in_your_property':
              'Select available categories in your property',
          'select_or_add_categories_in_your_property':
              'Select available categories in your property from the list or add your own categories',
          'standard': 'Standard',
          'selected_categories': 'Selected categories',
          'deluxe': 'Deluxe',
          'premier': 'Premier',
          'already_added': 'Already added',
          'category_already_added':
              'The selected category has already been added to the list',
          'add_custom_category': 'Add custom category',
          'category_name_arabic': 'Category name in Arabic',
          'category_name_english': 'Category name in English',
          'add': 'Add',
          'next': 'Next',
          'unit_information': 'Unit Information',
          'categories': 'Categories',
          'choose_unit_numbers_per_category':
              'Choose the number and numbers of units per category',
          'number_of_units': 'Number of units',
          'unit_numbers': 'Unit numbers',
          'unit_number': 'Unit number',
          'add_property_instructions':
              'In the following steps, you will add specifications for the first category, followed by six steps for each category. You can stop and go back to complete adding the property by returning to the draft list. Note that the specifications for the first category will be automatically copied to the remaining categories upon completion of entering the details in the first category, to facilitate entering duplicate specifications.',
          'category': 'Category',
          'from': 'From',
          'property_location': 'Property location',
          'please_select_property_location_on_map':
              'Please select the property location on the map',
          'selected_location': 'Selected location',
          'show_exact_location_before_booking':
              'Show exact location before booking',
          'show_exact_location_on_map':
              'You can choose to display the exact location of your property on the map to potential guests even before booking if your property is for commercial use and you have no objection to displaying your exact location. If you do not want this option, the approximate location of your property will be shown to potential guests, and the exact location will be displayed after the booking is confirmed.',
          'location_services_disabled':
              'Location services are disabled. Please enable the services.',
          'error': 'Error',
          'location_permissions_denied': 'Location permissions are denied',
          'location_permissions_denied_permanently':
              'Location permissions are permanently denied, we cannot request permissions.',
          'unit_details': 'Unit Details',
          'unit_area': 'Unit area',
          'direction': 'Direction',
          'north': 'North',
          'west': 'West',
          'east': 'East',
          'south': 'South',
          'youth': 'Youth',
          'families': 'Families',
          'and': 'And',
          'choose_youth_and_families':
              'It is recommended to choose youth and families to increase the chance of booking your property',
          'number_of_lounges': 'Number of lounges',
          'lounge_number': 'lounge Number',
          'delete_lounge': 'Delete Lounges',
          'type': 'Type',
          'lounge1': 'Lounges',
          'lounge2': 'Lounges',
          'living_room': 'Living room',
          'tent': 'Tent',
          'private': 'Private',
          'shared': 'Shared',
          'or': 'Or',
          'indoor': 'Indoor',
          'outdoor': 'Outdoor',
          'seats_capacity': 'Seats capacity',
          'amenities': 'Amenities',
          'lounge': 'Lounge',
          'air_conditioning': 'Air conditioning',
          'heating': 'Heating',
          'spray_mister': 'Spray mister',
          'stove': 'Stove',
          'grill': 'Grill',
          'television': 'Television',
          'video_games': 'Video games',
          'swing': 'Swing',
          'delete': 'Delete',
          'bedrooms_count': 'Bedrooms count',
          'bedroom_number': 'Bedroom number',
          'bedroom': 'Bedroom',
          'double_beds_count': 'Double beds count',
          'single_beds_count': 'Single beds count',
          'sofa_beds_count': 'Sofa beds count',
          'facilities': 'Facilities',
          'master_bedroom': 'Master bedroom',
          'jacuzzi': 'Jacuzzi',
          'bathtub': 'Bathtub',
          'desk': 'Desk',
          'has_kitchen': 'Has kitchen?',
          'yes': 'Yes',
          'no': 'No',
          'dining_table_size': 'Dining table seats up to',
          'kitchen_facilities': 'Kitchen facilities',
          'refrigerator': 'Refrigerator',
          'oven': 'Oven',
          'cooking_utensils': 'cooking Utensils',
          'kettle': 'Kettle',
          'microwave': 'Microwave',
          'prices': 'Prices',
          'sunday': 'Sunday',
          'monday': 'Monday',
          'tuesday': 'Tuesday',
          'wednesday': 'Wednesday',
          'thursday': 'Thursday',
          'friday': 'Friday',
          'weekend_prices': 'Weekend Prices',
          'select_weekend_days': 'Select Weekend Days',
          'weekday_price': 'Weekday Price',
          'currency': 'SAR',
          'prices_title': 'Prices',
          'night': 'Night',
          'select_weekdays': 'Select weekdays',
          'first_category_details_added_successfully':
              'You have successfully added details for the @num1 category. You can continue adding details for the @num2 category, or you can exit now and return later to continue adding your property using the draft.',
          'added_details_first_category': 'Details added successfully.',
          'choose_or_add_category': 'Choose a category or add a custom one',
          'first': 'First',
          'second': 'Second',
          'third': 'Third',
          'fourth': 'Fourth',
          'fifth': 'Fifth',
          'sixth': 'Sixth',
          'seventh': 'Seventh',
          'eighth': 'Eighth',
          'ninth': 'Ninth',
          'tenth': 'Tenth',
          "all_categories_details_added_successfully":
              "You have successfully added details for all categories. You can continue and add booking terms for your property, or you can exit now and come back later to continue adding your property via the draft.",
          "addition_results": "Addition results",
        },
      };
}
