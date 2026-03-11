Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B503E1CE5
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245316; cv=none; b=b9B6xUFiz3bqM2nUl1kchHAnOXeYharXhOxP0qvdCG6mDHYBsD43uzyqOGl9WjVNE6ddrV96lVxjvFJ7/CvFgRS1ghzODFqmueoFZPryoNIkHgvm25U8U5vAu+ae0La3p5ZEQhGw2BnbycWHvrWbyk8h8oVgkBr0hALjRDfK/9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245316; c=relaxed/simple;
	bh=baLse7Wisy0ajVq7VAF1W6Q8rnqwQnJ0swQxre94YJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QF2MVQFE4L2BnvFtgCvVjclRsdyttvRutic7pNB/jScIhGeQHqFfx3dz+/Av/2zQrsmbFNv6fA8VVEfSdN0qM8Mgct+j42wL+pKRr24CYiY7GUL0JOG0TrJdcqh8GVgGRqG+jrA74vEA2VTNarYye1R9DDALf7bQOJQQk1SuDwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUBrRgNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3BU6ZNW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUBrRgNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3BU6ZNW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BCQVsj2030967
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQ1VKYj6/MdhUSvHYax9UhceHrIKeZjpSOhtpE6EgXU=; b=XUBrRgNy1MTEe4i4
	ugvwGZp87T9kbpSD5/b5vWI5szxueilAJ133MoONPZTwElCm6NX0CUAFEtcKDxfe
	rdthRp0QcQuStVTADMK02f1ISM+lDxrvToN5HpR5P4iVyfimRhBXKqts0fE8+x/0
	jZroZ2AsCn8NSgpYf1jrYeyEVSsNwygz/wpdFa3C/OTRsooE+BuxJdA3dbO5O4G+
	FW3qe8h9e4xPZKAnZNiOkylh1fwUeBUNrCH2u2onzjtwr2bbSpqesgKwtgqBmanl
	9YaGWVU8XrPMdzIv+lTUGFTJH0WLB4Ly1+wqLnGpRxuGEInoUmE7MWQWD5o/gqZy
	6bLEUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu40h2087-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77e5e187so2527580385a.1
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245312; x=1773850112; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQ1VKYj6/MdhUSvHYax9UhceHrIKeZjpSOhtpE6EgXU=;
        b=S3BU6ZNWkqdXv5ko6cPqXax68iq8sn31Y47146aH40HPTBXhfapQmVcLlVWll0Jdwt
         wteZsqrO1/Qy69e/XWKm6udSyxy7ltdIKfmFdPfXNDS6HKd06EmpTDlf3v6wKI9Yc/CI
         AeT7F+0OZZOmh8n/8fpCBAhZ3zYw4rRw8LBR06shJ1F5AbL3ENZmxcU166WIOr/i8EyQ
         0TLyDMSHpf/a4/lcKBeF3mOfBonY7sk0wNWmtJl+lPVpjvZeJu5MLEzgrPkFS1Fjyfz2
         M/W4KaficPAVJbMfH078H+ryiEo5u4kt5FVRswY5AkNATGm8SXkN+8IZxoTABV+H8XrB
         vAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245312; x=1773850112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQ1VKYj6/MdhUSvHYax9UhceHrIKeZjpSOhtpE6EgXU=;
        b=oNcOq/nIsNEpIWmUjNm0SUgTZsB2+d201RYe68exKYhY9Jag6M+oYJC4G5072G45kL
         U6f2b3jzNrhbCFYJveQ08pfyZDuq5prthGLJjNppJD8G+fX5exo/bWZ2op1e3e/Nep9k
         DC+pKQHQ2xxoA63iFbtG/co9VMofR3ts/m9g5+SdmON3VVXfnaUemZzTbVNVG7TzodJl
         NdfKJgwFtdhDXTf9R4TB48FdfjV8PIP49qlcrsRdTvXb7ETnsdJ9LQin4ICy6eiSn74R
         R3+OPd0/pgVH9eaMMSivphhUd+qeHPK9qDu553eW9vIkvg7mlSh0yyNrUBi30YLaMra+
         V8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsulNfpyd9d+DyaPbO+o2bCUwXZw3iycj/Hj/ucOadgRRLvJQgSLRPmaSE9PX55jekiKw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSjrKSJc4pfjMFbgw/VY6qm18jfyK9yviV8sZr3Nj8ixifZVqM
	9oalFRIrDOi1kuWg2nabQNBmmiPf03CBZN09H2i3egdQ+ATfDZwGvD1OPP/OpJvpmA/PC2gjrQJ
	tcT183eA6/5K7v3AYCkizCpYTHOBpmvexpP07DMN8+hglH51kgN7252U=
