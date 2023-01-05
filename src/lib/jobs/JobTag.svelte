<script>
    import {filters} from "$lib/stores";

    export let tag;

    let filter;
    function handleFilterClick(e) {
        const newTag = filter.textContent.trim()
        let newSet = $filters;
        if ($filters.has(newTag)) {
            newSet.delete(newTag)
        } else {
            newSet.add(newTag)
        }
        filters.set(newSet)       
    }
</script>

<div on:click={handleFilterClick} bind:this={filter} class="badge badge-outline badge-lg hover:bg-primary hover:text-black z-50">{tag.tag}</div>