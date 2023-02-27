package egovframework.aviation.metadata.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import egovframework.aviation.metadata.vo.image.FileEntity;

public class FileRepository {

   private static int incrementableKey = 0;
   private static final Map<String, FileEntity> repository = new HashMap<String, FileEntity>();
   
   public static synchronized String addFileEntity(FileEntity entity) {      
      String key = String.format("F%1$05d", ++incrementableKey);
      entity.setKey(key);
      repository.put(key, entity);      
      return key;
   }
   
   public static FileEntity getFileEntity(String key) {      
      if (repository.containsKey(key))
         return repository.get(key);
      else
         return null;
   }
   
   public static List<FileEntity> getFileEntities() {      
      List<FileEntity> list = new ArrayList<FileEntity>();
      Set<String> keys = repository.keySet();
      Iterator<String> iterator = keys.iterator();
      while (iterator.hasNext()) {
         list.add(repository.get(iterator.next()));
      }
      return list;      
   }
   
   public static synchronized void clear() {      
      repository.clear();
      incrementableKey = 0;
   }
}