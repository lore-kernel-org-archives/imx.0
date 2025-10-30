Received: from mx-relay164-hz1.antispameurope.com (mx-relay164-hz1.antispameurope.com [94.100.133.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E349340280
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828667; cv=pass; b=ShgKPsQxXcwUF409O3UV/YfRMQO9MwcadFmmbNRiMxphELZcl6ft74xZmGdGqHr0kMikmjL0fTZpPPWz+8JknGwZg8dbytZ2pKIlsFg9ErW8VNycoshsWKhyhwSYvzfXSvbMgxdTFhXkId/bcxJ5akNFrE4sQeY5dt/6m7VdoiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828667; c=relaxed/simple;
	bh=nuhZ3TcRNxc8iA4zNw99CDtFaforLONChmZfXktBvWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBfRboGZbWTq1PsgNdL40qGbwpjLFzvdO8AxMRwUey6HCx60H3EQkYs6pNb91tfFhISNnjMlX2HJuwp3JirJyp00Ca0C04ujOar2IQgxgjURkFS8RpO44J8rUKZHPuQAy86Tl0j9EzvygSC+lSNY36fe9n1WHWfGe8H5sHver+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k5Vu0H/u; arc=pass smtp.client-ip=94.100.133.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k5Vu0H/u"
ARC-Authentication-Results: i=1; mx-gate164-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=LH+QGYOc/zlk9kynHB57i4Jfr2TpVc6CuOpzeWP/q+M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828611;
 b=f+oM5qxZIDG5mfMzBhL9UT1guRa0I5Mgbob3WkeK52QeHss3Jf7L5ASgUCUwazEn+Fn3qoiO
 S5jND225Ei2WzCR4aYmkg8U8kL4t3bHAlwA+LeuwhlVQNeYhNkWcQXyXSqqUOiXxTq8YTi5dZK1
 YI7AvMnXMe9lRTXbm/Um0ZUSdKVZXSLOkb+5rWlY3KaKArnn/y+uEAy1lTFHmW5TQbZCnR3PhZW
 sJmhfKEd4wkmOEY1z5uon2bvOJi2solFsTknXiVgPW+RiySljGkWn5xeSDD81wa+TVR9+wwq4qF
 stiGdqr8yslVP/viUudoc1wIuTZWdFnU1uE13OKVHFKQg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828611;
 b=f8uLi52Bt2EBR4UpPVb9QBYHvhiUWZISndE3D/m7eN4fpJmO4j01rGkdzJnKDNTTIdiRx/yV
 X9ym/LS1XRYSfhDni8QcnNSXLBTYn/JkGWXN7yBxpEPmPOz9Bf0zR7ySTJ8AH5L1hvGL/hLhjni
 shfwLUKGq8owfCbafoeJ7F0oT/lSk9vOaXLX2Nv477ewkdNUD1XJnjcDWNjb04Y1GE0fghqOiCC
 em1c+y5yY07FMMAazcH3o2x9oP7hL9FcHv5xrT82kUwiLXgeKGSGngKwb7iqC1WdmEInTYkErBl
 PlcF+IU/Jfmx1tj+M7tq0evz0/6Q6E3PvoxhnbI17SkEw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay164-hz1.antispameurope.com;
 Thu, 30 Oct 2025 13:50:11 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 35CF1220D35;
	Thu, 30 Oct 2025 13:49:59 +0100 (CET)
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
Subject: [PATCH 07/19] arm64: dts: imx95-tqma9596sa: move sai config to SOM
Date: Thu, 30 Oct 2025 13:49:14 +0100
Message-ID: <20251030124936.1408152-8-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay164-hz1.antispameurope.com with 4cy3qC6KJsz3xpSY
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:9ebcda3407cd901d1ba1b6606188f8b0
X-cloud-security:scantime:2.896
DKIM-Signature: a=rsa-sha256;
 bh=LH+QGYOc/zlk9kynHB57i4Jfr2TpVc6CuOpzeWP/q+M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828610; v=1;
 b=k5Vu0H/uCZzU3aS5gSQRIZdvZWnWS6KXXCBveUy+j976QiQZvCVrcLHjwqmpAqjblernfSlW
 EN3H9yK+yd1yFi7fmFtHj25i2eblPBwxkPLFe4e+eoz0g8emhFQxXG8bFaz6TFB0NngwKuHeE1q
 ceUhe9nh7qIYKU42xLk18+FQv0aRjL2i9Put1BswjKzgaWV3Yovg9M6saGol+EP6YsPcBXaP05+
 6Rw3k/rZSwdwiqOv4nXHRqKdt0neNBfB8OUJcABh9nDS6TJSlVQYdMibquQ7PfPEOENKantAms5
 WX4kJbrGVvYIiJHr8lreyBL+zo1evt3jT0BFqEVe5EwKg==

The muxing and other features are mostly determined by SOM, so add it
at this level.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx95-tqma9596sa-mb-smarc-2.dts | 30 -----------------
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi  | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
index 02bbaaf298930..5c94d8cf28c4c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
@@ -254,39 +254,9 @@ &reg_sdvmmc {
 };
 
 &sai3 {
-	#sound-dai-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sai3>;
-	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
-			  <&scmi_clk IMX95_CLK_SAI3>;
-	assigned-clock-parents = <0>, <0>, <0>, <0>,
-				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
-	assigned-clock-rates = <3932160000>,
-			       <3612672000>, <393216000>,
-			       <361267200>, <12288000>;
-	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-&sai5 {
-	#sound-dai-cells = <0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sai5>;
-	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
-			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
-			  <&scmi_clk IMX95_CLK_SAI5>;
-	assigned-clock-parents = <0>, <0>, <0>, <0>,
-				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
-	assigned-clock-rates = <3932160000>,
-			       <3612672000>, <393216000>,
-			       <361267200>, <12288000>;
-};
-
 /* X4 */
 &usb2 {
 	srp-disable;
diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 166439e251c53..e7edeec712dcb 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -391,6 +391,39 @@ ethphy3: ethernet-phy@3 {
 	};
 };
 
+&sai3 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+};
+
+&sai5 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI5>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>,
+			       <3612672000>, <393216000>,
+			       <361267200>, <12288000>;
+};
+
 &scmi_bbm {
 	linux,code = <KEY_POWER>;
 };
-- 
2.43.0

