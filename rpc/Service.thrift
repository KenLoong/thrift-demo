include "User.thrift"

//编译该文件的命令,生成go代码
//thrift -r --gen go rpc/Service.thrift

//namespace用来定义生成代码的包名，每个语言都需要单独声明
namespace go Sample
namespace php Sample

//typedef和c语言里的用法一致，用于重新定义类型的名称
typedef map<string, string> Data

//struct里每个都是由1:required i32 errCode;结构组成，分表代表标识符、是否可选、类型、名称。
//单个struct里标识符不能重复，required表示该属性不能为空，i32表示int32。
struct Response {
    1:required i32 errCode; //错误码
    2:required string errMsg; //错误信息
    3:required Data data;
}

//定义服务
//service在golang里是interface。service里定义的方法必须由服务端实现
service Greeter {
    Response SayHello(
        1:required User.User user
    )

    Response GetUser(
        1:required i32 uid
    )
}
