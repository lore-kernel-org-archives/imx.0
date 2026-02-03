Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7939A812
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113099; cv=none; b=jXxr5E+UA66/Tf8HpKddsj5FBb2uNVYd+EwagT9KcW9OpkUWeSYWAeatF7d9R6wZFtvBsTQ01ZFOmY44Vm5iJE31GV05fzWUmsSQAuSiIUrpIEuDjyytnC3jUdeIDwhH2IBuiWN1jBCnk2NwpMKGKCozgWKconLs1YlvS6vsdpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113099; c=relaxed/simple;
	bh=Hik5asmTwUamyL0nKO98yWSe3Rq6gzjjcbyeQGAYfqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WTee1uKwHECF2NlTwWkAjxS62y7yNj3GEtQTOf+0S/CiPjQxR0twU04hQjacf18J+PEwNqlc9IFPxcI8mTtXvQ9EU2j49JgKY52G+cjWr8qQnAJyxRLK9nyAoemAIqkJxSP2yIptefoxF20oUufR294a+7JBLRG3pZ+7ZhXVK2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sn7HoM3r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sn7HoM3r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so39597705e9.3
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 02:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113096; x=1770717896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z51/LSwxyVQQCwJzOsYDCUnfNLjjWuW1smeCgpUaBns=;
        b=Sn7HoM3rvXqBIVStaDTs6gchmQfVWddJOYmF9U3KHgfu6EzFn5Zu0nPBNNp8vbrwJM
         76XC+swI1dM2wZNRnQGfPxTu57Nb8QRQqh3fbPYFt2oiXk3vNdHnrNHFCH/JFdNohsTr
         UGulpkgB6SLA52J+JsDoSt1fFTa0tL7z7hWOFnl1RtYGIk2ZNGXchH8sYosdAU/6f2Km
         2XH/AbWxS5C7MMxz5woqeMsUuEYBn1XmyLX9bv1Chp+B6ydYtFGnGMW7/o5agFljxoyc
         FJnfmQLYtFpavTRFH1QmL4378S3jaeI01AVADBbcJOSvqv1sXM8M96Rxoaae0Aj58iRw
         tzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113096; x=1770717896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z51/LSwxyVQQCwJzOsYDCUnfNLjjWuW1smeCgpUaBns=;
        b=NIZ555S5QdSJQhb4+SPjLHKedR5O7lKDoc+81eYlazBaqGUkfY8mvqZ7CR2NkfkLTv
         VYqkOF6OaAXkoDkgL17rxSGvXcKk0CTv/kel69QcyIuj0lAYRLNIRWkFsWUwhVXyDZI4
         fXX/J3qMybhHEdFHtIsBKLV/1Qe70RkFzgecfKjBecHe5y+8AxX+BXCGg9XYFc61ZaZO
         3v/xMJDTvS9h4iDPQQldVzX+F0RmvTSbIH6CTs9OmTsURK+i4yq6C6kr3MG2/vY/hXU/
         JKkhLo9Nw9mhY972UaQFPPAylthu1hG7u6bbw3vVzEzOWOCN6/bJH6WCcpCvqPB6XQiK
         JLpw==
X-Forwarded-Encrypted: i=1; AJvYcCXhgHCIRaLEFB7YE1X/Hp/VgbJrUfgafNJwlopiNt0/i2DxiyciqafXxFfY69FHZlX4xww=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJENONZViHB59WiW9EV0eSjDUiVPP7L1jQYEJVJuKYmx+sc5ky
	6WWy3Fyfjl6cUCb9kgaXcfz/ItCOK04jN2VSAF1/uA7a6zixHdr6WDET
X-Gm-Gg: AZuq6aKR4zAdmuCYtI1yU8QiVbFtZJ+Ve7lWExoIPDyntgBQy5qFTdF6TPVsmq2YJh5
	/dzpTq1Zaf5d6ft78PxYey7eN7KFNsBwsZEXPcOK1FZ6l5Hj/qajRWyVFpyWOU2DaN+HKzVVyNg
	AI4RAb9ob/4ZX6//CxO/se4tnAFRII1UF4YSL6VSjEUkpzSlCOWwq0ktD2XOK/OEj7N0Yp3Yckf
	qQLayPNfz8MD8mglUYLE3Ou8JmzeGXAQcJtnZUfOz6akW+m6ScBm5cmqMZ9hlqglYGcUvHqiGfd
	qatB1plHmqMAmD2+Os6nmWj1cvoX0VABkl9uFkqYMshrHoLsZ6luXwEkAQYLmAOoVpoCpC7ox7r
	ajpFpPWlHnvc2knRRQnuK+OS/ueIj+OczB+Nm+E5sWVQuy+26jsUJnfyiFRJQaWJdSyHR8l4X0x
	DSpRGj3bjKsV4a2Zk66p/PfjmVoxMYKQq26AreLw==
X-Received: by 2002:a05:600c:34c4:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-482db012dd7mr201253775e9.0.1770113096399;
        Tue, 03 Feb 2026 02:04:56 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm115534365e9.0.2026.02.03.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:04:55 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Date: Tue,  3 Feb 2026 02:03:32 -0800
Message-ID: <20260203100332.915-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for AONMIX MQS (i.e. MQS1).

Reviewed-by: Chancel Liu <chancel.liu@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index ca1c4966c867..0f43e3be7058 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -243,6 +243,12 @@ codec {
 		};
 	};
 
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		links = <&sai1_port1>;
+		label = "mqs-audio";
+	};
+
 	usdhc3_pwrseq: usdhc3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
@@ -473,6 +479,21 @@ &mu7 {
 	status = "okay";
 };
 
+&mqs1 {
+	clocks = <&scmi_clk IMX95_CLK_SAI1>;
+	clock-names = "mclk";
+	pinctrl-0 = <&pinctrl_mqs1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mqs1_port: port {
+		mqs1_ep: endpoint {
+			dai-format = "left_j";
+			remote-endpoint = <&sai1_port1_ep>;
+		};
+	};
+};
+
 &netc_blk_ctrl {
 	status = "okay";
 };
@@ -534,6 +555,51 @@ &pcie0 {
 	status = "okay";
 };
 
+&sai1 {
+	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* leave unconnected - no RX in the context of MQS */
+		port@0 {
+			reg = <0>;
+
+			endpoint {
+			};
+		};
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			mclk-fs = <512>;
+
+			sai1_port1_ep: endpoint {
+				dai-format = "left_j";
+				system-clock-direction-out;
+				bitclock-master;
+				frame-master;
+				remote-endpoint = <&mqs1_ep>;
+			};
+		};
+	};
+};
+
 &scmi_iomuxc {
 	pinctrl_emdio: emdiogrp {
 		fsl,pins = <
@@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
-- 
2.43.0

