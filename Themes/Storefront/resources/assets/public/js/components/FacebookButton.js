export default {
    props: {
        fbpageid: { 
            required: true, 
        }, 
    },
    methods: {
        isMobileDevice() {
            return typeof window.orientation !== "undefined" || navigator.userAgent.indexOf("IEMobile") !== -1;
        },
        openFacebook() {  
 
            if (this.isMobileDevice()) {
                const link = `fb-messenger://user-thread/${this.fbpageid}`;
                window.open(link, "_self");
            } else {
                const link = `https://www.messenger.com/t/${this.fbpageid}`;
                window.open(link, "_blank");
            }
        },
    },
};