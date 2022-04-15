const addFormToCollection = () => {
    const collectionHolder = document.querySelector('.invoiceLines');

    const item = document.createElement('div');
    item.innerHTML = collectionHolder
        .dataset
        .prototype
        .replace(
            /__name__/g,
            collectionHolder.dataset.index
        );
    collectionHolder.appendChild(item);

    collectionHolder.dataset.index++;
};
document
    .querySelectorAll(".add_item_link")
    .forEach(btn => {
        btn.addEventListener("click", addFormToCollection)
    });

addFormToCollection()