X-Gm-Gg: ATEYQzzmQrpP5gC0BIo4mrb8lQRdGeAcV8bXJPByQiELiBhFJGJWticvqKLDGpDTGBG
	GqIIgrj/shqxXJQQSm9tNDTWQf0rhf7VGoq5RBn+/e8c/i6MwTunUU6jynqipe34dJfNRwiqU6Q
	dSp0P5WsnY4Zvvp+dD2POsxgxArGArVlmJ8QUHPhC6qu+J2ekK79ptNp6srgMxmFxdoej3ZsYN2
	mhOQd9woHixeGBHjBpXqpV6VQMHLea1/1L4rnNRxzkVrBqVyckZw2nTwHaFFQjyfao10P3qqNaa
	I9yYBbrFQOm93+KgJ1kTaMyCBnGMfqibtdr9zxf9xFamD0rA145Tlj5vn0EaJ2T/juZmo6O8AtH
	DRCX9Og57rYO9rcCbE3FRWNdlDZxlf53vpKncmDQVgTJZ
X-Received: by 2002:a05:620a:290c:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cda1a8a5e8mr382043885a.80.1773245311988;
        Wed, 11 Mar 2026 09:08:31 -0700 (PDT)
X-Received: by 2002:a05:620a:290c:b0:8cb:4c:3ad9 with SMTP id af79cd13be357-8cda1a8a5e8mr382035485a.80.1773245311331;
        Wed, 11 Mar 2026 09:08:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:08:02 +0100
Subject: [PATCH 06/12] ARM: dts: imx7d: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-6-ea1cc09fba84@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=baLse7Wisy0ajVq7VAF1W6Q8rnqwQnJ0swQxre94YJY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNjGBIhOlV1H6GwnXQb4z7BUJr2Spz/02Iv8
 47oyFmsyUmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTYwAKCRDBN2bmhouD
 19KfEACDYpmDpcRiNffKmElW/1AumXhkqMDEsjZtblf0vSF5jCQutVoGcsHEEC1RnVfQVBdDBOL
 W1DRCCZMWzequ7h7NOxkCaHllg4fXTgYuG100z/2swIehPEfgB30j8eWD8VX6hs+uMqYb4qHAL9
 PK+d2COdKkgJxydxqEUjEeCV6QIGjQ0K2LLLj2z/jk2qHqNljF0iPAsOj731NSdPXbzFoISpRPn
 JPt90u7yGkwCjt6g7lsO6iw1tIA5fELc+1/zidEsv8zyvWuBgZDzF4witwRiltZ71fhYoWkS9va
 sKIJgeNEbY+xjzGTV2rFdvIdZPG99nkABiKJqTw5aqJxvWq6VEk2k8ggylGTB0Yj+x9igc0qZLQ
 Ehcqk8DhAsge715UEwaLUdeX9gpkvPA+FZpA2MAcwoQ/sT3K4nJCkBEAxikNtGHOAk/Viz2NziX
 5HR2iZiFmQyjU1NRYTawjbaOssYdo7ZBa0/kd9pN+LK8/WIAejGH+5AcUfTivg/dUK+TiFzMbsr
 xQlAaYhxdcFzwhqh5HenSDAo98auuT/6wA6z909G31J0kbePaHeSZtFCLUvdyzm/XYzMm1456Kl
 zTHgq1+8HYRsOQyIggDAcV1Jj38As5hsapeYCx020A9NTNCspomFtKR2kvNp1XNCSCBosVAxcCP
 +T9MzMaHCrBhgHA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX/Co4kUE2clUl
 cgeGZVoJxYTK8/XIhpSoQUSnYQoqc4SCHty3TnxheJKGV+Pld3AuschnyeIP3Drtn9MPy3zohXv
 LPXoK7KeVoRIBMFsXcPXZte88KkWezkWVxNMceZnpJ1DIAhEfhMaAt9AXP1PoY3S4ZA2fJKSy0E
 y1gRMJnqFY9NSxD+hF6Mger2v7BjuqWq7+Kjlqxan+5paXPcjH8R39TQLKfMj45yFPdz6+EaEYz
 tW6w8VGdalGDE3cpQtONyyqv07laod+vBjnWN2TzSaPIQvBNeyEoM6JGBijOWhcemeK1qMkaZp2
 IpigU+I9eNRTcOmCu/3pGAmWXakJlgVo7GnKY+svyzxaMqAtFai2QjwjW5eui1tUQYX5UMp28PV
 OQiHPmt7JWGrmaSBlU0QKUqjBgGPU6XmhUeJxWrHc7NqsaIJC314WHeYi0SFcs3TY9pxlocdyTJ
 5MV3GlZ40NXJKDXmygw==
X-Proofpoint-ORIG-GUID: Xtia2KBBTmDlTOCwQW6SCfx23_DO-6b1
X-Authority-Analysis: v=2.4 cv=YJ+SCBGx c=1 sm=1 tr=0 ts=69b19381 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BBuWd3GDwlF34hjrYEMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Xtia2KBBTmDlTOCwQW6SCfx23_DO-6b1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

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

