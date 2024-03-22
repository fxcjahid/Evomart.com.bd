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

/***/ "./Modules/User/Resources/assets/admin/js/main.js":
/*!********************************************************!*\
  !*** ./Modules/User/Resources/assets/admin/js/main.js ***!
  \********************************************************/
/***/ (() => {

eval("window.admin.removeSubmitButtonOffsetOn('#permissions');\n$('.permission-parent-actions > .allow-all, .permission-parent-actions > .deny-all, .permission-parent-actions > .inherit-all').on('click', function (e) {\n  var action = e.currentTarget.className.split(/\\s+/)[2].split(/-/)[0];\n  $(\".permission-\".concat(action)).prop('checked', true);\n});\n$('.permission-group-actions > .allow-all, .permission-group-actions > .deny-all, .permission-group-actions > .inherit-all').on('click', function (e) {\n  var action = e.currentTarget.className.split(/\\s+/)[2].split(/-/)[0];\n  $(e.currentTarget).closest('.permission-group').find(\".permission-\".concat(action)).each(function (index, value) {\n    $(value).prop('checked', true);\n  });\n});\n$('.delete-api-key').on('click', function (e) {\n  $('#confirmation-form').attr('action', e.currentTarget.dataset.action);\n});//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJuYW1lcyI6WyJ3aW5kb3ciLCJhZG1pbiIsInJlbW92ZVN1Ym1pdEJ1dHRvbk9mZnNldE9uIiwiJCIsIm9uIiwiZSIsImFjdGlvbiIsImN1cnJlbnRUYXJnZXQiLCJjbGFzc05hbWUiLCJzcGxpdCIsImNvbmNhdCIsInByb3AiLCJjbG9zZXN0IiwiZmluZCIsImVhY2giLCJpbmRleCIsInZhbHVlIiwiYXR0ciIsImRhdGFzZXQiXSwic291cmNlcyI6WyJ3ZWJwYWNrOi8vZXZvbWFydC8uL01vZHVsZXMvVXNlci9SZXNvdXJjZXMvYXNzZXRzL2FkbWluL2pzL21haW4uanM/ZDIzOSJdLCJzb3VyY2VzQ29udGVudCI6WyJ3aW5kb3cuYWRtaW4ucmVtb3ZlU3VibWl0QnV0dG9uT2Zmc2V0T24oJyNwZXJtaXNzaW9ucycpO1xyXG5cclxuJCgnLnBlcm1pc3Npb24tcGFyZW50LWFjdGlvbnMgPiAuYWxsb3ctYWxsLCAucGVybWlzc2lvbi1wYXJlbnQtYWN0aW9ucyA+IC5kZW55LWFsbCwgLnBlcm1pc3Npb24tcGFyZW50LWFjdGlvbnMgPiAuaW5oZXJpdC1hbGwnKS5vbignY2xpY2snLCAoZSkgPT4ge1xyXG4gICAgbGV0IGFjdGlvbiA9IGUuY3VycmVudFRhcmdldC5jbGFzc05hbWUuc3BsaXQoL1xccysvKVsyXS5zcGxpdCgvLS8pWzBdO1xyXG5cclxuICAgICQoYC5wZXJtaXNzaW9uLSR7YWN0aW9ufWApLnByb3AoJ2NoZWNrZWQnLCB0cnVlKTtcclxufSk7XHJcblxyXG4kKCcucGVybWlzc2lvbi1ncm91cC1hY3Rpb25zID4gLmFsbG93LWFsbCwgLnBlcm1pc3Npb24tZ3JvdXAtYWN0aW9ucyA+IC5kZW55LWFsbCwgLnBlcm1pc3Npb24tZ3JvdXAtYWN0aW9ucyA+IC5pbmhlcml0LWFsbCcpLm9uKCdjbGljaycsIChlKSA9PiB7XHJcbiAgICBsZXQgYWN0aW9uID0gZS5jdXJyZW50VGFyZ2V0LmNsYXNzTmFtZS5zcGxpdCgvXFxzKy8pWzJdLnNwbGl0KC8tLylbMF07XHJcblxyXG4gICAgJChlLmN1cnJlbnRUYXJnZXQpLmNsb3Nlc3QoJy5wZXJtaXNzaW9uLWdyb3VwJylcclxuICAgICAgICAuZmluZChgLnBlcm1pc3Npb24tJHthY3Rpb259YClcclxuICAgICAgICAuZWFjaCgoaW5kZXgsIHZhbHVlKSA9PiB7XHJcbiAgICAgICAgICAgICQodmFsdWUpLnByb3AoJ2NoZWNrZWQnLCB0cnVlKTtcclxuICAgICAgICB9KTtcclxufSk7XHJcblxyXG4kKCcuZGVsZXRlLWFwaS1rZXknKS5vbignY2xpY2snLCAoZSkgPT4ge1xyXG4gICAgJCgnI2NvbmZpcm1hdGlvbi1mb3JtJykuYXR0cignYWN0aW9uJywgZS5jdXJyZW50VGFyZ2V0LmRhdGFzZXQuYWN0aW9uKTtcclxufSk7XHJcbiJdLCJtYXBwaW5ncyI6IkFBQUFBLE1BQU0sQ0FBQ0MsS0FBSyxDQUFDQywwQkFBMEIsQ0FBQyxjQUFjLENBQUM7QUFFdkRDLENBQUMsQ0FBQyw0SEFBNEgsQ0FBQyxDQUFDQyxFQUFFLENBQUMsT0FBTyxFQUFFLFVBQUNDLENBQUMsRUFBSztFQUMvSSxJQUFJQyxNQUFNLEdBQUdELENBQUMsQ0FBQ0UsYUFBYSxDQUFDQyxTQUFTLENBQUNDLEtBQUssQ0FBQyxLQUFLLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQ0EsS0FBSyxDQUFDLEdBQUcsQ0FBQyxDQUFDLENBQUMsQ0FBQztFQUVwRU4sQ0FBQyxnQkFBQU8sTUFBQSxDQUFnQkosTUFBTSxFQUFHLENBQUNLLElBQUksQ0FBQyxTQUFTLEVBQUUsSUFBSSxDQUFDO0FBQ3BELENBQUMsQ0FBQztBQUVGUixDQUFDLENBQUMseUhBQXlILENBQUMsQ0FBQ0MsRUFBRSxDQUFDLE9BQU8sRUFBRSxVQUFDQyxDQUFDLEVBQUs7RUFDNUksSUFBSUMsTUFBTSxHQUFHRCxDQUFDLENBQUNFLGFBQWEsQ0FBQ0MsU0FBUyxDQUFDQyxLQUFLLENBQUMsS0FBSyxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUNBLEtBQUssQ0FBQyxHQUFHLENBQUMsQ0FBQyxDQUFDLENBQUM7RUFFcEVOLENBQUMsQ0FBQ0UsQ0FBQyxDQUFDRSxhQUFhLENBQUMsQ0FBQ0ssT0FBTyxDQUFDLG1CQUFtQixDQUFDLENBQzFDQyxJQUFJLGdCQUFBSCxNQUFBLENBQWdCSixNQUFNLEVBQUcsQ0FDN0JRLElBQUksQ0FBQyxVQUFDQyxLQUFLLEVBQUVDLEtBQUssRUFBSztJQUNwQmIsQ0FBQyxDQUFDYSxLQUFLLENBQUMsQ0FBQ0wsSUFBSSxDQUFDLFNBQVMsRUFBRSxJQUFJLENBQUM7RUFDbEMsQ0FBQyxDQUFDO0FBQ1YsQ0FBQyxDQUFDO0FBRUZSLENBQUMsQ0FBQyxpQkFBaUIsQ0FBQyxDQUFDQyxFQUFFLENBQUMsT0FBTyxFQUFFLFVBQUNDLENBQUMsRUFBSztFQUNwQ0YsQ0FBQyxDQUFDLG9CQUFvQixDQUFDLENBQUNjLElBQUksQ0FBQyxRQUFRLEVBQUVaLENBQUMsQ0FBQ0UsYUFBYSxDQUFDVyxPQUFPLENBQUNaLE1BQU0sQ0FBQztBQUMxRSxDQUFDLENBQUMiLCJmaWxlIjoiLi9Nb2R1bGVzL1VzZXIvUmVzb3VyY2VzL2Fzc2V0cy9hZG1pbi9qcy9tYWluLmpzIiwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///./Modules/User/Resources/assets/admin/js/main.js\n");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval-source-map devtool is used.
/******/ 	var __webpack_exports__ = {};
/******/ 	__webpack_modules__["./Modules/User/Resources/assets/admin/js/main.js"]();
/******/ 	
/******/ })()
;