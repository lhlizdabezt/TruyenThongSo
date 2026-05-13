# 📡 Truyền Thông Số · MATLAB Digital Communications Labs

<p align="center">
  <img src="assets/digital-comms-motion.svg" alt="Banner chuyển động của repo Truyền thông Số" />
</p>

<p align="center">
  <a href="https://github.com/lhlizdabezt/TruyenThongSo/releases/latest"><img src="https://img.shields.io/github/v/release/lhlizdabezt/TruyenThongSo?style=for-the-badge&label=Release&color=0f766e" alt="Bản phát hành mới nhất" /></a>
  <a href="https://github.com/lhlizdabezt/TruyenThongSo/tags"><img src="https://img.shields.io/github/v/tag/lhlizdabezt/TruyenThongSo?style=for-the-badge&label=Tag&color=2563eb" alt="Tag Git mới nhất" /></a>
  <img src="https://img.shields.io/badge/MATLAB-DSP%20%2B%20BER-D95319?style=for-the-badge" alt="MATLAB DSP BER" />
  <img src="https://img.shields.io/badge/Portfolio-HR%20Ready-8b5cf6?style=for-the-badge" alt="Portfolio sẵn sàng cho HR" />
</p>

<p align="center">
  <b>Repo bài tập và đồ án môn Truyền thông Số</b> của <a href="https://github.com/lhlizdabezt">Lương Hải Long</a>, sinh viên ngành <b>Điện tử Viễn thông</b>. Nội dung tập trung vào mô phỏng kênh AWGN, bộ lọc phối hợp, BER, điều chế số, nén giãn tín hiệu thoại và giải mã LDPC bằng MATLAB.
</p>

---

## 🎯 Tín hiệu chính cho người đánh giá

| Điều cần chứng minh | Bằng chứng trong repo | Giá trị kỹ thuật |
| --- | --- | --- |
| Hiểu nền tảng truyền thông số | Mô phỏng bit, dạng sóng, nhiễu AWGN, bộ lọc phối hợp và ngưỡng quyết định | Nối được lý thuyết xác suất lỗi với kết quả mô phỏng |
| Làm chủ điều chế số | BASK, BPSK, BFSK, QPSK và đường cong BER theo `Eb/N0` | So sánh được độ bền của từng sơ đồ điều chế |
| Biết xử lý tín hiệu thực | Mẫu thoại `.wav`, lượng tử đều, nén giãn A-law/mu-law và đánh giá SNR | Có năng lực đưa tín hiệu đời thực vào pipeline MATLAB |
| Có tư duy mã hóa kênh | Ma trận kiểm tra chẵn lẻ, đồ thị Tanner, syndrome và bit-flipping LDPC | Hiểu luồng phát hiện/sửa lỗi ở mức triển khai |
| Đóng gói như portfolio | README, hình kết quả, báo cáo PDF, slide, tag và release | HR và kỹ sư có thể đọc nhanh mà không phải đoán cấu trúc |

## 🧭 Bản đồ nội dung

| Hạng mục | Đường dẫn | Nội dung |
| --- | --- | --- |
| Chương 3 | `Chapter3/22207056_LuongHaiLong/` | Tạo chuỗi bit, mô phỏng tín hiệu trong AWGN, bộ lọc phối hợp và xác suất lỗi |
| Chương 4 | `Chapter4/22207056_LuongHaiLong/` | BASK, BPSK, BFSK, so sánh BER bằng đồ thị semilog |
| QPSK | `Chapter4QPSK/22207056_LuongHaiLong/QPSK.m` | Chòm sao 4 điểm, cơ sở trực chuẩn, tách sóng theo khoảng cách gần nhất |
| Đồ án 1 | `Nhom5_DoAnTTS/Project1/` | Lượng tử tín hiệu thoại, A-law, mu-law, khôi phục và đánh giá SNR |
| Đồ án 4 | `Nhom5_DoAnTTS/Project4/` | LDPC, đồ thị Tanner, syndrome, thuật toán bit-flipping |
| Báo cáo và slide | `Nhom5_DoAnTTS/*.pdf` | Tài liệu trình bày, báo cáo nhóm và bằng chứng học thuật |

## 🖼️ Kết quả trực quan

