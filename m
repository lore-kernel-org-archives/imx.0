Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E41402B91
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343113; cv=none; b=WR9AqKgLxutmhsalOh+EJbF2LoCy+n+z4Tnc+LPr1hM1yVONOPXzB9uSdT0Gc1bCiByWdjxsLPYS3RGYL3cHlIzw2p0wzUtxZqKO9HzUXXHNYkWCPlDwf+o2KIy5aSYkR37sJyfzQ95UIOTEv2+ebpl9u3NZ2wLW85BfyVuTXDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343113; c=relaxed/simple;
	bh=rimSKUgKUB8M7kBDvMqD/j3DAOlWykchI/HohrWjDBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbZ9wRWG4RZ/LN3RCljc5rbydMh250n0CTJkRy9PhuQ6X15wjec5TF1p4sZRKiZrPHLbSufpxYO/4oOBboPDDeeezAtqXhtQ2d5r4RTXISQ0qyTWPLnm2Rh/s7F3yMKmKLXBeAvaz+EZjWNG9RmN0VA904RazZr37a9P6xqefZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iq7XI1dQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLKmrt49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iq7XI1dQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLKmrt49"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9Fn4h587752
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAqWXgBZaItjZFLcpaHSGp9QjO1XDfG0WWjivaOVvog=; b=Iq7XI1dQfCqeDGhx
	MqodbWVBYaiRaZ1GNmPRT2Z8cdwGMFN8txB4dHKtdgMUgM+eyC5nreuaOKArF1gI
	LWXydwLszlrUGQMSHenTs7WexDy7n5pX9WXqh8T+bkNuCyI9FHr9A1wSoi/s4H6g
	4iD5ZqTCOJL1a8OCGaLG1EKxzcIw0e7tsRoKS8ADR7TFvIPUiAPYkmTe8RFpifxr
	YJgxXRfEdHEXMVe/i45nbvmw4Zsy9z9t8fX7oOhxXlMIouXTMsEYE3IQQ8LMT2mf
	NMbKJpaurEwNes86yLujIIKl7fVu0//dfDZtv7INGfZvHA9jwbA1tjn1X532qGd6
	JBZ5/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q3a80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so1054965485a.0
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343110; x=1773947910; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAqWXgBZaItjZFLcpaHSGp9QjO1XDfG0WWjivaOVvog=;
        b=JLKmrt49JBc0eYhU4pr3HC1mHk5/QXWI4NfOwV5Doh5j/h3jeKcrTHK7GSyItlaVCx
         P6oQOrdMNcWVgKULOEOmbN2azaBl7KWUov4RRpQlnoqrfJl7dSX6b/vQQ9O0kjt9NLVi
         uVdXwuPysWliCVfdFivxAI56iBkSPGGqNC/uo6mhx6615NEF8OJrzsLKPf81y3zO7xyQ
         i7tHQ/mTrWqOhPYyhF68KLvTR01Bt6irp2var1tZM5mTjwME1ol2DT8ABPyc3iyY9ePP
         i/KUZx4UDP5r5BIBbMgCG/Mf7FKveF/umXoFCM2QQi3BEWKV8bPimSymSHh2v/RRj9Zu
         MNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343110; x=1773947910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JAqWXgBZaItjZFLcpaHSGp9QjO1XDfG0WWjivaOVvog=;
        b=nB0eFwZyARvzLnhzbPlF+03SlXuM+os4eruRCzNd+O3To3RSnfznmX4vuQ6fsdiXrM
         +HM0OMQk1GjpiDNP/3t4d2uBbqDkR1CqIQhUrhtAm/8wigQDeQ+/TepuTaWRdhXOJly4
         mxKZxUFmemgAiBA0JwQKKy1y2IIHlr204Ewb9kyApo474bQdZwSl5o3dRyZeeH6Rs4Xl
         ivacu/s907VCj8kBdJU5NGhosuGBaG/WttN6MAatJfJD2nD0Bzz3svIFDebDZ2dx3vae
         DBt16vxgwa0MLckDqWh807IXvH+MP5xjZzbWAOnRF9lA1vu58BoywPbK+rQm3XVlAa2w
         aHTg==
X-Forwarded-Encrypted: i=1; AJvYcCWY/2j9rJ7DfzK5bB2H0tdyaWxu+gjC8yOhHYnYy5qGDZC/qnD84AHchoLoR3FrQVGufI4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAa/kWsj/++2OzjXwypuUNv+JOYoxVORnIyhHRCYxEGMnR84nw
	DBIpC/o9o4no7podHEYwcLYEAAymy1IKxZhYm9Gxh+Js0wPl/0f30rh6BsntdDcBVxzE+iI2lDN
	zOU7SBaqlCcvuWjc6eOuUebmRh0w8LJn00Wcz308MIWwxY5yhd961zNw=
