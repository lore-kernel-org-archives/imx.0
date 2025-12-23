Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDE8348469
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503595; cv=none; b=axSj5z8VlVtUssx71akeEI9RWdbL3GwqrTOm3IMyGogmXLoKw2V185img82Bgk4cPKktoEi2mQdIfVsdivxxe3oVS3IYBf/WtkeEyFxDHt9iISescu7un4naniINKa5Dzk6/X+AF6uz+J+DjiEMwRjpWp+3/CLUuP0hQIyVCt98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503595; c=relaxed/simple;
	bh=s6dmgXshYqBcqge/Gl9ktu77tPn7QoWsqWGoZ+fnNM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTG/NnwiEwFEqyRtep+g3jSFw3H5RjMxnfg4DQgZAW0rv8ThOXQXE4Dcdjr1lxV0gdslTKqUDAHhSkkP9wTo2q+lQQFb5JCx5XYaYD1+1ayGlGZ4YD7sEU/j0EF6zwDJ6fNQprdvHk5CElr8835ktOGMY7z/KpHXPRN/3i8eC+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SF3Iw9Cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SqRlkBuK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SF3Iw9Cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SqRlkBuK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNEN8Bp913441
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 15:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fe/7BwVxywJ
	SaIl6KaqmfdtPVzgRz9T9FMrtbw6gnzg=; b=SF3Iw9CpNuwlyLE8CRTXTlQlcka
	r7FitOED88XeZUXFUuh++XvKRYRti/PbVXhACYQiBMPMCp5occQmSi/2CC+kxJeZ
	TSmyGrusrQVQCJogD+vCvW14UYRBFZ3lRoBZtbokOhe5IvcJvD6i494sHXJtahsP
	BihqtZQE6UmX34zS1dyBEF8wVZo5mR3w25ekBkARncvG63sHPUfmKXo6wqddzBO8
	Q/gjjyD62FXMPYn4SdUhlG7xEEvEidSU/zcb7dMnDaVdrM2F+HyOxbncJJYRye0R
	PkXEimzzfHuqY9xN3B9CVvbMte0l7EQESqvEIuUaQgX/Uqghv1J5r052a0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2g5n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 15:26:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so178379481cf.0
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 07:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503592; x=1767108392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fe/7BwVxywJSaIl6KaqmfdtPVzgRz9T9FMrtbw6gnzg=;
        b=SqRlkBuK0YOqaPRhshpOiaO/KcVnT1fpWjDhQfu25gMMIDYaIEis8Uff+Ud5j85rFr
         rp2tyI01bYvGCgc41OagInZIUoik4uw7fFKPZhBmUv716YkqGjJ/GFHEnyRBvd9GjMds
         oCNPZ6GudOpcw8qeu0IkBE0Z99Z5uBqZ/v5Ud9usVgWLzE3Q/JpZYw2umTymEg0STX9Y
         52WNL8KA3MRO0b6j4Gc7mgJh5bq+ZPE6/bgYz0GvtC/gy7AYt26xzqzBmhgsDSqUXKIN
         xPBiJzUJxBYOHVnReY+/z7MoQPaXhXiaJG4EGvfsm0E5nVWBnTUow1DvJhlhpgYzF7/w
         1bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503592; x=1767108392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fe/7BwVxywJSaIl6KaqmfdtPVzgRz9T9FMrtbw6gnzg=;
        b=LVV1tkBMOExHZOcOChPjdg3YennMf5v+Zv93+UvZ7whpafvA1zHOFurpqVKMp9Pbkg
         xCyqrntqC5OtyiGDYY3ACXm7VktUdTtwloUeE5cwkUBeYRxRpl1sp53lye+v6YZlRLZR
         3N+CStQew8M1gokbMVGoen+xzlxYq9MoiasxQwli6KB2WJDjnM4PPRWPtMKpAmJe2+rD
         rsXYQNukXIsF8D7hqKMZXdIASMw9dd3ONPYr/IRS9K+WILg9suOSUQqaJSBhxTuUX2Xt
         khMM1fDKzDv3xvmb/TtBK36f+UVUkCPQKVL885LDzy1kp7udgDQipkeTFboRw3CMui5e
         x7qg==
