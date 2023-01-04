<script>
    import JobList from "$lib/jobs/JobList.svelte";
    import FilterRow from "$lib/filters/FilterRow.svelte";

    let email;
    let emailValid = false;
    let notified = false;
    let emailExists = false;
    let emailValidError = false;
    const re = /\S+@\S+\.\S+/;
    export let data;


    async function handleSubmit(e) {
        emailValidError = false;
        if (emailValid) {
            const response = await fetch('/users', {
                method: 'POST',
                body: JSON.stringify({ email }),
                headers: {
                    'content-type': 'application/json'
                }
            });
            if (response.ok) {
                notified = true;
            } else {
                emailExists = true;
            }
        } else {
            emailValidError = true;
        }
        
    }

    function splitDescription(description){
        return description.split("\\n")
    }

    $: emailValid = re.test(email)

</script>

<div class="flex justify-center mt-12 mx-12">
    <div class="flex flex-col">
        <div class="flex flex-col max-w-3xl space-y-4">
            <h1 class="text-2xl md:text-5xl font-bold text-primary text-center">Indie Company Jobs</h1>
            <h2 class="text-lg md:text-3xl font-bold text-center ">Find jobs at companies that have taken no outside investment and like it that way</h2>
        </div>
       
        <div class="flex justify-center mt-8">
            <div class="flex flex-col space-y-1">
                {#if !notified}
                   
                    <form on:submit|preventDefault={handleSubmit} class="flex flex-col space-y-2">
                        {#if emailExists}
                            <p>Email is already registered!</p>
                        {/if}
                        {#if emailValidError}
                            <p>Please enter a valid email</p>
                        {/if}
                        
                        <div class="form-control">
                            <label class="input-group">
                                <input bind:value={email} type="text" placeholder="Get weekly email job alerts" class="input w-80 input-bordered border-secondary border-4" />
                                <button class="btn btn-secondary">Sign up <polygon xmlns="http://www.w3.org/2000/svg" points="247.773,8.081 175.407,82.05 295.118,199.145 0,199.145 0,306.14 279.496,306.14 175.407,407.949     247.773,481.919 490,245.004   "/></button>
                            </label>
                        </div>
                    </form>
                {:else}
                    <p>Thanks for signing up! We send a new email every Sunday-ish.</p>
                {/if}

                
            </div>
        </div>
    </div>

    
</div>

<div class="flex justify-center">
    <div class="div flex flex-col w-full space-y-4">
        <FilterRow />
        <JobList allJobs={data.allJobs}/>
    </div>
    
</div>








