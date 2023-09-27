<template>
    <div>
        <div class="modal-backdrop fade in show"></div>
        <div class="modal fade show" id="order_user_details_require" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <button type="button" @click="close" data-dismiss="modal" class="close">
                        <i aria-hidden="true" class="la-times las"></i>
                    </button>
                    <div class="modal-header">
                        <h5 class="modal-title">Login required</h5>
                    </div>

                    <div class="modal-body">
                        <section class="form-wrap login-wrap">
                            <div class="container">
                                <div class="form-wrap-inner login-wrap-inner">
                                    <form>
                                        <div class="form-group">
                                            <label for="email">
                                                Email Address <span>*</span>
                                            </label>
                                            <input type="text" v-model="email" name="email" id="email" class="form-control">
                                        </div>

                                        <div class="form-group">
                                            <label for="password">
                                                Password <span>*</span>
                                            </label>
                                            <input type="password" v-model="password" name="password" id="password"
                                                class="form-control">
                                        </div>

                                        <button type="button" @click.prevent="login" :class="{ 'btn-loading': loading }"
                                            class="btn btn-primary btn-sign-in" data-loading>
                                            Sign In
                                        </button>
                                    </form>
                                </div>
                                <a :href="route('checkout.guest')" class="complete-as-guest">
                                    Check out as guest
                                </a>
                            </div>
                        </section>
                    </div>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            loading: '',
            email: '',
            password: ''
        }
    },
    methods: {
        close() {
            this.$emit('close', true);
        },
        login(event) {

            this.loading = true;

            $.ajax({
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                url: route('login.post', { email: this.email, password: this.password }),
            }).then((res) => {
                if (res.success) {
                    document.location.href = route('checkout.create');
                }
            }).catch((xhr) => {
                this.$notify(xhr.responseJSON.error);
            }).always(() => {
                this.loading = false;
            });

        }
    }
}
</script>