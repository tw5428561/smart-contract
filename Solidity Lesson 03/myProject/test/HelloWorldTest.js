const HelloWorld = artifacts.require("HelloWorld");

contract(
    'HelloWorld', 
    async function (accounts){   // 使用同步操作
        console.log(accounts);
        it("HelloWorld合约测试：", async function(){
            var HelloWorld_instance = await HelloWorld.deployed();

            // 调用交易
            await HelloWorld_instance.setName("田伟");

            var result = await HelloWorld_instance.getName.call();  // 可以传递参数
            var name = result;
            console.log(name)
            assert.equal(result, '田伟', "是田伟");
        });

    }
);