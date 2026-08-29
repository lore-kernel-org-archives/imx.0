Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60670367B99
	for <imx@lists.linux.dev>; Sat, 29 Aug 2026 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032437; cv=none; b=Y35UHEHWTLXd3W6bE2n8VvNFli2CenCIFR05zNJSaoAAr8hViP3FjJFzZpuHxt3LeEn+SGEEZfDHt62DZKRorcwTMP6ve5dlLo0oHuAU/vOB/ev9yaqu7VcK0SBgTBQwD6kvNVoHmtMOxLLCSwv4rPX3dyD4/9RIZfrALu8VrOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032437; c=relaxed/simple;
	bh=u03xzcwD9ylZspI7+JnMXgsKtYsbVRW1UUGcA7cj1zA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzFyeTQpR8HFS+E7D+IqIWwJw9SA35XQ5AGFM/psA10XySZEfswEps8ykqQRYL3DuslpphnHjivjrNRVuP8zOJ4M4xgu3Y8tIt7HjIKSeaQpV/O4vP/vxdQRb+qYhjrPZRTbWrz1GopPi836pA9kADvRHOiibj1XhU5BCtXP6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0OnX38C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sxly1I4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0OnX38C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sxly1I4L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx84E1257990
	for <imx@lists.linux.dev>; Sat, 29 Aug 2026 19:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kvOjP7H743NqEr4+DNIdZ2XfKWZWa+GVyO0
	tgJcX8hk=; b=o0OnX38C3k/YvauvfAwK3mb8/dAO63vHnDfQ/LOs1QymM08RY4P
	Uvag0sK8YMiZcSlDNLDeVj8yIJ0EaAcXFWBo/UY3ev7V6c3XHfqNfKJwwD3cVRJv
	gIYSxaKih9ukks5co3oFuZiQG2VwmIqVIprkIXOkLQWUDuV8R8hZFfXJuZyCg+dm
	SNQg4fPrOqCN2acnn81AiAW88TeUpP3te9NZRWmw1mEgUJpNKZ7bPX8og+Fm5gVk
	zX/WAle14VXy+PLsuhslUanjOz58gUMm6pPCHgdqkS823+v9xbqp0OPNj4DrVxxh
	pJmLkCFm1Bt5ASnP90g0lWLodu4aO8Vz9Pw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgsgsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 29 Aug 2026 19:40:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so25259031cf.0
        for <imx@lists.linux.dev>; Sat, 29 Aug 2026 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032435; x=1788637235; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvOjP7H743NqEr4+DNIdZ2XfKWZWa+GVyO0tgJcX8hk=;
        b=Sxly1I4LpsuDApLU7w5pUQGPgjdI78pYc5vbqQ13ojNolKqZFmKJDs/fPv6xmXAt3b
         uF4G5xzGjgrGpct+k/N9p5EjLR6QHxkneuCxinHPHx75Rk622FMSKA1s9Eft0RSbC3Xp
         KnThuqB52N3KJ3+ij7UIZuyu36y5OdopjrS1r9rZDnWSF8jXJfdCG4S/GY9zKOqA/wUc
         qXoxcgZ+t3NPEtGd8zXM+4+aSlzGonioiMNDWy/IIiHj6KgVpGuyaXphk+AFAjwF2ae+
         VcYkORidWc/xOYIg8K8yw/cFv4XZUymCtO8BSFZeaMb/amvtAiOZKEApoCyD0oaxGtFx
         HrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032435; x=1788637235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvOjP7H743NqEr4+DNIdZ2XfKWZWa+GVyO0tgJcX8hk=;
        b=UZwEY7nCPzaZw4AlXZvmgLYK1+Kr5whZSCGcvJ2k2H4AnG9u2Au7ywofBTKTT36hpO
         9NcBJe92hn/lY2x1yKUHPXrdhYK3TUnYE+pOtD1Mxd3tJ9A50ypvCRDuillJUApa9KOY
         8pL0+I0QzV4AeBWsw34DUmnG4x7hMfiTpxaAzM2ijFOLaMoYiV7lvkOIWXr6HETznbs7
         KeEdBqvkpUJR08+SD13LgvNsQlHNi2xOJ2wsd+RosURSVbHzfRsesBu6I4ziWKWGo8Z6
         6dvKBQhSRQ9Qd7X5gIcTDOr9Ot2P1CmcGNpeK9hNP8Z9DE5rfnCV+JZltN5GgCk2LBnG
         Y87w==
