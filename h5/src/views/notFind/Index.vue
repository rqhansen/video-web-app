<template>
<section class="not-find-box">
    <div class="not-find">
        <div class="tip-section">
           <p class="expression">o(╥﹏╥)o</p>
            <p class="tip">页面找不到了!</p>
            <p><a href="/" target="_self">返回首页</a></p>
        </div>
    </div>
    <Footer class="footer"/>
</section>
</template>

<script>
export default {
    name: 'notFind'
}
</script>

<style lang="scss" scoped>
.not-find-box {
    position: relative;
    .not-find {
        padding-top: 100px;
        text-align:center;
        .expression {
            font-size: 48px;
            line-height: 50px;
            margin-bottom: 50px;
        }
        .tip {
            font-size: 36px;
            line-height: 72px;
        }
        .tip +p{
            font-size: 30px;
            line-height: 80px;
        }
        .tip+p a{
            color: #5193c7;
        }
    }
    .footer {
        position: absolute;
        left: 0;
        bottom:0;

    }
}

</style>