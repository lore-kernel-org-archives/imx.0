Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBFB31E85D
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245323; cv=none; b=pIM7Sdcsl0GHopBLvyTV9ZsMNJN+vig46Gw7KrNM0EulGAtKz8dy1TPKUpbdpI6cWtJKMLpc0fOo+Ib3RiVymi9JVSPZQaNmG+BCYLW9/+5uSgsXKjUVKJ4m9qMdnLpEU7TIqlVvChoNIw/SKt40dsy6jbzPAiulZ/SN02UKSuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245323; c=relaxed/simple;
	bh=PyYv7E0JsZSy3jSwWQnOrC9HAY0vipOc/UQiAuEos0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/GVLfkf+bzbPrcLqoG6SIgiMx+IXEXHWVg3Y9NyqyyJpaj6Xhfh+VzZy26w9/ng05rq5RGDR+4DN5fNMNXk/FvPT0Z7mEmH/SPVVzYISQxfkwq/S+YJs3Xs6V5otoxj78lygx/UA1bgehU6wwpPeZMAn/vmhxFhZeqMwocnPIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=julJh3sC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCYc2ei1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="julJh3sC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCYc2ei1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvAAK2622064
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5J64OTYQKZnoTM5LTlEOWSmTsdwDHhavurygf6nwV0U=; b=julJh3sC9YoaH7h0
	ikCTK9UCizHoanbBfXxv71drbsIcgu0CVuH5pFD+2vRdlF6XiI0q2bwKQZVcyFFR
	wc8UEgHCryZHhEAWByiNX4aoI121M6NPVf9YUTEMJgQT3DyvXXpeQfr60rT9rphp
	0ZDF4jsTc2+vGIm5SPVc6TJCdhxZ/iZfjpsfhRXb6B30+CoZzg9an05FMx4DSKWG
	XFytTFXvZKpbvTUefsizsbF7VhNI6e2lU8tSQABNlA5WXoXXMcuuX46NfDvKDXLU
	2UDaka/cuYuZPKNkvpK7C2685zJYoi8fe1II5may+/ZVgorxfd0PoavzlkzKnsxX
	nOo7Mw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h1572-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a09295650so450886d6.2
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245319; x=1773850119; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5J64OTYQKZnoTM5LTlEOWSmTsdwDHhavurygf6nwV0U=;
        b=WCYc2ei1cbeazlpfZamtUrOmxBHBcGo6e7blisRvLtWXZwURYjUqKKs+PRVCvrEB6w
         k3KDCsHhpUzB+ChF3tioQEZ6cJESOc3eYuNs1hW0tnAvzgmzaCS4NRY3Ur+3wilU0v2Z
         W2ZQq9GgFrmsM3lxuL5XueU2CWI+Dru1mV+DhYVjBsy/QRelufJ7vHKmdOzX7LzeU0/i
         T4NLN8ES2LAPGgtg0nLq4bceTzfwej7rgR4yFBmWlmVGsqNAR5fX5MA1lE5WRRRneNHP
         uH5mG524M7KXlE86fIfAR9tgkh/dVwJIhCHZk9I8IuwnV8lO+3h1STVvHVqL2jWFIRcz
         3p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245319; x=1773850119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5J64OTYQKZnoTM5LTlEOWSmTsdwDHhavurygf6nwV0U=;
        b=ZPjgMD42Eyofdwdh14I3oEgoHuvBAm/IUkiawYOVB4LDe2B9Io5IA1kOJ7J5G3AuM+
         znwDNaIzlcXS9cQgPLJhIjzDOAD4qiLzScsjLqNo+A6A3OjvVOHD3CBQ2alxTk+Wdzil
         gbjAMUZe3vHiRdi5r1CHBUSwTFpgzyjN7Ky6/dLbF3iRLAfM3C/HZQi/lahwBlU/97Fa
         gpOvpe1BQVx+guUDuvWhJDSdFvmNKyAtxsAbfT88kySibERS3nr1Rxh3oeaD/s5bsc/i
         O7VYk4n3mgGGhl0Jl7CNYWjTMqJNd0jXMm7y6I2o0CJ7QbvrSnpcrdUmRPs2PTo4RF16
         uAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZiD7JtLjy+RTa/ZvJ0qek9TDZ9AFHC15Vg+MAe3lYzXD81xvl91MWyXb6zooOvGoz55o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl5Ny1A8wJDV87GyARlXf5z9+PLvvR8cYb8SHGRXUDN1MS1+1e
	4vypBdpQvETJl+qabiHIH0ogQ828uMadRycYhKXRWVn+XWg5InzhZOWj2yhV0HD8iViw7XXDrmB
	ypgk0ci4TmdkO+qrwHM6PL2tMNd2GtSOIDKZ3bFfHOm/XmeR6H9gVubU=
