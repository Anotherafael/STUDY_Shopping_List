import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/grocery_items_dummy_data.dart';

final groceryItems = Provider(
  (ref) => groceryItemsDummyData,
);
