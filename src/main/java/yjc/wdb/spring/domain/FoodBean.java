package yjc.wdb.spring.domain;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FoodBean {
   
   private int pid;
   private String pfood_name;
   private String pfood_menu;
   private int pprice;
   private String psize;
   private int plev;
   private MultipartFile imgFile;
   
   
   public int getPid() {
      return pid;
   }
   public void setPid(int pid) {
      this.pid = pid;
   }
   public String getPfood_name() {
      return pfood_name;
   }
   public void setPfood_name(String pfood_name) {
      this.pfood_name = pfood_name;
   }
   public String getPfood_menu() {
      return pfood_menu;
   }
   public void setPfood_menu(String pfood_menu) {
      this.pfood_menu = pfood_menu;
   }
   public int getPprice() {
      return pprice;
   }
   public void setPprice(int pprice) {
      this.pprice = pprice;
   }
   public String getPsize() {
      return psize;
   }
   public void setPsize(String psize) {
      this.psize = psize;
   }
   public int getPlev() {
      return plev;
   }
   public void setPlev(int plev) {
      this.plev = plev;
   }
   public MultipartFile getImgFile() {
      return imgFile;
   }
   public void setImgFile(MultipartFile imgFile) {
      this.imgFile = imgFile;
   }
    public byte[] getImgFileBytes() throws IOException {
           return imgFile.getBytes();
       }


}