X-Forwarded-Encrypted: i=1; AJvYcCX4lN7ONopZhiBzk2KrhjkZmvnol0h7BPg3e/vaaARDrFr00t+105VkM5WJ58/XjDWXB48=@lists.linux.dev
X-Gm-Message-State: AOJu0YyF0aPilg98cY/4CrvG+/Nh3kTa0Xo4luZB60uoqb2MsQ3T+neT
	XqG4DGZJqWoNda8DVDuLlX3H6Al/VlfhDxwfn4uxyvM/Qxk8+Aw2GYn8VM0QDXChO8F1qRyRs4H
	dEAgIi80sxTyILXYvTYXawR8HHmz0Kh96oxPdjJnPr3L5r7gl23h7pnU=
X-Gm-Gg: AY/fxX641LsJQFqKRjYzbtXP40hqBLOvI2kPpV91puT6tdwheZaK1JLtiitR6s45eP1
	LbOMIS33S6C+usfgUc1kXrJxbLe/FHAWZNwsScxai5U2//PysWFmatPSsB6C1i8KIbQ9eVzM2XU
	0PV52kcT7ZJb3C5kF7pbwlHvLoAQ3JzGm4CV9krVnQG1p3XW21ARsW07OjTcKyayxxWZjDCzOx6
	zpNjAvuRL3OdLy8jlZEBf79KUNO+i8ZaI9DgDPCNZQ3XYR1iAuBw+8mxkideL4WNsO/6R4o5CBd
	AHWFlGaYJlzQHxzEy0BT2QOhpixWqNFUUkEcmwZxBv6oLV88RfZjlWzzd+i/Tthm4nsqivLrfh1
	tGaqZxIwzcuGQe+gkFt82pcPmbNWYM9YTcwKnwr0PsvKhLsAAG7MF9rMJ6WO32Nn3Jdo=
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr222709151cf.65.1766503591888;
        Tue, 23 Dec 2025 07:26:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSiYBQgxmIXmFWgF50OKz3n3aCKf8Q8fGIx4+FxfvnJo22vVmH6AX3Yw49a91CCGZ5hT2RdA==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr222708821cf.65.1766503591499;
        Tue, 23 Dec 2025 07:26:31 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1454905266b.60.2025.12.23.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 07:26:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: freescale: Minor whitespace cleanup