X-Gm-Gg: ATEYQzyAQ51o5YMBHrkIJ7ojnf3l19FO72VKx0CQdYo4+2IuG65tQxiHI29L60yabej
	1IVCa9fzSNah6H5wVkAe5N33+gKVPmz4xbuZYiZnVAZdRMXZ2a+dJ7IKLG0g8r5vGPRtuX545UZ
	3BXXLLMT/xMGn2E8sXI72XgHQhHcw1s1qdYQIf9bpsbc2cisqpbBvt3uj+NpDWPaOpUlpxchCye
	bq11vKSsIeadDNbIRSnVeyyYHlIQEbsbACdXR1ufmnHixXAfBzX2WV7YvsRtI9KlHgadA5tu8sh
	EJ/kWoD1DPwF3xo7/OSTJCxGwGDfBJ49sIOaGc2q62DnCR7OofTheHMEP5LXKOB/5Bzy0qxhDwe
	aNft0lXAXNfveEw0cKB6/yryTLV2QjcoA57q457fkgICl
X-Received: by 2002:a05:620a:4551:b0:8cd:9707:6315 with SMTP id af79cd13be357-8cda19ba6a7mr365425385a.9.1773245318958;
        Wed, 11 Mar 2026 09:08:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4551:b0:8cd:9707:6315 with SMTP id af79cd13be357-8cda19ba6a7mr365419285a.9.1773245318235;
        Wed, 11 Mar 2026 09:08:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:05 +0100
