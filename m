Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403901;
	b=TedfHmMkjgptKsGTGSN+uCWY/d7WP8zLarvGdC0aXk5ZbfdnAYnuVq0krD72D35ZhFRe
	 Tb0KJPk1MWopth1W4ywfKakZH7qFTGrpGdDWkaYhfOe/7pbeoydl0DHqq5/gof5M37Vj4
	 +weySDDPcv7ol5m+sa6A2cW0EADza0eFXqmi43AAqayVpe05wVNyYEFNP9shI8usAjdC+
	 nDM1uxGG6nO8nXdjjRU1gu16kE92FfdEItLgFKU2q5NTGGF3l/QvMKAPRd6q/qpxxd2Sg
	 Kt4H0gZaDjj1e+xMUIJHC73hUzxykzheupjEnJtFq8ZtE3ouPhrsXG+kdbjDuMtucnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=;
	b=MjgGDyqEvZBo044zlIDeOq9M9YsNy08jrE5YXXq7K3FRRcYBduVgPM6ddhfc4CH+VSpg
	 EQ8jL8Q5VtLGmA0CL8f4zhuFAQ7+oTWtLzFPAr5/nWlDNM9J9IvUueorJvZVg1fJ2TQk5
	 BCFk/SlXcnpvAGLGzzip0QbCofbBwa1dooXxI47G4E0mTdV8RoD6mXP1FTVjiZILkVWRS
	 SNhozsi8qJGLBHzLl0TgEgJPhv7harlbK5awNh3GMvCrmzJ7+z9UVGfJ9cgr0B9llkEYm
	 VR5fktb+I9NyMQRh0kDQx2VCmYIUd9g2dWYbAytUfCQSTB7eQhpu8BLH1IZfXFJwy2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Gtqz5DWs;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8798F606A327
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 13:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8798F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Gtqz5DWs
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a215e64962so35706185e9.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 05:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403899; x=1795008699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=;
        b=Gtqz5DWsBNjWbEez3Sf2F56K1SlA52kUHQKW915Tr/48968BRcaXYPgWP10VtMZTye
         eryvdDRzaiU9E5FPDtVF23BNo6TFzxpi2WbEwOlYaLSTfMGUEpWVuMgs0ig0XsT2F8Rk
         7CvtkIn4x810qAglkCYK2GMTvcDt2uPSr5knXPWVlsST3kCyc7Kk82xtVNpsocgp5d9D
         x/V7R7wZKffvGiCGV9mB2PuNECY8yGagIJEz5GgFYmJg0v8xoG4+4MN2NKKme3oKx8xZ
         RdJGJBGMetJytl2o6pWhqXQIa5ZISArViZIIo/f0RLgAWdaJAX0YD7g2s+10ICu2SK2t
         D5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403899; x=1795008699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0L8NY5KvCN7Y6Y0k6z0RIGpvtUytxSeGPbkleqES2c=;
        b=NsmVQRP98rmVqQJ6lRk1kSznOk2B4wqv8bQxk4EKC/Pp4TR6bhPvZoUsI7h9HpZZeE
         Y4xvG9xnXELVZ93iZqx2kU6M9JMCByPN9QPASr7UcOwCBh1xxPrgszoeYi5oA3r93W55
         kRtIdv2T/+myY1ipLwofnDk7AUVT5mBEL/TfX3URqPx6d+NZdLJYMgEHE528ySKH25io
         0xI2sHfEaXn4uL1RCBuf95v6jquqsazVbWYjXcxoMNosbRV20GioDitbDE+Ms3kdkv/D
         OMY9GK+vILtGbpbwGaIOm0bHt8+YzFwLEdN5y9osdjzbczL3K5mFPmLjnrGjrcOkdmxD
         cOVw==
X-Forwarded-Encrypted: i=1; AL+hErEDgZYco4wlgW5VyMEbSsYfpA95d+10hxbv/ZajVPLSEy1NsebFblU+cdLCeDpL+sCvNwE=@lists.linux.dev
X-Gm-Message-State: APuU4Z80eKyXszIrAndyohqKnHSh5pByZRZPyzA5se41zv3yMyqSMNQe
	UOIoQl5Z0OCMpf+ISfvImDyphYltEViWw5MNhew7i3whrlwOdwTa9lBhmnfWOGNOsBo=
