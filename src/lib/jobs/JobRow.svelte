<script>
    import JobTag from "./JobTag.svelte";
    // import { handleFilterClick } from "$lib/helpers";

    export let job;
    let showApply = false;

    function formatLocations(locations) {
        const cities = locations.map(loc => loc.city )
        return cities.sort().join(' | ')
    }

    

    

</script>
<!-- svelte-ignore a11y-mouse-events-have-key-events -->
<div on:mouseenter={() => {showApply = !showApply}} on:mouseleave={() => {showApply = !showApply}} class="collapse outline outline-1 rounded-lg bg-base-300 shadow-lg hover:bg-base-200 hover:shadow-xl hover:ring-8 hover:ring-secondary">
    <input type="checkbox" /> 
    
    <div class="collapse-title flex flex-row items-center space-x-2 text-xl font-medium">
        <div class="bg-black w-20 md:w-1/12 aspect-square rounded-full"></div>

        <div class="flex flex-col lg:w-1/3">
            <div class="font-extrabold text-xl md:text-2xl">{job.title}</div>
            <div class="text-sm md:text-lg">{job.company}</div>
            <div class="text-sm md:text-md">${job.salaryMin.toLocaleString()}-${job.salaryMax.toLocaleString()}</div>
            <div class="text-sm md:text-md">
                {formatLocations(job.locs)}
            </div>
            
        </div>
        <div class="lg:flex flex-row flex-wrap w-1/3 space-x-2 gap-y-2 hidden">
            {#each job.tags as tag (tag.id)}
                <JobTag {tag}/>
            {/each}
        </div>
        <div class="flex justify-end w-1/4 z-50">
            {#if showApply}
                <a href={job.url} class="btn btn-primary">Apply</a>
            {/if}
        </div>

    </div>
    

    <div class="collapse-content"> 
        <div class="flex flex-col mx-24 mt-6">
            <h2 class="text-3xl">{job.company} is hiring a</h2>
            <h3 class="text-3xl font-bold">{job.title}</h3>
            <div>
                <a href={job.url} class="btn btn-primary">Apply</a>
            </div>
        </div>
        <!-- {#each splitDescription(job.description) as paragraph}
            <p>{paragraph}</p>
        {/each} -->
       
        
    </div>
</div>