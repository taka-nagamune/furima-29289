const pay = () => {
  Payjp.setPublicKey("pk_test_14329ba60cd8433bb0f90ef4"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener('submit', function (e) {
    e.preventDefault();
    // console.log("submit OK")

    const formResult = document.getElementById("charge-form");
    // console.log(formResult)
    const formData = new FormData(formResult);
    // console.log(...formData.entries())

    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    // console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
 
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);
 