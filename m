Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FFC3E022F
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245309; cv=none; b=MTzvn7pKrelkCGHzv8xBUckp0mY7SB2Z8HM8QOfN2RqWiT12o/G3zxwcqxQ9ha/Km8/3G7pL4WUvtzYcetbUmO53q87Qrq+LGb5rgOvzlrGrNhoim+bRz9cSIN6BghUswYNbNBI4sqT2XwVI9I8/6KihP6qAY6FDZvF5GAMwHSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245309; c=relaxed/simple;
	bh=mgJychgJJSvJb5EPQ/SrXwpl21HswNU2SRWUeliofAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8fe+yFpF3X2edJzt3nRESMg4yDvzAlRh8PrTBJWazCnWBZ3A9gEr3Pao+5yczp/Q2EdL/5agAENsA1F6T86YYknzuPiSFseFCG363v1CbFuH+1pWsTKBqfQVDKFMyYO3/ZZfF4U4BN1lhLIgIPacsD3+kHvLF0yp6+lFCHFFDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7H7NwFD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6vzVlO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7H7NwFD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6vzVlO8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD82DQ4032746
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RWuLFkC+W8N6pgB1r3mjP/feOeH0KAiskDiUSNrILSI=; b=m7H7NwFDnXM019P6
	2S9wmIOsJ/bmZdy90AC0VFn6tuAzrpqk4d86WDdkzu5GQcrvRFcNI74aTa3ez3+c
	BleN/kqZNn4Y6HfrgeRMG5g0R+/nsugtdPvhajfy8+cKkZdq25c5xLCnxutt8Bpp
	7Ot9xeyAnVvOtKLRmtN6ib4QjlyEhVvZQt0P9ood9vtIIOoONVa5KgW9q9mpjTyU
	j2k3PM1HZoUd0vhiSqOeo1RR8lIjTowg4VTjJdOScJpyEnqsstnIHVim2QCScCr/
	s9LMNxnla9s3QKBH4YhDTSmvH/bsHsc6670QJMOhPHjTOrr1K9k3oIXOtMXjl5pl
	3OaalQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t8qwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffa63f874aso219616137.0
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245305; x=1773850105; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWuLFkC+W8N6pgB1r3mjP/feOeH0KAiskDiUSNrILSI=;
        b=b6vzVlO82f0kQipsJOPXHkhoyaEzDNpGvsOOxzffrBq2z7Sd8WLwAI8hU9PsEQa3pu
         hjE/7X9MegSmuSB0MDsTW9Pg02t5WZL4pEhLD1vyfHLxiufWWmh8se6L4hNYn8+isY+W
         YLCqUrUmMWP/CadRsqBPSNv5NRrHM8b5qfYjf0dWpGmc66xwnOnKMiEAHi7fCde5ZCQY
         xivmiSdjiCDIfXkKYMaWrojFddKSBRqS5KlQbC50wLi7d0MOYT9qkyi4rcYcotLyQCG5
         jL3vGOruTpmJti4bBJKkS+IIayrWGqp4LRJaIY0G+N98eC14Yx6W/Du0rHJ/lQh5Cwid
         MzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245305; x=1773850105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RWuLFkC+W8N6pgB1r3mjP/feOeH0KAiskDiUSNrILSI=;
        b=j2dG0E0R9varcPFuFG1VwOqJheLCrpZW5RYakIDfR8Ickjk7L8YpqbPwXqA6WxIQgJ
         9u16Y8D/oWTD6Mx3EmhRD/SqnRXxeQGABRGV1nfn6nCS6Mtf+vmRAM8P8KybT6LXi2Jx
         1n1Or545i5OG8jyoc5a7Bll4fBu8jp0NA/sqVXE8PhBiIfoiG3zTp3uIcSCyVzEE123s
         7XIZEBUIzKZ6zXpdkzXJAUD0dWozHYoIy4r27cB0ERJ3at2fLMtR/uUz2XCFIbY6XN7K
         efOjv5TpNrtrUQ4l4ocQ5A1v8MWZHxdN6yxzekK7GD3/J5HWdIzpTmxGXhA+OJ8Vcr1g
         YcDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4u8skHaaPGKGWNUIumjjUL7Rp827vMC5ij6/bgQ3St2d4EcKS1H4+n+uBu6AYI0PUfjU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3LwkeC7SF8ImBskarQvhjMsODWfaRpmvaueM5bMKCSMZwriqB
	86KyWcIbuvdk74M3TdR54cEqrWTbEo91A0I9nrSYVrwjJeXQpMNc2gkAGtJ9hfU1UAU5tqOcdPN
	F4anMPUZHne5WbTK5IArSyFPs2CJSuQM9G24dgZMxEP9QtZuepUAJtFM=
