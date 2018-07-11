package AllTest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import java.io.*;

/**
 * @Author: xiaoqiZh
 * @Date: Created in 20:03 2018/6/17
 * @Description:
 */


public class FtpClientUtils {

    /**
     * Description: 向FTP服务器上传文件
     *
     * @param url      FTP服务器hostname
     * @param port     FTP服务器端口
     * @param username FTP登录账号
     * @param password FTP登录密码
     * @param path     FTP服务器保存目录
     * @param filename 上传到FTP服务器上的文件名
     * @param input    输入流
     * @return 成功返回true，否则返回false
     * @Version1.0
     */
    public static boolean uploadFile(
            String url,//FTP服务器hostname
            int port,//FTP服务器端口
            String username, // FTP登录账号
            String password, //FTP登录密码
            String path, //FTP服务器保存目录
            String filename, //上传到FTP服务器上的文件名
            InputStream input // 输入流
    ) {
        boolean success = false;
        FTPClient ftp = new FTPClient();
        try {
            int reply;
            ftp.connect(url, port);//连接FTP服务器
            //如果采用默认端口，可以使用ftp.connect(url)的方式直接连接FTP服务器
            ftp.login(username, password);//登录
            reply = ftp.getReplyCode();
            ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftp.disconnect();
                System.out.println("FTP服务器 拒绝连接");
                return success;
            }
            ftp.changeWorkingDirectory(path);
            ftp.storeFile(filename, input);

            input.close();
            ftp.logout();
            success = true;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (ftp.isConnected()) {
                try {
                    ftp.disconnect();
                } catch (IOException ioe) {
                }
            }
        }
        return success;
    }

    /**
     * 删除文件
     *
     * @param fileName 要删除的文件地址
     * @return true/false
     * @throws IOException
     */
    public static boolean delete(String fileName, FTPClient ftpClient) throws IOException {
        return ftpClient.deleteFile(fileName);
    }


    /**
     * 下载文件到指定目录
     *
     * @param ftpFile 文件服务器上的文件地址
     * @param dstFile 输出文件的路径和名称
     * @throws Exception
     */
    public static void downLoad(String ftpFile, String dstFile, FTPClient ftpClient) throws Exception {
        if (StringUtils.isBlank(ftpFile)) {
            throw new RuntimeException("ftpFile为空");
        }
        if (StringUtils.isBlank(dstFile)) {
            throw new RuntimeException("dstFile为空");
        }
        File file = new File(dstFile);
        FileOutputStream fos = new FileOutputStream(file);
        ftpClient.retrieveFile(ftpFile, fos);
        fos.flush();
        fos.close();
    }

    /**
     * 从文件服务器获取文件流
     *
     * @param ftpFile 文件服务器上的文件地址
     * @return {@link InputStream}
     * @throws IOException
     */
    public static InputStream retrieveFileStream(String ftpFile, FTPClient ftpClient) throws IOException {
        if (StringUtils.isBlank(ftpFile)) {
            throw new RuntimeException("ftpFile为空");
        }
        return ftpClient.retrieveFileStream(ftpFile);
    }

    public static void main(String[] args) {

        //ftp服务器地址
        String hostname = "47.95.5.140";
        //ftp服务器端口号默认为21
        Integer port = 21;
        //ftp登录账号
        String username = "ftpuser";
        //ftp登录密码
        String password = "123456";
        try {
            FileInputStream in = new FileInputStream(new File("D:\\tttt.txt"));
            boolean flag = uploadFile(hostname, port, username, password, "/home/ftpuser/www/text", "texttt.txt", in);
            System.out.println(flag);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}


