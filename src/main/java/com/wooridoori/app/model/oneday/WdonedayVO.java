package com.wooridoori.app.model.oneday;

public class WdonedayVO {
	private int wdopk; // pk
	private String wdoname; // 원데이클래스이름
	private String wdoregion; // 원데이클래스지역
	private String wdoaddress; // 원데이클래스주소
	private String wdosubject; // 클래스 종류 (카테고리)
	private String wdomainimg; // 메인 이미지
	public String getWdomainimg() {
		return wdomainimg;
	}
	public void setWdomainimg(String wdomainimg) {
		this.wdomainimg = wdomainimg;
	}
	public int getWdopk() {
		return wdopk;
	}
	public void setWdopk(int wdopk) {
		this.wdopk = wdopk;
	}
	public String getWdoname() {
		return wdoname;
	}
	public void setWdoname(String wdoname) {
		this.wdoname = wdoname;
	}
	public String getWdoregion() {
		return wdoregion;
	}
	public void setWdoregion(String wdoregion) {
		this.wdoregion = wdoregion;
	}
	public String getWdoaddress() {
		return wdoaddress;
	}
	public void setWdoaddress(String wdoaddress) {
		this.wdoaddress = wdoaddress;
	}
	public String getWdosubject() {
		return wdosubject;
	}
	public void setWdosubject(String wdosubject) {
		this.wdosubject = wdosubject;
	}
	@Override
	public String toString() {
		return "WdonedayVO [wdopk=" + wdopk + ", wdoname=" + wdoname + ", wdoregion=" + wdoregion + ", wdoaddress="
				+ wdoaddress + ", wdosubject=" + wdosubject + ", wdomainimg=" + wdomainimg + "]";
	}
	
	//
	
    private int page =1; //현재 페이지 (get)
    private int totalCount; //row 전체의 수 (get)
    private int beginPage;  //출력 시작
    private int endPage;    //출력 끝
    private int displayRow =10;  //한 페이지에 몇 개의 로우 (선택 set)
    private int displayPage =10;  //한 페이지에 몇 개의 페이지 (선택 set)
    boolean prev; //prev 버튼이 보일건지 안보일건지
    boolean next; //next 버튼이 보일건지 안보일건지
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        //setTotalCount()를 꼭 호출해야 paging이 되기 때문에
        //paging()함수를 setTotalCount()를 호출했을 때 자동으로 호출되게 한다.
        this.totalCount = totalCount;
        paging();
    }
    public int getDisplayRow() {
        return displayRow;
    }
    public void setDisplayRow(int displayRow) {
        this.displayRow = displayRow;
    }
    public int getDisplayPage() {
        return displayPage;
    }
    public void setDisplayPage(int displayPage) {
        this.displayPage = displayPage;
    }
    public int getBeginPage() {
        return beginPage;
    }
    public int getEndPage() {
        return endPage;
    }
    public boolean isPrev() {
        return prev;
    }
    public boolean isNext() {
        return next;
    }
    private void paging(){
    	
        endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage;
        System.out.println("endPage : " + endPage);
        
        beginPage = endPage - (displayPage - 1);
        System.out.println("beginPage : " + beginPage);
        
        int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
        
        if(totalPage<endPage){
            endPage = totalPage;
            next = false;
        }else{
            next = true;
        }
        prev = (beginPage==1)?false:true;
        System.out.println("endPage : " + endPage);
        System.out.println("totalPage : " + totalPage);
        
    }
}
