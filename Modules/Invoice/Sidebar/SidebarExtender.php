<?php

namespace Modules\Invoice\Sidebar;

use Maatwebsite\Sidebar\Group;
use Maatwebsite\Sidebar\Item;
use Maatwebsite\Sidebar\Menu;
use Modules\Admin\Sidebar\BaseSidebarExtender;

class SidebarExtender extends BaseSidebarExtender
{
    public function extend(Menu $menu)
    {
        $menu->group(trans('admin::sidebar.content'), function (Group $group) {
            $group->item(trans('admin::sidebar.sales'), function (Item $item) {

                $item->item(trans('invoice::invoice.invoice.index'), function (Item $item) {
                    $item->weight(10);
                    $item->route('admin.invoice.index');
                    $item->authorize(
                        $this->auth->hasAccess('admin.invoice.index')
                    );
                });

            });
        });
    }
}