X-Forwarded-Encrypted: i=1; AHgh+RoYhj+SeJdBsxwyCLrXI6ANR10tr3GBdEkVgHCyed1E6sVX9zGEtrs1g3qR+j1foN8nkAg=@lists.linux.dev
X-Gm-Message-State: AFuF++kaPKRUxE7ROt0Kd47KGQcBO6ItGpH0lWuGDD6Nen+1FKmspD4w
	yh/yxlQ2ORO7iXEFdRtk2BOYw3uW9CDC6f4d9zEB5XCIjCigKs4Vfhm70FbmzK7s8d27xA3OHcn
	ES/9AoOA6OL+0tGK/MQhz4Qxb1c+gun3cXlgRAYIXRGKmoim5eMztdcY=
X-Gm-Gg: AR+sD13b3pvAfTAPGYL9iHlxVzuuWv+QvAq4O+2n/Z25b6s3HEAPEtS7I7raoNT3B38
	ANHJMu7Ujw0yGKdD0I/lDBRi+YapPtDfBlDsf6CDvq/atz75vBfL4HLhdSEo5w0agUMi2zQK7Ms
	Mb2DqgCihDiRTUFMIPwIFC7KBD62SdxD0zlMoeCNjJXxNAXlkN/bu+zVO0dDFNo2edMF1bsKvqV
	F4gCOaXUwlM/o60yWWGTCme2YJM8b+6Get7wiQSCzD0YegGpcOWPrQJjhuwHixFBX1N4vKKoGlZ
	Lpv+6onQKg8F7e7jtva4DIzwr3GHTSWXFVXFJ0Z/W64gaij5fi5RJa9k+v2l2aJHRwZXcHVOk5V
	WEnwSXV5iODQ9jTw=
X-Received: by 2002:a05:622a:146:b0:52f:4a76:750d with SMTP id d75a77b69052e-52fb93ac5dbmr196756851cf.9.1788032434428;
        Sat, 29 Aug 2026 12:40:34 -0700 (PDT)
X-Received: by 2002:a05:622a:146:b0:52f:4a76:750d with SMTP id d75a77b69052e-52fb93ac5dbmr196756391cf.9.1788032433933;
        Sat, 29 Aug 2026 12:40:33 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm65736555e9.3.2026.08.29.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:40:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] ARM: dts: nxp: imx: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:40:23 +0200
