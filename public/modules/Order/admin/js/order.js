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

/***/ "./Modules/Order/Resources/assets/admin/js/main.js":
/*!*********************************************************!*\
  !*** ./Modules/Order/Resources/assets/admin/js/main.js ***!
  \*********************************************************/
/***/ (() => {

eval("$('#order-status').change(function (e) {\n  $.ajax({\n    type: 'PUT',\n    url: route('admin.orders.status.update', e.currentTarget.dataset.id),\n    data: {\n      status: e.currentTarget.value\n    },\n    success: function (_success) {\n      function success(_x) {\n        return _success.apply(this, arguments);\n      }\n      success.toString = function () {\n        return _success.toString();\n      };\n      return success;\n    }(function (message) {\n      success(message);\n    }),\n    error: function (_error) {\n      function error(_x2) {\n        return _error.apply(this, arguments);\n      }\n      error.toString = function () {\n        return _error.toString();\n      };\n      return error;\n    }(function (xhr) {\n      error(xhr.responseJSON.message);\n    })\n  });\n});//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJuYW1lcyI6WyIkIiwiY2hhbmdlIiwiZSIsImFqYXgiLCJ0eXBlIiwidXJsIiwicm91dGUiLCJjdXJyZW50VGFyZ2V0IiwiZGF0YXNldCIsImlkIiwiZGF0YSIsInN0YXR1cyIsInZhbHVlIiwic3VjY2VzcyIsIl9zdWNjZXNzIiwiX3giLCJhcHBseSIsImFyZ3VtZW50cyIsInRvU3RyaW5nIiwibWVzc2FnZSIsImVycm9yIiwiX2Vycm9yIiwiX3gyIiwieGhyIiwicmVzcG9uc2VKU09OIl0sInNvdXJjZXMiOlsid2VicGFjazovL2V2b21hcnQvLi9Nb2R1bGVzL09yZGVyL1Jlc291cmNlcy9hc3NldHMvYWRtaW4vanMvbWFpbi5qcz9lM2YwIl0sInNvdXJjZXNDb250ZW50IjpbIiQoJyNvcmRlci1zdGF0dXMnKS5jaGFuZ2UoKGUpID0+IHtcclxuICAgICQuYWpheCh7XHJcbiAgICAgICAgdHlwZTogJ1BVVCcsXHJcbiAgICAgICAgdXJsOiByb3V0ZSgnYWRtaW4ub3JkZXJzLnN0YXR1cy51cGRhdGUnLCBlLmN1cnJlbnRUYXJnZXQuZGF0YXNldC5pZCksXHJcbiAgICAgICAgZGF0YTogeyBzdGF0dXM6IGUuY3VycmVudFRhcmdldC52YWx1ZSB9LFxyXG4gICAgICAgIHN1Y2Nlc3M6IChtZXNzYWdlKSA9PiB7XHJcbiAgICAgICAgICAgIHN1Y2Nlc3MobWVzc2FnZSk7XHJcbiAgICAgICAgfSxcclxuICAgICAgICBlcnJvcjogKHhocikgPT4ge1xyXG4gICAgICAgICAgICBlcnJvcih4aHIucmVzcG9uc2VKU09OLm1lc3NhZ2UpO1xyXG4gICAgICAgIH0sXHJcbiAgICB9KTtcclxufSk7XHJcbiJdLCJtYXBwaW5ncyI6IkFBQUFBLENBQUMsQ0FBQyxlQUFlLENBQUMsQ0FBQ0MsTUFBTSxDQUFDLFVBQUNDLENBQUMsRUFBSztFQUM3QkYsQ0FBQyxDQUFDRyxJQUFJLENBQUM7SUFDSEMsSUFBSSxFQUFFLEtBQUs7SUFDWEMsR0FBRyxFQUFFQyxLQUFLLENBQUMsNEJBQTRCLEVBQUVKLENBQUMsQ0FBQ0ssYUFBYSxDQUFDQyxPQUFPLENBQUNDLEVBQUUsQ0FBQztJQUNwRUMsSUFBSSxFQUFFO01BQUVDLE1BQU0sRUFBRVQsQ0FBQyxDQUFDSyxhQUFhLENBQUNLO0lBQU0sQ0FBQztJQUN2Q0MsT0FBTyxZQUFBQyxRQUFBO01BQUEsU0FBQUQsUUFBQUUsRUFBQTtRQUFBLE9BQUFELFFBQUEsQ0FBQUUsS0FBQSxPQUFBQyxTQUFBO01BQUE7TUFBQUosT0FBQSxDQUFBSyxRQUFBO1FBQUEsT0FBQUosUUFBQSxDQUFBSSxRQUFBO01BQUE7TUFBQSxPQUFBTCxPQUFBO0lBQUEsRUFBRSxVQUFDTSxPQUFPLEVBQUs7TUFDbEJOLE9BQU8sQ0FBQ00sT0FBTyxDQUFDO0lBQ3BCLENBQUM7SUFDREMsS0FBSyxZQUFBQyxNQUFBO01BQUEsU0FBQUQsTUFBQUUsR0FBQTtRQUFBLE9BQUFELE1BQUEsQ0FBQUwsS0FBQSxPQUFBQyxTQUFBO01BQUE7TUFBQUcsS0FBQSxDQUFBRixRQUFBO1FBQUEsT0FBQUcsTUFBQSxDQUFBSCxRQUFBO01BQUE7TUFBQSxPQUFBRSxLQUFBO0lBQUEsRUFBRSxVQUFDRyxHQUFHLEVBQUs7TUFDWkgsS0FBSyxDQUFDRyxHQUFHLENBQUNDLFlBQVksQ0FBQ0wsT0FBTyxDQUFDO0lBQ25DLENBQUM7RUFDTCxDQUFDLENBQUM7QUFDTixDQUFDLENBQUMiLCJmaWxlIjoiLi9Nb2R1bGVzL09yZGVyL1Jlc291cmNlcy9hc3NldHMvYWRtaW4vanMvbWFpbi5qcyIsInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///./Modules/Order/Resources/assets/admin/js/main.js\n");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval-source-map devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./Modules/Order/Resources/assets/admin/js/main.js"]();
/******/ 	
/******/ })()
;