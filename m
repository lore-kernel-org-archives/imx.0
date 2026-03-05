Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C210637C0E2
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704144; cv=none; b=pIeZFwN76P/RvCRHT5Sl1c8bFvExZ+HE5RWW2vUmTICdPpnN3KPmJxTdjwyWoBjSzPZZRJjGaxXhS9vy9YA6KWw5l/cXZOHDbzyowpRoWdClUXwRRmwyu5p1ly0r9SqAycHPuEBSUfJBDtKKr4XL9vZF/16ogFnk/wrWssCugDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704144; c=relaxed/simple;
	bh=PxCok/m06RL8EtXvhxkBdkhQnDrY29ujrliEFTX0zGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXqfRohXcOEZKBC+3brdOudy3ifoZDZsvd3GPk2WQJ7q9TCI6nhOrAxePfP7/Ir+7I4hta+Iw01/f6DbG0KsomKz6Fe9CBOF9DVMlBCvEcM3NEVG8PQL5h79Q96Tc+duzpLhH2chfCPvTqLdTkyDLxEf65qm+1QDUwXv3FS2KBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0eanmbe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gohx3aqw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0eanmbe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gohx3aqw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62590KXl3482643
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 09:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=; b=m0eanmbe0KpQ4EZG
	fwJYyZ/9ahL9lpyukyALogpv9cxSWSnZeI46S33ZVe4AVK8y2C1BH+uW8WAjj51e
	wT92BFgBGN+/uIHznYeinmRIjsiyXz0wAeHa0DubAIIEQxHOABkmvXPce8xeNjyM
	6AR1gEQzM15hAJwrCcq3KU83KNRg3jWTigIdr/QVnxcjxD+IA83DSU9OYuvVf8zB
	PTBe0+x9CXtha7Xmit5ktXklz94yEMA5WUH85/oB8mBKtl82+woEiJZdyqIWmucm
	DuhMQvbH0wTiebtcRz8pTsHL7y2RymWb9eHAw7H8qD9b5OUxTsiAyhhdMdilG5Xx
	xDkiQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjrd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:49:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506c0da79c5so625614041cf.1
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704138; x=1773308938; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=;
        b=gohx3aqw87iIfjKwhUCIxDOjuBvvYUwYjBXAKc+k1Whi/tw7ZWVPVQ2K3UJtSjcc/9
         +O/uRoiEMJ34EuF0B2JtWcN9ReVFw4Mgtlc9xbWm90KuNKcfNgwNOdti566CBqThj7Gv
         MgtTzOBK/ER+7o0bfcRMcypjV4X/uCPj1CFwTxpu5+Pb6I2el1qAil5vKCTxl9XgYXhT
         x99nY0/uG1WcAC6My45V5hvGA0loVfxf+EttYA/TPDnxtzPqNxQvmTSbaZy+oUt+oykp
         YZj3hwBboubimei/aO1JZh5xO1eHLc6a0vXGeqB4DhlEHOO5Yvo0Ql6+CLW9IYon5GAJ
         jbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704138; x=1773308938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UTco5l+cTyAHR+yMd81P+5uIodWOmaB8yH0KycCwb6Y=;
        b=SDTTT5KTgKjSq9qDr2RWYpOr+zxLxMuGrpFyi74LOrg0uzI2TqOyK/XMVkhNDx/pBb
         kh8VM19vniLk9jHEpTXHuSn5jvzCYWckFtOm/uOij3uzTgp/fmlPgz4ENTTzj50DwYJ1
         jpgvo7NjtN9fkA09zVbwftxErmBSteWi9hZWVgO6WIqEBeCmZKCOHkeR9lWD1Pjai+Zo
         VWIC0KSO97Z+GxGSdu1W2PI2GwSRkqTXqQo6XLCfjee/5G4YiNWk7khUtZ/t35ViiyoL
         zL68ERvlhJLfX4X8k8cj3XlC3Z5/hUh4Pf2IBWj+XtWBizufZXfC3cbwNLDXPVO4uoIX
         E3xw==
