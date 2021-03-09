window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const taxInput = document.getElementById("add-tax-price");
  const profitInput = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxPrice = Math.floor(inputValue * 0.1);
    taxInput.innerHTML = taxPrice;
    profitInput.innerHTML = inputValue - taxPrice;
  })
});

