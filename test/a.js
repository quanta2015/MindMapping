const pako = require('pako');
let data = `<div class="m-item" data-lv="1" data-id="1"><div class="m-item-cnt"><span class="m-val">Beef</span></div><div class="m-child"><div class="m-item" data-lv="2" data-id="1-1"><div class="m-item-cnt"><span class="m-val">Bread</span></div><div class="m-child"><div class="m-item" data-lv="3" data-id="1-1-1"><div class="m-item-cnt"><span class="m-val">Cabbage</span></div></div><div class="m-item" data-lv="3" data-id="1-1-2"><div class="m-item-cnt"><span class="m-val">Butter</span></div></div></div></div><div class="m-item" data-lv="2" data-id="1-2"><div class="m-item-cnt"><span class="m-val">Breakfast</span></div><div class="m-child"><div class="m-item" data-lv="3" data-id="1-2-1"><div class="m-item-cnt"><span class="m-val">Banana</span></div><div class="m-child"><div class="m-item" data-lv="4" data-id="1-2-1-1"><div class="m-item-cnt"><span class="m-val">Cheese</span></div></div><div class="m-item" data-lv="4" data-id="1-2-1-2"><div class="m-item-cnt"><span class="m-val">Chicken</span></div></div><div class="m-item" data-lv="4" data-id="1-2-1-3"><div class="m-item-cnt"><span class="m-val">Coffee</span></div></div></div></div><div class="m-item" data-lv="3" data-id="1-2-2"><div class="m-item-cnt"><span class="m-val">Carrot</span></div></div></div></div></div></div>`;
//压缩
let gzip = pako.gzip(data,{to:'string'});
//解压
let unzip = pako.ungzip(gzip,{to:'string'});  

//用node.js输出文件比较大小
const fs = require('fs');
fs.writeFileSync('./gzip.blob',gzip,function(err){
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
})

fs.writeFileSync('./unzip.txt',unzip,function(err){
    if(err) {
        return console.log(err);
    }
    console.log("The file was saved!");
})