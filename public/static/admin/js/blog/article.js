define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'blog/article/index',
        add_url: 'blog/article/add',
        edit_url: 'blog/article/edit',
        delete_url: 'blog/article/delete',
        export_url: 'blog/article/export',
        modify_url: 'blog/article/modify',
    };
    var laydate = layui.laydate

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: 'ID', searchOp: '='},
                    {field: 'category_id', title: '分类', width: 85, search: 'select', selectList: categorySelect},
                    {field: 'title', minWidth: 80, title: '标题'},
                    {field: 'img', minWidth: 80, title: '主图', search: false, templet: ea.table.image},
                    {field: 'click', minWidth: 80, title: '点击数'},
                    {field: 'status', title: '状态', width: 85, search: 'select', selectList: statusSelect},
                    {field: 'c_time', minWidth: 80, title: '创建时间', search: 'range'},
                    {width: 250, title: '操作', templet: ea.table.tool}
                ]],
            });

            ea.listen();
        },
        add: function () {
            laydate.render({
                elem: '#article_date', format: 'yyyy-MM-dd', trigger: 'click'
            });
            ea.listen();
        },
        edit: function () {
            laydate.render({
                elem: '#article_date', format: 'yyyy-MM-dd', trigger: 'click'
            });
            ea.listen();
        },
    };
    return Controller;
});
