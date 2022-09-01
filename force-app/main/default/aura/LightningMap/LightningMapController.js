({
    init : function(component, event, helper)
    {
        component.set
        ('v.mapMarkers', 
        [
            {
                location:
                 {
                    City: 'Vadavalli',
                    State: 'TamilNadu',
                    Country: 'India',
                    Street:'NO 4 Marudham Nagar Extn',
                    PostalCode: '641041'
                },
                title :"Abi Home ",
                icon: 'custom:custom54',
            },
               { location:
                {
                    City: 'Podanur',
                    State: 'TamilNadu',
                    Country: 'India',
                    Street:'13 Amman Pudur',
                    PostalCode: '641023'
                },
                title :" Prasanth Home ",
                icon: 'custom:custom74',
            },
            
            { location:
                {
                    City: 'Chennai',
                    State: 'TamilNadu',
                    Country: 'India',
                    Street:'Kovilambakkam',
                    PostalCode: '600129'
                },
                title :" Dhanush  Home ",
                icon: 'custom:custom64',
            },
            
        ] );
        
        component.set('v.zoomLevel', 5);
    }
})
