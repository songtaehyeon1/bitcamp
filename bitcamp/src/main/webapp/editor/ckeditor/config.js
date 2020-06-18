/**
 * @license Copyright (c) 2003-2020, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.uiColor = '#AADC6E';

	config.language = 'ko';//한글
	config.enterMode = '2' ,// 엔터모드는 <br/>
	config.toolbarCanCollapse = false; // 에디터 메뉴 축소/확대 가능 버튼 보이기



};
CKEDITOR.on('dialogDefinition', function( ev ){
	var dialog = ev.data.definition.dialog;
	var dialogName = ev.data.name;
    var dialogDefinition = ev.data.definition;
  
    switch (dialogName) {
        case 'image': // 이미지 속성창이 보일때 안보이게 하기 위해서 .
        	
            //dialogDefinition.removeContents('info');
            dialogDefinition.removeContents('Link');
            dialogDefinition.removeContents('advanced');
            
            dialog.on('show', function (obj) {
        		this.selectPage('Upload'); //업로드텝으로 시작
            });
            break;
    }
});