Message-ID: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6505; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=u03xzcwD9ylZspI7+JnMXgsKtYsbVRW1UUGcA7cj1zA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzWm47kpW3I2D3DFQCFh0xyI6sC8Y++0QyaJz
 MjhKolpPECJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM1pgAKCRDBN2bmhouD
 19TLD/9hX0jXvuLMesQaoPepH+K53m7ssZ4nXxxQIAkighkylKAbJ+C+2u0UN05vfO39WLiNQLS
 3zZoKNKvxgHBgLsd8Hkh2HL1AGtmwWLmC5GV4IgqWp11IIqzGuZmFpmD1ha4UF4yXWoO2W3cjoM
 TWoXUcvnHTeh3lBWFZSdGr+G4nKsSyxmmfdzLC0+zVj40kXdhSHwkHpYjmV3oSZu+8GICER7N6q
 sV2cezGc78PXyF3UzOSrhZSwhc4rY35+881J7VbsFXCc7+O5RoOi1bIZo5pU0g2SwFM3kR+J4oJ
 47kqLnD6XCaxxkujBO32iuxpSfx3ayp4F6lhQamXUnOf6zSylmHPlvyUv7lkC+OKtAA0CgIMYXH
 GWoVzFp6cZoaxd9LAHkRl9hBtpTkoGZZUqbJME5JLqWUTCvZFxbS5TVaS/i8N09+MZIIJEFvU0+
 tiChhGsiI2HFF6eAP/zz+fI+HAVOu60Jkl04slTTVFMAZ/wSffA/SI7dJmc8S2nHg8SiXH2lmKb
 Q7X1HHVXZU5VbmfjFf7ob8mBcFc7CaCpCUVnxpC+0TuhXVD4Td3I4IL8Hp81UH8PqgAQOGucsMH
 rrozQVa/Tc6KMh+Og+Z4/SVFhSO8d4kKtSrgW4NbR5ht2U6B9+vrplHXZukFgtFwN3vOWVtdQni iS3Y3vjwa0CV75w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX9K5EpJb6prpE
 QnkmOOygVZh/o7wFOea7aIer5hdkKrPxDLnVGL1+Qomi8vmaTPzb5Itg6jbLQQAtDld3GLnq1UN
 e5wdk72O5e30fwRepOAHYvajp7eK7TWiLkEvhM4hoPhYsZNefLJQHnSuNA6HRuV9qj39d1hlJwM
 1w6mKECsEhFh3uC4dgtsP2ouBGAJ6ebTRZHZIITkWmj6oFNiwR9Dsi5cA/4d222u9LSEZsDrhOC
 OwrcMCi6/wrvqPy4cR+EvxTmcwe8H6gwuBc1id9Owacp97WZs0+BaOWArIkpapgWMvR7trYZsG9
 7wtIUxxfc3JFD01BQWUHNXtXpHgwvmV4o9ap38RoBJbmN/PyGBFW/6j28IpRcHTliMqcjerGqNo
 uG7XMoUJr3BDEDulU5BG5Fk8gVf5ELHDSxO3LZ+DNSWKO8JrolH/qf7C08nWaMuDFQVNG0mUnCN
 D1vtH1EykRNJx4BtZVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX3g414RoP80nh
 b6mCRWXlC6e08KJy5lscE8et4TL1AcCBSxYbjMsrIZaDGMcI+JFlMFjnwBrTr8MpTWKTVo8l0LY
 cA0uO4zPFNzcqlamGwqITemTDvgEbGw=
