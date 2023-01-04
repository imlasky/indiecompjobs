<script>
    export let filter;
    import {filters} from "$lib/stores";


    function handleFilterClick(e) {
        const tag = e.srcElement.textContent;
        let newSet = $filters;
        if ($filters.has(tag)) {
            newSet.delete(tag)
        } else {
            newSet.add(tag)
        }
        filters.set(newSet)       
    }
</script>

<div on:click={handleFilterClick} class="px-4 py-2 bg-primary rounded-3xl text-stone-600 hover:bg-primary-focus hover:cursor-pointer">
    {filter}
</div>