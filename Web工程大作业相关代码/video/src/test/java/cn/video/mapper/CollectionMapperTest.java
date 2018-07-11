package cn.video.mapper;

import EnvSiteTest.BaseTest;
import cn.video.pojo.UserCollection;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class CollectionMapperTest extends BaseTest {

    @Autowired
    private UserCollectionMapper mapper;
    @Test
    public void test1() {
        UserCollection collection = new UserCollection();
        collection.setUserId(3);
        collection.setVideoId(2);
        mapper.addCollection(collection);
    }
}