Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E07375AB9;
	Mon,  2 Mar 2026 19:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478667; cv=none; b=DLLSLcnlaguLHJPHwJ7FtMjwXnmUKUPaNIbZcds8vgOPq/P3mCc4LzWnD3mNFnC+v0FfHuAUePmY1Kzpj7h3CP5WF8mRCkDuRsIpmLlyw8wIncIIICfgvlSWmJXJQsklHepGjPy9brnI8BTT0+l0IlXqJLSj0bc5aMK/jh/T7iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478667; c=relaxed/simple;
	bh=F9Opp9US0Ic905YPaPDNBLK6HebOx2DAxtkTcFUn5Ck=;
	h=From:To:Cc:Date:Message-ID:MIME-Version:Subject; b=DFaWjmwwFq6/Vh7qM9LtOuevTw1++7pzZjsIcKE1HXVObrxs0hy1xTx8ilIjJZFaNKV/bBOLlnRgMJJvGfgKAAb+Rpf7LzVKhmifrL8mCHL2fyf6Egq7eOnLvqXXYbnIclCwB3ogtbBR1TMlOWqDGdizj+MeSnoD2JQn2IBRuq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=hEYTfqKS; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="hEYTfqKS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=OsiU+25ikLMoP/pnEIeeGi5XIZmrewWgt/aCqVKENCM=; b=hEYTfqKSMQ+s8dWtuATsAUt6mi
	z14GSWSe5bL1HTRyD2vJGgXbPFGZMF/imrEJfDWshUZHCsKE2sS96S9Ndb64y+JzR/f5XR3DdbDnH
	NjP8dq6epf8vISR/Ig/Fa6buRSvSaI5y6aMNLstX77CSS83nhygLdEqx0twehm8IbMIs=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:59962 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vx8f6-0007Wl-Q3; Mon, 02 Mar 2026 14:10:37 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Mon,  2 Mar 2026 14:03:36 -0500
Message-ID: <20260302190953.669325-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: [PATCH 00/14] var-som-6ul: improve support for variants
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series improves support for Variscite VAR-SOM-6UL based boards.

The first two patches fix DT/dmesg warnings.

Then add support for the imx6ull CPU variant of the VAR-SOM-6UL.

Then improves/fixes the following features/options that are currently not
working on the concerto EVK board:
  - ethernet ports ENET1
  - LVDS display panel
  - Wifi/Bt

Also factor out optional features into separate DTSI include files, so it will be
easier to support them for other boards, and to make sure they are not
unconditionnally enabled.

I have tested these changes on a Variscite concerto EVK board using a
VAR-SOM-6UL with the following options:
  - EC (ethernet phy on SOM)
  - LD (LVDS encoder assembled on SOM)
  - WBD (Wi-Fi 802.11 ac/a/b/g/n and Bluetooth 5.2/BLE on SOM)
Result of tests:
  - Both ethernet ports Ok
  - LVDS display panel Ok
  - Wifi/Bt Ok

Also tested on a custom board with a VAR-SOM-6UL SOM (will be submitted in
a future series).

Thank you.

Hugo Villeneuve (14):
  ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply
    property
  ARM: dts: imx6ul-var-som: fix warning for boolean property with a
    value
  ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-6UL model name
  dt-bindings: arm: fsl: change incorrect VAR-SOM-6UL model name
  dt-bindings: arm: fsl: add variscite,var-som-imx6ull
  ARM: dts: imx6ul-var-som: Factor out common parts for all CPU variants
  ARM: dts: imx6ul-var-som-concerto: Factor out common parts for all CPU
    variants
  ARM: dts: imx6ul-var-som: factor out SD card support
  ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support
  ARM: dts: imx6ul-var-som: factor out ENET2 ethernet support
  ARM: dts: imx6ul-var-som: add support for EC configuration option
    (ENET1)
  ARM: dts: imx6ul-var-som: factor out audio support
  dt-bindings: display/lvds-codec: add ti,sn65lvds93
  ARM: dts: imx6ul-var-som: add support for LVDS display panel

 .../devicetree/bindings/arm/fsl.yaml          |   8 +-
 .../bindings/display/bridge/lvds-codec.yaml   |   1 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../dts/nxp/imx/imx6ul-var-som-audio.dtsi     |  30 ++
 ...ar-som.dtsi => imx6ul-var-som-common.dtsi} | 140 +++-----
 ...ts => imx6ul-var-som-concerto-common.dtsi} | 159 ++-------
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  22 ++
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   | 318 +-----------------
 .../dts/nxp/imx/imx6ul-var-som-enet1.dtsi     |  44 +++
 .../dts/nxp/imx/imx6ul-var-som-enet2.dtsi     |  79 +++++
 .../nxp/imx/imx6ul-var-som-lvds-panel.dtsi    | 112 ++++++
 .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   |  27 ++
 .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi |  75 +++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 219 +-----------
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  22 ++
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  21 ++
 .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi |  36 ++
 17 files changed, 575 insertions(+), 741 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-audio.dtsi
 copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som.dtsi => imx6ul-var-som-common.dtsi} (60%)
 copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (51%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
-- 
2.47.3

