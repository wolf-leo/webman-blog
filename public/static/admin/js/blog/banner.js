define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'blog/banner/index',
        add_url: 'blog/banner/add',
        edit_url: 'blog/banner/edit',
        delete_url: 'blog/banner/delete',
        export_url: 'blog/banner/export',
        modify_url: 'blog/banner/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID', searchOp: '='},
                    {field: 'title', minWidth: 80, title: '标题'},
                    {field: 'img', minWidth: 80, title: '主图', search: false, templet: ea.table.image},
                    {field: 'link', minWidth: 80, title: '链接'},
                    {field: 'sort', minWidth: 80, title: '排序'},
                    {field: 'target', minWidth: 80, title: '跳转方式', search: 'select', selectList: targetSelect},
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
