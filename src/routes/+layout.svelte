<script>
    import "../app.css";
    import Navbar from "$lib/nav/Navbar.svelte";
</script>
<div class="bg-gradient-to-r from-[#324a85] to-[#6be5ef] h-screen">
    <Navbar/>
    <slot />
</div>
