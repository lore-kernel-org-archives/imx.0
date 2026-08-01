Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DB02E7373
	for <imx@lists.linux.dev>; Sat,  1 Aug 2026 21:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618271; cv=none; b=PhK+9SM4WcAGPIHZ92CYO0gZRoGyqBCbeVhDDgJ+cq57nAmRtW35cPaBZdLvHxW3cwLkX9nG4GuBw3J9Rgu0gINor0KpTLzeC25h3fZumTPJ7frroU5F0iPS3n2yXw/mIdVfqafrDUE8AcWWoUAG+BSwILONAZSbEkr8nx1Lg3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618271; c=relaxed/simple;
	bh=6vnP9bDIJW1WrcV2zoZ0rjoF5DH+2zrB1ClkTk0Ep2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnJxj54UfuxElMfpAvWEHXpyiVzbrKB8rf7yCMLxhgy3mbg5ppCyBdsX3Y8nz4IQkJnmFPjrV9I2yLi3UJEmCa/aOzIjk5+BcjuB2YbpwMFaBJoV8R4x4Evbd/G0dZOJTDvNpbeK51cleXZqOgp/K+gcspwcq6EQjhQHBduFgTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOkUyhte; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJ/HScpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOkUyhte";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJ/HScpf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxMix040744
	for <imx@lists.linux.dev>; Sat, 1 Aug 2026 21:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DnsDFsIbpagtEOLuBC2d50Ec3A4f7vPyJNT
	bbp9e+Ik=; b=TOkUyhteDAw4kYCNlTTDS98RaAl0hpsJ+4mCxmSPTCQ4zq+k+Ir
	blbSyrAsyNtIKnXsL21GDqBRM5wVyhHoL4ILM3yeEspr9hIyGfv6lhx8EFM/vvdN
	MCINNDNRFf3cqWyQweuQQDBQ/UEyLkdQDgRAlyEpnGwFTR5620wFKJssP4vUcsC5
	mddbpaRjvACQCuHNv0B1NW7LJrzVBN/6JwsgmwNMFuxqQlhFcoVd2SR6DSENJPhG
	Jx7I1riSqDXO1sI0kJMFwZ0Ta1NspYzYMPD8GBwtA4TTgsWpT3jozSpARKC8cqJB
	n3iB8bsiXXWizZB/Ug2MZ9H+J2+wEd0DjCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qpsnt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 01 Aug 2026 21:04:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso37415641cf.0
        for <imx@lists.linux.dev>; Sat, 01 Aug 2026 14:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618268; x=1786223068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DnsDFsIbpagtEOLuBC2d50Ec3A4f7vPyJNTbbp9e+Ik=;
        b=dJ/HScpf+QaAxBhcv1zmOOndnYMyAytx6CgcPKA0yVJcsTGwOh+LFCfMOQ3UGEQZsY
         VZBAggl0sK2tR7qb+L3a818VQNYRoTpSX46tryN++eBvSeLUFBirZwGIaxahnS8Vngbs
         Bp7kGphC6pYWBmTNM9rUIMJbuu/Vy7VfSdtSOYNa/gaPgzqTlf/MicWqR6IWs9ImvVZU
         o3FQuvtAQSup9ut8lyf9WnEbrmJuxPjcZLricUEQgdJvGyD+XVfrXdt29tSEb/P8fM6m
         Iubzp8kpZGLeryQ71p07RD5Bjih77G5PWZn+U9me0wHekTsQOaHkeKA9xkQYkyPhuzZs
         5vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618268; x=1786223068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnsDFsIbpagtEOLuBC2d50Ec3A4f7vPyJNTbbp9e+Ik=;
        b=n2cX9+ejYdADUCu46qXx8N08sal/gxshe2qq716EDfzqHNHhh8D6KkEL3L+hjxYC7H
         rGy9LwU7oycFgwvhRxEV+BCmacEwgiYgumP7RytUPSHXUzi0Bg0whUH9cbL985jSuncx
         OUOg7H7PRDaSKSK28JIOK9ivJSDsgnO6Ov0nzzUlbaz+yZUJFwKNNe3Wl05qyHjc6OO3
         vlUaKDp4TStmMYvQyNJdBMEmF7HQRKazA8k8t5YZoxRIcXdmlAqwkG+3elggoaniAprk
         HVRpEpfrZiuW9KUhWLNRDZkBogKIztKNrIc3mPFv3qdvIJ3UACE/CiriTbTEbEKLohet
         oSZw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4qFcCwBiiNdJW3tV+YdHu1UltePXVpNlO1o2tNbDfU60Lxjnz9GEepy0DxdZJZSilr7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyGYEe8jEmGnFU+ZBRgB+GsTuZXZTlmLZHtR5rCR+mDcj4VeEPc
	3FQ9Uw5+n0ubJcjHGAuhfZr0AfY0I8j8ijEvfq0CEdCRKggCuIfXWW6MuRHdApY9+dPqLcgFsl6
	mbPCjoQyGGKO+H4k45bE4mf/hN6AzHSdZ677DFKJ2YIU0pIlGkjc6wv8=
