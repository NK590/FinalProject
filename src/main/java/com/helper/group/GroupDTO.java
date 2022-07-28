package com.helper.group;

public class GroupDTO {

   private int group_seq;
   private int mem_seq;
   private String group_title;
   private String group_content;
   private String group_std_key;
   private int group_max;
   private int group_memCount;
   private String group_image;
   
   public GroupDTO() {}
   public GroupDTO(int group_seq, int mem_seq, String group_title, String group_content, String group_std_key,
         int group_max, int group_memCount, String group_image) {
      super();
      this.group_seq = group_seq;
      this.mem_seq = mem_seq;
      this.group_title = group_title;
      this.group_content = group_content;
      this.group_std_key = group_std_key;
      this.group_max = group_max;
      this.group_memCount = group_memCount;
      this.group_image = group_image;
   }
   public int getGroup_seq() {
      return group_seq;
   }
   public void setGroup_seq(int group_seq) {
      this.group_seq = group_seq;
   }
   public int getMem_seq() {
      return mem_seq;
   }
   public void setMem_seq(int mem_seq) {
      this.mem_seq = mem_seq;
   }
   public String getGroup_title() {
      return group_title;
   }
   public void setGroup_title(String group_title) {
      this.group_title = group_title;
   }
   public String getGroup_content() {
      return group_content;
   }
   public void setGroup_content(String group_content) {
      this.group_content = group_content;
   }
   public String getGroup_std_key() {
      return group_std_key;
   }
   public void setGroup_std_key(String group_std_key) {
      this.group_std_key = group_std_key;
   }
   public int getGroup_max() {
      return group_max;
   }
   public void setGroup_max(int group_max) {
      this.group_max = group_max;
   }
   public int getGroup_memCount() {
      return group_memCount;
   }
   public void setGroup_memCount(int group_memCount) {
      this.group_memCount = group_memCount;
   }
   public String getGroup_image() {
      return group_image;
   }
   public void setGroup_image(String group_image) {
      this.group_image = group_image;
   }
   @Override
   public String toString() {
      return "GroupDTO [group_seq=" + group_seq + ", mem_seq=" + mem_seq + ", group_title=" + group_title
            + ", group_content=" + group_content + ", group_std_key=" + group_std_key + ", group_max=" + group_max
            + ", group_memCount=" + group_memCount + ", group_image=" + group_image + "]";
   }
}
