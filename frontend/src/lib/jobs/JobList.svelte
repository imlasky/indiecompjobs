<script>
    import JobRow from "./JobRow.svelte";
    import {filters} from "$lib/stores"
    import { onMount } from "svelte";
    
    export let allJobs;
    let filteredJobs = []

    $: filteredJobs = allJobs.filter(job => {
        
            if ($filters.size > 0) {
                let tags = new Set(job.tags.map(tag => tag.tag));
            
                const intersection = new Set([...tags].filter((x) => $filters.has(x)));
                
                return intersection.size > 0;
            } else {
                return true
            }
        })
    
</script>

<div class="flex justify-center w-full pb-12">
    <div class="flex flex-col w-4/5 md:w-3/5 space-y-4">
        {#each filteredJobs as job}
            <JobRow {job}/>
        {/each}
    </div>
</div>