X-Gm-Gg: AR+sD13Qpfh+JP0JyglGbfxGmqiPiQbhvKyv10gO39VY8rWqf//5EHwu/mZdTjJ5pJj
	HzKtd5Cv4qj6uRao14CstOAagSKc7/35QBl53FU8m/9K20+YmDKuOnu8wcniy/jm7lFuRSSAVXt
	U3xqgfgnbnXt73MSiGdubQ++Ov6mISm8KEoC22R8Ho3ETYH2nupbdZqqaPBeELZ0qfIYvFXn9ZT
	KzhbPyhx4V9jf12iCsc6bT6dLiElpDZCDH4VjyDLU0Tab2gbMFaNBrjxL30OXCE3gu4nn3pSLme
	QoZ4PdMcHvnx3cO+Xc2qYyqnrChqI0lv1LP8vtxl+S+8bsYB9BFAB3qphiS14Vqxt797r/oKWI6
	pSqAo2RrxHVLOlWTI
X-Received: by 2002:a05:622a:1801:b0:51c:f8f:13e with SMTP id d75a77b69052e-52b567f1258mr95146051cf.40.1785618268128;
        Sat, 01 Aug 2026 14:04:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1801:b0:51c:f8f:13e with SMTP id d75a77b69052e-52b567f1258mr95145531cf.40.1785618267661;
        Sat, 01 Aug 2026 14:04:27 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm16911890f8f.3.2026.08.01.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:04:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: nxp: Correct white-space style
Date: Sat,  1 Aug 2026 23:04:21 +0200
Message-ID: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8663; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6vnP9bDIJW1WrcV2zoZ0rjoF5DH+2zrB1ClkTk0Ep2c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl9UIsDcTUcj19PMtP6goGukFpGfayS3nNqa9
 92eXR+YJBmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fVAAKCRDBN2bmhouD
 1xA4EACFImkcSHyyoZAhuonl9ho5GXc2jxJQ6ZuCpgjg/SR4w5iZv4a/GM7YtFD9wIDxZzpsttv
 eXY+GgZrCERYBy73KdNIxsKEtckL8tM7sWLSJSnr/tHKfEM89ZzFWYwlRBrp7upcvdAOCfFB2g4
 z8ns6ktMrCnsYBJYK06eT76HkzesLuswaDwgL/Ljv81hnbZYHNnJU9CuT0zK10UmSVeyvIZ+BIB
 mp+Tk13BEbiTcucxnBxRiKSFS7Fvi3nlQ1QILYwHvtcPYj45y/l/Q/pIqlqsBPiPolVl9yTLd88
 bOwYVmYcgvriNF5bjKSmjIgiTY8cdd+JjnzRnddAeZ9cQwrbQefJeXT+HB2b+ahI5f7nTJufpUb
 c4mfLUwTewnzjNhm2FQLgnjvQSR+K0qDXKh9gXDZodqfZGOLLqmatbQStrnoZUVUBZ9rI6vlkOk
 7Apd6opbrhCZ+oDgdoi+q4FldbcEqyucyycsFSsju9pnewNxkZeSt7BUtiZNlkSdnyHe+/chqOD
 iZOJ8IHv884t0OiANitNbvvG3Op39/d3bUgiuNTx4BsrCNPI5/vC91486yFzQVAkq/rwBUmizbd
 pd8oEugBTx/iHKPs6UweShSx9SxfJh5RonXIv41Fq7fzNfHetarkqjt9Md++MHdcs8pQs3L4Y0S oKY1y/X8TBP0Lrg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX19QqNFJJphTm
 h2SgWJqwe8itJC8IYlQDuVu86nB0RBpfDX3DgZ3fsdsCrUUENXgc58eZr3QSjbhaqG/HOepLMg+
 7VnqKmsHsLv1d38XiY2O8RZhNhJia2q31zpZvKeLQFqpYKqAxoAdKZKMqKr9Snzfa+7+eEIIEzD
 eqGXFWKdTRrpV0PCzgwnC8s6jvcb+ht8EQLMslF5QeOdsJae4m44DO1TJgDQO1WtFUiyrzMagng
 U0DOtFuqWrn2clEPyNZBH3DX0jg2joODi3wDBr1cNreYYsQbl2oT/u0c6Np3klRok00ro6OdYfa
 669mENK1BtVx+WQBf2Vom4izCQNn4xPNm3HBH/PvsAJynAQhpfKLZlhx87NgYuEAGbPHynwg+M/
 L5t/AApcl0V4LlNamt3WFj8uMoy96HqvZ6rtdBC38UXYM/J7iD7WWMbY2ZwBzpbqfvjtQSRP1bm
 ijM6oHWaRqN/B+nqMxg==
