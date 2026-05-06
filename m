Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46E3E1220
	for <imx@lists.linux.dev>; Wed,  6 May 2026 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072549; cv=none; b=W/ONCAnQrkBSAo4QzAh3RPCzsQBPnmcA+o1+1UqkB5WgpHkEgjBVFMMswYOoFKIS0fT3mvJyURBxiAKp9FsHbzd1QDIAA6UsRtfExd1Aqi1Wgtp0LthE7UTAnRyum4R8tJQH5N4PVNT8pMWkoyf7jSgGjKCuGjLgval9nQPv1GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072549; c=relaxed/simple;
	bh=O1aeIGOQvGB7/OgikH+dEqEn84w48c8KWaQB1r1M41Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gBhTWxd21v5rx99Fonr1KGNKhG3fdiCMyQsxFig95NiPGhyf9ISXGWCW/9dPsb7KMnuT1DVvPBmY3Ycvhu7gUVXL1EDFS6dxHO3vAK+cAWzE73Ky2tPkMGprTYRkpaPoxGbz1Zhwq5j9O/eskGKVvgzqibHi/e4bm00j6CFJe+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJ47dOsT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ47dOsT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43eb05b1875so3432000f8f.3
        for <imx@lists.linux.dev>; Wed, 06 May 2026 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072532; x=1778677332; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6w/Ct8nuPMBPRpUy8/kJfgTP+J5orD9plu8W5VIflo=;
        b=HJ47dOsTjyYogn8v9SOgnUswY+ZRVCUcKLV6P2udh0sdkhgWqe4qDskbjVSzrED994
         I2+BfeU+LnhMN0A2dG9efvHoIMxmZMqOClqWc+Sfp7WbWY8E99pHrhCmcispHgHVzZcn
         7p2XmjmwlqgVgDq2/5FtRIqI270ojGAxsXQKxh4M1Ok11RGZtIjWDIaI13wMU98UpHeM
         HDvDP5BwjE3BKeQ1XNzVj7leF7ieGDzxGppCOVFnGinRbnmKNXNq2c2eNFzdygUuYkKq
         nyrx7RLI6H2cJ5efsfxcAmayE220NVsO516mltHU+Xtm2UeD1FOywu1DFMdh/yFhsc6C
         vUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072532; x=1778677332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6w/Ct8nuPMBPRpUy8/kJfgTP+J5orD9plu8W5VIflo=;
        b=XCMnxt8EUBKIUuYnnMnDRuwmPnS5bB8QP44tijO56r7zCe/iXQjStF69MdJ810/nY2
         TVAgTlojyVZzBqxEOOaPHsUjzxMGVCnE6YI+7Ax3uaQW3Beb7+cjKLdLRf5D/7RoTltm
         5sWvDKfOB+nXzwldbpRTEECyvnBfUr2k65rmv7dEZvkOT9gxxzGptDv7N6ibLCXHLehf
         +rVDUAQX9f7JJDQqSXrV4a4aCMGAZ5IWjWMiyjXmrKcUc+kbUJ+XNOyucIG6KXSwlJgI
         IciOL1vSGLB4k4IfhB9ulcVilmaBKfBUGpmuMs1Vg03nVBx0EEuFtvsWZq20w1wmH2p4
         MLog==
X-Forwarded-Encrypted: i=1; AFNElJ9w469SnHWT/skDgshqpyxgkuT4tFYy7lw64tmX91DbUG0AuO3q+8BYFHyKmFjlpsYI7JE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxY0q7QwQ1m/cL7hNuWMCRMA15iXsJLlee3ZeRY80ld0nS84IYo
	dDa+Q4RsHbeCkGWQ4oWS8vmM9CFErv6B3fE8lT15R8JhCMCEPlO1p0gE
X-Gm-Gg: AeBDieufpxiMHqOU+Rlfa8NnNEEhhliCXYLEJCgaVhBdNGrFdFXTR+Gqu5q/Jve53JR
	Z1taICIxOh9DH/wuDQ4sM1RGyl22dl4/WvYTifwYZ1NviJL41+Jw36YlUdhoADnVlaDjSAS/t46
	FB2HCd33XFISqKKnzhFGXmQOhVwdnfF9w42jSQMg89Le7B0TH6hDCWXNy4MaW9GoeYnynRgY3ix
	3XDZAjViBqXyE2bwkw3HkJEtFmBu8aIZ7dOgXpOVyUA4Ya6TwE54HpxIsis9pkeqDW1/ObhNjHE
	A09JYYuq/adevlbaoc9pOFCnBw6GzeogkT8+CNehIUV8WGqg9+0aptNWJabL008SbO6EGpcmFg1
	QOkyEPnww62qu37cEy2jJD2oTau0X7e5/evg8vmcFkHHKQRNsbzH5dufTSHrS/DmYcsFHAqR9YX
	ZXsf02iL6Y4W6LNQCClndemaw+47YZVcOm1Jl3v2BbrP9dP6+wfPuYwFsuTmt4iOxcfuOh9WtsY
	hNcVpCKeTCL5bWeLSaoejmy0OdUQgTPAe/+3dJFcnhzv7cZoaMROyXlof4/xyy70uoDwJFPYfxb
	WuouIrh2epI=
X-Received: by 2002:a05:6000:268a:b0:451:3b12:9bca with SMTP id ffacd0b85a97d-4515ce1cde3mr5834248f8f.25.1778072528841;
        Wed, 06 May 2026 06:02:08 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12288076f8f.12.2026.05.06.06.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:02:08 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Wed, 06 May 2026 15:01:54 +0200
Message-Id: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMI7+2kC/x3MSwqAMAwA0atI1gbaaAW9irgINmrAb4siiHe3u
 HyLmQeiBJUITfZAkEujbmuCzTPoJ15HQfXJQIYq44xF9h75OHVm1OWuHZZUkKt4KDxZSNkeZND
 7X7bd+34RJCVxYgAAAA==
X-Change-ID: 20260501-add-aquila-imx95-423256af3d21
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Antoine Gouby <antoine.gouby@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.14.3

This patch series adds support for the Toradex Aquila i.MX95 SoM and its
currently available carrier boards: the Aquila Development Board and the
Clover carrier board.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and 
Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
lane DSI or CSI interface, one LVDS interface (one or two channels), and
some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0, 
and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Antoine Gouby (1):
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Franz Schnyder (1):
      dt-bindings: arm: fsl: add Aquila iMX95

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

 Documentation/devicetree/bindings/arm/fsl.yaml     |    8 +
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  294 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  398 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1862 insertions(+)
---
base-commit: ebdfb84ecf7a0bba26d7a04edae98dd600fd4b42
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
-- 
Franz Schnyder <franz.schnyder@toradex.com>

