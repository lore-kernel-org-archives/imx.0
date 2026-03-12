Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050C401A07
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343099; cv=none; b=BpQPP1oMtbBL+h9K1LCL1P75biclaT9gLFDFHE/O0sAWwTjIaA8xF+PoCawPMZ/mpg+V+OZzTzWfUGrM3GlHz1DN8qD5TZ86nPFHuzf1UFNLf84U7dbvjmdok9C8tWnHXOLyL0TCo2DP3HtMVIdxLg9lILDc1t7rUKaUEqe5MJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343099; c=relaxed/simple;
	bh=FSagZpYeoU5OgfV3chNg7NHZFc9RhUFrhY0mXE5gWa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsnXeLuYqUaL6oZtmO4XGmKTnmj++hAlzqQ26FkH+0TW7NpzsDcs3BgwQC51CNvtaSy//hYkQ37o1537xtuf8Yn8ALpM6fSMDHm0lhpYP3fsvJKm+0Dsq8PMfVKKjbPePuBgQfNtZRxqh5XDhKGnSshShfABNdkUOdiDCFYPsBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9REE5/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PlYRcjRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9REE5/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PlYRcjRy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9km4P588071
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqyayV7Gg2halaaZ+cLaY6eAuvoXnGLGXG1qkIwL1Hk=; b=Z9REE5/i3eJdBmbI
	NwjL2mFHLiRboIcapwNYLOa0x5RwSrnqekPjC321oeeqEc0ojCeNGXzFt83GQSkf
	scTsgUK/wzA1jbojuY1U6nuF2WfANvxLsx+O4Zuff0960TZ8veZIG4r1jRmm53bc
	SOTp+4KoP/kQWV6DPxNdPFvyxThJikJe0lvQ/W3QipjAN6bfUZMt2OZvPabxSYIu
	TgpOYfHgjR3V4WAbsQ47V0NtOU8xQaOURfZRShJoYKClz3O1e+KcETefJnmUEKBj
	OY8J11XmrWS7Z4z/jT//GbYfu4A6wbwn+XdSTJTxJ9HQ+do1aXSrWfqLRAYUPZbK
	NiEMmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q3a76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81be6f05so812123285a.2
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343096; x=1773947896; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqyayV7Gg2halaaZ+cLaY6eAuvoXnGLGXG1qkIwL1Hk=;
        b=PlYRcjRy17y3g8dI55CmBz8IxE5h4S/acygt7RnWlZJyCE8vQonZ8vN3iyQrVM3AL3
         kvMrzwkh+hn5AYWWOm83zwxrab7Ek0xTILTBwaLRRmbe/R2VTf5GNoLpx466tRmMxb47
         q4qJxgvwjDsGtka9ZLzZEniV1Nww35IOHThcyvVwZlOTLaZxzVBCk+VOk8jOavED3cmb
         uMBTtAODG3iLdmpq//5lnb5/HDGRbQG9BhqbGKr81Mfst0jzBbNgbZRvOX0S4LR1kI31
         IPkGfRK1hB8GjPJ9q+jXU4o0MDg5c+OTzWhWyutxBmps7NoTzeV5v5Ao9Y7ZzIHZXAeP
         g7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343096; x=1773947896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KqyayV7Gg2halaaZ+cLaY6eAuvoXnGLGXG1qkIwL1Hk=;
        b=TOxurk4rnosKdurDRi6qt8ekfeW4fv0YbEnl8aI2mxjfKpSaCDn/6zUGP1KfUw6/RH
         F3nb7Xi7JCH1d6D8l5a4AZaMpPZDNhYciJSsnmmib1b8ynNB1NqmU7701kptps36CiFe
         7SiQ8yclgzElTDiMAHHvN3q7nAFpWL7M0qSb6iVPm4FzTMGRaiEWRX7HzfZHvjLC+bHI
         e/PuR3ebBS/wvm4AWSx+QKV+Ck+UtF1j2Swm2kcMQYvzcANugTdFiBusB2Utfxp2zMgl
         LGeKj0tRHkugPnKB5jb94Nwyi2cBjxYwj17ox/XGdZezLl/PT2hBSzPOc3a+fPbgcwmp
         Yfmg==
X-Forwarded-Encrypted: i=1; AJvYcCU1lA642L+oEcSOzubXRNOo88WkYc1Ilq+TCPZboVy4ElvyUzfGbPfQHLrHN4hKILBs5Eo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5gF89QgmcMiOUyGT5vb825sgCDu9cy5fg4C616LZ1klqwukcb
	nz5ph8fd9pqLpHy3Sxqz43y3ijCtlPhdkmdRoZiOqOvSyjHDHKZIHVIJlvgwPlagUcr5PNZynD2
	UI3K4ouQwET8E5O7veywA/PwHi8Inz8juinEx08Lf45ZzTpmZAI+Ggqc=