X-Gm-Gg: ATEYQzx8FP17071JEvX0MndGykm+fmK6IY+cX8hfbaCwYJl4ljhLxvgVXeg/r23tfCV
	2JCdTnQYY1Bb6oiz8atBs3kazEhEInmeXq6rDFB3KxtvgzNzkC1eS4wRRrB3RoFEHW+FpH2vMdY
	VC48nLIw447w28mPa1R09zowzzdFkfopjLV/vbWuMsMhUV4D+m570eYBONZhUB00z5y+I5ToJXx
	j2Cd+bOYxkJu2xqn3VYRhAvJgb00e6rQv7Nk6TtoGzBUT3Yjsm45IFVuBZS1k17j2Isi+mvRKKI
	j2j5FQ4yzA56W6hOm6qxe0TM/tgbPebFexOd+604PVrkK+bRigDUeA/IsvEmIkQ1DvG3r8AAfPr
	2bW0Q3XR9TvsID58R2Snocenh3MINVC1FW7pHgPQ55rg0
X-Received: by 2002:a05:6102:3ed0:b0:5f8:e54c:2f72 with SMTP id ada2fe7eead31-601def30fd0mr1283720137.20.1773245304379;
        Wed, 11 Mar 2026 09:08:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed0:b0:5f8:e54c:2f72 with SMTP id ada2fe7eead31-601def30fd0mr1283693137.20.1773245303846;
        Wed, 11 Mar 2026 09:08:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:07:59 +0100
Subject: [PATCH 03/12] ARM: dts: imx6qdl: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-3-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17359;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mgJychgJJSvJb5EPQ/SrXwpl21HswNU2SRWUeliofAc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNh/o4+c0j4ts7EAA2/0l7N3rDNVcAZIs/d7
 waOhWeowSqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTYQAKCRDBN2bmhouD
 1ybcD/9HZP+St8ZNRhRrYIOpMwOVQmrDPlPcwhGQtwWZXhCD2DtZDqaSMp9G8ON3GJPyYuguSU2
 PDBGW43OiXLLxsACFtP2ejZQbpxWRk7NGjGmNOQdRlQe+ZGUtjyXKfYHDK7utQ/+/s8M5+fJkkT
 fu7iz4A7yM1Lgb/H7IOCUOXtvNmFrm5Hlsc7WPjbcTuOoi24n6NN/+0YbmR3wa+K/IyEVVxnf24
 TZbM/w1yfdPlFKIzizfN/p8MuB9+ZEmmL/GJ9+WvfKIMCEjgUjB5PeIWouJH5Hwu6sClANjGCgm
 7R9rSAygR+B2NWsdZbeIboDwymmkZt4DK2JDW6AfzwE4EMOWNwRfcu0OMKRkqo/H8F0K+CrNAVs
 Eip+0fMVV0W036iPcs1+KHhHB8oX29/NOOEz/sUfeL3OUCqVKOcYtFIdZ7OMnTYdX89/L13eT1c
 r981tzJ2NaQbrxRBUGkJ/bX0aJa62I03xkMN/tbFtLOtrm3hH6sAC7VbBJf7nTTOt1iDxV470Mx
 TxfAr4OZkqomcvShZWymjNysLyVoMJIDFjrcm9JKOIp7z33t8TJd1tzmS1EapYiAj9G0KW31yMF
 PF8IVAHds3ND48F9jTKa+72AU9XYC5XkteUK1M2HAfXW0cj+EudgwwCcyOX2hvM99hxe+JxGfoB
 Hw0Pz5umXqndaMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: DaDlpcFIcStkzCuJvklnxtMofFsQ9me4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX7/Nl9rLPwM2g
 XLLB/r8Farc+3a5l31dKrv5oHpSSMiGd2WtUJdgoA9PrmsdzGldTk5TEpsToMo4m0d5fAee2SFE
 WktJQTgNbk6v9XaGmwGqPlthT9yraHhFFAVEHt/zUU6A0sH2CeG7MyTznpbqo0n8d8F0+uQQ47h
 obNzA3X3zDdf/rt9FYfGyS9A//k5oxx7SFixeKR0g2dozPXgmsIOs0piSG45RkM+hJWJrVLsgdr
 aZMJGRV6asLTXXqg3PBwM29Zp5/ZjiKzT8hl/+oEPDq/pu65l/+FcEJATDAJA7UyWXL0iqw4Bsg
 qKI/zAC9ZmTYUOmeZ9JZy18hwuX3W/YOmJ6b8F4WVLVBi3Xq1QPs5DwPWOdWh8dk5gKqTcqLRP+
 xbAEUh0E81w9/hL8WPRbadA79YCR8bfapG8eNqxxq9KW/15bMgeCbMfXKHi2GbOuW6/Q2HJuWw1
 JgfKT9sw+/lyV56i8Gg==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b19379 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=50GlOtY98KW9GriB_zcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: DaDlpcFIcStkzCuJvklnxtMofFsQ9me4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi     | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi          | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi         | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi   | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi      | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi    | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi           | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi        | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi       | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi       | 2 +-
 30 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
