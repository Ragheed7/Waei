import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waie/core/shared_models/look_ups/brand_lookup.dart';
import 'package:waie/core/shared_models/look_ups/category_lookup.dart';
import 'package:waie/core/shared_models/look_ups/colors_lookup.dart';
import 'package:waie/core/shared_models/look_ups/logic/lookup_cubit.dart';
import 'package:waie/core/shared_models/look_ups/logic/lookup_state.dart';
import 'package:waie/core/shared_models/look_ups/material_lookup.dart';
import 'package:waie/core/shared_models/look_ups/product_status_lookup.dart';
import 'package:waie/core/shared_models/look_ups/style_lookup.dart';
import 'package:waie/core/theming/colors.dart';

class FilterOptions extends StatefulWidget {
  final Function(Map<String, dynamic>) onApplyFilters;

  final double? initialMinPrice;
  final double? initialMaxPrice;
  final int? initialSelectedCategory;
  final int? initialSelectedColor;
  final int? initialSelectedBrand;
  final int? initialSelectedStyle;
  final int? initialSelectedMaterial;
  final int? initialProductStatus;
  final String? initialSortBy;
  final bool? initialIsDescending;

  const FilterOptions({
    Key? key,
    required this.onApplyFilters,
    this.initialMinPrice,
    this.initialMaxPrice,
    this.initialSelectedCategory,
    this.initialSelectedColor,
    this.initialSelectedBrand,
    this.initialSelectedStyle,
    this.initialSelectedMaterial,
    this.initialProductStatus,
    this.initialSortBy,
    this.initialIsDescending,
  }) : super(key: key);

  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  double? _minPrice;
  double? _maxPrice;
  int? _selectedCategory;
  int? _selectedColor;
  int? _selectedBrand;
  int? _selectedStyle;
  int? _selectedMaterial;
  int? _productStatus;
  String? _sortBy;
  bool? _isDescending;

  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();
    _minPrice = widget.initialMinPrice;
    _maxPrice = widget.initialMaxPrice;
    _selectedCategory = widget.initialSelectedCategory;
    _selectedColor = widget.initialSelectedColor;
    _selectedBrand = widget.initialSelectedBrand;
    _selectedStyle = widget.initialSelectedStyle;
    _selectedMaterial = widget.initialSelectedMaterial;
    _productStatus = widget.initialProductStatus;
    _sortBy = widget.initialSortBy;
    _isDescending = widget.initialIsDescending;

