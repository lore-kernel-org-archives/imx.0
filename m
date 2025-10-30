Received: from mx-relay144-hz1.antispameurope.com (mx-relay144-hz1.antispameurope.com [94.100.132.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91622688C
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.198
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832447; cv=pass; b=qclRUAZL/j7VbnMV4yU1TXFUl00ySI++JOZgDRMM/LFqqLuSHiJFnCDrgPdFsdsoHL7DdLpB7ILuilcYEZAZG3KmgAwVUFQy3I4YGhlhjUTlGqDfbTn2R1xdnGZbqWnG42hAENQkxEssZjQylD74S/INmVMSLgkuKabCg8U/LrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832447; c=relaxed/simple;
	bh=sIZggCHnGSlO45HiHftHmYcFFF8Ni5TxagNbhsJfx0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hajogJ/6gUMNNtkJzqZO+Snz5PDdDkljgy9sUm20AIrCYLXhIPkp9Iz2FjhqMbBelazifZRTNJExkM8rvekJpJyl9XDkSYWiWxTTQNLSHceZofJ5tXZfpR+KgcbPrYMvDsD9qE7HMSGVqFF9XRlV83tXS4ndJkEBR1wEZCxXNtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=A8CyxjBA; arc=pass smtp.client-ip=94.100.132.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="A8CyxjBA"
ARC-Authentication-Results: i=1; mx-gate144-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=tD+ajNxptu2k73Oepl6KZlA3PKs0QXwWaX/tcX3eJ2g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761832401;
 b=BFfb8/+zkGnOWHCE3b3FLXdBUgY26Pm9A7ApAf/M1AqeMc8FjVTwKBLs6rERR/taMOT2XhuZ
 q7ToLVfFDGDxU+S/EtHkIWTF8x4ypclChxeQxPEQxjUH9SBCCIgwDFpdbHN+S/ndNQL2yyr1AmF
 eLaaVfiRvIl1/HJej0d+M1eN4FgXphZ2nGsVNfSYMpJ3P9CU5WT40ZUF1wiyxVmBT2kuJCJEABL
 8ebJ7YL8VRBGx9jB5Hcs/jG91wcZc+zrj4wxdkXU9f1+PYxMbB88MUOBs7N85dnDu6GsGT2Za8l
 tLVtDtOtVgUCkZjRbjFhOr1Xbi+A1nNIprhKlMIKqI4/g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761832401;
 b=h6+09L5bvBZ5HcPrYDo68QFOaxvifIWSJwvyLIeuPOQqenup0isUh1hoXUH5HA6GM/xLCacD
 uS0L4AkMlw8WA0AcLEMfrtvvtc+YbxXNkmrrAxjFwSS9dBuiq2x5uWQkrW/uH9b6RcnOqt43PpT
 GhuboDJBVvPpf9VfbK9KUJxc/t0GGf1KP93ED/kUO00433AXUREdf9/+m7bm7I/527KHyfDsfBH
 13D15NuMdI0crJmjsoN0PblVo7YdFboHtFOK36aq4WvQ0FEa0gWoTDFs0Jb2d8cUMwwFSBZFgUI
 Pt43PMYQEWG4b8nXCmXsHMLrUVNBg4rqPmIHPbDrvgOxA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay144-hz1.antispameurope.com;
 Thu, 30 Oct 2025 14:53:21 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3E3895A048B;
	Thu, 30 Oct 2025 14:53:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/19] arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for i2c
Date: Thu, 30 Oct 2025 14:52:53 +0100
Message-ID: <20251030135306.1421154-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay144-hz1.antispameurope.com with 4cy5D70PDbz40bjJ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:1f356f726ad2319c426137b927962cc3
X-cloud-security:scantime:2.049
DKIM-Signature: a=rsa-sha256;
 bh=tD+ajNxptu2k73Oepl6KZlA3PKs0QXwWaX/tcX3eJ2g=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761832401; v=1;
 b=A8CyxjBARs6T1FBtt1lMpvbDzqb8i+4TgAVzYrrVTd/A76hJ096wyGlIG2WiTZ2h0wG8BnK5
 h/Gt4/07kjdRu4ueBYIwtkxxSyX++6JLAhl0DNzyQd7kM5C589gS8wDc1RETSb2W9xOfWtfDQbK
 WDWj7fdgEVWQHPUSnpjPLRnDmMfZlM+hgGqfoMaqZ/u2VSH37yHXg0YI7szxH0zjw54fKR9kBPk
 VLtVKv6jzh0YBvtEh/mXJ4GUDJH4Wvhu6DBKG4w3QYOKHkskWy02if71r1ZtB1o9K/SkFxgX2nT
 hI06RHp7tzJGyddaLygt1NvJJuz083m5W+PJBNS/jpx8g==

A sleep pin mux is not useful if it is the same as the normal pin mux.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index b7136982700a9..a6ab94208028a 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -165,9 +165,8 @@ &gpio2 {
 
 &lpi2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c1>;
-	pinctrl-1 = <&pinctrl_lpi2c1>;
 	status = "okay";
 
 	tmp1075: temperature-sensor@4a {
@@ -264,9 +263,8 @@ expander1: gpio@75 {
 /* I2C_CAM0 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c3>;
-	pinctrl-1 = <&pinctrl_lpi2c3>;
 	status = "okay";
 
 	dp_bridge: dp-bridge@f {
@@ -301,18 +299,16 @@ dp_dsi_in: endpoint {
 /* I2C_CAM1 */
 &lpi2c4 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c4>;
-	pinctrl-1 = <&pinctrl_lpi2c4>;
 	status = "okay";
 };
 
 /* I2C_LCD */
 &lpi2c6 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default", "sleep";
+	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
-	pinctrl-1 = <&pinctrl_lpi2c6>;
 	status = "okay";
 };
 
-- 
2.43.0

