define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'blog/options/index',
        add_url: 'blog/options/add',
        edit_url: 'blog/options/edit',
        delete_url: 'blog/options/delete',
        export_url: 'blog/options/export',
        modify_url: 'blog/options/modify',
    };

    var Controller = {

        config: function () {
            ea.listen();
        },
    };
    return Controller;
});
