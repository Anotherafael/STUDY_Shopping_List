import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/categories_dummy_data.dart';

final categories = Provider(
  (ref) => categoriesDummyData.values.toList(),
);
