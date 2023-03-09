function initUI(){gvector.maxFileCount=1;gvector.uitype="SINGLE";gui=new ApplicationForm;gui.updateFilterInfo();gui.updateCurrentFilesInfo();gui.updateUI();svgh.get("XHTML-INPUT-FILES").addEventListener("change",function(){var success=registerLocalFiles(this.files);if(!success){resetHtmlFiles()}},false);svgh.get("UIC-BTN-ADD").addEventListener("click",function(evt){evt.stopPropagation();evt.preventDefault();if(gfileEngine.acting){errorOut("ESVG-00024",gRB.get("ESVG-00024","_파일을 전송하고 있는 상태입니다."));return}if(gfileEngine.ufiles.length==0){api_openFileDialog()}},false);svgh.get("UIC-BTN-DELETE").addEventListener("click",onDeleteFileHandler,false)}var ApplicationForm=function ApplicationListForm(){this.uitype="SINGLE";this.helper=new SVGHelper;this.uRoot=this.helper.getAsUnit("UIC-DEXTUPLOADX5-MAIN");this.uMain=this.helper.getAsUnit("UIC-MAIN-AREA");this.uFArea=this.helper.getAsUnit("UIC-FILE-AREA")};ApplicationForm.prototype.throwError=function(code,msg,parameters){errorOut(code,msg,parameters)};ApplicationForm.prototype.getSelectedFirstSVGUnit=function(_useDefault){var target=null,uitems=null;uitems=this.helper.queryAll("#UIC-FILE-AREA .css-item");target=uitems.length>0?new SVGUnit(uitems.item(0)):null;return target};ApplicationForm.prototype.getSelectedLastSVGUnit=function(_useDefault){var target=null,uitems=null;uitems=this.helper.queryAll("#UIC-FILE-AREA .css-item");target=uitems.length>0?new SVGUnit(uitems.item(0)):null;return target};ApplicationForm.prototype.getRelativeSVGUnit=function(basis,_keyboard){return basis};ApplicationForm.prototype.updateUI=function(basis){if(!basis)basis=this.uRoot;var size=basis.getComputedSize();this.uMain.updateLayout(size.w,size.h,gvector)};ApplicationForm.prototype.displayJobWorking=function(_msg){};ApplicationForm.prototype.toggleJobWorking=function(_show){};ApplicationForm.prototype.createUIItem=function(item){var btnAdd=svgh.getAsUnit("UIC-BTN-ADD");btnAdd.css("cursor","default");btnAdd.query("rect").att("fill","#c8c8c8");btnAdd.query("use").att("fill","#e4e4e4");svgh.getAsUnit("UIC-TOOLTIP-TXT").replaceText(item.name);svgh.getAsUnit("UIC-FILENAME-TXT").replaceText(item.name);svgh.getAsUnit("UIC-BTN-DELETE").atto("dataItem",item);if(item)item.update();svgh.getAsUnit("UIC-FILENAME-REGION").css("display","block");svgh.getAsUnit("UIC-FILTER-TXT").css("display","none")};ApplicationForm.prototype.updateUIItem=function(item){var op=svgh.getAsUnit("UIC-BTN-DELETE");if(op.element.correspondingUseElement)op=new SVGUnit(op.element.correspondingUseElement);if(item.lock===true)op.att("xlink:href","#UIS-LOCK");else if(item.status=="DONE")op.att("xlink:href","#UIS-UPDONE");else op.att("xlink:href","#UIS-REMOVE")};ApplicationForm.prototype.deleteUIItem=function(_item){var btnAdd=svgh.getAsUnit("UIC-BTN-ADD");btnAdd.css("cursor","pointer");btnAdd.query("rect").att("fill","#65c3df");btnAdd.query("use").att("fill","#fff");svgh.getAsUnit("UIC-TOOLTIP-TXT").replaceText("");svgh.getAsUnit("UIC-FILENAME-TXT").replaceText("");svgh.getAsUnit("UIC-BTN-DELETE").atto("dataItem",null);svgh.getAsUnit("UIC-FILENAME-REGION").css("display","none");svgh.getAsUnit("UIC-FILTER-TXT").css("display","block")};ApplicationForm.prototype.updateCurrentFilesInfo=function(){};ApplicationForm.prototype.updateFilterInfo=function(){var tokens=[],fsize="";if(gvector.minFileSize>=0)fsize=getFriendlySize(gvector.minFileSize)+"~";if(gvector.maxFileSize>=0)tokens.push(fsize+getFriendlySize(gvector.maxFileSize));else if(fsize)tokens.push(fsize);this.helper.getAsUnit("UIC-FILTER-TXT").replaceText(tokens.length>0?tokens.join(" / "):gRB.get("RB-LIST-MAIN-0003","_필터없음"))};ApplicationForm.prototype.updateHeaderChecker=function(){};ApplicationForm.prototype.scrollRegion=function(){};ApplicationForm.prototype.scrollTo=function(){};ApplicationForm.prototype.createCustomColumn=function(){};ApplicationForm.prototype.deleteCustomColumn=function(){};ApplicationForm.prototype.getAllItems=function(){return Array.from(this.uFArea.element.querySelectorAll(".css-item"))};ApplicationForm.prototype.clearAllItems=function(){var parent=this.uFArea.element;while(parent.childNodes.length>1&&parent.lastChild.nodeName=="svg"){parent.removeChild(parent.lastChild)}};ApplicationForm.prototype.attachItem=function(item,index){new SVGUnit(item).att("y",index*gvector.fileItemHeight).into(this.uFArea)};ApplicationForm.prototype.toggleColumnVisible=function(){};ApplicationForm.prototype.setUIColumnLineColor=function(){};ApplicationForm.prototype.preview=function(index,method){var self=this;var item=gfileEngine.ufiles.getItem(gsortedList[index]);var bgstr=hexColorToRgba(gvector.previewBgColor,.75);if(isImageFile(item.ofile)==false){self.throwError("ESVG-00073",gRB.get("ESVG-00073","_미리보기에 유효하지 않은 형식입니다."))}else if(["image/jpeg","image/pjpeg","image/gif","image/bmp","image/x-windows-bmp","image/png","image/svg+xml"].indexOf(item.ofile.type.toLowerCase())<0){self.throwError("ESVG-00073",gRB.get("ESVG-00073","_미리보기에 유효하지 않은 형식입니다."))}else{var reader=new FileReader;reader.onerror=function(_evt){self.throwError("ESVG-00073",gRB.get("ESVG-00073","_미리보기에 유효하지 않은 형식입니다."))};reader.onload=function(t,i,m){return function(evt){dispatchDEXTX5Event("preview",createDEXTX5Event("preview",{id:gvector.elementId,itemIndex:i,itemId:t.id,method:m,itemSource:evt.target.result,backColor:bgstr}))}}(item,index,method);reader.readAsDataURL(item.ofile)}};ApplicationForm.prototype.moveUpAndDown=function(_index,_isUp){};