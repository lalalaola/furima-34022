window.addEventListener("load",()=>{

  const priceInput = document.getElementById("item-price"); //document.getElementById("id名")は、id名を指定してHTMLの要素を取得するメソッドです。
  priceInput.addEventListener("input", () => { //イベント発火するためにaddEventListenerメソッドを使用します。入力があるたびにイベント発火をするためにinputイベントを使用します。
    const inputValue = priceInput.value; //入力した金額の値を取得したい場合は、value属性を指定します。
    console.log(inputValue); //console.logを記述して、入力した金額の取得ができます。

      //販売手数料処理
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1)); //innerHTMLを使用して、販売手数料や利益計算結果を表示できるようします。innerHTMLはHTML要素の書き換えを行うことができます。
     console.log(addTaxDom);                              //Math.floorメソッドを用いて販売手数料や利益計算の処理を実装します。

      //利益手数料処理
    const profitNumber = document.getElementById("profit")
    profitNumber.innerHTML = (Math.floor(inputValue * 0.9));
      console.log(profitNumber);
  })
})
