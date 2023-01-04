<script>
    import JobRow from "./JobRow.svelte";
    
    export let allJobs;


    
</script>

<div class="flex justify-center w-full mb-12">
    <div class="flex flex-col w-4/5 md:w-3/5 space-y-4">
        {#each allJobs as job}
            <JobRow {job}/>
        {/each}
    </div>
</div>
