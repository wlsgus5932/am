package egovframework.aviation.metadata.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DEXTUploadX5Request {
   
   private List<String> DEXTUploadX5_ControlId;
   private List<String> DEXTUploadX5_UniqueId;
   private List<String> DEXTUploadX5_Folder;
   private List<String> DEXTUploadX5_EXIFData;
   private List<String> DEXTUploadX5_MetaData;   
   private List<MultipartFile> DEXTUploadX5_FileData;
   
   public DEXTUploadX5Request() {}

   public List<String> getDEXTUploadX5_ControlId() {
      return DEXTUploadX5_ControlId;
   }

   public void setDEXTUploadX5_ControlId(List<String> dEXTUploadX5_ControlId) {
      DEXTUploadX5_ControlId = dEXTUploadX5_ControlId;
   }

   public List<String> getDEXTUploadX5_UniqueId() {
      return DEXTUploadX5_UniqueId;
   }

   public void setDEXTUploadX5_UniqueId(List<String> dEXTUploadX5_UniqueId) {
      DEXTUploadX5_UniqueId = dEXTUploadX5_UniqueId;
   }

   public List<String> getDEXTUploadX5_Folder() {
      return DEXTUploadX5_Folder;
   }

   public void setDEXTUploadX5_Folder(List<String> dEXTUploadX5_Folder) {
      DEXTUploadX5_Folder = dEXTUploadX5_Folder;
   }

   public List<String> getDEXTUploadX5_EXIFData() {
      return DEXTUploadX5_EXIFData;
   }

   public void setDEXTUploadX5_EXIFData(List<String> dEXTUploadX5_EXIFData) {
      DEXTUploadX5_EXIFData = dEXTUploadX5_EXIFData;
   }

   public List<String> getDEXTUploadX5_MetaData() {
      return DEXTUploadX5_MetaData;
   }

   public void setDEXTUploadX5_MetaData(List<String> dEXTUploadX5_MetaData) {
      DEXTUploadX5_MetaData = dEXTUploadX5_MetaData;
   }

   public List<MultipartFile> getDEXTUploadX5_FileData() {
      return DEXTUploadX5_FileData;
   }

   public void setDEXTUploadX5_FileData(List<MultipartFile> dEXTUploadX5_FileData) {
      DEXTUploadX5_FileData = dEXTUploadX5_FileData;
   }
}