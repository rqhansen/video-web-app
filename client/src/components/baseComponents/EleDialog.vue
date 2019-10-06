<template>
    <el-dialog
        :title="title"
        :visible="showDialog"
        :width="`${width}px`"
        :custom-class="customClass"
        :center="center"
        @close="cancelDialog"
        >
        <!-- 默认插槽 -->
        <slot></slot>
        <span slot="footer">
                <el-button @click.stop="cancelDialog">{{cancelTxt}}</el-button>
                <el-button type="primary" @click.stop="handleDialog">{{okTxt}}</el-button>
        </span>
    </el-dialog>
</template>

<script lang="ts">
    import {Component , Prop, Vue} from 'vue-property-decorator';
    @Component({
        name: 'EleDialog'
    })

    export default class extends Vue {
        @Prop({ //是否显示弹框
            required: true,
            default: false
        }) private showDialog!: boolean

        //自定义类名
        @Prop() private customClass!: string

        @Prop({
            required: true,
            default: '',
        }) private title!: string

        @Prop({
            default: '445'
        }) private width!: number

        @Prop({
            required: true
        }) private cancelTxt!: string
        
        @Prop({
            required: true
        }) private okTxt!: string

        @Prop({
            default: true
        }) private center!: boolean
        
        //取消显示弹框
        private cancelDialog() {
            this.$emit('cancel-dialog');
        }

        private handleDialog() {
            this.$emit('handle-dialog');
        }
    }
</script>

<style lang="scss" scoped>
.el-dialog__wrapper {
    /deep/ .el-dialog--center {
        .el-dialog__body {
            padding-top: 15px;
            padding-bottom: 15px;
        }
        .el-dialog__footer {
            .el-button {
                padding-left: 0;
                padding-right: 0;
                text-align: center;
            }    
        }
    }
}
    
</style>