X-Gm-Gg: ATEYQzwtJytZ+kLd/h+WaFaFT9QI8gG8JsRgvdmFxp/l2H3pUBuwm4wjZfIflEqpdbn
	vmZf2AEyB1FjxV3FuHRh0qwm4ZY2iSr4l8cmX6lAYHqhNtPSs9Rlfamdsjd4FQ6vsDIMmWs4sYL
	ZjP+c3qDAyGDDvMHFWnXTDN6CbzRZJFzqVcqWpjsyCFGCoNWj9CnOmUXQV3Q2XRdjh9UkmP19ZQ
	m1I/I86zcuDAnWEFjs8sxzgXIbxVuSOJIe4mFEF/BCIBkJiLgQA8+7cZcX3geHeUIaXbr+iM2jJ
	K12AhXDG1qhYsXgdbtJqzyDyWGuRBZZMXTc3Ki+YbuuiRDxj7fZjy2TjHnujznhHPglj6q7YOUA
	u5R16WoWfmigojBhGVB3c607v6w2tup6XEKCvkIzINq4p
X-Received: by 2002:a05:620a:7085:b0:8cd:af31:b416 with SMTP id af79cd13be357-8cdb5a75623mr117967385a.34.1773343096433;
        Thu, 12 Mar 2026 12:18:16 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:8cd:af31:b416 with SMTP id af79cd13be357-8cdb5a75623mr117964585a.34.1773343095965;
        Thu, 12 Mar 2026 12:18:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:50 +0100
Subject: [PATCH v2 03/12] ARM: dts: imx6qp: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-3-0d5040eb4a1e@oss.qualcomm.com>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FSagZpYeoU5OgfV3chNg7NHZFc9RhUFrhY0mXE5gWa4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFjEgkzNjNpQE+L8JaKg45sCAUdwXfblhUwb
 vIBC6xW9DKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRYwAKCRDBN2bmhouD
 134eD/9q/OOzdFfoEz2Oryw39dQ0nJxRBAuXHBSl4fQLO1RiEHYLWdoql7X8N8T/nVWrMSrK7DV
 vJuyUP+3aIKnYD/u/xPHJOhox7AsJ8t9yhcrzXgdtfAiFddQ87bh2+uyjut8zB7cnB/K9VLgYz2
 qkdNJoABJticjlV9njxiSrmNX26/1ibs9nARqx1Dvk6knhncXJjQcXUtvDtCyyYlLflDvCYKSCN
 GMj10bL9SSu5sQVSeGpUqN60TF0tiUJ5mbJSjm+wQCUrI3+KJjpp2yeKsi7s8YnJxgZjcJ1gl3q
 WV3bKqrXkVXPDn/pmzUc195aChLg7qJGmS0dyVJSmENhroqHDNe9MTWAtXMnzUSouTi0Lzr5FpA
 5rLpfHBP/5O2n7CiE72DtAYtm5M+IpvSbZO+DZ+DTgBD+8u2d7iDbtWNMJjFe2QusVNl3bSKYjg
 GoaipT89gqWyrHCVQCdiFug+Ha/W1i3PrVyS3qU1fNFuDWdMamjtsjvC1W/rMJ+7JDRtJDeKqCS
 LW/tbKw30xDHkyDXt3o0oMmmTfJKc9atkn6Yu61DSs8ZnX4tBj10UFhZQLe6+nzVRg7k7GG9NLc
 +qPlvUs8SLcvaekZT8TXjimALzVOZt+xyTnM9l8K1GbYF9g3nfvGwSL+KPcYUt7n9fYwevGc4Ym
 Y6xrS/HHXJjq2NA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: oHW-zzRWjw9vppb6aRxyGerjWsTtUzHC
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b31179 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ujzWiR-heZmsqz2C2nEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: oHW-zzRWjw9vppb6aRxyGerjWsTtUzHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfXxg8WP+rB2NHt
 I63uf6E0n26RS1Pzy0feMAh08+D1pty45At6Hr4j4bC78m6mkIoVlCGwqDmdeDkcOxkkbwLjw1R
 YWf8i6gFru8Fg+e8EGoGmE2Bxm4mt3qi/LvuQfLj3Ok2hd8i/Thzoz5YFcE8u4Y/VAKBYp8SSWR
 TT5ASZT7Zs5DF9ysbcABdZh+E5j97WBjq/Ky0nvH04i8M5KSWLQeuuHuu1qTWpca0/1JCQmPeZl
 CHuiPsUt42R6unuNUYHTjmLN4NB+z0IS9Ua/YN6Ybvbg6B5nX262WV3s8ZfXv8kBR3oX4RCZaP8
 xJrTp48DLOmhOh/qgIYh0ooK9Ra7ViBNCO8zeH5aQfc23fYQzFB8FynP/LougHivKEoPN++q+xb
 tzyv33hT5W65juFdUEL6ITGXJfzMVy21qw+6OgdpnTMrnUG554ahzykOJOgw0qoBwfaOu6yZNfM
 qF508+P41ql5LxL5GLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156

Freescale i.MX6 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
index c5b220aeaefd..2eb84308f9ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
@@ -45,7 +45,7 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ		0x000b1
 };
 
 &pcie {
-	reset-gpio = <&max7310_c 5 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&max7310_c 5 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0