X-Gm-Gg: ATEYQzzdYQhI+6zHj5cC/HMQf6rhZOc+x0KP1VUSioxLHJ1gXDmcrcHwBEtw1Q/TyXX
	rzWulW+RpTjKpB8VlHkdvmeB2Tq7YNkRsaJ48CG5jqeklFhOOjrpjgMcyHIh6QWGgLomDxkiBO/
	gcCW2pndWOpCp/MWoL850PNpRejxXqh54cgPvbXLdJlnNIgVltXnU2FyCuQA+0vwXGJVFLMeZoD
	xKGqDJgFDvReVeeMVF6R1T+arkLBcqqIz69YceyzwtNoSJzWD0Z47/BZwocNBV/f6v2BtrtHqUl
	rcSNVDEjqb7+iCxIkoZVpjLzdqevU2XDWIlty0HMtXqmWiWA1A74PC7FgEbMbBazZ5RSPK9IkNG
	Vt8Q1ic1EZKKNPFiDVcIPp4q3ed41q9cvM6mrdjhI5eKm
X-Received: by 2002:a05:620a:1a06:b0:8cd:8bfb:a48 with SMTP id af79cd13be357-8cdaa84bfa8mr588749685a.28.1773343109844;
        Thu, 12 Mar 2026 12:18:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:8cd:8bfb:a48 with SMTP id af79cd13be357-8cdaa84bfa8mr588746685a.28.1773343109433;
        Thu, 12 Mar 2026 12:18:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:56 +0100
Subject: [PATCH v2 09/12] arm64: dts: imx8qm-mek: Use undeprecated
 reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-9-0d5040eb4a1e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rimSKUgKUB8M7kBDvMqD/j3DAOlWykchI/HohrWjDBQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFoZ2/9OulzA+k10fMju5/S5LkYZG/qGMou6
 K1Z3jdZ1puJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRaAAKCRDBN2bmhouD
 1/BoEACRIp3lO5mFFb+28o+83UC92NjUKR5da1brtzO5tE4+bkBdnKCnsuVtHdJyKvCeM17ECx5
 z/yz/qf3dP2nknIr6Zw+8MuY0U7uPpzXL7+xxncAdRTGgIe476VSqG1Qi4mtHFnKZsviG3QRu0Z
 Tgs+ygsAW7Vefp6q+IpyUL5TrmxjmJH896MOe96HvedEzzV+pbHfXbHk3vau72VHdajSS7+dl7m
 rx8qajCxLxXNFHJQp7PiNFzzBcfBTPJwHw1jarOm5BFzEQa5QXXeNsjyK8dvSL3o0A/9kYspWVd
 r/ByaCnWsAADG/DkVnVRBRGVtbLnjXroA3McMA6Oo0J6hsmWDV3R2Qswod6/f2kRvs2/mK2bpoD
 hkfArOshfpam8UXAgCLIgP/abNojEANuRrhXxBMjNVb9cr3KOwqZzML3AtyZOi8IwsavIlHUDmm
 R8cz2gCiNCOjbu5ytE5nOZHFp8SpyjNnJ4uG1n/3a4Jf27UJAqlkXLxGYfaBJgBLwrlJucOotvU
 CZKHuA9Oa7wBTFKHsZxD8ju3bz/4M7efzPUnEW2Z07MVb3IFeI8rk20Jwjey3ORy6/Q8uKIXLVA
 c4x8uCww0y0HLkyZcZeiXuuDdhOrD9ah7QQMmw/MXGMknQo/MVVQq8qp/r/z5ZOoUE73qiq6kkR
 LlAzD3cdLik40Vw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 3XmPCB3f9A6v64nOa3KjEBrCwAZ5rbSh
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b31186 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rBNLUka9-jj59pslBkYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 3XmPCB3f9A6v64nOa3KjEBrCwAZ5rbSh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX6vrc7kbu3NZd
 3T0v5bTN/jvwiWsl/Y9KKDdvp7AcLpcDiUHyPmP3CuwQqk+4Iyzcfecm9+dTIt8n/3tfphwRLAc
 9eDbs5YRtAQdzRfNJdJPT/LhRSFxzWYv9saf6zUbZ+eVUL06VvsL8427VMLrp7sZtc9N6rRzKue
 Zo6j2lwU0XuqaAjW451NvV2ZihTeO+Ad1CbjGS514S+HI8EwJj+hm6VmbNwFv45tCxCn0ej9WJt
 H9stT1O/tG6JV8P4dXOCMSPJONlOmb/uwe4tszpQUqVB6EgzKY+Hu4R0qhw4Ze7epjjHk0jKnSE
 jzqJrbnDfMtWYCnWX3X/gYXMCvP+iPS2Vh3ivz+wxLFFchou9Mg93ny9rIFn/EhElA4bj6UqGLx
 wPFCQCFKHYNctJ3EWHLN2DD/kKnm54FD/EH4F7A1KbDnfgyF0auEMupYCPOwdfGckoqvc7b/GlJ
 zmCQevbyCtPqn/zrOGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156

Freescale i.MX8 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

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

