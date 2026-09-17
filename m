Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC2C4DE700
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645292; cv=none; b=QKa3IufTllT+1nt2sYZgp2JeMKz3vp/Xtb1v9btQu7DI3a43mzs+BnSjI4EKXYFr/ZxvcDu96mgDvVALW7Ri3CI03y0MCNu3Q5Bw3ZJb4mDw+tIp0r6HX81TBxUK77+A2J13Y9UaUkLYy72QRGoenjge89DVq2aTwjZyqZMDbsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645292; c=relaxed/simple;
	bh=0clhG3sjpOKi9CnPJRlWEs4VtjCAuoD5Rqe1Oj+QesU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OfxiYubnJAaM0GNjyPt0gpspUCNFaDIAssFefpYdRd/cCvX5DxmoeWDoE1hMAKZVb0lGG0PxAsn2Aty0mmK4fbqR02C1qKHhcB4OolBAv47t7jEN+rWiu6IlXGc/wJtEJMIDdoQ0spcL7Ev7DV5mDlR8n4WtB0SRJ4j7e8yIz30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARZCI5J/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6EAGkL+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARZCI5J/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6EAGkL+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zn5O1258882
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=; b=ARZCI5J/a+gpzY5l
	CVUpQRr/eJFIOCADPVqyFTyP8roAC0T1nhsPpBNm8Y8/15WnVnypgqvtLVtzpBSn
	LoG+ViR2uuk/uQU0gefp7nAGqdPyq2dCNHXI2eM3BGfqil0DLR2bt3c9cI3kGyLo
	M57Vy5vLz6ir/+k26ZvpeWn2DZ6T0EsXBpL5zk7SkL9HMOluwiJnBQynmL+Aou7v
	9NCs7DlE59T2TyMhnDmft5Fo1VmDfRs0BCIPcZ3NvAVNivq2s8k1/SHQPg1TrN6e
	OPm7qI0C75pxKOKBZxOT5dNBDl5WRjf0Uyh5ZXWDWddTVYrazl1aNgG29r+/akFc
	70y3hg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgj7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 11:41:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-870ec29b035so484993b3a.2
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 04:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645287; x=1790250087; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=;
        b=F6EAGkL+je+E9N8I15+397OLdbnXdlM3uoNw4nYJXyAK/hhwWTtCEaJ0xnbm+1OEgp
         //xfQ66Byotldfoxkv/VDQbzzB8o54/+VPM68lLyUaSHtP3mXYZ0z7GosUNNl8sqtfYD
         3jd68+y2b9Su6DQVPvQTtVia/ej3CSbMxYR32YoE9nAUlukdBk7Snssp+/5Jmo4bbDay
         SXWgY3DGiUDOkkda+CStYQHAXVpuuheCPgh6h5fEx23aKg45q5C/AeYcGW5VHpZGJ/3r
         4gfJXKPo3eqC97pjIr7hU3Y+wx0bE2jLhtfvvr2z3DZvjz7GtrVePDA9N3KBoGB/f8Nw
         ANOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645287; x=1790250087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtpZ1UwOnwR1wfa+XkNK9I5ShlxLooktMu/pyV8I2Bk=;
        b=K7yR14U0HfCTbk8bEW4gjkt0vhmrNm8fBUCqgc2HPwfbQXZX5FC+eynyTGd3cyzhA8
         imzxogvKnOWjLg7TWBDWPQ5agUF92T0Ef7VRnel4SXThnViCAgLHgFi0GRMV9Yq6BEXk
         XJ2EezE9QinLaFwu4tAm/0y5C6M9evx0n6fHExFgha6PldZ2s3h9piIRo/PRFZOK7E/f
         32wpivFRWEaGBBzNAXEN9PbagkI2qyU3osuki7dZH6QnTZKzupj2coeU+yZxYkZRjJ+X
         X3rZyuqW16npDMU6RWFSaUbF2KIjqsz28nX3G4u9X6jCBJPnpTiP7v/BimGaHVCFaFd4
         vBuw==
X-Forwarded-Encrypted: i=1; AKwUvByHOlQf8bY+0UkfunutP/WvRhNS+yBCNpvdIgwMkGP3X4WHlU636BB14dAmUQuFCZEgupI=@lists.linux.dev
X-Gm-Message-State: AFuF++n3/e4It+yvmBmEh3FxXCa/NWKulNvpCs6EbrGEufWoR0nUWF+O
	jL17sbAuemgZc8UMGnCkP2YQFzZCkoIo+m5PS1ZkXemJWzco5OlP9aGPB83ZQeEHmZrfULw3Op2
	JB4YLgfmrFPBbV8PIYskC1vhIwEFIKhazSYXEErhXAV7tjTK8Oul1ex8=
