Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1CC1891AB
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733415978; cv=none; b=WhBoCMia95WYXIpeZ6d8E6OZe9V3p2XFnitLnyETYhFzlqDvMzOgt1rZe7Og1TVlu0QRsbn+4Ndwpz3eDRK8+/vP83Yw87RsKpHIRryO25TSBO9NgjMGqsnv4IPiwZRB832H2okAYVTriQfzwDN3TFZtZdGL5Sz7sNwtq+zK3yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733415978; c=relaxed/simple;
	bh=yC5x0Kr3GQ+y52MwCBTCIIJOZYvx1zk4EFtR7xU0I1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cosCZMitO1IhdGozkJmnDA7HZuk0bKo+TodjQTERAU5u5ka6kJ8L5falgEo35qyH3sELE6nooiDvWHFZIxWXmm+bTbQKjXPtVB3sW/8gdhX9OSg/fqMyj7N19SiSiFb6g8vanVNQgh46IbNWC0B0sTHoioIRgekLWl4MucjNBwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Egmu4vo9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Egmu4vo9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d0cfb9fecaso1702041a12.2
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 08:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733415976; x=1734020776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=;
        b=Egmu4vo94z0GvUEk2ssln3OHsXkmLosau/f39UAjQhHYTZ+SaH4gaOYQFg44YDVjcS
         2xTMI92fUUsb092/M20nl2cRVlkhJA2UnqmXKXj+zs28NR/buMP9Go2V+K4WwLn4LTkR
         TAx2pgqvm0BZSLn71sAHMNKdBlEvt+xvF8Ed8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415976; x=1734020776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCLk/wc3MKwAF912ySsq2eZpu6hxxtGQsnffSicJSqo=;
        b=WCMDecRoOOxoxVroi8+H4S+N8J774nw6Qvf9Naf8gKMCQ75UEZOewn6ZjZMQzV3uvA
         HaqRbywOc4KR6o0EnFiCRw6GZMesbRTE2UhhltOScSVRST9WJg2kKd1aIWA1rqyFAOI6
         I+DeCCWXzff1yhzxkiKbtpUK8HGKqL/JRxLRM/RmI3fhW5XdIPP6jfpZ5/15LtrBVeLC
         Wpg7IAAjQwya4pif6EMtBpL2RgznXqu1oza03oy4rqBrdrmYOTiJVC5jJ2lRId1R5X8P
         AW8pVlZsGkPXM6/5oJfxVDlpmstBi17rmdzWDOor9T63fHeL6CqX9dCiM7CrElaNaF/n
         Lt4w==
X-Forwarded-Encrypted: i=1; AJvYcCXXgfE8lPpaDgmiEQhuwSy8B0qEtygu+CeSEhcwbrdj0ztDme52N0wiXhmRyZHwU6IZWvw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRCVQDVBp/9t+POucmc6PkLVl0Xbxp6jsSgpFGh5tA5MF+LY5q
	Dd9BGRmBUfHiaegDtU4KwBJPpt/LN/+HUuIj4yglusuiJqIdrhJSE78S5sQrsJg=
X-Gm-Gg: ASbGncvbTNlxvwZOy1gWW0aXnp5es3Ezky4wN/tFAwdvMGTxFnxkGxTKCr9zh2svReo
	jf7kwnwqjw+qR49bwMbPCaFaY7vi5ncpc7fC1Raigrg7OHVMHhmQNG6DzaMtKYvekzxvy7hvW2c
	kTBtlVfzV2RI5cE0CJT6SQTdf06CxYy+xOIpIn+jXZslyMiSKZldD9dV/MbDAFvXTyNSaRuFvS2
	/pLv0A4ttDYaqID86Q1UKCPTzCZK/fn7JOgESwRGFed9BjeP2JiY64frgXvL4dmm8Ww3QwhMJtQ
	8B3AFWbGOOfH9Bj+189SCNMxOUVrEA7HMT2DACB12sSwGw==
X-Google-Smtp-Source: AGHT+IFXrt5EyVJNmwjOInbQwIR0hRyAYkVbpEnHiym56laCVf9oh8OvxH+kl7ISbHpLv75ASv1ecQ==
X-Received: by 2002:a05:6402:5107:b0:5d0:eb2d:db97 with SMTP id 4fb4d7f45d1cf-5d10cb80219mr11709960a12.25.1733415975690;
        Thu, 05 Dec 2024 08:26:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c798f98sm965026a12.57.2024.12.05.08.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:26:15 -0800 (PST)
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
Subject: [RESEND PATCH v2] arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer
Date: Thu,  5 Dec 2024 17:26:04 +0100
Message-ID: <20241205162612.1804274-1-dario.binacchi@amarulasolutions.com>
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

Changes in v2:
- Fix the warnings:
  (ranges_format): /chosen:ranges: empty "ranges" property but its #address-cells (1) differs from / (2)
  (ranges_format): /chosen:ranges: empty "ranges" property but its #size-cells (1) differs from / (2)
  by setting both #address-cells and #size-cells to 2.

 .../freescale/imx8mn-bsh-smm-s2-display.dtsi  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
index 7675583a6b67..98dec3c42060 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-display.dtsi
@@ -4,6 +4,34 @@
  */
 
 / {
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
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

