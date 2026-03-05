Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0CA377578
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 09:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704134; cv=none; b=EQfOXM2islsN95lJDdE/li7M7S4LvyFfvJbgJoesP7ZjEmaLfksjdD+rTf9VDA48w1oDNkA6VtKQaTo+auElXpv+L/hV1wQoJlFNI/PONtMDu1SEBx+W5Ul8O0ZhD01tmIhgsqXo0xo20HTwVKG3z/ZbOAbqqzjXmQl8W2DFUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704134; c=relaxed/simple;
	bh=UHkKZRKX+Z5mrmHc9PqOylVQatIA9vArdG8H4u12kKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwwOB5h/8zQzFc38i7CruyUdnRhIbxbSmEXfRFeKz5eJYUALZKrHVGlZlhUmq7ZnQYIGKhUqwsIOPRdMbjZJmVdnx7SUBcNDU3PZqTA4hPLWfBhyviusVhSoOXc7KA+u6v3/55U7lQzTKnXOxlbx0EcadIMtyx20tr4khiI/8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmOAzAJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CfZBkSAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmOAzAJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CfZBkSAe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AM42865886
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 09:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=; b=dmOAzAJ9ZrOjruOE
	sdLdWneq+TWsBayn78t5h4CmBYcmL66WFcTik6lfAhPJ5NJmASDZPDuUeB+U1nV9
	CuSPKA59VK1betskPcR/5Upm/GTJQM6hUEg4ZLH/U7q7WdKPmPr8dC8d4jqaqjcZ
	RbUbjrQ4Na9fvGpFnh+xSxV0zOZJHmgq6uXutykT3oEleTE/wu7agrxA7W/cbA+Q
	25OFLCIB8LQzuBcNhst50BzImrHflSazqK5AZeBohG3FA5c8WXTZYm32RuaDV1ad
	5cK/w0RfnaxIjP8sp2HA4cI3bYfU1dLOnYHqPmiezNBt0iNA5uoXmO9wZkKKbyDp
	4OtYOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk17uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:48:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506afabb8d3so751167531cf.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 01:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704130; x=1773308930; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=;
        b=CfZBkSAefMF1nXmMmeSmEdAYD8oUby2oyoxcnytC2DoZluFZGVu7aejmWHBs1SZmwz
         XXShp5XHKepbVKMZ72tqdNBbkF4BfAjGq4AiZzQU04BvdmFJCXlycawEbuiYXsvEu/8A
         UlDQ6gkGaPuSHi5iI2iUCq+vc5gBKqMnVUwIoYGC3LNlnIeDrLFsGz8q8PoIVRhFrqGx
         G8Bs7uTev9MgNzHjIfk4poZRa0L/8Y/D79zkvzqFcWqi7nGg0rw0w3gD+Tdd5gQy7y3j
         H2TXqqpGsOqUrSEhCw+asU66gpCM/vHsLt6Fpz3eIXfxrxHk3Z+kuHdhNvEjFZ/MdpVu
         bGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704130; x=1773308930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiE01OmyyEcs6zk7EOhDkZHfhm9tePHQG31k/jipSjo=;
        b=YBkKVtJaoIDFf26sXXil37B531s/21JiP/VNJhjxJDXigjiK/m/iHL3c44GRQb4PbE
         ywN1GtZFZ0P1MkisHdHeo0Sy5MbqYQYGMA4VRGa5KlkDtdWc+PK6up/DM6cFRkiafALA
         p4XKBOH+naR4oreUkaUDkn3IAdzuMrYMAtKEOwY/y8YiZNZnQCwszrEni+OGZGq/gmt2
         WkuFpyFjILxzOKhHMFyE+wu8BzqO86T4NeIowY8EdvCqIbJ7zAuGGFm3fJq37jZ6ecmG
         XNGK+msq3JzzJM+nYo0LoM1lZwx9XHEBTBpRe4/pM0RwH6gy6jT1k2nG5PhtfE/JK1xn
         Vl+g==
X-Forwarded-Encrypted: i=1; AJvYcCWjS1HDX8gPjGECQzxHDzrHXeoLSUFXKn1oPU1FclIkICoz9SVvr3Tn5MVQhMfm7JJhB5U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJM+6Ts62q6r91nbqvuXuKUMWy4qy3QJ3WmmzFQbtEowpsCx8s
	zaoKGXu0mhPS7m0SJ8Jz8bB0q3uPqYYcr3G6ioqNmHBi7H+09jKg/WvbjxPgqZyJ+hsXsQ9Hpsa
	2hjELbngIMCDbRzBOQD5Pw03dA++DrtgulC4U1ehxvPvC0jFVlxqD240=
