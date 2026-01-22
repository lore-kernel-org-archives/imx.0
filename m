Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34CC239E97
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769078501; cv=none; b=KNZ9L8qc1nTdtbcKXn/DaCTc7oI17/dKLGw4iaa5hfHUAsl8ksBjRSRyhg5dO7C+FonOP8RO9N1YA+dzsURhu+CAcMgJdChM4sG/4aRcfFB10XoY+WqT/MQr9W/BBhihVCee7Rw/BRFM042ij2ia7/QvpFXAsCnpGZx/07bF1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769078501; c=relaxed/simple;
	bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIQ/wJBFjuo/0YZYUhuWdrlT0cBeFpm/I5ftTs/AlFntI6SwBG7EL59fCv1d5d5w032dM0n9I9g2Cub30AGDz95I9YUsXg5dqpswFBFE8v5JcIl18RtOJb+S/dzv3Hke4/j6zRx+0jscCh6BXl464dL/WBn5ImwnF7ftsZxamCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX01lWX3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWo5t7+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jX01lWX3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWo5t7+k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M91Y6H3463169
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=; b=jX01lWX3yFK3QBsd
	L11wmoR0sLo16up3YONxLEHLJk2fQa8+O3fwOBkgB+dmzXIWC4E1F/EnEjOf6Pyk
	OwOSeGz3EvSWgknLzrr+rG9KJo4HIvZloVqTT6wDcqTQHGbUDTsgHJopNddxjtzU
	faOtMzyWbz5okd4Ra+b/IFTL2RXtUPduPNsANfSOHjVAoZf3bKDHODF1haHbpmuG
	6Rm3fMF3SGo9IIUJUCb7QDejdTHI3KBUfZzwNIehxvs4hLLHji9AcKfCM9WyFus/
	Ac7IWRkCfS4o45LxpNfVFPA3oEDdHuK2XrLeiwzsasYQMhtxZOEt/pNGNGg89CmY
	Bi61pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu0653hgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 10:41:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5297cfe68so170899485a.0
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 02:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769078496; x=1769683296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=TWo5t7+kRQh+xCWuQ/PfiXuGAdvpL0ckjosDmTaHzw/i5TLjmhqIMF0I1C/V1+6T/2
         55+DjfAZ0dNNjVQk0AmE1EYTOizicXQ5XW9wxAoffOIB4zx+ck6AzxjQPQ3lcejrvTGB
         n6vAjcJcxAz4Jut9xLEtA6KVB82dP7R6c24KXMGh4MRs1DGqVh90a5VJSXGfdwuTuMdj
         knxS4rsu90VnEcwOworMKVXFtHnZxWGsf5rOCe870jDweCy8q6CcDVXscUETZtonRVsv
         bKDk9o2Sfao/PSX1BQ3bIinJZZSjmsoI6fvL7Jpja0f2dNWs1NGwNTKoLVIl6txH2fNb
         p6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769078496; x=1769683296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYe3a+X8RQV757haNblqDrC0UCkSImr/La6BxbOeCBI=;
        b=HAoWmS4HGimzk3L9NUjwKbgTXPawEBoVQ4MUC/n+Vl+yjI1lewfYBOLXlKhsnMUcJq
         kj8TC5verYbDV7dlKWVM+xjybdvzdkuSpcRPVX5sItvxEZUOYR5vGAY1YmPQGsyrmLVj
         WJL762/tBW6+6dc9fXGyzXdcw0ztenwWWVJ5N/SRax33zIMj2OmUreoy9rbxwDRiJEB5
         DImK7XQLl/7UJfafcOcOP8HD2dKEfoflDYhO/6fKK9bWRtlnDCeagvYV9FYQC6Lxl+2B
         k3RINnf5zNiRdtjwz4nBvWBrWiaCC+5JNbNM76iCElyuFiMK2acAYmqDuremjIOGQHmK
         IP8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIswH7swz4l6FaBXWNUJOAWPbMbGVwIw9WIt8fDV715rTiS9nnUVQzS4PZfbEKb1STYmU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbikJBhoP+2eFRob0P7e4sd/b2I6WJqwFRlkCGYkdEH9OmChoN
	ha3+whq2DMl2g3ujquDdeJK5FfdXr6+c6AFSLbMTOTEpsuvAswioGE6c0Hf+1xTalErADohDM1o
	WGepk+KCKON7DR+LSmhh+aBhrRoRBYIeSnGAbGdPmWlIt2boJojRCTFKzd3bRjgwzNA==
