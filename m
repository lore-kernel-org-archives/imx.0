Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586132;
	b=VUZbCeq+rTl0HW7byJD+QbRuxLgJgL/3w5wOlaeOY/oUJ3Ru08R8XJY9OD+Qq3VTJ2hv
	 f7/ZJsk8/uINoENExpDhJ5d2yZLxfqmXAxTsa3Wwtg39aQ1MglMU/thM3jJnYKMQ2i9TI
	 bzr2UYWmTFYpYqIOAcvOoIsBC+MDZcmOiZUpcp+NDucOjXljfZsD514gHdkuQxwhMVv+Z
	 GyI3ASsLmj/0fwe77VnTGPVgptzErVshplTKY6OzKsj4S5c7LlQuzziDsS6hrnxms/Ws/
	 QyenJeY+bvUlt9tnxp6MYUcvTtxCyYPW9uyO54n6OK+BCOldU7I6dHnvJvjsx1b131w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
	b=QpkcZHYLSJb5oCCv/sQ98zM3V14MmZ3QvS2TktalTW6v/vUdngUtL/DAaYYMa2GY3R3B
	 K1UQzvzvJWMxV6ZK2V0rX34ST4EacJesv7YMFClxcS6L2aClHqwlqg30hUGFMWMHPMD78
	 qzlwDd2RkrLOS0KvtPztUxjshmhOGcKhcfzpG5Gdske1F9j4uftGbz5PRLtsA7JAsUQXI
	 OIg/sRbC4HwJoWa1ouoQnSPBCC0bBBm1Ot/DZnpqO3DvWKfV5Y9V5dyEtinmcbT4PL84R
	 gT76WWaiOh872k7fkz32b1vJ9Ecf0eY3GbF7UoyIfIFOGQoFk5rtuGm8WVkUyvrcReA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFwHApHW;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D491606ABCB
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 12:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D491606ABCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFwHApHW
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so358301b3a.0
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586132; x=1793190932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
        b=XFwHApHWP52T07tBjMNaHXXtntphXUI0CMfNtx2QP9CA8YBunN19xZWDOIq1Vqynoh
         pQ+AwEeowGMyq4glCCDK5RUOvCAzCQbvuipB5cp50dnPI1tQkCfTQD4EaZH3UoL+d64v
         koEoNTOZ428BOXRUosgMSL2yCtfoA0uCTtSC41sJ+YobCCUZQ3JInp6Y9xQs+0K/J/ms
         klnBYt4YW8LyMT+RRjLwv1S+a+KJ8WX+VzGOwTIgNp3HLQCipLeHG7Rs1YyQx9L38epk
         sWlZXm1nQllnVoqGj75g6BnYK0cMWROW7JNlK5u3hBAfLQe0W/ShMH0hw8CIVRKhhElI
         BPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586132; x=1793190932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EYl3M1lNXMEDde5L6u4dnJnpfbfwZtPoUfD3SBMHOns=;
        b=wPWe+KUDwTZmv+SfwS2kpeZIaD6jwjN+nDj+nZD1AULho+ehj51h9qnu9Br5V9bg9E
         BwmqSx6N/C6QfOoKHRBtpif2I3HQw+Tmu0WsPl5ei/Ct/TJkaXP5nK+jJ/SWpZu/nZzM
         5zoSOiTyMr3hp9teYrHWMc6FTKWU7dOvhfmazo8LHvq8JuMcp/9m0WMz1SJd/GGdRibt
         UrqALIZn1/nE1d7nlbjDintSwQSUt54bIfVFRwzeUMWzJbROzgW7IngtiHl1BW1kRS+l
         i8mGXhpLEhS2LACV4yCnYnY6aq2Pn86ILch5uDAH6RzF3KDowjls/ZKyWhGj2kUOv4tQ
         tjUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhZgN9p/ROkeP9eyV/AMnaiAbLp2bqj3FSDfqasRqoo3YgM2+G8BsaIlT8n1+NpcQE0Ek=@lists.linux.dev
X-Gm-Message-State: AFq9FYJakboZmhutj6gFaFBP3B7PCMkwAl5mGyLgiPGBr0Iv7cp7Hj+y
	spHaylAlaiXSg4KDqceL8i943s/p8FyqVlfpZI6tdO9Qn8AS7Py22ve+
X-Gm-Gg: AYBFou1sWppIIf8Fs7w1kWBCSdxcV6towO+i2/u9NJGYwSEcdnPpYujEMwMALedO/B3
	tRCZ2aI+fOYgD+u17XXMPUIp3HPS5URPBxeMYlbwIsGsFs1wUi9Nb64CSY+gva6b+fjaShI6w2O
	U+u8FYc6zdKEfCSlRM22W8o0piqeHTlSFnhauvCAC3NJDe4J5EL/EYBG70PFhxtc+rmO5QQUxre
	hlcFhG38sk9kove9CK2K4w8WG3frx1DQp9h1Pxoy+cpSIL8Va5DkdnrZ5jD/2ih1AqMDGa5Ykp1
	/XgOrmmJ/duTEkYze/oOOHtUDkd231kaDFbPv+WrzFvxHozwPnL4UO6P7fLzvDWJJ4O/H6PuPDu
	kxLPT1naeyaF8CEjMMGGwYYRL2DyEiJxEEhVW/vFDQF1KDTyyinNnWipul4BqwNJOTCyx3Paa7g
	uXf2ydytdZIuxyK6U0eLNAT5oJgxwmdhMpEWT/x3D25sR1FNbkw3ivHOi3S4RPw6o3qtmgfEEc7
	HT4zcoEB/octBSjdWUDoP1lImh4G+sw6SK/aEkR7P6BirP1du97vcLiuW0CFse758WK6KVJQMR7
	7oZgy4M=
X-Received: by 2002:a05:6a00:998:b0:89f:1b32:29a5 with SMTP id d2e1a72fcca58-8a089c4294dmr1551510b3a.7.1792586131851;
        Wed, 21 Oct 2026 05:35:31 -0700 (PDT)
Received: from FLK-B04Q314.global.tektronix.net ([87.58.102.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b484esm825732b3a.13.2026.10.21.05.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:30 -0700 (PDT)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Date: Wed, 21 Oct 2026 14:35:19 +0200
Message-ID: <20261021123522.346317-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021084602.121087-1-sympthicode@gmail.com>
References: <20261021084602.121087-1-sympthicode@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
node to the i.MX 7ULP device tree.

TPM6 is located in the Application Domain (Cortex-A7) at base
address 0x40a10000. This enables PWM and timer support for
peripherals connected to this domain, such as display backlight
controllers.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
v2:
 - Move tpm6 node under ahbbridge1 (bus@40800000), before lpi2c6@40a40000
   (reported by DT bot)
 - Fix author/Signed-off-by email typo (simpthicode -> sympthicode)

 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 39e37ae9b2b1..6240750b84dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
 		reg = <0x40800000 0x800000>;
 		ranges;
 
+		tpm6: pwm@40a10000 {
+			compatible = "fsl,imx7ulp-pwm";
+			reg = <0x40a10000 0x1000>;
+			assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
+			clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		lpi2c6: i2c@40a40000 {
 			compatible = "fsl,imx7ulp-lpi2c";
 			reg = <0x40a40000 0x10000>;
-- 
2.43.0

