const HelloWorld = artifacts.require("HelloWorld");

    contract(
        'Contrac_Base', 
        function (accounts){   // 使用异步操作
            console.log(accounts);
            it("简单合同测试：", function(){
                var HelloWorld_instance;
                return HelloWorld.deployed().then(function (instance){
                    HelloWorld_instance = instance;
                    HelloWorld_instance.setName("tianwei");
                    // return  返回name
                    return HelloWorld_instance.getName.call();   // 上面方式也可以
                }).then(function(result){
                    console.log("---------------------");
                    console.log(result);
                    console.log("---------------------");
                    assert.equal(result, '200', "数据不正确");
                });
            });

        }
    );