    _minPriceController = TextEditingController(text: _minPrice?.toString());
    _maxPriceController = TextEditingController(text: _maxPrice?.toString());
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 12),
      child: BlocBuilder<LookupCubit, LookupState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainGreen,
              ),
            ),
            loaded: (colors, brands, styles, materials, productStatuses,
                categories) {
              return _buildFilterOptions(
                context,
                colors,
                brands,
                styles,
                materials,
                productStatuses,
                categories,
              );
            },
            error: (error) => Center(child: Text('Error: $error')),
            orElse: () => Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainGreen,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterOptions(
    BuildContext context,
    List<ColorsLookUp> colors,
    List<BrandLookUp> brands,
    List<StyleLookUp> styles,
    List<MaterialLookUp> materials,
    List<ProductStatusLookUp> productStatuses,
    List<CategoryLookUp> categories,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorsManager.grey,
              ),
              height: 1.5,
              width: 75,
            ),
            SizedBox(height: 8),
            // Min and Max Price
            Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: ColorsManager.mainGreen,
                    controller: _minPriceController,
                    decoration: InputDecoration(
                      labelText: 'Min Price',
                      labelStyle: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: ColorsManager.mainGreen,
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.mainGreen),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _minPrice = double.tryParse(value);
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _maxPriceController,
                    cursorColor: ColorsManager.mainGreen,
                    decoration: InputDecoration(
                      labelText: 'Max Price',
                      labelStyle: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: ColorsManager.mainGreen,
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.mainGreen),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _maxPrice = double.tryParse(value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Category and Brand
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Select Category',
                      labelStyle: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: ColorsManager.mainGreen,
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.mainGreen),
                      ),
                    ),
                    value: _selectedCategory,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedCategory = newValue;
                      });
                    },
                    items: categories.map<DropdownMenuItem<int>>((category) {
                      return DropdownMenuItem<int>(
                        value: category.value,
                        child: Text(category.nameEn),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Select Brand',
                      labelStyle: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: ColorsManager.mainGreen,
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.mainGreen),
                      ),
                    ),
                    value: _selectedBrand,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedBrand = newValue;
                      });
                    },
                    items: brands.map<DropdownMenuItem<int>>((brand) {
                      return DropdownMenuItem<int>(
                        value: brand.value,
                        child: Text(brand.nameEn),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Color and Style
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Select Color',
                      labelStyle: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: ColorsManager.mainGreen,
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.mainGreen),
                      ),
                    ),
                    value: _selectedColor,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedColor = newValue;
                      });
                    },
                    items: colors.map<DropdownMenuItem<int>>((color) {
                      return DropdownMenuItem<int>(
                        value: color.value,
                        child: Text(color.nameEn),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Select Style',
                      labelStyle: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: ColorsManager.mainGreen,
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.mainGreen),
                      ),
                    ),
                    value: _selectedStyle,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedStyle = newValue;
                      });
                    },
                    items: styles.map<DropdownMenuItem<int>>((style) {
                      return DropdownMenuItem<int>(
                        value: style.value,
                        child: Text(style.nameEn),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Material and Product Status
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Select Material',
                      labelStyle: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: ColorsManager.mainGreen,
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.mainGreen),
                      ),
                    ),
                    value: _selectedMaterial,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedMaterial = newValue;
                      });
                    },
                    items: materials.map<DropdownMenuItem<int>>((material) {
                      return DropdownMenuItem<int>(
                        value: material.value,
                        child: Text(material.nameEn),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Product Status',
                      labelStyle: TextStyle(
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color: ColorsManager.mainGreen,
                        fontFamily: 'cabin',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsManager.mainGreen),
                      ),
                    ),
                    value: _productStatus,
                    onChanged: (int? newValue) {
                      setState(() {
                        _productStatus = newValue;
                      });
                    },
                    items: productStatuses.map<DropdownMenuItem<int>>((status) {
                      return DropdownMenuItem<int>(
                        value: status.value,
                        child: Text(status.nameEn),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Is Descending
            SwitchListTile(
              activeColor: ColorsManager.mainGreen,
              activeTrackColor: ColorsManager.mainGreen.withOpacity(0.5),
              title: Text(
                'Sort Descending',
                style: TextStyle(
                  fontFamily: 'cabin',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: _isDescending ?? false,
              onChanged: (bool value) {
                setState(() {
                  _isDescending = value;
                });
              },
            ),
            SizedBox(height: 20),
            // Reset and Apply Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _minPrice = null;
                      _maxPrice = null;
                      _selectedCategory = null;
                      _selectedColor = null;
                      _selectedBrand = null;
                      _selectedStyle = null;
                      _selectedMaterial = null;
                      _productStatus = null;
                      _sortBy = null;
                      _isDescending = null;
                      _minPriceController.clear();
                      _maxPriceController.clear();
                    });
                  },
                  child: Text(
                    'Reset Filters',
                    style: TextStyle(
                      fontFamily: 'cabin',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorsManager.mainGreen, 
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ColorsManager.mainGreen, 
                  ),
                  onPressed: () {
                    widget.onApplyFilters({
                      'minPrice': _minPrice,
                      'maxPrice': _maxPrice,
                      'categoryId': _selectedCategory,
                      'color': _selectedColor,
                      'brandId': _selectedBrand,
                      'styleId': _selectedStyle,
                      'materialId': _selectedMaterial,
                      'productStatus': _productStatus,
                      'sortBy': _sortBy,
                      'isDescending': _isDescending,
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Apply Filters',
                    style: TextStyle(
                      fontFamily: 'cabin',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
