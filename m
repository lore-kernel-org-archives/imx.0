Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B931E831
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245327; cv=none; b=MNFw5Xs+hLnNTaqEQqraWamdSMIBNaJxTwE/gsvuPHrh+0aSN84S6jD3fjAb82mznX1qvKv2qlysGp2/qUJUEC1gLVEvGloDvoTKImhg5kpXEsX0WJf4yGKweXwQbrPHvtvD+Z5VA1vRC4bURmU+GbhYn7PTp5QuyOzpXzMQQLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245327; c=relaxed/simple;
	bh=D9IKkSDhQkZ4CBlACMDv5In+s6nGyoHpMlWQxtEa9Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TV5C5c6rQ57qZitIBc0ICWuwk8Axkoa8vGOElVVxLD40dEGnDRUOcDQ/5UdNkY/4uEMf5XacJA4iLwkuyF76jxRcQtmJkIK1ibm3Al2Z6X7RBxQuMoYNL3BA/jL1FX3yzLdvtpgkp/IH5ciDurslugiFsg9HGIq3NTL5KhZEIc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2BFa8vr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMRx8bfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2BFa8vr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMRx8bfs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBnvOO2677237
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/GB542IMmzWnaIj2pnKfeVpWqji25xL6rPmBPjh2hk=; b=N2BFa8vrDnXDmhvh
	6Ocouxdh10aJnRY2siGwomoymwu/WkRw8cvaAH/lYKhQu/aTvO1RVl3Sx5iHvAhL
	Ed1XEvlSZDPS4GMHdmmHtcSXkQv79bt1S9RU6LJQ524wP3rzW5nUGX49odwDxxy8
	tb6grplFGr7m3h5WcVb7QMM17oVE41izb2RismYrEbGkwuF5/J4+h410ugqA2+Bo
	51gtu6u1Z9WdzNy4aU62wBKgQ7U3k0YCmhEOsYxtatyO9s9FdHteufoNBQEIYBBO
	Y4kgJpOkPjMpQesR4K8q52wFZEn2GyQETTx6EF1oIdBrp4m7VVwoCBjfteFJfCz1
	jpqcsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd25tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7d66afceso2424020385a.3
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245324; x=1773850124; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/GB542IMmzWnaIj2pnKfeVpWqji25xL6rPmBPjh2hk=;
        b=TMRx8bfsTS6jTjocQuopVIrIxobn3+PFNW7fULQZ9tCbmbNLi3FNJepe/1EbXPDhUH
         KP+9nz2r247Qfz16Sw1SYMuEQi8aYDDgISLVsAYG0l0Ycf/SsWbEYoKtjPIaAD8prTNZ
         jCnScgHgH0Eq0mFG5aICM40NP3A0CTZplk3bSLG/+NenL1zxEPkTVP5LWXV72WV/yWyO
         ZnqGnM3SwRbBn8+1j3yk2ojTMcC0wBCrJdlp/sEXbUASnw8BjlmQ1HdEnCLlI47jhLbY
         xtBlx1g3K6oGCgFLoEq5Wts/XaCS0//apQ2dLeLXYpYRiwAmP3+gMWdO6N/6roTlWHQM
         Rasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245324; x=1773850124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g/GB542IMmzWnaIj2pnKfeVpWqji25xL6rPmBPjh2hk=;
        b=jnUAm18HFu9qWWFI/2LdX2KyTOMvk3CKnqeR2HSVfpJ2ap3SWMdA0Kd1K5GIrXb+kJ
         itsX714eb8PRqaadHAIoKt/57UBDt2l6NmJ4UzODoO1SyK6XJfbfZwhyjmJteM2RLzBB
         Am+cb5zhYnH1ylTCGMG1yDER7tWDkmTK4YfG4IDuqxkHs4ysVAmhWsDw8Me4zZZ6RgY2
         FblSVUn8gBGcodOGu7DC4PLQ/0sYEDm/26JKDqC763OWlb2a5U8U+t45ykwnFjEGsc7n
         P8UamheGtCHo4j2D1Nm2Jkz5DKxuJ0bMuG/nxfXJonJMVIlzvrq0m50PCOW4Egqc0HS2
         fN4A==
X-Forwarded-Encrypted: i=1; AJvYcCUk/Y5GgW27GJwNQoI2CVtllA3fIBh4IGG97ublJ28eqeSBlGDO6AqxGT/aYt5OL1wYtVU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhUnmJ0E0aQDO1AYikArTl/padjXeteMmHYUN99F4dYTSjswXA
	Kfxar1tUduquCUlvAq6BuApHG4VBFg59APfmzV3lBQn3wQGTJT2NMaLAkHgC2jfyMALeAXtOkRn
	rhMHtb0hci+tl4AAdzPX6uhsNE07LsktBSWsk/Vr1ZFAqUhn8yAf3gT0=
