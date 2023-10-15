package com.dongwu.web.controller.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.dongwu.system.config.com.dongwu.common.config.RuoYiConfig;
import com.dongwu.system.config.com.dongwu.common.constant.Constants;
import com.dongwu.system.config.com.dongwu.common.core.domain.AjaxResult;
import com.dongwu.system.config.com.dongwu.common.utils.StringUtils;
import com.dongwu.system.config.com.dongwu.common.utils.file.FileUploadUtils;
import com.dongwu.system.config.com.dongwu.common.utils.file.FileUtils;
import com.dongwu.system.config.com.dongwu.framework.config.ServerConfig;

import java.io.File;

/**
 * 通用请求处理
 * 
 * @author
 */
@RestController
public class CommonController
{
    public static String MU_PATH="C:\\Dpan\\bossProject\\congwu\\java0505\\admin\\src\\main\\resources\\muban\\";

    private static final Logger log = LoggerFactory.getLogger(CommonController.class);

    @Autowired
    private ServerConfig serverConfig;

    /**
     * 通用下载请求
     * 
     * @param fileName 文件名称
     * @param delete 是否删除
     */
    @GetMapping("common/download")
    public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request)
    {
        try
        {
            if (!FileUtils.checkAllowDownload(fileName))
            {
                throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
            }
            String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
            String filePath = RuoYiConfig.getDownloadPath() + fileName;

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, realFileName);
            FileUtils.writeBytes(filePath, response.getOutputStream());
            if (delete)
            {
                FileUtils.deleteFile(filePath);
            }
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }

    /**
     * 通用上传请求
     */
    @PostMapping("/common/upload")
    public AjaxResult uploadFile(MultipartFile file) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            AjaxResult ajax = AjaxResult.success();
            ajax.put("fileName", fileName);
            ajax.put("url", url);
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 本地资源通用下载
     */
    @GetMapping("/common/download/resource")
    public void resourceDownload(String resource, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        try
        {
            if (!FileUtils.checkAllowDownload(resource))
            {
                throw new Exception(StringUtils.format("资源文件({})非法，不允许下载。 ", resource));
            }
            // 本地资源路径
            String localPath = RuoYiConfig.getProfile();
            // 数据库资源地址
            String downloadPath = localPath + StringUtils.substringAfter(resource, Constants.RESOURCE_PREFIX);
            // 下载名称
            String downloadName = StringUtils.substringAfterLast(downloadPath, "/");
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, downloadName);
            FileUtils.writeBytes(downloadPath, response.getOutputStream());
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }


    /**
     * 模板上传请求
     */
    @PostMapping("/common/uploadMuban")
    public AjaxResult uploadFile(MultipartFile file,String type) throws Exception
    {
        String filePath = MU_PATH+type+".zip";

        try
        {
            File fileNow = new File(filePath);
            if (!fileNow.exists())
            {
                fileNow.createNewFile();
            }
            file.transferTo(fileNow);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {



        }
        return AjaxResult.success();
    }


    /**
     * 下载请求
     *
     */
    @GetMapping("downloadMuban/{type}")
    public void downloadMuban(@PathVariable("type") String type, HttpServletResponse response, HttpServletRequest request)
    {

        try
        {
            String filePath =MU_PATH+type+".zip";

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, type+".zip");
            FileUtils.writeBytes(filePath, response.getOutputStream());

        }
        catch (Exception e)
        {
            System.out.println("下载失败");
        }
    }

}
