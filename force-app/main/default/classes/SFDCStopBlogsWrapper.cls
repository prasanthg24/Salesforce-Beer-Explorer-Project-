public class SFDCStopBlogsWrapper {

	public class Blogs {
		public String id;
		public String title;
		public String url;
	}

	public String author;
	public List<Blogs> blogs;

	
	public static SFDCStopBlogsWrapper parse(String json) {
		return (SFDCStopBlogsWrapper) System.JSON.deserialize(json, SFDCStopBlogsWrapper.class);
	}
}