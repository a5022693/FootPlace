//
//  UserModel.h
//  FootPlace
//
//  Created by wangchengyuan on 15/10/17.
//  Copyright © 2015年 wangchengyuan.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//{
//    "activityId":"459",
//    "activityTitle":"今天你吃月饼了吗？",
//    "activityType":"0",
//    "address":"上海静安区",
//    "albmTitle":"",
//    "albumId":"0",
//    "at":"",
//    "avatar":"http://dn.fotoplace.cc/84525c3bbda84de2b8d3455e783e145a.jpg",
//    "bigUrl":"http://dn.fotoplace.cc/90984a54bdbd44a6b06f49029db17147.jpg-mb",
//    "commentCount":"1084",
//    "commentList":Array[3],
//    "content":"用心的月饼节小惊喜😊😊😊",
//    "height":"2160",
//    "isLike":"0",
//    "isRecommend":"0",
//    "likeCount":"2180",
//    "nickName":"足记君",
//    "postId":"42600684",
//    "randomRecommend":{
//        "avatar":"http://dn.fotoplace.cc/fp4409085.jpg?t=5916",
//        "nickName":"暑古",
//        "source":"system",
//        "uid":"431224"
//    },
//    "shareLink":"http://fotoplace.cc/m/post.php?id=42600684",
//    "smallUrl":"http://dn.fotoplace.cc/90984a54bdbd44a6b06f49029db17147.jpg-ms",
//    "tags":"日常",
//    "timestamp":"1443403928000",
//    "uid":"101838",
//    "width":"2160"
//


//------------------------------------------------
//"activityId":"0",
//"activityName":"",
//"activityType":"0",
//"address":"",
//"albumId":"0",
//"albumName":"",
//"at":"[]",
//"avatar":"http://dn.fotoplace.cc/fp3412285.jpg?t=303401",
//"commentCount":"0",
//"comments":Array[0],
//"distance":"0",
//"fakePostId":"43797641",
//"id":"43797641",
//"imgHeight":"3204",
//"imgId":"44049998",
//"imgUrl":"http://dn.fotoplace.cc/c4494dbd4db541df86e5a8cd5c757d89.jpg-ms",
//"imgUrlBig":"http://dn.fotoplace.cc/c4494dbd4db541df86e5a8cd5c757d89.jpg-mb",
//"imgWidth":"2304",
//"isFollowing":"0",
//"isLiking":"0",
//"isRecommended":"1",
//"isRepost":"0",
//"lat":"0",
//"likeCount":"14",
//"likes":[
//
//],
//"lng":"0",
//"serverTimestamp":"1445872713000",
//"snsShareUrl":"http://fotoplace.cc/m/post.php?id=43797641",
//"source":{
//    "footprintId":"0",
//    "imgHeight":"0",
//    "imgId":"0",
//    "imgUrl":"",
//    "imgWidth":"0",
//    "title":"",
//    "workName":"",
//    "workType":""
//},
//"tags":[
//
//],
//"text":"坚韧强悍的生命力~",
//"timestamp":"1445872713000",
//"topicTag":"",
//"type":"post",
//"uid":"16185331",
//"userName":"桃子君",
//"venue":"",
//"venueEnglish":""
//},
@interface UserModel : NSObject

@property(nonatomic,copy)NSString *pictureImageUrl;
@property(nonatomic,copy)NSString *contextText;
@property(nonatomic,copy)NSString *loverCount;
@property(nonatomic,copy)NSString *commentCount;
@property(nonatomic,copy)NSString *ProfileImageUrl;
@property(nonatomic,copy)NSString *pictureHeight;
@property(nonatomic,copy)NSString *pictureWidth;
@property(nonatomic,copy)NSArray *commentList;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *postId;

-(id)initWithDataDic:(NSDictionary*)dataDic;

@end
