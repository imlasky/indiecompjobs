<script>

    import {filters} from "$lib/stores"
    import FilterCapsule from "./FilterCapsule.svelte";

    let sortedFilters;
    $: sortedFilters = [...$filters].sort()

</script>

<div class="flex justify-center w-full mt-12">
    <div class="flex w-4/5 md:w-3/5 space-x-4">
        {#each sortedFilters as filter}
            <FilterCapsule {filter}/>
        {/each}
    </div>
</div>
        

