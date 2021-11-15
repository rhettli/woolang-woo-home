

new Vue({
    el:"#content",
    data: {
        a: 1
    },
    created: function () {
        // `this` 指向 vm 实例
        console.log('a is: ' + this.a)
    },
    computed: {

    },
    methods:{
        changeLan:function(e){
            if (e==='zh-CN'){
                location.href='/zh/'
            }else {
                location.href='/'
            }
            console.log('changed...',e)
        }
    }
})

