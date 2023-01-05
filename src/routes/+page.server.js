import { error } from '@sveltejs/kit';

/** @type {import('./$types').PageServerLoad} */
export async function load({ fetch }) {

    const response = await fetch('/jobs');
    const allJobs = await response.json()
    return {allJobs};

}