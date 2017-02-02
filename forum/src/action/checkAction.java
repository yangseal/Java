package action;
import com.opensymphony.xwork2.ActionSupport;
import dao.ForumDao;
import entity.Post;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by yangshuangpeng on 16-12-26.
 */
public class checkAction extends  ActionSupport{
    private String name;
    private List<Post> allPost;
    private int totalPage;
    private int pageNumber;
    private int pageSize;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public List<Post> getAllPost() {
        return allPost;
    }

    public void setAllPost(List<Post> allPost) {
        this.allPost = allPost;
    }

    public String execute(){
        HttpServletRequest request = ServletActionContext.getRequest();
        String pageNumberStr = request.getParameter("pageNumber");
        if(pageNumberStr == null || "".equals(pageNumberStr.trim())){
            pageNumberStr = "1";
        }
        ForumDao forumDao = new ForumDao();
        pageSize = 10;
        System.out.println("++++++++++"+name);
        if(name==null || "".equals(name.trim()))
        {
            name = "";
        }
        int postAmount = forumDao.postAmount(name);
        System.out.println("postAmount: " + postAmount);
        int[] paging = new int[2];
        paging = forumDao.pageNumber(postAmount, pageNumberStr, pageSize);
        pageNumber = paging[0];
        totalPage = paging[1];
        allPost = forumDao.allPost(pageNumber, pageSize, name);
        System.out.println("allpost: "+ allPost);
        return SUCCESS;
    }
}
