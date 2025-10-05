//
//  LotteryScreen.swift
//  LottoDemoApp
//
//  Created by Dhiman Das on 05.10.25.
//
import SwiftUI

struct LotteryScreen: View {
    @State var viewModel: LotteryViewModel
    
    var body: some View {
        ZStack {
            contentView
            overlayView
        }
        .contentShape(Rectangle())
        .accessibilityIdentifier("lotteryScreenTapArea")
        .task {
            await viewModel.fetchAllLotteries()
        }
    }
    
    // MARK: - Content View
    @ViewBuilder
    private var contentView: some View {
        if viewModel.isEmpty {
            emptyStateView
        } else {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.lotteries) { lottery in
                        LotteryCardView(lottery: lottery)
                        Divider()
                    }
                }
                .padding(.horizontal, 8)
                .opacity(viewModel.isLoading ? 0.5 : 1.0)
                .onTapGesture {
                    viewModel.openLink()
                }
            }
            .accessibilityIdentifier("lotteryScrollView")
        }
    }
    
    
    // MARK: - Overlays
    
    @ViewBuilder
    private var overlayView: some View {
        if viewModel.isLoading {
            loadingOverlay
        } else if let error = viewModel.errorMessage {
            errorOverlay(message: error)
        }
    }
    
    private var loadingOverlay: some View {
        Color.black.opacity(0.2)
            .ignoresSafeArea()
            .overlay(
                ProgressView("Loading....")
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(1.0)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(UIColor.systemBackground))
                    )
            )
            .accessibilityIdentifier("loadingIndicator")
    }
    
    private func errorOverlay(message: String) -> some View {
        Color.black.opacity(0.4)
            .ignoresSafeArea()
            .overlay(
                VStack(spacing: 12) {
                    Text("Error")
                        .font(.title2)
                        .bold()
                        .accessibilityIdentifier("errorTitle")
                    Text(message)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.red)
                        .accessibilityIdentifier("errorMessage")
                    Button("Retry") {
                        Task {
                            await viewModel.fetchAllLotteries()
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .accessibilityIdentifier("retryButton")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                .padding(40)
            )
    }
    
    // MARK: - Empty State
    private var emptyStateView: some View {
        VStack(spacing: 12) {
            Image(systemName: "tray")
                .font(.system(size: 40))
                .foregroundColor(.gray)
                .accessibilityIdentifier("emptyStateImage")
            Text("No data found")
                .font(.headline)
                .foregroundColor(.secondary)
                .accessibilityIdentifier("emptyStateText")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

#Preview("Successful Loading") {
    LotteryScreen(
        viewModel: LotteryViewModel(
            manager: LotteryManager(service: MockLotteryService(delay: 1.0))
        )
    )
    .background(.thinMaterial)
}

#Preview("Network Error") {
    LotteryScreen(
        viewModel: LotteryViewModel(
            manager: LotteryManager(service: MockLotteryService(delay: 1.0, showError: true))
        )
    )
    .background(.thinMaterial)
}