X-Gm-Gg: AYBFou3NHBCuxP272VD8nzP5c2Zr8oGbBVck+Up/o9YeGj8smMF5q+FlNRxXBpJ65WQ
	Vg+JU/6Es6myCCAuxF6YpE/zpHGrIV9/fA/yZ2D5IZsM95Hgs3oW7r0lKgGPxw8QJB1I14nJCey
	ioBSUW47VF88zHds1iVA1huMn1l0UumTBgx7xrTCHb2wMHC2Or3/Xgj8qXBKZs+rvdskf2+PYpn
	TayDdoEyH430o1eyqovdo/4fUocJ24htWddzLIeoLkLgTKlwfK0EHk0QPL04DVAgYPIv7toRgeA
	rB/Rn2vItOMg7vVGfICDsqrDTP+v/K54tF4rCc9+9BdCV8hsMAJsOIYski0sEBWlFK+OLz/nZRS
	9srmJlLRCECjBfKi7Z6q46sKccv9hOQ==
X-Received: by 2002:a05:6a00:6caa:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-87236ae8236mr13475405b3a.2.1789645287256;
        Thu, 17 Sep 2026 04:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:6caa:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-87236ae8236mr13475325b3a.2.1789645286774;
        Thu, 17 Sep 2026 04:41:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc1178sm3066557a12.30.2026.09.17.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:41:25 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:01 +0530
Subject: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789645263; l=2744;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=0clhG3sjpOKi9CnPJRlWEs4VtjCAuoD5Rqe1Oj+QesU=;
 b=q9ZHy4b/hYrpmM6KJAM4IBhaNiSsWe8M6eZGolV23XCjbGyp0nz+xSWis0QNMf1UJgu0D8lXM
 MQ8jU2CFlxkC1NckBKAvVifToy0pmJ8JzKI2Hb5OHXBs+1ml6iYZmfi
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX1LQj+xh3p2rK
 lwvuKktvNNpq1pI7GklWVGQM3XWhIUHUUxp/ydHdhS8uMR1NrXduPyAQbCepLfI9sIT9g4W5zzS
 qe7+8gBjc8WTbA9gOiO+bozeqJe8TjN+sy9BUxFtsa/RJfKbjq1D4utnXix33iG++cjUV+lFEns
 vvIf8700lVQIoyRPjzo2v1o9yrUN/AK0lrouM7TXt270cJ4bhkXq1ylQ4GAiaLnvBibtUL9xYnn
 fTfsHf8gamQO/3ajp/mm+EFSdbRYSEyIFiGmynRenw35Ey70InzJ4aZC4tr536f+kF4rfdNY/eJ
 qh87edhYSFeJuL4yJGNnOqKPtr2H3lQl39hP8DcNhN6LuQo1sBY+nk/A9DNZ12vl8pkflf+cNI5
 s/msP8jAxPwspLUAVD7yeBYPj52v2PMMmAeb0iJw0eG63A/vVpUroS5sFdOS/OMVWiitqJjhaoT
 f6pQJCdrM11agKBZ98A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX7NQ+BSP0Gkf7
 e529jSDgZM3ZVD2dE99v7XuvmruGEq2TIUyKKqWBXNOoRFKHhp3d8oY5HknoeQjWkgX9vvVWEPU
 wW+yPBkIMEHzwa+9K/vP1QSEdnRW9Qg=
X-Proofpoint-GUID: Ah6i7Ccjq1iaOJ8WbCPITvKu9wfeVNzO
X-Proofpoint-ORIG-GUID: Ah6i7Ccjq1iaOJ8WbCPITvKu9wfeVNzO
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabd1e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZbC1Des45MQyGPwI-hwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162

Qualcomm Shikra SoC has one Camera Control Interface (CCI)
containing two I2C hosts.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index faa1f02c01957b8ed86b5e8fc659c856d574a8ee..5f64b4e50967d61846b7b0c565380a58e4ba3210 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -892,6 +892,38 @@ qup_uart9_default: qup-uart9-default-state {
 				bias-disable;
 			};
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c0_sleep: cci-i2c0-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio36", "gpio37";
+				function = "cci_i2c0";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_sleep: cci-i2c1-sleep-state {
+				/* SDA, SCL */
+				pins = "gpio41", "gpio42";
+				function = "cci_i2c1";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";
@@ -2077,6 +2109,43 @@ port@1 {
 			};
 		};
 
+		cci: cci@5c1b000 {
+			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x05c1b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
+
+			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		remoteproc_mpss: remoteproc@6080000 {
 			compatible = "qcom,shikra-mpss-pas";
 			reg = <0x0 0x06080000 0x0 0x100>;

-- 
2.34.1

