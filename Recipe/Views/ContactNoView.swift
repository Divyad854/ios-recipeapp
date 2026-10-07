
import SwiftUI

struct ContactNoView: View {
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Contect")
                    .font(.system(size: 30))
                    .bold()
                ProviderCard(
                    systemImage: "person.crop.circle.fill",
                    name: "Krisha Kitchen",
                    contact: "+91 98765 43210",
                    location: "Surat, Gujarat",
                    about: "Authentic homemade recipes curated with traditional spices and fresh ingredients."
                )
                
                ProviderCard(
                    systemImage: "fork.knife.circle.fill",
                    name: "Taste of Home",
                    contact: "+91 91234 56789",
                    location: "Ahmedabad, Gujarat",
                    about: "Daily homemade dishes inspired by traditional Gujarati and North Indian cuisine."
                )
                
                ProviderCard(
                    systemImage: "takeoutbag.and.cup.and.straw.fill",
                    name: "Foodie's Choice",
                    contact: "+91 90000 11223",
                    location: "Vadodara, Gujarat",
                    about: "Unique fusion recipes crafted using both modern and traditional cooking styles."
                )
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .navigationTitle("Recipe Providers")
        .navigationBarBackButtonHidden(true)   // hide default back button
        
    }
}


// MARK: - CARD COMPONENT
struct ProviderCard: View {
    var systemImage: String
    var name: String
    var contact: String
    var location: String
    var about: String

    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            Image(systemName: systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 70)
                .foregroundColor(.orange)
                .padding(15)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 18))

            VStack(alignment: .leading, spacing: 12) {
                
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.green)
                    Text(contact)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.red)
                    Text(location)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Text("About Provider")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text(about)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(22)
        .background(Color(.systemBackground))
        .cornerRadius(22)
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 6)
    }
}


struct ContactNoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactNoView()
        }
    }
}
