Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40627401A1E
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343101; cv=none; b=ouuM4AktmxBHOZCAFHf5LAL7j/6/4jek/7ctYhOh6KdSa5bYqqj7x+mtSzpnKMPY1LcUvOfxos31k8Mmnm/JC65sh0Flq2glUDMR6SzudMHnhGP7FSY7XGQV9EdooJjlFTaTsUGW05YsEtI/qbMAhdhslIlVQjSKxLbphSdSaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343101; c=relaxed/simple;
	bh=1JhUw/+k2HghIFw2rLURIxN1E0BaOLd/s4QvkRP9/jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/gKAbPRDQCQEfeSKwHyQqr8Owtr2FSvoGrxsePSY207bfWWxxwJYpMOgwA19uO39KJnec8UCKhjr1HEEJtFY1RQCIgw8KjKvnsmRuExIdgEkFN1IGhnzIuexsd//0DKdhwdHDhEAnlI6BIClFXA7LvOW06bJypME6cXa5WPWYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iriMTp0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZATnY137; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iriMTp0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZATnY137"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CDT2Tm1594015
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NoYJ8smrLE12hDZjhZ28ISQ4B1LbfLzlcdD/Jf3yZlY=; b=iriMTp0sjX2QxC4s
	mHKwN/iOBmEGRlInxaVTSsMZYe1X+CybqlnilwmvTUVBbsPya2kdNJ4JN+W388Dd
	XgOgvoH5D+J5peqOC3LRXJFSfSZsP4PUwsiFPMAxajsWTPTec43qkdMTxxzvK7Ms
	8ptqNO+m0a1t+ls/W7xbvNXnSOxme7gRycp/8RTohossOgOp1Ac4WEBgxYxS3e60
	rqdyedpNPI+Dpregb1ZSqtw57OaWuihaY0JODGvg9P8nfoOEgz4Y86dd4nzYBwcM
	HfSK36FN4EjET750bRIl2XBy94Y6ky8DxCnLpUTSM2Qw4t6EZxfT+XAosUUgKiRc
	4wgcsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqaq9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 19:18:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81be6f05so812146785a.2
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 12:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343098; x=1773947898; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoYJ8smrLE12hDZjhZ28ISQ4B1LbfLzlcdD/Jf3yZlY=;
        b=ZATnY137bVC7CbRFiO1UygGbjh6QwkDveKGiGpY74oIy4R1Q51C5Clz6g4knt6sDNI
         iwkdGI19EK+y12RUMg1KbB0hX4SWq0c6mjVcrM2aMExCp5apS0jmXOw8a2Bah8FUm8E8
         8I8ud9EtV6Qbv+yeHtIhzPgPfnPMLJuYwBeD+gDHlQTIvL/5+HnDgTtSVFmroWcWSF/C
         oULQwVIwWddEYpFK7FzS1ZUiewco+8V0Qr11KatvTHOMOmz9VWPlb1dF5RuE369TtweT
         G+yNLz39Kk9wTvWuWR9omVNZy62gv12jJfgdDIv1aHCCr5EA7IEyUP0s+drYkWS89S1x
         YAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343098; x=1773947898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NoYJ8smrLE12hDZjhZ28ISQ4B1LbfLzlcdD/Jf3yZlY=;
        b=pWu228q5sYmJwbYcWmKhf0fGUdK3CYf5N4SguhIiYF35w9Svy6OQLYktZHWHYfuXlv
         nxtkyT+PTVOyEMjc6KCWY0nUynvhRx7NIRLQ139Vl6DBKTrwL1SYX8Qss7t9brE5LdOB
         AgdZI+X84Bu5/Xc86ULd+SBvtMB4NhtH29hr/J2fYe4y4e+ooakZXsOA5u7FWSjlv22A
         S35xBV/fI+a6jNVMrMyNsSnu66pAmL7nBXZ7yN7L511iocVmhclc97hJIWpeyX5gGtPk
         fmegwlYekasGNL6EPZvgP399rCRaESW9pEhM3Ami/sK6jU1y4kAyommpSwEiri095hD6
         efDg==
X-Forwarded-Encrypted: i=1; AJvYcCVz5KjQPTMeNYMngWOnzM8pv5LM2uOs5fq8mixDr4qZQe3CcjDYIpBDqbeyldt5ZyWQlYs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzrbv6VinKCW9cdCAjewxggdktaJ2+zB1Lk3eSuzd3kvAdAyBol
	V1Ld5otEuv90dxvJDjHcxK+PlPgC+StFIp3tDIgSr/o7h24524vJDNhesiPFV5JCeC3fasmMjT8
	Kq0xJoNZA+kApq2cqQK0E+8fCMa305GmcXYxrlZCsHM5sTbCjCn9W5Ss=
X-Gm-Gg: ATEYQzy9zal29Z3A/oZZ/AGuWyojiNjy0C/92r/f6RFE1Vhx/wPtRUDF8ZBjeCN8VLY
	G/eWw+kvSC3OuDhfe7zH0fLOht3hNn2SwFbjm6kK4K1CVrziTbIvWPWoCZ/+QR/72ZexIOdCQCo
	/KjCf9ilHT8Ah3e5P6spGovSTwFj2Iq8CY1oBcyBbPtdbilVY2D3mppLcYOACWOfyCnAXG2oB6e
	Ky5i8ZmmgVKWNkGyU6rPVKcWkWDuO9lkDcmNBkPvf3HW3W1m78ckyrlthN1V3aTGhWE/pD1k4VX
	0oVp9HJ0Vr66j7SVYw1EAIqD8Z7VwNRMhB9Ecfva91FvU9sV13oIj12FLPC62pSD6HvmeayXXTp
	RJm62W/N4ETxvdhkbutMZyQtunFikZGAq8Fl1N6TUDwbj
