Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6086331A4C
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915333; cv=none; b=Qe5SVIf9hSLgAaTtE69LE9ag1SH3+tgCpoJ0FUKx1eUOTBhqTQhatZ23ADy9L0yF3fDqwr3GT99CTduMbR0TKgyKYjn3GRwzd+SyrQQRYg6t+H6XC7Lq10uNGRtmchK0BF1GPf58wJIwHXg+CuZhaaGyTycH6c6TY8fzSl2ekgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915333; c=relaxed/simple;
	bh=maxNummCODk3xOKN9REfqVWBI6syLE7tsnIUSjVMlfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mDgvhzv5xSMeBBnzMcF0t3YWT5KHWCwn6MrLDstLua0PrzjaIblfC2xMqjM82O1VPn/qLu75ZUIeZESFi/7zr2JqmHL2ebZNe0AhLUmVYyQ8+jJUYmTs8e/JCDTRkmCZmRno+PfwCzuQwIqp4fqfIAiEhw3x2SpbHX7bEtwOE5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJcle2Co; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJcle2Co"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4710683a644so19546505e9.0
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915330; x=1762520130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ur2nzdK93Gujnnrr7/bhg1o+Yu3Nd/Uvn3Pjsb5/zzU=;
        b=aJcle2CoCMQ/+qjLB0oy6l4qf2tLCYXkUQkZ0i7ShBkimpWHYqa3WnXPuhNDVI05df
         jOVkRGzODMkB057gydVIFoEwC7UO1t7H3VBy+SBg8Tl9O1SGfbYtL2E6fSsRi++Yws+c
         o5LUFDTRfDc3o52QvqjgkJFYAX2OciULhIhD/Qj3DYkrlkmJA0d7q909io98W5ueAHHc
         X+TQV4GqQZ/WCcG3pziQgUzeY9HTGQJXY9YPfTbnuv+X05HIWuNGhIVdeUrnbE4O7Ulk
         7FsgsRVqjMa4J5boCusordLekBkZh9yOThxUo7dkhlfWvL1YyJU8r9o4a1yQJlKjxd+k
         //sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915330; x=1762520130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ur2nzdK93Gujnnrr7/bhg1o+Yu3Nd/Uvn3Pjsb5/zzU=;
        b=Of1hBtIWAyCTAR+mhgDGsq8hueximdkYo3P3N0QOrimt1tc8wkxy/xgJCT2tQye9XH
         2ViC8IPGSO/yQLoKLP7R9XH/fcNvHvIF8TgUhaa/g4WU9UuAI4J7cjiWpEMyBQk0zR8t
         XrwcjbVonPOoWKpy9/LwtVtT3FD0rNm/7j3y9BtNzZlJgdBbC2QGQdCf8g5NeU5EZEUo
         sBVQVcfGf2lUCnPUiRRE0NegyJomrjRia9xLkBPmW+S7ebMnatGjS7byaqPlKZRUakpt
         kTHBLSpHJrIeYhiqw6BUMKIkDGqQ6S/yNFpXrGSYWVT7PJ1PJz2/lywfql3pS5+2v+c6
         JO2A==
X-Forwarded-Encrypted: i=1; AJvYcCWDL4Z7t7uaxd8ta1RZaFZVjbomx52ikuEDJOdO5Rp6FJzQUWFza97MFuLM+UGYBGR8+vY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYSfvvltX+/JNJpP2t393OvyE0DhiNvRgkQDlvYP9zNuzBmPuR
	J9/cwB6rF91DJ4lTnhb/iHVK+/XCyaXgXjFS+2Q48nT24gZsXCKIgF7W