Date: Tue, 23 Dec 2025 16:26:26 +0100
Message-ID: <20251223152624.155845-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3136; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=s6dmgXshYqBcqge/Gl9ktu77tPn7QoWsqWGoZ+fnNM0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSrShE5eMgUcd1C17LkbPFjWDDQK4yQF2fNFL6
 yy6q1oM3NmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUq0oQAKCRDBN2bmhouD
 1wI2D/9qzhez4f9b4TZHsMgxaDFa372/H8+VYVy1VBio5wG54gOYRmItc9LVsbsRDbXYr4WcPRE
 xP35O+PjdCHfio1+vnV6G+GQzTuTn1ZCg0+BiFKlWG1iDewvYElrEvMSqeUgzDmWxf0qWCr4ZkN
 AM9IFt0DmFNaBkGKGxmdg7DyD8yylNImlACehry85WKpSXK1W7pxaIH2D60L/WSMFDukcT4+818
 qLsMJePqsLUhnsDD717eqqSAtyur2Hu+JRWV8bMqcIBrA99nNncWNAZtkZz6wscH6RwRZMOlexe
 WktQ7NP+FxrON1OCKpg8fZjkF99gkiZ/om3c5BcfrerSWClzoSIbS3bAyMPlzksDNCTSD2iIiFl
 99YZCCaHkS+T228sRYT9PGsmUiu2QvcYHNgr95DMPciMLGx1qEuPbA+CQtXubOWhyW8aABPwdGC
 pAFTVKIp+JH7ne9i3ZYXA2NTyVQn17ogRtZoV/oq/1PBSH5cbfHPo1NrBTHwxfx4+1ZWgEigU8n
 d8tP/ahYfv23ERczntP/W3CeUmKlK519ouv8dOtLLe/Tz7XFvf7yIjR1DyYXkGEzukBpvX3Thtw
 B2kzvspp5OLd/kGL/r8X0fASiRWJjmeqjte7IsQ0RorQ72m9Ec50lIVx7wwg0FeteIoBL0WsYPh xWQ+ZmbnnrF3w9w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyNyBTYWx0ZWRfXwVSJhO236zu5
 CDDfJdDefGb/H16V6h3Z/ORzqm/e3xTpWR5z7+UsQzZGPlre0IMmBX+UPvF9ebbicVnvyU38xQ2
 bGki/eSWpBG2mMe9Yllq0G21kqq28ew9JF8qVlzVUeSQvAq18pyUb99SMnHFEKQrIWdQQXBuc1n
 VMgGvT72yiqAO+BY+LX77cbqSbr7fEfOl04ha3tb+ED5z1RWaHASNkEnz9cGMtpIHxx+5XwVLpi
 vFxBx4EVCAuOvuo7vRlbRCiW/vQbiEKwVM1NQ40qQpA1HJ3Pv6BYIeZAJKg7ilHcbh4Mc/9oLFt
 4l8WI643PTTXkn1PJQs61lqoqBPA29GB2hKjXR5kigsPzr+n8wgJNecYwBBNy3FLQHquUId/mUM
 LExjMAtZgJAh0kqo4y4oP3rOO1DI5Q0fldPYv1Ifha+kdNe8VL5fuD/AUt4UAM0JfHC9yEioX/9
 VEKF8uzPEOJTBtAgo1w==
X-Proofpoint-GUID: I5Y52AbhQSo_w_6kNswBM4CDEDOp9VV5
X-Proofpoint-ORIG-GUID: I5Y52AbhQSo_w_6kNswBM4CDEDOp9VV5
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694ab4a8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=XxgNNySyAjg5KShGdy4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230127

The DTS code coding style expects exactly one space around '=' and
before '{' characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts           | 2 +-
 .../dts/freescale/imx8mp-hummingboard-pulse-common.dtsi     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi            | 6 +++---
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi            | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
index 138f21e257aa..242fa930bd2f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
@@ -117,7 +117,7 @@ &aud2htx {
 };
 
 &easrc {
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index 825ad6a2ba14..fa7cb9759d01 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -141,7 +141,7 @@ mpcie-reset-hog {
 };
 
 &i2c3 {
-	carrier_eeprom: eeprom@57{
+	carrier_eeprom: eeprom@57 {
 		compatible = "st,24c02", "atmel,24c02";
 		reg = <0x57>;
 		pagesize = <16>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
index 4e6629f940bf..3cdb0bc0ab72 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
@@ -198,7 +198,7 @@ buck2: BUCK2 {
 				nxp,dvs-standby-voltage = <850000>;
 			};
 
-			buck4: BUCK4{
+			buck4: BUCK4 {
 				regulator-name = "BUCK4";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -206,7 +206,7 @@ buck4: BUCK4{
 				regulator-always-on;
 			};
 
-			buck5: BUCK5{
+			buck5: BUCK5 {
 				regulator-name = "BUCK5";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -264,7 +264,7 @@ ldo5: LDO5 {
 		};
 	};
 
-	som_eeprom: eeprom@50{
+	som_eeprom: eeprom@50 {
 		compatible = "st,24c01", "atmel,24c01";
 		reg = <0x50>;
 		pagesize = <16>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 2dc8b18ae91e..24063bf8183d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -131,7 +131,7 @@ buck2: BUCK2 {
 				regulator-ramp-delay = <3125>;
 			};
 
-			buck4: BUCK4{
+			buck4: BUCK4 {
 				regulator-name = "BUCK4";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -139,7 +139,7 @@ buck4: BUCK4{
 				regulator-always-on;
 			};
 
-			buck5: BUCK5{
+			buck5: BUCK5 {
 				regulator-name = "BUCK5";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
-- 
2.51.0

