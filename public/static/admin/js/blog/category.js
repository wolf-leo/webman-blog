define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'blog/category/index',
        add_url: 'blog/category/add',
        edit_url: 'blog/category/edit',
        delete_url: 'blog/category/delete',
        export_url: 'blog/category/export',
        modify_url: 'blog/category/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID', searchOp: '='},
                    {field: 'title', minWidth: 80, title: '标题'},
                    {field: 'status', title: '状态', width: 85, search: 'select', selectList: statusSelect},
                    {field: 'c_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {width: 250, title: '操作', templet: ea.table.tool}
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});
