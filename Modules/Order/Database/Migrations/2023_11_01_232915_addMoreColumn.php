<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddMoreColumn extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('customer_name')->nullable()->after('customer_phone');
            $table->string('courier_name')->nullable()->after('shipping_country');
            $table->boolean('same_address')->nullable()->after('shipping_country');
            $table->string('create_by')->nullable()->after('shipping_country');
            $table->string('creator_id')->nullable()->after('shipping_country');
            $table->decimal('advance_pay', 18, 4)->unsigned()->after('discount');
            $table->decimal('due_amount', 18, 4)->unsigned()->after('discount');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('customer_name');
            $table->dropColumn('courier_name');
            $table->dropColumn('create_by');
            $table->dropColumn('creator_id');
            $table->dropColumn('advance_pay');
            $table->dropColumn('due_amount');
        });

    }
}
