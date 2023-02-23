var DX5UpProgress=function(manager,popwin,progressType){var tdoc=popwin.document;var headTag=tdoc.querySelector("head");if(!headTag){headTag=tdoc.createElement("head");tdoc.documentElement.appendChild(headTag)}if(!popwin.declarationDX5PopupStyle){popwin.declarationDX5PopupStyle=[]}if(popwin.declarationDX5PopupStyle.indexOf("dextuploadx5-up-"+progressType+"-style")===-1){var popcss=tdoc.createElement("link");popcss.setAttribute("rel","stylesheet");popcss.setAttribute("type","text/css");popcss.setAttribute("href",combinePath(manager.rootPath,"./pop/dextuploadx5-up-"+progressType+"-style.css"));headTag.appendChild(popcss);popwin.declarationDX5PopupStyle.push("dextuploadx5-up-"+progressType+"-style")}var pupwin=tdoc.createElement("div");pupwin.classList.add("dx5-pop-up");tdoc.documentElement.appendChild(pupwin);var pupctn=tdoc.createElement("div");pupctn.classList.add("dx5-pop-up-container");pupwin.appendChild(pupctn);var pupobj=tdoc.createElement("object");pupobj.classList.add("dx5-pop-up-svg");pupobj.style.width="100%";pupobj.style.height="100%";pupobj.type="image/svg+xml";pupobj.data=combinePath(manager.rootPath,"./pop/dextuploadx5-up-"+progressType+".svg");pupctn.appendChild(pupobj);this.pwn=pupwin;this.pob=pupobj;this.mng=manager;this.active=false};DX5UpProgress.prototype.show=function(id){if(!id)return;var tw=this.pwn;var to=this.pob;var mn=this.mng;addClass(tw,"is-visible");this.active=true;(function detectPopup(delay){if(delay<0){mn.throwErr(id,"EX5-13",mn.errs.get("EX5-13","_The progress popup window doesn't exist for DEXTUploadX5."));return}if(to&&to.contentDocument&&typeof to.contentDocument.updateUI=="function"){to.contentDocument.updateUI(mn.get(id))}else{setTimeout(function(){detectPopup(delay-1e3)},100)}})(3e3)};DX5UpProgress.prototype.hide=function(id,force,callback){var mn=this.mng;var tw=this.pwn;var to=this.pob;var md=mn.get(id);if(this.active)console.log("DX5: Hide progress up window("+id+") "+(force?"by force":"")+".");this.active=false;if(md&&force)md.stopUploading();if(to&&to.contentDocument&&typeof to.contentDocument.stopUI=="function"){(function detectStop(){var ret=to.contentDocument.stopUI(!force);if(ret==true||force==true){removeClass(tw,"is-visible");if(callback&&typeof callback=="function")callback()}else{setTimeout(function(){detectStop()},100)}})()}};