Subject: [PATCH 09/12] arm64: dts: imx8mp: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-9-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11995;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PyYv7E0JsZSy3jSwWQnOrC9HAY0vipOc/UQiAuEos0w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNmEw6ins58ya7DrN8YfCjMGhahNZRBxnGcK
 rBbmgfc3WGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTZgAKCRDBN2bmhouD
 1/+XD/98zh+uKEFleDTYxS2olNWHXyUR8SbQYP+DtbtqT395O+nq59ZgN6p+51K7ECyn3kj9qRo
 5zTQVzlr8AcUI1JgEjM5q/Bm3WBReaTBlWbINmercX5GrMH+a+wLR2HdOnEN9ubJ1wIPZGwcuLk
 pokB4YeB0fMivztKgSpRBr7bu95la7Oup59BtynG7hyKWsT2V5moFktd/UNWgZD+R5I02c+1897
 Hg5ZLGi662YwwEv/7l9V/3fbJUACkCgJARM7QO6IWc2RyMrNQuTuO9+mZRsnivXbhF0s50ISfHp
 Byjy1p2q9OXgj0d/L7Zb6EVplDLo2FlmBW9XzuemuOz7/4FORQqVhWzvVdkD6mow3s0gT6VG8np
 oy49X4vedhla34DdXXzimRFccrb3d+yTFoLmEFGY0xqkuMVIXNokwDZymbBGxi7n7NYedfKaz35
 9DwPtNRz4TAG9wZ5M+a5vs7hFkZyifsA66g1JQGAp37f/juFcNU1QMi80oVrZemaYP2IPKB4r4Z
 LtFADI08Mn/ZU/RZZiyyROsjq/QoJ36WruxGLyZ3WfZ8lw9sTdtUQKduYUTJkIHNCPdie9+Ssjv
 c/5YlkPiGCn0Hb/heY59oryh1nJMTUgHeLII/30IFLSz6gOMjkiqcfwu4BUsTk6E1r2eelj736E
 DPt/wLU/uje/AXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: stU76lBtARNgXgGTuIXQHfZAauPEttnD
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b19388 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cw-Pq11FuC5Uhxb-6mwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: stU76lBtARNgXgGTuIXQHfZAauPEttnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfXw8aPfq3tDF4v
 MipCjV5dWrwvib54diwCfv2d6/E+rZbb+eWZJm29fogH1n9c8SyTa+7mgtbWe1U4RR7O8d2EPfH
 uJtUiFEXS860gn2/uOgx5WnKjK/XKp6NdGE0ds7iVzGcMJr4UqbIuMubo8htDASwT4/mpMJ7H/i
 EWdj//TdzkxzBW1Razm7oiBB6Ds+hd33zYpFgd3V5wuDTtYzYPEGJcuUZ6gq/M5APITlxqim4ye
 zkchpPFYsMva1oT/FNu6SMbzlFw8mZfULwkyX53Zdft+TZp0pR8y8jT0r1rQSQieSBPDG7VBwaH
 7ZOt9iTc1a+7P/ASpwVNtSIIqW2n5rZBm0s9ZHGUDpdqpcvBL0C5E0irAQGMzr1H4O8Al9naFDG
 CESDfcUVIjGe/sJIhi/v7Ust2jjpVEE68FuLb6zKiqfLhVC56Ns62TmYfG17Y7OWpT8BRsBxZ1Z
 9PREdNxgy1rur6cwRaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts                        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts         | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts              | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi                    | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index f654d866e58c..7d7d96f0642a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -568,7 +568,7 @@ &mipi_dsi {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 20 GPIO_ACTIVE_LOW>;
 	fsl,tx-deemph-gen1 = <0x1f>;
 	fsl,max-link-speed = <3>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index 31c33acb560c..001430130e01 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -530,7 +530,7 @@ dsi_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index 7e46537a22a0..bf6c53700057 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -614,7 +614,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
 	fsl,max-link-speed = <3>;
-	reset-gpio = <&gpio1 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
index 3d18c964a22c..68a481965cf0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts
@@ -237,7 +237,7 @@ &pcie_phy {
 
 &pcie {
 	fsl,max-link-speed = <1>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;	/* GPIO J */
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;	/* GPIO J */
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
index ef012e8365b1..78f0ba14ea5b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
@@ -296,7 +296,7 @@ &pcie_phy {
 
 &pcie {
 	fsl,max-link-speed = <3>;
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
index 3f1e0837f349..1c8a380dc01b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
@@ -310,7 +310,7 @@ &i2c5 {
 &pcie {
 	pinctrl-0 = <&pinctrl_pcie>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio1 1 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
 };
 
 &pwm1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index aedc09937716..fcfe89cb76cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -769,7 +769,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
 	supports-clkreq;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
index 36cd452f1583..a09b2dc34429 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
@@ -34,7 +34,7 @@ &iomuxc {
 &pcie {
 	pinctrl-0 = <&m2_reset_pins>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio1 6 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
index d32844c3af05..8e87a9543382 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
@@ -57,7 +57,7 @@ MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0x0
 &pcie {
 	pinctrl-0 = <&pcie_eth_pins>;
 	pinctrl-names = "default";
-	reset-gpio = <&gpio4 28 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 28 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	root@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
index 2173a36ff691..393cca39a0d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
@@ -187,7 +187,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 2 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
index 86b8c5af4153..254d6930eca1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
@@ -243,7 +243,7 @@ ldb_lvds_ch0: endpoint {
 
 /* Mini PCIe */
 &pcie {
-	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vdd_3v3>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 0fe52c73fc8f..7a4681578b24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -264,7 +264,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_vcc_3v3_sw>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
index 9317e62304e3..1c2e5be5ed9a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx.dtsi
@@ -123,7 +123,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
index 76020ef89bf3..89681b21ed36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx.dtsi
@@ -154,7 +154,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
index 5eb114d2360a..90d15340f935 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx.dtsi
@@ -166,7 +166,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
index 7662663ff5da..e37f580fa90e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts
@@ -680,7 +680,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio2 17 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 17 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
index f90b293c85fc..efdd4b0231af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx.dtsi
@@ -140,7 +140,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
index 2b86cc62a41a..fb12bfaa9b77 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
@@ -237,7 +237,7 @@ &pcie_phy {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
-	reset-gpio = <&gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	pcie@0,0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index d31f8082394f..0f5f924b6a6d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -801,7 +801,7 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
 	/* PCIE_1_RESET# (SODIMM 244) */
-	reset-gpio = <&gpio4 19 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.51.0

