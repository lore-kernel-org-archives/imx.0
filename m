Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728E11C07D1
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729765691; cv=none; b=HSA10uq4OHKJYy01F3OLCu5SUhA/7T+3m0b+TIMCbL741f3APaGaH99dfXe9GRwj8cfrfQpyZSK7GKA/RfQ5fwBylIcllhh6S5Wmrh1r/vQYAVStQHiNfuClC1mqWcpjXaqjiXR5b2Bbpgf+XSKo1YEcTMxQx9Dc6oHtpZGk4TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729765691; c=relaxed/simple;
	bh=wnIvT3IpVrnkazOAfuknkSg50yEaXIoQFrYlNgWuD0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTTUvb4XVGSa+gp7nNi8d3E3Vnp415azG4uIamQu6seUjmPAJ1XjDVrGdXAt4BdfU6mKiH3lPpe1nCNFoRZfK8TuuP0WE/siRlQjsR9bdc9cmvJVGjuMi4sEqONmQ6nQkWPgt8KVVXoSn53NNwdtiUQRUXzkhTcE/UJnBOJpHLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Spjcyjid; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Spjcyjid"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cb72918bddso963535a12.3
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 03:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1729765688; x=1730370488; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVJNmqv90FijvAIp/3GkvDIQz+9MpbG95NCFvDT1TVU=;
        b=SpjcyjidOt8foVxHVbdPxp8WbCNR17uXX4mNUJobWaGnhyVaOlfiV1ks3zuE1b3Zw7
         yBy62WxHeeSJ8OkYJfMbs+rw2E7/bQLWe1DQ+98ZA6AYkK3b5XN/L6A+hJZd7+Kmss/C
         DTdMSz9Lh3iIV4qgr6Kdqbo+xYiy010YyrCto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729765688; x=1730370488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVJNmqv90FijvAIp/3GkvDIQz+9MpbG95NCFvDT1TVU=;
        b=uWs7IHAb14Ae9dakMsJ9JwgWYhUFUpnb3Tc2Pq2zAmh3s47GGdLBzB2e5DeVQrH2y3
         R4RhQmM/jqcqv+RkbRGQ0aNqPbAOYeegLH4XGfnTMFQDxgE8lyK1iKAwy7l6RhY3aj/e
         nRdYFZMbOsMQebe/dcFfiTC3vAoOVT/gYl1d4HZfbdMgPKGJrzbvhqLrQbc4yrdvkXYs
         3PNTnSXlZgGBHNTvtNp5b/S6EvO5CEgoaupE0i47Np+lNx+2FisXexo19ECDgXXNoX2B
         kzR64QggRqRa+iJ0EHjFZG1gSg1IUFquAk9mllLGOG63wa8YmsFZE2ioUIjA72cSBU3u
         MhZg==
X-Forwarded-Encrypted: i=1; AJvYcCUG7iq6MypVLdkOePk0YiRj+y71GQ/k6L3fcKBUVcFCjh9Dzn7D+2n0dYvesYI/YlVOayw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzO9/TDjz2X0Xixe8vRGa1mOHBOvxhwn2BreYxIBUNxFPkaZ1VZ
	KLb1sPzqJu2wbIn8dTDG/umDpM6znAu09dVHtC9o756THK8JTZNZtmaKRgM2PUg=
X-Google-Smtp-Source: AGHT+IFIqyj+bFhDT0bT0Yue3u7gj7a0OTnPThmVI8x1ivIOOR0hXbcRig1qWOZuLaJ3Cyrf5Wbirg==
X-Received: by 2002:a05:6402:3591:b0:5cb:6ca4:f552 with SMTP id 4fb4d7f45d1cf-5cb8b1a982emr4924713a12.35.1729765687354;
        Thu, 24 Oct 2024 03:28:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:f79d:49dd:b804:3f48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c726besm5538534a12.93.2024.10.24.03.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:28:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Date: Thu, 24 Oct 2024 12:27:56 +0200
Message-ID: <20241024102800.3481574-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a simple-framebuffer node for U-Boot to further fill and activate.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
index 7675583a6b67..3d670534a714 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
@@ -4,6 +4,34 @@
  */
 
 / {
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer-panel0 {
+			compatible = "simple-framebuffer";
+			clocks = <&clk IMX8MN_CLK_DISP_PIXEL_ROOT>, /* lcdif */
+				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
+				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>,
+				 <&clk IMX8MN_VIDEO_PLL1>,
+				 <&clk IMX8MN_CLK_DISP_AXI_ROOT>, /* pgc_dispmix */
+				 <&clk IMX8MN_CLK_DISP_APB_ROOT>,
+				 <&clk IMX8MN_CLK_DISP_AXI>,
+				 <&clk IMX8MN_CLK_DISP_APB>,
+				 <&clk IMX8MN_SYS_PLL2_1000M>,
+				 <&clk IMX8MN_SYS_PLL1_800M>,
+				 <&clk IMX8MN_CLK_DSI_CORE>, /* mipi_disi */
+				 <&clk IMX8MN_CLK_DSI_PHY_REF>;
+
+			power-domains = <&disp_blk_ctrl IMX8MN_DISPBLK_PD_LCDIF>,
+					<&disp_blk_ctrl IMX8MN_DISPBLK_PD_MIPI_DSI>;
+			dvdd-supply = <&reg_3v3_dvdd>;
+			avdd-supply = <&reg_v3v3_avdd>;
+			status = "disabled";
+		};
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm1 0 700000 0>;	/* 700000 ns = 1337Hz */
-- 
2.43.0

