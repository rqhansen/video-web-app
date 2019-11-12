<template>
    <header class="title-bar">
        <main>
            <span>{{title}}</span>
            <span>{{canShowMore}}</span>
        </main>
    </header>
</template>

<script>
export default {
    name: 'TitleBar',
    props: {
        title: {
            required: true
        },
        canShowMore: {
            required: true,
            default: trueS
        }
    }
}
</script>