X-Gm-Gg: ATEYQzwg3/lImOV/Ore8WxDkROmT1VYYlaX6fqexIfCPYj8KfZVPakiJP2RUtYGnWbC
	LXu/NUYOB1PnSqJH5zyRLw+aLl73ZO8hdtpW/r2AvXBZpOz2IMo0d87yC/lNIdDKapiuLdCrOV7
	DEfk9M5UFhiRynMBnN/mpFJX3cpKsxyucjFB+3lM+sAQMB03DNbxpv6/ZAvfXLrzyf+9DFCt53u
	TdBpVvzsnilkV4+QSp80eOsYWYGuW1gfw8EZhTodGAZoX2rX1ZCzgUZGoNjaHwZMpMFY7ciGzAZ
	6xcNbEnUMYkV9mjLMVhlnba8C1+hVRsFkeul6doWkF6fiqriK4GQlfzPw/5zaRJc9tIemF+PAq9
	0GUh0wsaJPuP6PxKwVG8WZcow8SZ4+NMmnzi+NI7riG9o
X-Received: by 2002:a05:620a:198c:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cda1a2d227mr390678185a.40.1773245323421;
        Wed, 11 Mar 2026 09:08:43 -0700 (PDT)
X-Received: by 2002:a05:620a:198c:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cda1a2d227mr390670585a.40.1773245322571;
        Wed, 11 Mar 2026 09:08:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:07 +0100
Subject: [PATCH 11/12] arm64: dts: imx8qm-mek: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-11-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D9IKkSDhQkZ4CBlACMDv5In+s6nGyoHpMlWQxtEa9Y0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNokQ8AYwYH0RS4+Nbm67yN/nyBv0zU6Tz6R
 v49hE3+HXaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTaAAKCRDBN2bmhouD
 13ODD/0SuhEHzZqwnJhU7xI7M9xh3DKYpLg7HXx3ohOLk62EHJ6v+Ls5DdcFS3H01409qPjQWKp
 Z1W0+g0wxfUFwEwYyNx5gNNLYD1Eotl8+Oii3dMU3tIFWCE4PIMfo4iPp9bqttLNIEt5XVmMVXc
 OcSWcd0ex3pMt4s3DKFaWAYVBZFG5g0nZOfaeYqEpEhzyLdkO+iMHMOPMy5spDXmaq1ZqVO1v2S
 CTkjud1EguPQBWbKEY/LBKrRNp85SOIb8fEbZyUeBz/XE4c+rr7swVAh9BN/+p/n7YX8TlznN9t
 zWAmbL8dhqhNDp+BGVmbzGlN5wrtJ/47micS5AhqnZOb9kjPG7bVcSbDvd5gMOB7U4qIhbAuVR/
 8+wCU87J5bNa9o1154CcK9jUGVpBRqVUNIc0x0ZmyKNq49q8Qj26MB06xvDTxDTkS9lqv/yc9np
 pDjQC3ptptr+DiM5mXXHgmCNox1PpP7DmRTwdqB2MmwEoBP7nouO/Xfn2beTwrC7rIktscNhlou
 XEfFBMno4c4wH01HWazHZkzFqmQYxG9TfVF/ODJEj7s8YflADILAoXuJGbeLpIsKwfX7OM+TttK
 pLJlo6bAZTT/qNnL5C6mgv/URRZtJACq9phdh1+jIwOS5d2JOnKhftgmA2X1whrJWShEwx5sp6G
 y63PyVeIzPJBEwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX9v1aF3gkb1Wb
 4xfFOKMR/4xKdwwHhHEP/rsORtnJutNZPQEWtdujg+6qzUZe1u3zsXYR3HUkfXuuZNNgUVoEoS5
 pUGLOcKhnd1BNXrj36++hXVKMVNm/R5nT1WKMBBcefdOHAg5nY0ykg8NGC+QMNjSDwpnuECsDs2
 0R/ya/MjuqZSTfWZlv64NC5wIUpIkT3b4hnFQgG3C1ufznziZ0lQyPh9leNNPWXB0xb69TJnuQH
 mUv9C5w1lycN04PCpR9ULezPFslofExP4cdBSluuMTFk8UnDis3309gg4HpXVXocHJQ+RGD+R6k
 xPuj0GEBZhDZEzmCUpvEO6g+G9ZfeS43f6eS/bzmX0oqzmWlu8PbxzL7M38pf6qJzrpfzqrxUdw
 aelcwkXtFlB/5N3Uhckf0LHGQ3CE2gCM3+Q5MbtkBqTwaibCxGuh2pLK67PCaEVc/eAE7M8n8Dh
 TK7LE0tlsyU6VVIysrA==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b1938d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rBNLUka9-jj59pslBkYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LVElN2UeaTBXcS2lIv9xtHlo_nzBIRQa
X-Proofpoint-ORIG-GUID: LVElN2UeaTBXcS2lIv9xtHlo_nzBIRQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index dadc136aec6e..2595181504f4 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -802,7 +802,7 @@ &pciea {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pciea>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pciea>;
 	vpcie3v3aux-supply = <&reg_pciea>;
 	supports-clkreq;
@@ -814,7 +814,7 @@ &pcieb {
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
 	pinctrl-names = "default";
-	reset-gpio = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&lsio_gpio5 0 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 

-- 
2.51.0