X-Forwarded-Encrypted: i=1; AJvYcCUYTztu3OnCC4YV/xcHw1SFhbInzQuhF0OT+cGPbgtR2SdEFSuJm5hb2NJeX0CQPFCe58o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzfhE28HkoCUF5CnmHrv0WQSwVKmGM3Aum4Ck4Ut0VF+dYuhRw
	e2xv/2asnNFZl0wVCPoZ+875bkNkmBn+XgflPQB9PfYV/pnFiwcFNPZwvSrTaB7VFC2EkwiRrtI
	FV7Brhedisa8pBhGPx6PatxWdi+YOrxtOy8ROU8T2egAbmNQSN218I1Q=
X-Gm-Gg: ATEYQzw3ROiP5O4tRZ39jG27WKe5zpDSqca3cLR//9r82gNtHGcI4QY1y94u3qlAiW3
	uwoPLq6sK0wB87fmNZZBZM8QzIHiDtST1DMliqEHV2DHsYPfeI7FWWTBRcMlsTKnbzP8YQN6Qlu
	WJUi2X0y0J2d5tB/9gZssQG5tKl9tNKNoT0nn9svaZT21vlINf1H9B5VcIsSXlDKoEwvSih+9GD
	yqc3SigAn/twGAQBkM3XKcrU3mRcdkWtByMoisQtzS/vuNJZtBUIb1aeyAzpLqHXjD8irdL6TSn
	nAxF/WJbJhs3pY33+EEXXknAeeRwmqbJpkpEHe/l6M+mhYUR7+4wkwAWAaXsJ8ozse4AiUhF+QT
	tHVsVrqcSA+mGlRgkmJn0TYxcnDpnsQ2qzRhZsD9b841aH54W0OokQh7O1yqS4ibMmv9F4jqrkD
	VXIiGlZo8RIPVn
X-Received: by 2002:a05:622a:190c:b0:503:2f21:6355 with SMTP id d75a77b69052e-508db32cef3mr62095041cf.34.1772704138544;
        Thu, 05 Mar 2026 01:48:58 -0800 (PST)
X-Received: by 2002:a05:622a:190c:b0:503:2f21:6355 with SMTP id d75a77b69052e-508db32cef3mr62094771cf.34.1772704138150;
        Thu, 05 Mar 2026 01:48:58 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:57 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:15 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-4-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=1578;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=PxCok/m06RL8EtXvhxkBdkhQnDrY29ujrliEFTX0zGs=;
 b=QCvqamsbtXSXBcZDLP6JGVj8UEFEM6iTAPbY3uUtSzvfKRzoSV6fuCQYY0vBFV5l2El9SHEjF
 TWyDUqc5QqZANTVRm5sUT2Yqc9F9T6A+NHbsPYIv5LDxHIpYi7GFVTx
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: X0L1GzLJpqBUbLelKDNUAg48swC6H77K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX5zjGojijTs1Y
 SKH6fMcfNYQRchuEoofvJKmqfgrLJyIrf7y808ETZwooBD5cj11yjeMOd51K0umnsUC1MVyHKby
 7o5pcZptJgIAlIBWlcSeZPNycWGo9SaT2t3nP48dZn3BCOUUziuyDfvnC2QJTHA0dd29AELRij7
 uNzVOktgsIY/34eG3xhRrSiSuQt4FgGGkowdPSjBjp8uy/aM1+REIGT0y9/PcTzUlkPCGo9quE8
 66snPvECIcgp8a4ErLknSIHeg0N0uTghJhTGGNN2vc2ECC4ijLR/1yhoFJLkDmcZylGsQs7+1Uy
 aR92imcizywDh5F+nIC/cz/G5JMC9VxcDjBgq4ue5tCULpsXqPqsXp3+d4KmjtlCRQXjGy/3h9W
 MmUaq2p5olrZlUQo091SJLJuON7n+0Lomlxzs4gxqrg4goKEMrr/21oldeYoYPNgYXsrBvMBDiw
 QG+t3yQ2gwEFNedWMyw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9518d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: X0L1GzLJpqBUbLelKDNUAg48swC6H77K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078

Define pinctrl definitions to enable camera master clocks on Talos.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ace2b2a0bf2b7e574b0d43f98ae4624df03b477c..9da6ae131b9195885458ff4b7688773620af8e8c 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
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

