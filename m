Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815283CE4B9
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731497; cv=none; b=QKZd1c08neQi+b7J2zTwjrj0/D0xFRqvadN8kWX+40DUUykAcdwL2fpJaSMzuFaeJLrIaiNJ+UldZ9E0OPHSOMQr4FEkblnN6m2hGojArRI5AAnv8vqEkHK/pQpeQkhwuq0VZJw/Ho7joD1wNWxTwA8somvCzRSfbk/XhIEqUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731497; c=relaxed/simple;
	bh=DJdkhzl95VtBfgRmIm7aKthuHYvHno4RWtiBaP6/SOE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lcdadI0knGCrUBKM1Z96QySfU/a6AUcrrvPX7HkT6dNrJVjWv1OqKFn1hLeSl6Zfilzxj9fhGE9ZgoDzjovDL2GAyI+jE8W0+U5w4cbmZjv8Yr9YP063puIXDIAOIdrjh6thPXTPwCJAcpblv/IQi++WZ8tYqmkbXPUFLi4k1A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWvNa/GE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWvNa/GE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48069a48629so87211145e9.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731495; x=1773336295; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lw259pcYxSLiNSL1/jRGj80sakZ8LNO4UKiJX/RHt8A=;
        b=cWvNa/GEeNfa/tBj/WpvmnMt07UXYlbjxbqZWgVM/dwyEMunHSMvZV2yPuP0QLcEg0
         iXvlcaVVVM4sRJYsfZGDUrxypEEyXCrwSa4YgudyXJyEEeDFlunwQ6lMo9N/Fc6OO6dG
         xvcPHdQWV1gJrZ9Epbkzj3S9Od2CmC9H8/HJXRc7g+ZEZRAbchOCWfWM1DZJP3hgfxnP
         5x7DA++SjNouVl/lgVb+lY5WJmYXFVNPn8eI5KX4j/b5PEbNr5N6Ghg9mlKge1vDV+8b
         QwpzOAhwEdZt9B3x2zBDLeGQRvBzrbRspF0X8FmA2fLs6xErwF80GpwxT3biFlCcnehW
         jhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731495; x=1773336295;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw259pcYxSLiNSL1/jRGj80sakZ8LNO4UKiJX/RHt8A=;
        b=eKDttJv7260XdovSpgg7/4Z9BZI/0rSF28ViZkAbzDvIjEofCxvEln3UGe8HULIxAx
         Q8cmhX4EWg1UGt9fRQFPZaW1wNZRvs0RBzECfEejZNemjOtY20T5BtbLUiebu9BOdK1h
         O6y8+bt1p+H4PJYhPUgtC1KQifSeJpyBKKfueAAcbefVp/YcsA9csIN7jZE+Da850pNR
         b2cPqc00LVvEHsenU455dWglylN2OZVpsO2Bw2+TAU/CafQn8cTgjulO2gsO9C6ovweq
         Q2zfcZB9Zv/kJuGNp/EgiFGAieTVKLcXpkzd13uqeCTBoVewPWkrAPtgrt9u+6zFqJsG
         X6uw==
X-Forwarded-Encrypted: i=1; AJvYcCUz9phhGRdDxLQMKht3hliS3euhYaCGDsugAZ6aNUeqpIml2JFa5Uy0asATh1AiffZXxEU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzVvg5XOZLfyZpccy83hRSfGSK+IH2DBo//zZ30tbert+wWcPG
	WE6qxQnD9nrevnHC6OqfZl3uc3S73+Rb31aHsCLgp4+AaeS+PXCxwntc
X-Gm-Gg: ATEYQzziIyzW+tKubyrvigcZrT1VbKX6k+izviIu2Smk7OS9NXJdFHovpvXieZxQZiM
	Pw0XLGTZBaG4v491zfAV+w6xPV8+2hmzPbuptH4P5zNIbCOHCpyq5L101pSQ0sOku+jAz/mBJve
	pmlYzxT607TWturChV2Z+uX5JoDVSHe7KRAYf0T44Tg8lMwnEszh+mGzOkBSVDOMxJx1HwA+i0f
	YuwIZojhGyigEuhgspmgE3k2IugSb8gWNO1+pfWgYm9I9ejGIiXn2Nclll0I2Oi5/eGe1TBsxZz
	PeR3GDXPRCiHy9MRjzItIqlbRplZ+4kr7X0j9sYwGRP5Bn4RcYvoOTtlwRXmEDz6cEZw+SapKFo
	HuEb5/tJr4L4a4Fcd7/XXrBqEvD1BaZp1iOc5l8HzJyY0Gvp7Ilsm0mTZAlAbOmzHvkuhI9LgKx
	CiprooH4RuYyhrYzxHsCrILEvfUTXFftIsOWuDLjTtlMZoOh+QLVrWnPhjmPsF4G9oaCtrfrSUM
	T1VCoVOQwJ5yOaexxWTFdEONb4=
X-Received: by 2002:a05:600c:a51:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-48519889928mr109001225e9.25.1772731494781;
        Thu, 05 Mar 2026 09:24:54 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm67153495e9.15.2026.03.05.09.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:24:53 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/6] arm64: dts: freescale: add Verdin iMX95
Date: Thu, 05 Mar 2026 18:24:28 +0100
Message-Id: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEy8qWkC/x3NQQqDQAxA0atI1g2MllTsVUoXmTG2oXUqiRVBv
 LuDy7f5fwMXU3G4VxuYLOr6ywX1pYL05vwS1L4YmtDcwjUQLmK9ZtRx7Qj/k88mPOJgnD/4VYz
 sgpFajl2biFINpTSZDLqel8dz3w828f/ZdQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0

This patch series adds support for the Toradex Verdin i.MX95 SoM and its
currently available carrier boards: the Verdin Development Board, and
the Dahlia, Ivy, Mallow and Yavia carrier boards.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
interface, one LVDS interface (one or two channels), and some optional
addons: TPM 2.0, and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
---
Ernest Van Hoecke (6):
      dt-bindings: arm: fsl: add Verdin iMX95
      arm64: dts: freescale: Add Verdin iMX95 support
      arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
      arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
      arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
      arm64: dts: freescale: imx95-verdin: Add Yavia carrier board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   24 +
 arch/arm64/boot/dts/freescale/Makefile             |   10 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    |  270 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-dev.dtsi |  250 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |  515 +++++++++
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    |  223 ++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-dev.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-ivy.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-nonwifi.dtsi   |   16 +
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-dev.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-ivy.dts   |   21 +
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi.dtsi      |   50 +
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     |  217 ++++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    | 1162 ++++++++++++++++++++
 20 files changed, 2947 insertions(+)
---
base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
change-id: 20260305-verdin-imx95-upstream-frank-li-base-b57ab97c55c1

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

