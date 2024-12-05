/* 
 * Author: Nguyen Van Bien
 * Email: nvbien2000@gmail.com
 */

library recursive_tree_flutter;

import 'package:flutter/material.dart';
import 'package:unit_tree_data_structure/unit_tree_data_structure.dart';

export 'package:unit_tree_data_structure/unit_tree_data_structure.dart';

part 'models/typedef.dart';

part 'utils/ui_properties.p.dart';
part 'utils/ui_property_constants.p.dart';

part 'views/expanded_variant/expanded_widget_mixin.p.dart';

part 'views/expanded_variant/multiple_choice/widgets/m_expanded_internal_widget.p.dart';
part 'views/expanded_variant/multiple_choice/widgets/m_lazy_expanded_internal_widget.p.dart';
part 'views/expanded_variant/multiple_choice/m_lazy_expanded_widget.p.dart';
part 'views/expanded_variant/multiple_choice/m_expanded_widget.p.dart';

part 'views/expanded_variant/single_choice/widgets/s_expanded_internal_widget.p.dart';
part 'views/expanded_variant/single_choice/widgets/s_lazy_expanded_internal_widget.p.dart';
part 'views/expanded_variant/single_choice/s_lazy_expanded_widget.p.dart';
part 'views/expanded_variant/single_choice/s_expanded_widget.p.dart';

part 'views/stack_variant/multiple_choice/m_lazy_stack_widget.p.dart';
part 'views/stack_variant/multiple_choice/m_stack_widget.p.dart';
part 'views/stack_variant/single_choice/s_lazy_stack_widget.p.dart';
part 'views/stack_variant/single_choice/s_stack_widget.p.dart';