X-Proofpoint-GUID: a-LQ1TMUAOnlEwMLfQS3SvfAh_7VU-RN
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6e5f5d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=AXt24ZvJ6lj9WyOqnD8A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: a-LQ1TMUAOnlEwMLfQS3SvfAh_7VU-RN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfX+Nh5uJ/BPHwa
 nLCd9POU3bCRcthE5PJ0HiqfUhj9ftYmC01ivVHGxiKJrPJWdmO5Dzq5Ap0/ksAxlugkO9Uvs0a
 SV+biGR1X0KG2dJXmbNSvBL6MgR020o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi                |  8 ++++----
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi                |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts        |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts      |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts |  8 ++++----
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts             |  2 +-
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi                | 10 +++++-----
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
index aac7b9ef7627..ed59b27834a6 100644
--- a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
@@ -240,13 +240,13 @@ regulator-state-mem {
 			};
 
 			/* IR_3V3 */
-			ldo1_reg: LDO1  {
+			ldo1_reg: LDO1 {
 				regulator-name = "LDO1";
 				regulator-boot-on;
 			};
 
 			/* Core1_3V3 */
-			ldo2_reg: LDO2  {
+			ldo2_reg: LDO2 {
 				regulator-name = "LDO2";
 				regulator-always-on;
 				regulator-boot-on;
@@ -259,7 +259,7 @@ regulator-state-mem {
 			};
 
 			/* Core5_1V2 */
-			ldo3_reg: LDO3  {
+			ldo3_reg: LDO3 {
 				regulator-name = "LDO3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -310,7 +310,7 @@ ldo10_reg: LDO10 {
 				regulator-boot-on;
 			};
 
-			ldortc1_reg: LDORTC1  {
+			ldortc1_reg: LDORTC1 {
 				regulator-name = "LDORTC1";
 				regulator-boot-on;
 			};
diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index 3bb11c5a6353..dc7ff108aa85 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -243,13 +243,13 @@ regulator-state-mem {
 				};
 			};
 
-			ldo1_reg: LDO1  {
+			ldo1_reg: LDO1 {
 				regulator-name = "LDO1";
 				regulator-boot-on;
 			};
 
 			/* Core1_3V3 */
-			ldo2_reg: LDO2  {
+			ldo2_reg: LDO2 {
 				regulator-name = "LDO2";
 				regulator-always-on;
 				regulator-boot-on;
@@ -262,7 +262,7 @@ regulator-state-mem {
 			};
 
 			/* Core5_1V2 */
-			ldo3_reg: LDO3  {
+			ldo3_reg: LDO3 {
 				regulator-name = "LDO3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -311,7 +311,7 @@ ldo10_reg: LDO10 {
 				regulator-boot-on;
 			};
 
-			ldortc1_reg: LDORTC1  {
+			ldortc1_reg: LDORTC1 {
 				regulator-name = "LDORTC1";
 				regulator-boot-on;
 			};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
index ec5a9bf40677..30275319902e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
@@ -151,7 +151,7 @@ reg_usb_host: regulator-usb-vbus {
 		enable-active-high;
 	};
 
-	reg_wl18xx_vmmc:  regulator-wl18xx-vmcc {
+	reg_wl18xx_vmmc: regulator-wl18xx-vmcc {
 		compatible = "regulator-fixed";
 		regulator-name = "vwl1807";
 		pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts b/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
index 929def2bb35e..20b6cc74f622 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
@@ -177,7 +177,7 @@ reg_usb_h2_vbus: regulator-usb-h2-vbus {
 		regulator-name = "usb_h2_vbus";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&reg_5p0> ;
+		vin-supply = <&reg_5p0>;
 		regulator-always-on;
 	};
 
@@ -207,7 +207,7 @@ reg_dac: regulator-dac {
 		regulator-name = "vref_dac";
 		regulator-min-microvolt = <20000>;
 		regulator-max-microvolt = <20000>;
-		vin-supply = <&reg_5p0> ;
+		vin-supply = <&reg_5p0>;
 		regulator-boot-on;
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
index 657d0f1b6115..47b05207574e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
@@ -211,14 +211,14 @@ regulator-state-mem {
 			};
 
 			/* IR_3V3 */
-			ldo1_reg: LDO1  {
+			ldo1_reg: LDO1 {
 				regulator-name = "LDO1";
 				regulator-always-on;
 				regulator-boot-on;
 			};
 
 			/* Core1_3V3 */
-			ldo2_reg: LDO2  {
+			ldo2_reg: LDO2 {
 				regulator-name = "LDO2";
 				regulator-always-on;
 				regulator-boot-on;
@@ -231,7 +231,7 @@ regulator-state-mem {
 			};
 
 			/* Core5_1V2 */
-			ldo3_reg: LDO3  {
+			ldo3_reg: LDO3 {
 				regulator-name = "LDO3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -282,7 +282,7 @@ ldo10_reg: LDO10 {
 				regulator-boot-on;
 			};
 
-			ldortc1_reg: LDORTC1  {
+			ldortc1_reg: LDORTC1 {
 				regulator-name = "LDORTC1";
 				regulator-always-on;
 				regulator-boot-on;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
index 4c655579f43e..64a74719c216 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
@@ -276,13 +276,13 @@ regulator-state-mem {
 			};
 
 			/* IR_3V3 */
-			ldo1_reg: LDO1  {
+			ldo1_reg: LDO1 {
 				regulator-name = "LDO1";
 				regulator-boot-on;
 			};
 
 			/* Core1_3V3 */
-			ldo2_reg: LDO2  {
+			ldo2_reg: LDO2 {
 				regulator-name = "LDO2";
 				regulator-always-on;
 				regulator-boot-on;
@@ -295,7 +295,7 @@ regulator-state-mem {
 			};
 
 			/* Core5_1V2 */
-			ldo3_reg: LDO3  {
+			ldo3_reg: LDO3 {
 				regulator-name = "LDO3";
 				regulator-always-on;
 				regulator-boot-on;
@@ -346,7 +346,7 @@ ldo10_reg: LDO10 {
 				regulator-boot-on;
 			};
 
-			ldortc1_reg: LDORTC1  {
+			ldortc1_reg: LDORTC1 {
 				regulator-name = "LDORTC1";
 				regulator-always-on;
 				regulator-boot-on;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
index 814401486792..d20d2735cab5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
@@ -633,7 +633,7 @@ MX6SLL_PAD_PWM1__PWM1_OUT   0x110b0
 		>;
 	};
 
-	pinctrl_wdog1: wdog1grp	{
+	pinctrl_wdog1: wdog1grp {
 		fsl,pins = <
 			MX6SLL_PAD_WDOG_B__WDOG1_B   0x170b0
 		>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
index 25f38acc5350..b1989013c1a4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
@@ -272,7 +272,7 @@ &uart1 {
 	status = "okay";
 };
 
-&uart3  {
+&uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
 	assigned-clocks = <&clks IMX7D_UART3_ROOT_SRC>;
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index e0b9ea6dd510..af518fc08809 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -721,7 +721,7 @@ queue-group@2d10000 {
 					<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			queue-group@2d14000  {
+			queue-group@2d14000 {
 				reg = <0x0 0x2d14000 0x0 0x1000>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
@@ -740,14 +740,14 @@ enet1: ethernet@2d50000 {
 			ranges;
 			dma-coherent;
 
-			queue-group@2d50000  {
+			queue-group@2d50000 {
 				reg = <0x0 0x2d50000 0x0 0x1000>;
 				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			queue-group@2d54000  {
+			queue-group@2d54000 {
 				reg = <0x0 0x2d54000 0x0 0x1000>;
 				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
@@ -766,14 +766,14 @@ enet2: ethernet@2d90000 {
 			ranges;
 			dma-coherent;
 
-			queue-group@2d90000  {
+			queue-group@2d90000 {
 				reg = <0x0 0x2d90000 0x0 0x1000>;
 				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
-			queue-group@2d94000  {
+			queue-group@2d94000 {
 				reg = <0x0 0x2d94000 0x0 0x1000>;
 				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.53.0