X-Gm-Gg: ATEYQzwS7QJ3uVKdYBat1nv9sHs/ta2JEnlrCPz4plvY88X7KM/tq1I3s+p1HagUVpG
	lP/3GmP5AmfEqXDS2uKlKpsRXokKinWEXX3HB/fYISo2vL3Fad+VlHsQ+0Jkm8s+4lJPgek7D03
	+TkTnMdjiyJiLG6L/jxyze9DcApdlioSa6Qjo3EHIorb6uUkNNqr7oz6VKomjIFmPsQAWys5Mxq
	j9z8PdI75vQBkb1yeoC1wAI55peHzGIRFJl/51X7qyGHjJDQflpuTsBxjCLAhJDx0oe/xihCQEh
	a2PN9MAERFR4cwt9+9AKJ+at7euRAf82yInbBWpZk1vybyxhwefyymoX4/4vjut8wlTS8BW6z9n
	MnCQTew5odtvqJISk56EBLhmDmxrksTFxQd2EbJTDqqBqPZzGH4iXS4WiSYwxM9WmwNtgqJj7sH
	7q4lM2arPaAWcd
X-Received: by 2002:a05:622a:164a:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-508e6946118mr19329581cf.21.1772704130398;
        Thu, 05 Mar 2026 01:48:50 -0800 (PST)
X-Received: by 2002:a05:622a:164a:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-508e6946118mr19329321cf.21.1772704129986;
        Thu, 05 Mar 2026 01:48:49 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:49 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:14 +0800
Subject: [PATCH v6 3/5] arm64: dts: qcom: talos: Add CCI definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-3-38ce4360d5e0@oss.qualcomm.com>
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
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=2250;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=UHkKZRKX+Z5mrmHc9PqOylVQatIA9vArdG8H4u12kKg=;
 b=JXkhUvtpWwcXpsiIO4GJCvO2jqVyJnJtvoaiDr78rNtQppEPMG0cyzhxpNpFzgjtrNVT6NBAN
 vP4TBSQjCTJBSEg3SgjuQHxLSvbTDJZF12Hfbd48KYEHcVEgdryAtuf
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: LV2LX97zjlfvsbELmDjRYUXmkGUi8-PT
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a95184 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=szutk0iRDVHniUSXDBIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LV2LX97zjlfvsbELmDjRYUXmkGUi8-PT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX2uU2FBmGg3k4
 WP/futHGGwNfEG6NwYkD0KvhEZlLGD7fTQ3KQ+STFx2rEVPzu5Qhqp3OAXk44BIjOhlTZKsqdxG
 K3J1mM5Em3S5rCBhBxUuCeyvylEIlmeWZtVode0wbPxEh5/YqfvPGIrbL/zqoNys4IXTAZk0A59
 WBTlzzCIL1ZNokxH1k7JMip4R3GOAOaYI+horYRIcwEKhyiilHWUOUykWeDoC8BH/Xzx+kAnFMm
 47n4uQLDOVL+PZEB+etARj1XyJ/4iw0z6fPF6PVglgbNvNYT6EuUBYvL1A2Emzb+Afe761F/6cW
 Gn6y3KT+zEpqtOX++6PbYHjFhcs942gv3G2nqlPokOvBHHOlLr0fB/0F2ck6IhUtlnszFbUJwYj
 osnco7FBbq+CjoKCDMqLBaSN01MMcwGnc24atRhmwFtfNHXCpGxU29yhgYqJKkDwPnMqm1nmYpy
 6v4i2liZqMImmoOoOhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078

Qualcomm Talos SoC contains single controller,
containing 2 I2C hosts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 51 +++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 054255a65c7fbb51e6c411d10252270bd7ef1522..ace2b2a0bf2b7e574b0d43f98ae4624df03b477c 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1553,6 +1553,22 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci_i2c0_default: cci-i2c0-default-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			cci_i2c1_default: cci-i2c1-default-state {
+				/* SDA, SCL */
+				pins = "gpio34", "gpio35";
+				function = "cci_i2c";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3789,6 +3805,41 @@ videocc: clock-controller@ab00000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci: cci@ac4a000 {
+			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
+
+			reg = <0x0 0x0ac4a000 0x0 0x4000>;
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sm6150-camss";
 

-- 
2.34.1