<p align="center">
  <img src="Nhom5_DoAnTTS/Project1/project1_uniform.png" width="48%" alt="Kết quả lượng tử đều" />
  <img src="Nhom5_DoAnTTS/Project1/project1_mu.png" width="48%" alt="Kết quả nén giãn mu-law" />
</p>

<p align="center">
  <img src="Nhom5_DoAnTTS/Project1/project1_a.png" width="48%" alt="Kết quả nén giãn A-law" />
  <img src="Nhom5_DoAnTTS/Project4/tanner_ldpc.png" width="48%" alt="Đồ thị Tanner LDPC" />
</p>

## ⚙️ Cách chạy nhanh

Yêu cầu môi trường:

| Thành phần | Ghi chú |
| --- | --- |
| MATLAB | Khuyến nghị có các hàm xử lý tín hiệu/truyền thông tương ứng |
| Dữ liệu thoại | Giữ `MaleSpeech-16-4-mono-20secs.wav` cùng thư mục với `Project1.m` |
| Thư mục chạy | Nên `cd` vào đúng thư mục chứa script trước khi chạy |

Ví dụ:

```matlab
cd('Nhom5_DoAnTTS/Project1')
run('Project1.m')

cd('../Project4')
run('DoAn4.m')

cd('../../Chapter4QPSK/22207056_LuongHaiLong')
run('QPSK.m')
```

## 🧪 Ma trận kỹ thuật

| Module | File chính | Điểm đáng xem |
| --- | --- | --- |
| AWGN cơ bản | `Question1.m` | Sinh bit ngẫu nhiên, biểu diễn dạng sóng, thêm nhiễu và quan sát tín hiệu nhận |
| Matched filter | `Question2.m` | Tính biến quyết định, đặt ngưỡng, so sánh BER mô phỏng và lý thuyết |
| BASK | `Problem1.m` | Điều chế ASK nhị phân, tách sóng kết hợp, BER theo `Eb/N0` |
| BPSK | `Problem2.m` | Tín hiệu đối cực, ngưỡng 0, BER thấp hơn khi cùng năng lượng bit |
| BFSK | `Problem3.m` | Sóng mang trực giao, bộ lọc phối hợp hai nhánh |
| QPSK | `QPSK.m` | Mã hóa 2 bit/ký hiệu, cơ sở trực chuẩn, quyết định theo khoảng cách |
| Companding | `Project1.m` | So sánh lượng tử đều với A-law và mu-law trên tín hiệu thoại |
| LDPC | `DoAn4.m`, `Cau1.m`, `Cau2.m` | Ma trận `H`, syndrome, đồ thị Tanner và vòng lặp sửa lỗi |

## 🏷️ Metadata đề xuất

| Nhóm | Nội dung |
| --- | --- |
| Mô tả repo | Bài tập Truyền thông Số MATLAB: AWGN, matched filter, BER BASK/BPSK/BFSK/QPSK, A-law/mu-law, LDPC, báo cáo và slide. |
| Topics | `digital-communications`, `matlab`, `signal-processing`, `telecommunications`, `awgn`, `matched-filter`, `ber`, `bpsk`, `qpsk`, `ldpc`, `companding`, `channel-coding`, `hcmus`, `electronics-engineering` |
| Release | Dùng release mới nhất để ghi lại phiên bản portfolio đã có README, hình minh chứng, tag và mô tả kỹ thuật đầy đủ |

## 👤 Tác giả

| Trường | Thông tin |
| --- | --- |
| Họ tên | **Lương Hải Long** |
| Ngành | Điện tử Viễn thông |
| GitHub | [github.com/lhlizdabezt](https://github.com/lhlizdabezt) |
| LinkedIn | [linkedin.com/in/lhlizdabezt](https://www.linkedin.com/in/lhlizdabezt) |
| Portfolio | [Hồ sơ GitHub kỹ thuật](https://github.com/lhlizdabezt/lhlizdabezt) |

## 📌 Ghi chú học thuật

Repo này là hồ sơ học tập và portfolio kỹ thuật. Báo cáo, slide, dữ liệu và mã nguồn được giữ lại để người đánh giá có thể truy vết mục tiêu bài học, cách triển khai và kết quả mô phỏng.
