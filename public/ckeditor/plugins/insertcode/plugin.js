/*
 Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
 */
CKEDITOR.plugins.add('insertcode', {
    requires: ['dialog'],
    init: function(a){
        var b = a.addCommand('insertcode', new CKEDITOR.dialogCommand('insertcode'));
        a.ui.addButton('insertcode', {
            label: a.lang.insertcode.toolbar,
            command: 'insertcode',
            icon: this.path + 'images/code.jpg'
        });
        CKEDITOR.dialog.add('insertcode', this.path + 'dialogs/insertcode.js');
    }
});
