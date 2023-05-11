//
//  WhatsNewView.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 10/05/23.
//

//
//  WhatsNewView.swift
//  ProjetoNeuerWagen
//
//  Created by Roberto Edgar Geiss on 10/05/23.
//

import SwiftUI

struct WhatsNewView: View 
{
    @AppStorage("version") var version = 1.0
    @AppStorage("build") var build: Double = 1
    
    @State var items: [VModel] = []
    @State var loading = true
    @State var historySheet: Bool = false
    
    @Binding var show: Bool
    @Binding var align: HorizontalAlignment
    @Binding var color: Color
    @Binding var size: String
    @Binding var labelColor: Color
    @Binding var label: String
    @Binding var labelImage: String
    @Binding var history: Bool
    @Binding var data: String
    @Binding var showDrop: Bool
    
    public init( show: Binding<Bool>, align: Binding<HorizontalAlignment>, color: Binding<Color>, size: Binding<String>, labelColor: Binding<Color>, label: Binding<String>, labelImage: Binding<String>, history: Binding<Bool>, data: Binding<String>, showDrop: Binding<Bool>)
    {
        _show = show
        _align = align
        _color = color
        _size = size
        _labelColor = labelColor
        _label = label
        _labelImage = labelImage
        _history = history
        _data = data
        _showDrop = showDrop
        compareVersion()
    }
    
    public var body: some View
    {
        Button(action: {
            if showDrop
            {
                show = true
            }
        })

        }
        .sheet(isPresented: $show)
        {
            sheetCurrent
                .sheet(isPresented: $historySheet)
            {
                sheetHistory
            }
        }
    }
    
    // MARK: - Current Version Changes View
    public var sheetCurrent: some View 
    {
        VStack(alignment: align) 
        {
            Spacer()
            
            headings
            
            Spacer()
            
            if loading 
            {
                VStack {
                    Text("Loading...").padding(.bottom)
                    ProgressView()
                }
            }
            else 
            {
                ScrollView(showsIndicators: false) 
                {
                    ForEach(items, id: \.self) { item in
                        if item.version == Bundle.version {
                            ForEach(item.new, id: \.self) { new in
                                HStack 
                                {
                                    ZStack 
                                    {
                                        color
                                        Image(systemName: new.icon)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 50, height:50)
                                    .cornerRadius(15)
                                    .padding(.trailing)
                                    VStack(alignment: .leading) 
                                    {
                                        Text(new.title).font(.headline).lineLimit(1)
                                        Text(new.subtitle).font(.subheadline).foregroundColor(.secondary).lineLimit(1)
                                        Text(new.body).font(.caption).foregroundColor(.secondary).lineLimit(2)
                                    }
                                    Spacer()
                                }.padding(.bottom)
                            }
                        }
                    }
                }.frame(width: 300)
                    .frame(maxHeight: 450)
            }
            
            Spacer()
            
            if history 
            {
                showHistoryButton
            }
            
            closeCurrentButton
                .padding(.bottom)
        }
        .onAppear {
            loadData()
        }
    }
#if os(iOS)
    public var appIcon: some View {
        Bundle.main.iconFileName
            .flatMap {
                UIImage(named: $0)
            }
            .map {
                Image(uiImage: $0)
                    .resizable()
                    .frame(width: 65, height: 65)
                    .overlay(
                        RoundedRectangle(cornerRadius: 19, style: .continuous)
                            .stroke(.gray, lineWidth: 1)
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: 19, style: .continuous))
    }
    public var headings: some View {
        HStack {
            if align == .leading {
                appIcon
            }
            VStack(alignment: align) {
                if align == .center {
                    appIcon
                }
                Text("Novidades").bold().font(.largeTitle)
                Text("Versão \(Bundle.versionBuild)").bold().font(.title).foregroundColor(.secondary)
            }
            if align == .trailing {
                appIcon
            }
        }
    }
#elseif os(macOS)
    public var headings: some View
    {
        VStack
        {
            Text("Novidades").bold().font(.largeTitle)
            Text("Versão \(Bundle.versionBuild)").bold().font(.title).foregroundColor(.secondary)
        }
    }