X-Gm-Gg: ASbGncurnz0ztKUGmiPJby3JJtbC5+2fALxNdUafFz6fChsZzYqGOI8Xgh9vn3JmXEB
	c7ptD4y5/PlOjnTLIT+lfRoBCxEMQ9fud/99BFWdo5hWTkOyr/5i/sVLioydFeW2TLKsfAzTE6h
	Dsta/Vcpu2R44xE4v7YL3QGxe2noARsFOgumDGmB8oBOVStf5UysuYKfOH1/J5GxtPd7mjrwqXn
	TSlBDRcFYlCBWQ3DJyiNypz96tgtDP9Dj6F4iw1n1ljVAqMiDnClk9urohdLBfUSoBxHPKZZhJ9
	nXwodMhowu5KcRh1alAENettU3aBlwk/uRL448d6bwA3Tvhx52E+YpUvF/KVbBD8uouibega6HZ
	Zv8Ei3smx6cvWC48eWAwboPDAKkB7cI8CvNHPWjgaCUq4kCTsp2Nth/hghyZha0ctZmp3oNXNTs
	rSPQdB9okOfZJDqR5Ol8DaEwc6PLBCyeBgMhacHir88VHgtuUMBR2IPKaO5FZ4XC6UXg6nx0rlA
	vi6t2kRvAhHU8dP
X-Google-Smtp-Source: AGHT+IHKkMjFYDq3sA/7iAVV6Ds+dv03BvTAXq+xvomUp5eBrJogf0XF/TD11Cyme54hAMfPd6Wl0w==
X-Received: by 2002:a05:600c:c4a5:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-4773010641fmr38615415e9.13.1761915329775;
        Fri, 31 Oct 2025 05:55:29 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c54efcadsm99111f8f.5.2025.10.31.05.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:55:29 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8qm-apalis: add pwm used by the backlight
Date: Fri, 31 Oct 2025 13:55:07 +0100
Message-ID: <20251031125510.433175-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Add pwm node used by the backlight output pin BKL1_PWM and
reference it from the pwm-backlight node.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi       | 5 ++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 5 ++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 5 ++++-
 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi       | 7 +++++--
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
index 311d4950793c..06790255a764 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
@@ -109,7 +109,10 @@ &pciea {
 	status = "okay";
 };
 
-/* TODO: Apalis BKL1_PWM */
+/* Apalis BKL1_PWM */
+&pwm_lvds1 {
+	status = "okay";
+};
 
 /* Apalis DAP1 */
 &sai1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
index 3d8731504ce1..7022de46b8bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
@@ -196,7 +196,10 @@ &pciea {
 	status = "okay";
 };
 
-/* TODO: Apalis BKL1_PWM */
+/* Apalis BKL1_PWM */
+&pwm_lvds1 {
+	status = "okay";
+};
 
 /* Apalis DAP1 */
 &sai1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
index 106e802a68ba..12732ed7f811 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
@@ -245,7 +245,10 @@ &pciea {
 	status = "okay";
 };
 
-/* TODO: Apalis BKL1_PWM */
+/* Apalis BKL1_PWM */
+&pwm_lvds1 {
+	status = "okay";
+};
 
 /* Apalis DAP1 */
 &sai1 {
diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 86d018f470c1..66261c0286d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -18,7 +18,7 @@ backlight: backlight {
 		brightness-levels = <0 45 63 88 119 158 203 255>;
 		default-brightness-level = <4>;
 		enable-gpios = <&lsio_gpio1 4 GPIO_ACTIVE_HIGH>; /* Apalis BKL1_ON */
-		/* TODO: hook-up to Apalis BKL1_PWM */
+		pwms = <&pwm_lvds1 0 6666667 PWM_POLARITY_INVERTED>;
 		status = "disabled";
 	};
 
@@ -799,7 +799,10 @@ &phyx2_lpcg {
 		 <&hsio_refa_clk>, <&hsio_per_clk>;
 };
 
-/* TODO: Apalis BKL1_PWM */
+&pwm_lvds1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm_bkl>;
+};
 
 /* Apalis DAP1 */
 &sai1 {
-- 
2.42.0

