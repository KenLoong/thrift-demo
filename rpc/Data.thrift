namespace go Sample


/**
MAP_CONST = map[string]string{
  "goodnight": "moon",
  "hello": "world",
}
*/
const map<string,string> MAP_CONST = {"hello": "world", "goodnight": "moon"}

//
//list<t1>：一系列t1类型的元素组成的有序列表，元素可以重复
//set<t1>：一些t1类型的元素组成的无序集合，元素唯一不重复
//map<t1,t2>：key/value对，key唯一

struct Car{
    1:list<i64> lists;
    2:set<string> sets;  //在go中，也只是生成slice
    3:map<i64,string> maps;
}
struct Pixel{
    1:required i32 Red;
    2:required i32 Green;
    3:required i32 Blue;
}

//联合体要求字段选项都是optional的，因为同一时刻只有一个变量有值。
/**
* 注意，字段都是指针类型
 type Pixel_TypeDef struct {
    Pixel *Pixel `thrift:"pixel,1" db:"pixel" json:"pixel,omitempty"`
    Value *int32 `thrift:"value,2" db:"value" json:"value,omitempty"`
  }
**/
union Pixel_TypeDef {
    1:optional Pixel pixel
    2:optional i32 value
}

enum TweetType {
    TWEET,
    RETWEET = 2,
    DM = 0xa,
    REPLY
}

exception BizException {
    1:required i32 code
    2:required string msg
}