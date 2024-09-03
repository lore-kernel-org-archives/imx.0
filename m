Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0951A2656
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354773; cv=none; b=kaudAFTfiXWbmqEpOCj3fBXcRZMoskRPW6hD7xBKBGq9HsSW37QlTcewy94WiikyM7pR45VpY0Oy71DSzMQwGorgVR6rMmT2OUucFGE8ncKFrD6c7vkEuv3+S5Szy+r+xaA7arHL+bFUooSzrEK51uXx2ExIIqJZXsFc8J0vTU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354773; c=relaxed/simple;
	bh=gSDhxL3U7kr/v7J19khXJJ9lHpBydvwxXsSy52o9uZ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T4pGeUKtwDEcMaKYvDCOlP0PFMXBLf1IzWeBUqnSLqzr1cpa7ACjZ360gTL2jPQF7ZcHbYcIfoy+7oHlRIxMELhlxrdYptuNAjtiApjvgd00zTXygj+hQYCqXrXsGRKzMeXWn25Y83wsSlO5pYD9SOIM/HP2t65MUYFve5Gq6SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=CJq0/nIz; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="CJq0/nIz"
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 3D63E22A3D;
	Tue,  3 Sep 2024 11:12:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725354763;
	bh=GCUCXBgEluNs9qtFpdzYjJ/FhmFocJXBjDxNqILE4js=; h=From:To:Subject;
	b=CJq0/nIzfuHy139Td3xg8WILHbrV/JWAHxWJ2li9XdkJVJZiFXb60O841cCnTrJK2
	 Zp9UJ4vE2dqkn2IxB8s/zC9WwbkEbdcAO33niWISo+HsTIhbfW8LTxQNz8NsQyYvrj
	 u1aXlJ3ET12P5pHzhE0bwl/7lXs/JAzC7og58Vvs+crPjMpD1S3pDEkNNeurelP3Ys
	 SfHU6swdgLc/jo75+1PGAOUxMiI0YDA2266D8fsEHDXKK6eZViKrGrSBUiZ6uc1pxQ
	 /7TEK7TSJTSddcGfuXwvkhGGlwjhtZwAY9ZGGOrHEFnOJGUuOW8GlWXLhmiWlv7eud
	 jFJ+JWmNWP2DQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/5] arm64: dts: imx8-apalis: Set thermal thresholds
Date: Tue,  3 Sep 2024 11:12:28 +0200
Message-Id: <20240903091231.20035-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903091231.20035-1-francesco@dolcini.it>
References: <20240903091231.20035-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>

Set critical/alert thermal thresholds for all relevant SOC
temperature trips to the IT value (max T_junction 105 degree
Celsius) in accordance with the IT grade of the SOM.

Signed-off-by: Andrejs Cainikovs <andrejs.cainikovs@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: no changes
---
 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 160153853b68..e53683e49e03 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -239,6 +239,30 @@ &adc1 {
 
 /* TODO: Asynchronous Sample Rate Converter (ASRC) */
 
+&cpu_alert0 {
+	temperature = <95000>;
+};
+
+&cpu_alert1 {
+	temperature = <95000>;
+};
+
+&cpu_crit0 {
+	temperature = <105000>;
+};
+
+&cpu_crit1 {
+	temperature = <105000>;
+};
+
+&drc_alert0 {
+	temperature = <95000>;
+};
+
+&drc_crit0 {
+	temperature = <105000>;
+};
+
 /* Apalis ETH1 */
 &fec1 {
 	pinctrl-names = "default", "sleep";
@@ -285,6 +309,22 @@ &flexcan3 {
 
 /* TODO: Apalis HDMI1 */
 
+&gpu_alert0 {
+	temperature = <95000>;
+};
+
+&gpu_alert1 {
+	temperature = <95000>;
+};
+
+&gpu_crit0 {
+	temperature = <105000>;
+};
+
+&gpu_crit1 {
+	temperature = <105000>;
+};
+
 /* On-module I2C */
 &i2c1 {
 	pinctrl-names = "default";
-- 
2.39.2

