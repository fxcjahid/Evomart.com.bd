export default {
    props: {
        number: { 
            required: true, 
        },
        message: {
            type: String,
            required: true
        }
    },
    methods: {
        isMobileDevice() {
            return typeof window.orientation !== "undefined" || navigator.userAgent.indexOf("IEMobile") !== -1;
        },
        openWhatsApp() { 
            const number = encodeURIComponent(this.number);
            const message = encodeURIComponent(this.message);

            if (this.isMobileDevice()) {
                const link = `whatsapp://send?phone=${number}&text=${message}`;
                window.open(link, "_self");
            } else {
                const link = `https://web.whatsapp.com/send?phone=${number}&text=${message}`;
                window.open(link, "_blank");
            }
        },
    },
};