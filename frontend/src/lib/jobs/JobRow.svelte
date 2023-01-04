<script>
    import {filters} from "$lib/stores";
    // import { handleFilterClick } from "$lib/helpers";

    export let job;

    function formatLocations(locations) {
        const cities = locations.map(loc => loc.city )
        return cities.sort().join(' | ')
    }

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
<div class="collapse outline outline-1 rounded-lg bg-base-300 hover:bg-base-200 outline-neutral-300 shadow-lg hover:shadow-xl hover:outline-8 hover:outline-secondary">
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
                <div on:click={handleFilterClick} class="badge badge-outline badge-lg hover:bg-primary hover:text-black z-50">{tag.tag}</div>
            {/each}
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