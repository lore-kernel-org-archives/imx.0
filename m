Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900E43EE1EA
	for <imx@lists.linux.dev>; Sun, 27 Sep 2026 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513210; cv=none; b=tO2BDg7l3lAaRP0Amt2rqQZpVQPtEtqvKnEtf6wcjF0mqj4fDZxgaYqqJPziWKyI6aqEcwoxFfHh1oa9YTB6uF+vV781fdYGz8xy44ZyoIj6O6W/By0eXpLt/C8zISK4Fl2FlYtK9kqyiQssHgq1dBK1PbU0V766/vSyoRr/+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513210; c=relaxed/simple;
	bh=xGk9jTRysFq1xMJGgvf4PgE7aL4WLroGrjc8dG5KjBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bd//6e/Dnj+QKM9wZEmIa2cFvFrPAhfKHnnb8PGaW3uJzEahbK9W4lOPtMtvHqnKxOzlL2Vfo+U0iVzDscaJq/oKMNosCUFZeHwhdSL4PTsrfsB+QVuye7/f7H+NizoVUmjimmdHfzUBWVGQFliZx62thWKuHQYryyXdOipSbk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8P89xaE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8P89xaE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so7156175e9.1
        for <imx@lists.linux.dev>; Sun, 27 Sep 2026 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513202; x=1791118002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQEEneNhkSGMagWc44r//3s8R86QBncqDPoJlJvrhsg=;
        b=F8P89xaEjCLl4MptvCezjZLMmsIjQJhmmsOlhm3lcyyC7qgy/g/pkZ07aLirDQuunr
         GrnGrK3Z8M0+gkTxHk7UfzOHM6n2BauQhCmdhPLwXxcKYGvQuidiZHzkIqoYWyRbo0eB
         ht/OY0axZ9rrjdxb/86Muz1lSu0x99YSvby501fuYCC+JqcumiQTraf26sEVFO0950Cs
         Wbg3OIOFk2H87+NB7DrbXA3y7pQ8zz5XSTBfi/fv0If5sUXWavgK7zOPoZJw6kgs0/6U
         4JHL8NNTz48fFWnpQQESC1Ms34241oM60LpuJHzXqqSWcmUHUSi9QXrCPE5V0PubCod3
         Si4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513202; x=1791118002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQEEneNhkSGMagWc44r//3s8R86QBncqDPoJlJvrhsg=;
        b=cPKqMe1G0Jyc4aBoMHfXJ3amdXMoa+/3UtHReBFXYTpNSE/5YTRnfRkmUbQpkqVU32
         5DK3g7goep7WxI21Fcu7b0l8W1vLw3oCGZb6GW0rrJ8cczPOcST01vgcuCq3kGDxWtbT
         U0qtMnCcQMw1dGE9k47Z4rjvneSZuEPx/uH9HXzcLvFh8vripPU3bVnL9PvtYyE7DFxd
         rAohYTNEw7M0j4M/gvcR6cvbUCOolJFEvkaSnkCKJNDw1ydttHW5YjxRFiUbl6sab5by
         ishvpEq/GwpegU4PTbSSg3F6CtG3D7poqwJCa+3U1G3ZUQPoOdxivj2JBLanODPbx9qt
         SCIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyF8Yn/RWwaH7WTpjZw0KxaG1Qk+42T9x0LQSelj0UM2N/HFHd1P9Tn72O9k1Zpq+yEKc=@lists.linux.dev
X-Gm-Message-State: AFuF++kfQwkVvY9HRNNNn8XhRKdWtx22ndu4RU0C/T3EnpFJcHyopdcd
	m4AmzfY9QlUy5nug+pccRj1b9gWX4GkL/D8bx44eTrCSQqzT+9sj5W9E
X-Gm-Gg: AYBFou0wxYj7ZGgj1+/kjQ3HB0jLsj7CBNYl4n5Z4TNyLGIUrDjjqpcTMOsUp11CWML
	Cmiv2h8hQatt/O+ZSlyMO3ykedyH/blDT4YdHwg63BsicPt2dgST/3NOdS8/JF3hfbFWR059wJc
	9i2j9VCTbXWFQSH/8zF5Z8WSM26xY6X+SSX2OL8iqRPfZKTtCW+eRHCVnPSMfcDIoGGgJj+bPAe
	CTSuOhTtaLWxmhPdmSZ5HqCex1sf8t1nHClOB968uuqSZHtDkQlX6RDYI9mVaMhvZ10jcfCJxOf
	4QsXB5l/nAJRa9F763qZkrjnLOLRrBi14Gnhc4liJFiP8ADaPytnynguzBgrL53uxODa+Wi3tRy
	douPhB6kftmEGv2+PMGtlRD6/iwXILEGaIfW4fTRwqQtKNPc87o9FJlproK8s9QwcS4NunJ6fpd
	SpJiirO8/Z4sntOMWDt1muQVamY1/wX9XKdahoElcIygy1mw99/ktQsFeBDraY5SBorI/85OL+n
	d9CqkC5P9GGXx70gsV1dYqZcliybEf3FRbLEA/Aet8RcAZdSlg72C/53iWSjtc2fJvU025NvLT+
	mogLrvlTcyNaoiWYK1KWRQ==
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr172482935e9.8.1790513201680;
        Sun, 27 Sep 2026 05:46:41 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 05/12] ARM: dts: imx6ul: Add Variscite audio codec files
Date: Sun, 27 Sep 2026 14:46:20 +0200
Message-ID: <d82767680658b3d9452b72578aa68ad681318870.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add shared WM8904 and WM8731 audio option DTSI files for
VAR-SOM-6UL and DART-6UL. Keep the codec, SAI2 setup and pinctrl
out of the module base so each board selects its fitted codec.

The DART-6UL WM8904 wrapper adds the microphone routes to IN2L,
IN2R and MICBIAS. Both modules use the same WM8731 description.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Share the WM8904 description with a DART-specific microphone
   routing wrapper, and consolidate the identical WM8731 files.

 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 17 ++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi    | 71 ++++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi    | 85 +++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
new file mode 100644
index 000000000000..236022f3da10
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+
+&sound_wm8904 {
+	simple-audio-card,routing =
+		"Headphone Jack", "HPOUTL",
+		"Headphone Jack", "HPOUTR",
+		"IN1L", "Line In Jack",
+		"IN1R", "Line In Jack",
+		"IN2L", "Microphone Jack",
+		"IN2R", "Microphone Jack",
+		"Microphone Jack", "MICBIAS";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
new file mode 100644
index 000000000000..7d74fc3b7014
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		HPVDD-supply = <&reg_3p3v>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_sai2: sai2-grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
new file mode 100644
index 000000000000..dd5f6e4edad5
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	sound_wm8904: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8904audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN1L", "Line In Jack",
+			"IN1R", "Line In Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		CPVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		MICVDD-supply = <&reg_3p3v>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
+			  <&clks IMX6UL_CLK_SAI2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
+	assigned-clock-rates = <0>, <11565177>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_sai2: sai2-grp {
+		fsl,pins = <
+			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
+			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
+			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
+			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
+			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
+		>;
+	};
+};
-- 
2.47.3
