//Generated by wsdl2apex

public class AsyncParksServices1 {
    public class byCountryResponseFuture extends System.WebServiceCalloutFuture {
        public String[] getValue() {
            parksServices1.byCountryResponse response = (parksServices1.byCountryResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class AsyncParksImplPort {
        public String endpoint_x = 'https://th-apex-soap-service.herokuapp.com/service/parks';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://parks.services/', 'parksServices1'};
        public AsyncParksServices1.byCountryResponseFuture beginByCountry(System.Continuation continuation,String arg0) {
            parksServices1.byCountry request_x = new parksServices1.byCountry();
            request_x.arg0 = arg0;
            return (AsyncParksServices1.byCountryResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncParksServices1.byCountryResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://parks.services/',
              'byCountry',
              'http://parks.services/',
              'byCountryResponse',
              'parksServices1.byCountryResponse'}
            );
        }
    }
}