X-Gm-Gg: AYBFou3PhfOiwSme6YW9R3zQ16A7PQhW7ixEpHM9Qm2j6jMdoiKl8V7X45O8ihcWS80
	Ckk3XPssN/556o+aiHq7Lqp7iMRYZM/L18yy3L42BTYBTg5RUYAQ8IBgVPLj9Of+RPjcANiYSuD
	/QTiWKpN0p4qPNyxE6G+maeDyf8HGwvTN/TlbscTvt104fvw2pQOmfUZvS8OmehKyl6VbohamCT
	e9h9ol/0t/S/vMB26TP5zClXbARvRl4jBTPciv8Jzr3ftmI/6w+jRuerluTcGXe8C7RnNdwplv2
	CVNNXETBMbElpZdmfpPENDO7wQvgBYHX7AxQCmsVAnadIESp73Ad8rJD9mlCR13Zl79VROAlTPi
	eCwEdAmTKeZierd5HywQuWZQjqAv3i/8cqfwRREMtQ99tCiHqxdKCTHibJlwT6KxSjWvXLKLEqH
	4T2FTmkyTyU6rPoH8hby3Qe+2WjGqIsABdn1SZ2FLMKrDw3qf78HN7qZoCrVvbrLw758fw0hCrz
	zQsBlPguSLKQdm6oEGYcpfVF3NFzWYCL8Osvqs0zOYCiYnkwo1sQk72z1ttqDIvOfCbLkVNqmYA
	E7VtdZQ66MAoINrFNBxvT0g9piHgq5oNYsf9dBoQ/2+YDHTkNosA1RZeeS9D74g4sNHpPRVtw38
	ltdsN9B8ZBQ==
X-Received: by 2002:a05:600c:6214:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4ba0939815cmr42149525e9.34.1794403898734;
        Wed, 11 Nov 2026 05:31:38 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:37 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] arm64: dts: freescale: Add support for bytesatwork byteDEVKIT i.MX93
Date: Wed, 11 Nov 2026 14:31:14 +0100
Message-ID: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
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

This series introduces support for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the carrier board byteDEVKIT.
It also adds display support for the integrated Youritech et050fw01-kt
MIPI-DSI panel by extending the existing ILI9806E panel driver.

Changes in v3:
- Patches 1 & 4:
  - Added Reviewed-by tag from Daniel Baluta.
- Patch 5:
  - Added imx mailing list (imx@lists.linux.dev) to MAINTAINERS entry.
  - Moved controller activation (&lpi2c2, &mu1, &mu2, &usdhc1, &wdog3) from
    imx93-byteengine.dtsi to imx93-bytedevkit.dts.
  - Removed unused LVDS backlight (lcd_bl), disabled lpi2c1 node, and unused
    LVDS pinctrl groups.
- Patches 2 & 3:
  - No changes.

Changes in v2:
- Patch 1:
  - Use specific panel part number (youritech,et050fw01-kt) instead of generic controller name.
  - Elaborate commit message with vendor description, panel resolution and dimensions.
- Patch 2:
  - Update compatible string and function names to match youritech,et050fw01-kt.
  - Fix commit subject formatting and commit message.
- Patch 3:
  - No changes.
- Patch 4:
  - Drop standalone SoM compatible entry from fsl.yaml (only bootable board combinations allowed).
  - Fix typo in commit message ("byteDEVKIT carrier board").
- Patch 5:
  - Update panel compatible string to youritech,et050fw01-kt.
  - Invert GT911 GPIO polarity to GPIO_ACTIVE_HIGH to fix address strapping and reset.
  - Assign pinctrl_usb2 to reg_usb2_vbus and add vbus-supply to usbotg2.
  - Add disable-over-current to usbotg1 and usbotg2.
  - Move panel reset GPIO into dedicated pinctrl_panel_reset group on panel@0.
  - Standardize Ethernet PHY node names to ethernet-phy@... and use tx-fifo-depth.
  - Replace underscores in pinctrl node names with hyphens.
  - Rename tca6418e node to generic gpio@34.
  - Consolidate devkit devicetrees into single imx93-bytedevkit.dts.

Frank Obergfell (5):
  dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
  drm/panel: ilitek-ili9806e: Add support for Youritech et050fw01-kt panel
  arm64: dts: freescale: imx93: Add MIPI DSI controller node
  dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
  arm64: dts: freescale: Add support for bytesatwork i.MX93

 Documentation/devicetree/bindings/arm/fsl.yaml                |   7 +
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml        |   4 +
 MAINTAINERS                                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile                        |   1 +
 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts            | 415 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi           | 185 +++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi                      |  34 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c            |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9806e-dsi.c             | 158 ++++++
 10 files changed, 816 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-bytedevkit.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-byteengine.dtsi
