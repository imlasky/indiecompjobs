import {filters} from "$lib/stores"

export function handleFilterClick(e) {
    const tag = e.srcElement.textContent;
    let newSet = filters;
    if (filters.has(tag)) {
        newSet.delete(tag)
    } else {
        newSet.add(tag)
    }
    filters.set(newSet)
}