X-Gm-Gg: AZuq6aJseUbN7MacayrkeqhgGofASw1QsFuZaOHtRWQj98sUmbyEnkykb5kv700CEYd
	J13blqXzqcY8uYlNa2c6Klz20lEdCYxGvAIKWby04eL6Y40IkiTZ6oHH6+pBuYsX8isWhoW2SvW
	i8Ko8uUEoJFRn3FX+D2t1Guz7XWVqK1/SiOG9/UfMbUUZSsSxMcEU8pzx3It/KIYH9UOvyURyo8
	BQVXWkwgX4rjbgDMp8OMHCoJEXhVHGBRJiYjxXgZ+iCfGX/zjWIsbWjKSV7BqR9tMobzE1s9kO4
	VXNSYKmObobQNcNvZllZGIl1uvmPGLTa3oXgKBZ7dzz/aQl+GBnO6/NHAtCEWhGtydxZWS5KLbO
	MqrOIr3VabXT14LEBWArcyKOYltSg4AlqlXHrdfc+tlYEom/eIxTrUxSBd2ufLhSDpjxdY+VGPq
	0K
X-Received: by 2002:a05:620a:288b:b0:8b5:1b5:cafc with SMTP id af79cd13be357-8c6a6709b67mr3080296885a.36.1769078495756;
        Thu, 22 Jan 2026 02:41:35 -0800 (PST)
X-Received: by 2002:a05:620a:288b:b0:8b5:1b5:cafc with SMTP id af79cd13be357-8c6a6709b67mr3080294885a.36.1769078495346;
        Thu, 22 Jan 2026 02:41:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7260229sm1387868685a.42.2026.01.22.02.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 02:41:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:40:49 +0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-sm6150_evk-v4-4-a908d49892e7@oss.qualcomm.com>
References: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
In-Reply-To: <20260122-sm6150_evk-v4-0-a908d49892e7@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769078453; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=urisQog5JZfbdirBxu5tGAO+ASUUaW9dPoY/c9Nj33A=;
 b=I7z9k27YrP0G4lQE7jSsHQaqMCmfAdS0JW5oaDyYtJTvk5+UcdXrfI7CMFvOcIoB4Bt41Vodq
 tUrvYBEyWVUDgr/FFrVxfAuANQayW2RNkejOcM6nSJ3Mw1e+f1Ux8fA
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=HOHO14tv c=1 sm=1 tr=0 ts=6971fee1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fjhmLkgCktOXMXXZ_4isFugAIZ7Q_Wv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3NiBTYWx0ZWRfX3KC4IhpdF5Y1
 tiPmLq4mTbVMU0DnhbH01Ne36BpUBP7rjhDDwhgxTUsaR4nBqVXkRnhrbzqbP76e7IMegbhKBiA
 9EIvEXY8vraKlppJDMdwip6Ri4rQIInZ10RrSMthS7P7rHjzYlJlnwnHLlifx9P/aj7Jk1q1Iw7
 Fl/uRx5VmSdRqRRRvNT3XiEUygih3eMQt/H+QrYY5c1xNfaGWvI0PNRq9reZGJnLc09AVhFtq88
 c0p5hWTmG9Ld79ngMNYOcqZ7tc5UlfjcYyF6fv/AvqgIl51kWjtKIn5r8MMPqQZatYw+LnRFSYq
 VE/0sr9IgT+dtCVhPDdUNV82J1fmnYmkdN3HCLrS0DW3qvf5VsFAThmU2+lmqPlHnrdzvcMwyY+
 TmGDm4F8lNcQrR5GIRNnrTRwndYPmVOhnrcilBE9r5hYeH7vPXQHTUQT4DHg6UQQ7hYnL+BkWOv
 s1tp+96Mp7jsyORSO4w==
X-Proofpoint-GUID: fjhmLkgCktOXMXXZ_4isFugAIZ7Q_Wv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220076

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6d28096e50546855bd762e479b66ed6214ec5d65..33897994d0ca8a193acfbc94a932551a09c712ce 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1