index 9e97ef5e43f2..5e33164e5005 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi
@@ -212,7 +212,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio6 2 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio6 2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
index 01d4ea20b13d..4faa7b9c50ff 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi
@@ -308,7 +308,7 @@ &gpmi {
 };
 
 &pcie {
-	reset-gpio = <&gpio2 16 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 16 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
index d7c2b30aecfd..1dc4732bd3fe 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi
@@ -270,7 +270,7 @@ &ipu1_di0_disp0 {
 
 &pcie {
 	pinctrl-0 = <&pinctrl_pcie &pinctrl_dhcom_j>;
-	reset-gpio = <&gpio6 14 GPIO_ACTIVE_LOW>; /* GPIO J */
+	reset-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>; /* GPIO J */
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
index 9f4e746beb2d..511b3b6dc5e3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi
@@ -732,7 +732,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie_ctrl>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	disable-gpio = <&gpio2 22 GPIO_ACTIVE_LOW>;
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
index beff5a0f58ab..1d4899f8aec4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi
@@ -400,7 +400,7 @@ &ipu1_csi0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
index 9d3ba4083216..46e3b2b18aee 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi
@@ -504,7 +504,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
index 7e84e0a52ef3..dd1201b628f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi
@@ -501,7 +501,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
index 81394d47dd68..b8a1e47d1d3b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi
@@ -547,7 +547,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
index 6136a95b9259..57b0d635bdab 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi
@@ -456,7 +456,7 @@ &ipu1_csi0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi
index 9c822ca23130..b29c26b729fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi
@@ -359,7 +359,7 @@ &i2c3 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
index 552114a69f5b..198af79b5490 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi
@@ -413,7 +413,7 @@ &ipu1_csi0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
index e9d5bbb43145..4dafd225a34e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
@@ -560,7 +560,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 31 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 31 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
index 3df4d345da98..a03f422d9a8d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi
@@ -528,7 +528,7 @@ timing0: timing-hsd100pxn1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
index 87fdc9e2a727..862f44967c71 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi
@@ -326,7 +326,7 @@ channel@6 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
index 099ed2f94d61..8564eb8e7cc0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi
@@ -333,7 +333,7 @@ accel@19 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
index cbca5e58e812..0a2a9b9db1fa 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi
@@ -313,7 +313,7 @@ accel@19 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi
index 4e4dce5adc15..37f7e15d65ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi
@@ -292,7 +292,7 @@ &i2c3 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
index 6b737360a532..4755bf2bc65e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi
@@ -321,7 +321,7 @@ MX6QDL_PAD_DISP0_DAT9__GPIO4_IO30 0x1b0b0
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hummingboard_pcie_reset>;
-	reset-gpio = <&gpio3 4 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
index 3069e1738ba2..d113130c1770 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi
@@ -517,7 +517,7 @@ MX6QDL_PAD_EIM_D24__UART3_RX_DATA	0x40013000
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hummingboard2_pcie_reset>;
-	reset-gpio = <&gpio2 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
index dff184a119f3..396b621487ce 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi
@@ -220,7 +220,7 @@ sgtl5000: codec@a {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
index c771f87b10df..bdc8dc6731e0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi
@@ -743,7 +743,7 @@ &mipi_csi {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 13 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 13 GPIO_ACTIVE_LOW>;
 };
 
 /* LCD_BKLT_PWM */
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index ee2c6bec92e8..a492bf4f49d9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -240,7 +240,7 @@ &i2c2 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio6 7 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
index ef0c26688446..bbdb77e6fec8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi
@@ -731,7 +731,7 @@ lvds1_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio6 31 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio6 31 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
index 03fe053880ca..25e6cc3e9ff5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi
@@ -639,7 +639,7 @@ lvds1_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a3c2811e9c6f..661f96fa3990 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -218,7 +218,7 @@ lvds0_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio2 25 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio2 25 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "disabled";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
index 6f3becd33a5b..33ebb9320395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
@@ -399,7 +399,7 @@ MX6QDL_PAD_DISP0_DAT19__AUD5_RXD	0x130b0
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio4 17 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
index c39a9ebdaba1..f18652b2f6ca 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi
@@ -277,7 +277,7 @@ mipi_csi2_in: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie_reset>;
-	reset-gpio = <&gpio5 21 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 21 GPIO_ACTIVE_LOW>;
 };
 
 &pwm1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index ba29720e3f72..5d379b98d74f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -754,7 +754,7 @@ lvds0_out: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
index 7749074e438d..13d092cb9961 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi
@@ -394,7 +394,7 @@ MX6QDL_PAD_SD3_DAT3__SD3_DATA3	0x17059
 &pcie {
 	fsl,tx-swing-full = <103>;
 	fsl,tx-swing-low = <103>;
-	reset-gpio = <&gpio4 11 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
index 9ff183e4e069..1860e5a525ee 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
@@ -651,7 +651,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	host@0 {

-- 
2.51.0