#endif
    public var showHistoryButton: some View
    {
        Button(action: { historySheet = true }) {
            HStack {
                Text("Mostrar histórico")
                Image(systemName: "arrow.up.bin")
            }.font(.body)
        }.foregroundColor(color)
    }
    public var closeCurrentButton: some View {
        Button(action: { show = false }) {
            HStack{
                if align == .trailing {
                    Spacer()
                }
                Text("Continue").bold()
                Image(systemName: "arrow.right.circle.fill")
                if align == .leading {
                    Spacer()
                }
            }.font(.body)
            .frame(width: 300, height: 50)
            #if os(iOS)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(15)
            #endif
        }
    }
    
    // MARK: - History List View
    public var sheetHistory: some View 
    {
        VStack(alignment: align) 
        {
            Spacer()
            
            Text("Histórico").bold().font(.largeTitle)
            
            Spacer()
            
            ScrollView(showsIndicators: false) 
            {
                ForEach(items, id: \.self) { item in
                    ZStack 
                    {
                        color.opacity(0.25)
                        Text(item.version).bold().font(.title2).foregroundColor(color)
                    }.frame(width: 75, height: 30)
                    .cornerRadius(15)
                    .padding(.bottom)
                    ForEach(item.new, id: \.self) { new in
                        HStack 
                        {
                            ZStack  
                            {
                                color
                                Image(systemName: new.icon)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 50, height:50)
                            .cornerRadius(15)
                            .padding(.trailing)
                            
                            VStack(alignment: .leading) 
                            {
                                Text(new.title).font(.headline).lineLimit(1)
                                Text(new.subtitle).font(.subheadline).foregroundColor(.secondary).lineLimit(1)
                                Text(new.body).font(.caption).foregroundColor(.secondary).lineLimit(2)
                            }
                            
                            Spacer()
                        }.padding(.bottom)
                    }
                }
            }.frame(width: 300)
            .frame(maxHeight: 450)
            
            Spacer()
            
            closeHistoryButton
                .padding(.bottom)
        }
    }

    public var closeHistoryButton: some View 
    {
        Button(action: { historySheet = false })    
        {
            HStack
            {
                if align == .trailing 
                {
                    Spacer()
                }
                
                Text("Voltar").bold()
                Image(systemName: "arrow.down.circle.fill")
                if align == .leading 
                {
                    Spacer()
                }
            }.font(.body)
            .frame(width: 300, height: 50)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(15)
        }
    }

    // MARK: - Functions
    public func compareVersion() 
    {
        if Double(Bundle.version)! > version || Double(Bundle.build)! > build 
        {
            withAnimation {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) 
                {
                    show = true
                }
                version = Double(Bundle.version)!
                build = Double(Bundle.build)!
            }
        }
    }

    public func loadData()
    {
        if data.contains("http")
        {
            // MARK: Remote Data
            let url = URL(string: data)
            URLSession.shared.dataTask(with: url!) { data, response, error in
                if let data = data
                {
                    do
                    {
                        let decoder = JSONDecoder()
                        items = try decoder.decode([VModel].self, from: data)
                        self.loading = false
                    }
                    catch
                    {
                        print(error)
                    }
                }
            }.resume()
        } 
        else 
        {
            // MARK: Local Data
            if let url = Bundle.main.url(forResource: data, withExtension: "json") 
            {
                do 
                {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    items = try decoder.decode([VModel].self, from: data)
                    loading = false
                } 
                catch 
                {
                    print("error: \(error)")
                }
            }
        }
    }
    
}

// MARK: - Model
public struct VModel: Codable, Hashable
{
    var version: String
    var new: [Model]
}

public struct Model: Codable, Hashable
{
    var icon: String
    var title: String
    var subtitle: String
    var body: String
}

// MARK: - For App Icon
extension Bundle
{
    var iconFileName: String?
    {
        guard let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last
        else { return nil }
        return iconFileName
    }
}