X-Received: by 2002:a05:620a:4041:b0:8cd:8e07:46a7 with SMTP id af79cd13be357-8cdb5a6b403mr120170085a.23.1773343098557;
        Thu, 12 Mar 2026 12:18:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:8cd:8e07:46a7 with SMTP id af79cd13be357-8cdb5a6b403mr120164285a.23.1773343097995;
        Thu, 12 Mar 2026 12:18:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm1874935e9.7.2026.03.12.12.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:18:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:17:51 +0100
Subject: [PATCH v2 04/12] ARM: dts: imx7d: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-dts-snps-reset-gpios-v2-4-0d5040eb4a1e@oss.qualcomm.com>
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
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1JhUw/+k2HghIFw2rLURIxN1E0BaOLd/s4QvkRP9/jo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsxFkqcWLZ7eeKfW52uQ191tN4KQHtZS5AFTNA
 RUVL379c0yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMRZAAKCRDBN2bmhouD
 1zLQD/0e5Y6Cn547ZI034CLSim+/I/VP95hWXYBnHBC5t1ov+7ttLaUZDLarzpaKB8ge5Qf8iIC
 EnncVAyKnmCkC68qMWArmeG2yRG1S6qDC0E7UNLV8Y7zox8OCPv+y7XXkZqnZXqO6bHSCJLOZcE
 glabsRRCGIREYUBRH1asYvekrklBIaKSsxezsHivW0nO6n7ky54bmoCOeDZASCSNp3uzkJMxDQ6
 MBypzNDhm17ZYaUU5+DaCRgXqaOW4TtofARj/iBmtgva7BXObzK21aAONA0E8vvdhGl8c8qAzae
 3Xnu9/9KfAAJzrjZ/rtP1adak1BCte6gRaWpXF2dYLDEi05yecMyYXQp3I9KGj+inbklh7VTyW5
 RY03vwySvbNFEbED8hr9vRy/mzzBzB+ECoyGCfpWApREXy1ugGbB5REqzXl3mI2M/yl4fJbpFlr
 lUcN1ly24ogZGOhqu3yfvM7QOxa8rQr8/vroOUq2EAAuESsrgqSdG0y/r1PtkZuRaeaiFoSCNPN
 n8kPQfb4YrqVIrY7S/M6dWhU01YCQYoyti2u215IFvTgiVGepyaCzxkXK/z4XYUfdU5oDkdK+MS
 nOZ6qKkwBKtzSO6GSbg3B6gyOK0OaJv+75JXkVj0gwYvTzX1DOKTLCD8dFaMKj+maHGFJ5tlJgZ
 6rnCbKptUC7Ml8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 8A56lGmBRmKWmrkt4pNbNfrReFipXh-P
X-Proofpoint-GUID: 8A56lGmBRmKWmrkt4pNbNfrReFipXh-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1NiBTYWx0ZWRfX4ClYpZaEvdCF
 9ccRq6xknU/1Hl88zdzyA/C/dWlpzpZfxhAR9hNKMTM+gzul+R4W/4e/Vp9KK+9VzJsP/VIxBnH
 V4kBf5dahIhtNKv83tQb2E9hVa2lPLf+vi2+XkSY716PnuTuRW8zbXcXOR3nvm4gIWN77bRtfiT
 wY2gOGaAxbDTL6R+y9ej09BRLgqc3WNFpXqFzQ0Ai9P6I+WFrsLHmH8Lv19jdhwletnEciLJwHQ
 Lq/i7hrfPcA5OFdy8uUHVxeC4rvP6qasUHo4W+rcMbS5LsscQXL0QFKcMAAoHgwVeMCeWS/6F/K
 6nJtqLan+OS7Qt9ip2XtutALrJ2MKrpE8cGLevkCQ14nb0n9nIUBCg6HPCfikFrMjVDoFvar3K9
 fsF3Y9Aw0ULQSsAQw9JB5nLIg9hUMETMHlsX7k14rVuPrBtAEPlGxL0izJbEvxuGderHBhbHVnf
 NG/dL/HQnN84wZIpvSA==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3117b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=ZEd_D3wCKC4SqcO1QeYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120156

Freescale i.MX7 PCIe host controller bindings, through referenced
snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" which is deprecated since commit 42694f9f6407
("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
index e3ee16f1aaa9..a5fc7f80f651 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts
@@ -122,7 +122,7 @@ &pcie {
 	/* 1.5V logically from 3.3V */
 	/* probe deferral not supported */
 	/* pcie-bus-supply = <&reg_mpcie_1v5>; */
-	reset-gpio = <&gpio5 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
 	status = "disabled";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index a370e868cafe..ab7cabe5552d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -456,7 +456,7 @@ display_out: endpoint {
 };
 
 &pcie {
-	reset-gpio = <&extended_io 1 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&extended_io 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 

-- 
2.51.0