X-Proofpoint-ORIG-GUID: XYLUjnJvDnY2p_gFgS0-MNTaFjk2kD67
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a9335b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=RjE-yO3A8T5mLwkRmZoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: XYLUjnJvDnY2p_gFgS0-MNTaFjk2kD67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290170

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Also two GPIO values should be really separate <> entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts   |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi | 20 +++++++++----------
 .../boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  2 +-
 .../boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi    | 10 +++++-----
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        | 10 +++++-----
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
index 635c5a1e1fc7..e3496ea9643d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts
@@ -155,7 +155,7 @@ alert {
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
-                              <&adc_ts 5>;
+			      <&adc_ts 5>;
 		io-channel-names = "y", "z1", "z2", "x";
 		touchscreen-min-pressure = <64687>;
 		touchscreen-inverted-x;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
index 353f7097cb7e..09381dc980b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
@@ -288,7 +288,7 @@ alert {
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
-                              <&adc_ts 5>;
+			      <&adc_ts 5>;
 		io-channel-names = "y", "z1", "z2", "x";
 		touchscreen-min-pressure = <64687>;
 		touchscreen-x-plate-ohms = <300>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
index 18019a6bb3af..f874b2b11114 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
@@ -116,7 +116,7 @@ alert {
 	touchscreen {
 		compatible = "resistive-adc-touch";
 		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>,
-                              <&adc_ts 5>;
+			      <&adc_ts 5>;
 		io-channel-names = "y", "z1", "z2", "x";
 		touchscreen-min-pressure = <64687>;
 		touchscreen-inverted-y;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
index e9d5bbb43145..57f1583c74fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi
@@ -418,16 +418,16 @@ tca8418: keypad@34 {
 		reg = <0x34>;
 		interrupt-parent = <&gpio5>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
-		linux,keymap = < MATRIX_KEY(0x00, 0x01, BTN_0)
-			         MATRIX_KEY(0x00, 0x00, BTN_1)
-			         MATRIX_KEY(0x01, 0x01, BTN_2)
-			         MATRIX_KEY(0x01, 0x00, BTN_3)
-			         MATRIX_KEY(0x02, 0x00, BTN_4)
-			         MATRIX_KEY(0x00, 0x03, BTN_5)
-			         MATRIX_KEY(0x00, 0x02, BTN_6)
-			         MATRIX_KEY(0x01, 0x03, BTN_7)
-			         MATRIX_KEY(0x01, 0x02, BTN_8)
-			         MATRIX_KEY(0x02, 0x02, BTN_9)
+		linux,keymap = <MATRIX_KEY(0x00, 0x01, BTN_0)
+				MATRIX_KEY(0x00, 0x00, BTN_1)
+				MATRIX_KEY(0x01, 0x01, BTN_2)
+				MATRIX_KEY(0x01, 0x00, BTN_3)
+				MATRIX_KEY(0x02, 0x00, BTN_4)
+				MATRIX_KEY(0x00, 0x03, BTN_5)
+				MATRIX_KEY(0x00, 0x02, BTN_6)
+				MATRIX_KEY(0x01, 0x03, BTN_7)
+				MATRIX_KEY(0x01, 0x02, BTN_8)
+				MATRIX_KEY(0x02, 0x02, BTN_9)
 		>;
 		keypad,num-rows = <4>;
 		keypad,num-columns = <4>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index e2631db798a8..27a73a3361ae 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -28,7 +28,7 @@ aliases {
 	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc 0>, /* 24V */
-		              <&adc 1>; /* temperature */
+			      <&adc 1>; /* temperature */
 	};
 
 	leds {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
index 9ff183e4e069..601733c3c2a9 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi
@@ -22,8 +22,8 @@ mdio1: mdio {
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_mdio1>;
-		gpios = <&gpio6 5 GPIO_ACTIVE_HIGH
-		         &gpio6 4 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio6 5 GPIO_ACTIVE_HIGH>,
+			<&gpio6 4 GPIO_ACTIVE_HIGH>;
 
 		phy: ethernet-phy@0 {
 			pinctrl-0 = <&pinctrl_rmii_phy_irq>;
@@ -218,9 +218,9 @@ edp_refclk: edp-refclk {
 
 &clks {
 	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
-	                  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
+			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
 	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>,
-	                         <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>;
+				 <&clks IMX6QDL_CLK_PLL5_VIDEO_DIV>;
 };
 
 &cpu0 {
@@ -629,7 +629,7 @@ reg_5p0v_user_usb: charger@32 {
 		pinctrl-0 = <&pinctrl_ucs1002_pins>;
 		reg = <0x32>;
 		interrupts-extended = <&gpio5 2 IRQ_TYPE_EDGE_BOTH>,
-		                      <&gpio3 21 IRQ_TYPE_EDGE_FALLING>;
+				      <&gpio3 21 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-names = "a_det", "alert";
 	};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
index 9438862b9927..86c4f7e010d0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
@@ -924,11 +924,11 @@ pd_pu: power-domain@1 {
 						#power-domain-cells = <0>;
 						power-supply = <&reg_pu>;
 						clocks = <&clks IMX6QDL_CLK_GPU3D_CORE>,
-						         <&clks IMX6QDL_CLK_GPU3D_SHADER>,
-						         <&clks IMX6QDL_CLK_GPU2D_CORE>,
-						         <&clks IMX6QDL_CLK_GPU2D_AXI>,
-						         <&clks IMX6QDL_CLK_OPENVG_AXI>,
-						         <&clks IMX6QDL_CLK_VPU_AXI>;
+							 <&clks IMX6QDL_CLK_GPU3D_SHADER>,
+							 <&clks IMX6QDL_CLK_GPU2D_CORE>,
+							 <&clks IMX6QDL_CLK_GPU2D_AXI>,
+							 <&clks IMX6QDL_CLK_OPENVG_AXI>,
+							 <&clks IMX6QDL_CLK_VPU_AXI>;
 					};
 				};
 			};
-- 
2.53.0

