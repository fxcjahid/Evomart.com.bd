/*
 * ATTENTION: An "eval-source-map" devtool has been used.
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file with attached SourceMaps in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./Themes/Storefront/resources/assets/admin/js/main.js":
/*!*************************************************************!*\
  !*** ./Themes/Storefront/resources/assets/admin/js/main.js ***!
  \*************************************************************/
/***/ (() => {

eval("window.admin.removeSubmitButtonOffsetOn(['#logo', '#footer', '#newsletter', '#product_page', '#slider_banners', '#three_column_full_width_banners', '#brands', '#two_column_banners', '#three_column_banners', '#one_column_banner']);\n$('#storefront_theme_color').on('change', function (e) {\n  if (e.currentTarget.value === 'custom_color') {\n    $('#custom-theme-color').removeClass('hide');\n  } else {\n    $('#custom-theme-color').addClass('hide');\n  }\n});\n$('#storefront_mail_theme_color').on('change', function (e) {\n  if (e.currentTarget.value === 'custom_color') {\n    $('#custom-mail-theme-color').removeClass('hide');\n  } else {\n    $('#custom-mail-theme-color').addClass('hide');\n  }\n});\n$('#storefront-settings-edit-form').on('click', '.panel-image', function (e) {\n  var picker = new MediaPicker({\n    type: 'image'\n  });\n  picker.on('select', function (file) {\n    $(e.currentTarget).find('i').remove();\n    $(e.currentTarget).find('img').attr('src', file.path).removeClass('hide');\n    $(e.currentTarget).find('.banner-file-id').val(file.id);\n  });\n});\n$('.product-type').on('change', function (e) {\n  var categoryProducts = $(e.currentTarget).parents('.form-group').siblings('.category-products');\n  var productsLimit = $(e.currentTarget).parents('.form-group').siblings('.products-limit');\n  var customProducts = $(e.currentTarget).parents('.form-group').siblings('.custom-products');\n  categoryProducts.addClass('hide');\n  productsLimit.addClass('hide');\n  customProducts.addClass('hide');\n  if (e.currentTarget.value === 'category_products') {\n    categoryProducts.removeClass('hide');\n  }\n  if (e.currentTarget.value === 'latest_products' || e.currentTarget.value === 'recently_viewed_products' || e.currentTarget.value === 'category_products') {\n    productsLimit.removeClass('hide');\n  }\n  if (e.currentTarget.value === 'custom_products') {\n    customProducts.removeClass('hide');\n  }\n});//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJuYW1lcyI6WyJ3aW5kb3ciLCJhZG1pbiIsInJlbW92ZVN1Ym1pdEJ1dHRvbk9mZnNldE9uIiwiJCIsIm9uIiwiZSIsImN1cnJlbnRUYXJnZXQiLCJ2YWx1ZSIsInJlbW92ZUNsYXNzIiwiYWRkQ2xhc3MiLCJwaWNrZXIiLCJNZWRpYVBpY2tlciIsInR5cGUiLCJmaWxlIiwiZmluZCIsInJlbW92ZSIsImF0dHIiLCJwYXRoIiwidmFsIiwiaWQiLCJjYXRlZ29yeVByb2R1Y3RzIiwicGFyZW50cyIsInNpYmxpbmdzIiwicHJvZHVjdHNMaW1pdCIsImN1c3RvbVByb2R1Y3RzIl0sInNvdXJjZXMiOlsid2VicGFjazovL2V2b21hcnQvLi9UaGVtZXMvU3RvcmVmcm9udC9yZXNvdXJjZXMvYXNzZXRzL2FkbWluL2pzL21haW4uanM/NjNlZSJdLCJzb3VyY2VzQ29udGVudCI6WyJ3aW5kb3cuYWRtaW4ucmVtb3ZlU3VibWl0QnV0dG9uT2Zmc2V0T24oW1xyXG4gICAgJyNsb2dvJywgJyNmb290ZXInLCAnI25ld3NsZXR0ZXInLCAnI3Byb2R1Y3RfcGFnZScsICcjc2xpZGVyX2Jhbm5lcnMnLCAnI3RocmVlX2NvbHVtbl9mdWxsX3dpZHRoX2Jhbm5lcnMnLFxyXG4gICAgJyNicmFuZHMnLCAnI3R3b19jb2x1bW5fYmFubmVycycsICcjdGhyZWVfY29sdW1uX2Jhbm5lcnMnLCAnI29uZV9jb2x1bW5fYmFubmVyJyxcclxuXSk7XHJcblxyXG4kKCcjc3RvcmVmcm9udF90aGVtZV9jb2xvcicpLm9uKCdjaGFuZ2UnLCAoZSkgPT4ge1xyXG4gICAgaWYgKGUuY3VycmVudFRhcmdldC52YWx1ZSA9PT0gJ2N1c3RvbV9jb2xvcicpIHtcclxuICAgICAgICAkKCcjY3VzdG9tLXRoZW1lLWNvbG9yJykucmVtb3ZlQ2xhc3MoJ2hpZGUnKTtcclxuICAgIH0gZWxzZSB7XHJcbiAgICAgICAgJCgnI2N1c3RvbS10aGVtZS1jb2xvcicpLmFkZENsYXNzKCdoaWRlJyk7XHJcbiAgICB9XHJcbn0pO1xyXG5cclxuJCgnI3N0b3JlZnJvbnRfbWFpbF90aGVtZV9jb2xvcicpLm9uKCdjaGFuZ2UnLCAoZSkgPT4ge1xyXG4gICAgaWYgKGUuY3VycmVudFRhcmdldC52YWx1ZSA9PT0gJ2N1c3RvbV9jb2xvcicpIHtcclxuICAgICAgICAkKCcjY3VzdG9tLW1haWwtdGhlbWUtY29sb3InKS5yZW1vdmVDbGFzcygnaGlkZScpO1xyXG4gICAgfSBlbHNlIHtcclxuICAgICAgICAkKCcjY3VzdG9tLW1haWwtdGhlbWUtY29sb3InKS5hZGRDbGFzcygnaGlkZScpO1xyXG4gICAgfVxyXG59KTtcclxuXHJcbiQoJyNzdG9yZWZyb250LXNldHRpbmdzLWVkaXQtZm9ybScpLm9uKCdjbGljaycsICcucGFuZWwtaW1hZ2UnLCAoZSkgPT4ge1xyXG4gICAgbGV0IHBpY2tlciA9IG5ldyBNZWRpYVBpY2tlcih7IHR5cGU6ICdpbWFnZScgfSk7XHJcblxyXG4gICAgcGlja2VyLm9uKCdzZWxlY3QnLCAoZmlsZSkgPT4ge1xyXG4gICAgICAgICQoZS5jdXJyZW50VGFyZ2V0KS5maW5kKCdpJykucmVtb3ZlKCk7XHJcbiAgICAgICAgJChlLmN1cnJlbnRUYXJnZXQpLmZpbmQoJ2ltZycpLmF0dHIoJ3NyYycsIGZpbGUucGF0aCkucmVtb3ZlQ2xhc3MoJ2hpZGUnKTtcclxuICAgICAgICAkKGUuY3VycmVudFRhcmdldCkuZmluZCgnLmJhbm5lci1maWxlLWlkJykudmFsKGZpbGUuaWQpO1xyXG4gICAgfSk7XHJcbn0pO1xyXG5cclxuJCgnLnByb2R1Y3QtdHlwZScpLm9uKCdjaGFuZ2UnLCAoZSkgPT4ge1xyXG4gICAgbGV0IGNhdGVnb3J5UHJvZHVjdHMgPSAkKGUuY3VycmVudFRhcmdldCkucGFyZW50cygnLmZvcm0tZ3JvdXAnKS5zaWJsaW5ncygnLmNhdGVnb3J5LXByb2R1Y3RzJyk7XHJcbiAgICBsZXQgcHJvZHVjdHNMaW1pdCA9ICQoZS5jdXJyZW50VGFyZ2V0KS5wYXJlbnRzKCcuZm9ybS1ncm91cCcpLnNpYmxpbmdzKCcucHJvZHVjdHMtbGltaXQnKTtcclxuICAgIGxldCBjdXN0b21Qcm9kdWN0cyA9ICQoZS5jdXJyZW50VGFyZ2V0KS5wYXJlbnRzKCcuZm9ybS1ncm91cCcpLnNpYmxpbmdzKCcuY3VzdG9tLXByb2R1Y3RzJyk7XHJcblxyXG4gICAgY2F0ZWdvcnlQcm9kdWN0cy5hZGRDbGFzcygnaGlkZScpO1xyXG4gICAgcHJvZHVjdHNMaW1pdC5hZGRDbGFzcygnaGlkZScpO1xyXG4gICAgY3VzdG9tUHJvZHVjdHMuYWRkQ2xhc3MoJ2hpZGUnKTtcclxuXHJcbiAgICBpZiAoZS5jdXJyZW50VGFyZ2V0LnZhbHVlID09PSAnY2F0ZWdvcnlfcHJvZHVjdHMnKSB7XHJcbiAgICAgICAgY2F0ZWdvcnlQcm9kdWN0cy5yZW1vdmVDbGFzcygnaGlkZScpO1xyXG4gICAgfVxyXG5cclxuICAgIGlmIChlLmN1cnJlbnRUYXJnZXQudmFsdWUgPT09ICdsYXRlc3RfcHJvZHVjdHMnIHx8IGUuY3VycmVudFRhcmdldC52YWx1ZSA9PT0gJ3JlY2VudGx5X3ZpZXdlZF9wcm9kdWN0cycgfHwgZS5jdXJyZW50VGFyZ2V0LnZhbHVlID09PSAnY2F0ZWdvcnlfcHJvZHVjdHMnKSB7XHJcbiAgICAgICAgcHJvZHVjdHNMaW1pdC5yZW1vdmVDbGFzcygnaGlkZScpO1xyXG4gICAgfVxyXG5cclxuICAgIGlmIChlLmN1cnJlbnRUYXJnZXQudmFsdWUgPT09ICdjdXN0b21fcHJvZHVjdHMnKSB7XHJcbiAgICAgICAgY3VzdG9tUHJvZHVjdHMucmVtb3ZlQ2xhc3MoJ2hpZGUnKTtcclxuICAgIH1cclxufSk7XHJcbiJdLCJtYXBwaW5ncyI6IkFBQUFBLE1BQU0sQ0FBQ0MsS0FBSyxDQUFDQywwQkFBMEIsQ0FBQyxDQUNwQyxPQUFPLEVBQUUsU0FBUyxFQUFFLGFBQWEsRUFBRSxlQUFlLEVBQUUsaUJBQWlCLEVBQUUsa0NBQWtDLEVBQ3pHLFNBQVMsRUFBRSxxQkFBcUIsRUFBRSx1QkFBdUIsRUFBRSxvQkFBb0IsQ0FDbEYsQ0FBQztBQUVGQyxDQUFDLENBQUMseUJBQXlCLENBQUMsQ0FBQ0MsRUFBRSxDQUFDLFFBQVEsRUFBRSxVQUFDQyxDQUFDLEVBQUs7RUFDN0MsSUFBSUEsQ0FBQyxDQUFDQyxhQUFhLENBQUNDLEtBQUssS0FBSyxjQUFjLEVBQUU7SUFDMUNKLENBQUMsQ0FBQyxxQkFBcUIsQ0FBQyxDQUFDSyxXQUFXLENBQUMsTUFBTSxDQUFDO0VBQ2hELENBQUMsTUFBTTtJQUNITCxDQUFDLENBQUMscUJBQXFCLENBQUMsQ0FBQ00sUUFBUSxDQUFDLE1BQU0sQ0FBQztFQUM3QztBQUNKLENBQUMsQ0FBQztBQUVGTixDQUFDLENBQUMsOEJBQThCLENBQUMsQ0FBQ0MsRUFBRSxDQUFDLFFBQVEsRUFBRSxVQUFDQyxDQUFDLEVBQUs7RUFDbEQsSUFBSUEsQ0FBQyxDQUFDQyxhQUFhLENBQUNDLEtBQUssS0FBSyxjQUFjLEVBQUU7SUFDMUNKLENBQUMsQ0FBQywwQkFBMEIsQ0FBQyxDQUFDSyxXQUFXLENBQUMsTUFBTSxDQUFDO0VBQ3JELENBQUMsTUFBTTtJQUNITCxDQUFDLENBQUMsMEJBQTBCLENBQUMsQ0FBQ00sUUFBUSxDQUFDLE1BQU0sQ0FBQztFQUNsRDtBQUNKLENBQUMsQ0FBQztBQUVGTixDQUFDLENBQUMsZ0NBQWdDLENBQUMsQ0FBQ0MsRUFBRSxDQUFDLE9BQU8sRUFBRSxjQUFjLEVBQUUsVUFBQ0MsQ0FBQyxFQUFLO0VBQ25FLElBQUlLLE1BQU0sR0FBRyxJQUFJQyxXQUFXLENBQUM7SUFBRUMsSUFBSSxFQUFFO0VBQVEsQ0FBQyxDQUFDO0VBRS9DRixNQUFNLENBQUNOLEVBQUUsQ0FBQyxRQUFRLEVBQUUsVUFBQ1MsSUFBSSxFQUFLO0lBQzFCVixDQUFDLENBQUNFLENBQUMsQ0FBQ0MsYUFBYSxDQUFDLENBQUNRLElBQUksQ0FBQyxHQUFHLENBQUMsQ0FBQ0MsTUFBTSxFQUFFO0lBQ3JDWixDQUFDLENBQUNFLENBQUMsQ0FBQ0MsYUFBYSxDQUFDLENBQUNRLElBQUksQ0FBQyxLQUFLLENBQUMsQ0FBQ0UsSUFBSSxDQUFDLEtBQUssRUFBRUgsSUFBSSxDQUFDSSxJQUFJLENBQUMsQ0FBQ1QsV0FBVyxDQUFDLE1BQU0sQ0FBQztJQUN6RUwsQ0FBQyxDQUFDRSxDQUFDLENBQUNDLGFBQWEsQ0FBQyxDQUFDUSxJQUFJLENBQUMsaUJBQWlCLENBQUMsQ0FBQ0ksR0FBRyxDQUFDTCxJQUFJLENBQUNNLEVBQUUsQ0FBQztFQUMzRCxDQUFDLENBQUM7QUFDTixDQUFDLENBQUM7QUFFRmhCLENBQUMsQ0FBQyxlQUFlLENBQUMsQ0FBQ0MsRUFBRSxDQUFDLFFBQVEsRUFBRSxVQUFDQyxDQUFDLEVBQUs7RUFDbkMsSUFBSWUsZ0JBQWdCLEdBQUdqQixDQUFDLENBQUNFLENBQUMsQ0FBQ0MsYUFBYSxDQUFDLENBQUNlLE9BQU8sQ0FBQyxhQUFhLENBQUMsQ0FBQ0MsUUFBUSxDQUFDLG9CQUFvQixDQUFDO0VBQy9GLElBQUlDLGFBQWEsR0FBR3BCLENBQUMsQ0FBQ0UsQ0FBQyxDQUFDQyxhQUFhLENBQUMsQ0FBQ2UsT0FBTyxDQUFDLGFBQWEsQ0FBQyxDQUFDQyxRQUFRLENBQUMsaUJBQWlCLENBQUM7RUFDekYsSUFBSUUsY0FBYyxHQUFHckIsQ0FBQyxDQUFDRSxDQUFDLENBQUNDLGFBQWEsQ0FBQyxDQUFDZSxPQUFPLENBQUMsYUFBYSxDQUFDLENBQUNDLFFBQVEsQ0FBQyxrQkFBa0IsQ0FBQztFQUUzRkYsZ0JBQWdCLENBQUNYLFFBQVEsQ0FBQyxNQUFNLENBQUM7RUFDakNjLGFBQWEsQ0FBQ2QsUUFBUSxDQUFDLE1BQU0sQ0FBQztFQUM5QmUsY0FBYyxDQUFDZixRQUFRLENBQUMsTUFBTSxDQUFDO0VBRS9CLElBQUlKLENBQUMsQ0FBQ0MsYUFBYSxDQUFDQyxLQUFLLEtBQUssbUJBQW1CLEVBQUU7SUFDL0NhLGdCQUFnQixDQUFDWixXQUFXLENBQUMsTUFBTSxDQUFDO0VBQ3hDO0VBRUEsSUFBSUgsQ0FBQyxDQUFDQyxhQUFhLENBQUNDLEtBQUssS0FBSyxpQkFBaUIsSUFBSUYsQ0FBQyxDQUFDQyxhQUFhLENBQUNDLEtBQUssS0FBSywwQkFBMEIsSUFBSUYsQ0FBQyxDQUFDQyxhQUFhLENBQUNDLEtBQUssS0FBSyxtQkFBbUIsRUFBRTtJQUN0SmdCLGFBQWEsQ0FBQ2YsV0FBVyxDQUFDLE1BQU0sQ0FBQztFQUNyQztFQUVBLElBQUlILENBQUMsQ0FBQ0MsYUFBYSxDQUFDQyxLQUFLLEtBQUssaUJBQWlCLEVBQUU7SUFDN0NpQixjQUFjLENBQUNoQixXQUFXLENBQUMsTUFBTSxDQUFDO0VBQ3RDO0FBQ0osQ0FBQyxDQUFDIiwiZmlsZSI6Ii4vVGhlbWVzL1N0b3JlZnJvbnQvcmVzb3VyY2VzL2Fzc2V0cy9hZG1pbi9qcy9tYWluLmpzIiwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///./Themes/Storefront/resources/assets/admin/js/main.js\n");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval-source-map devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./Themes/Storefront/resources/assets/admin/js/main.js"]();
/******/ 	
/******/ })()
;