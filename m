Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C733803EB;
	Thu,  5 Mar 2026 18:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734120; cv=none; b=e1c8dANa07wmZyGjcram7o6urJqgtgpkC9cOs6O67fEg+KOohy1EOBtyZk1hPaJq1IdA35FqabPf1qXr3wk2Y606MiyZ+nn19MGsaJKh4CkeS4tiAj/zM6vIl8AZKYO/fiku/7tFNOlXYfxFMdAWNmHdHtUNaxh7OidNvTQC52o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734120; c=relaxed/simple;
	bh=qVDR4r0RNnpyFTaBID79WKMftRjHbNVK0loosyYv41o=;
	h=From:To:Cc:Date:Message-ID:MIME-Version:Subject; b=bcUw5MzzgjFPAzxVOYmw5f3Xc2sWF4Ig+k5P+3xCmp9rzpWmi1nP1frEPo0QKAO/GDnchNWDk2kMf3CK079J2+1fIZ573xT+HxGRC9vg6DIa8ISOgaNurUhvSpkdlj06LCfZXgnfHNKS170X1i2zQGgp2BvaCDLtjwnIYcJyWlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=CxWr7cc6; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="CxWr7cc6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=xlv9aSBDN9dBeajKyuHQxLmuBfwuhVHupzGXgcU9K58=; b=CxWr7cc6/pd/qdgtGA7o5nsQWP
	zGWH7xN3y7bhDNaKluN4rX2wMiLrJmL+Qz2ny8Yt1FzaNMj2VuM8K31ZgolY9h/Nf80b7++wFXGsd
	Rs9x2z9g/iRsoOSq0Sqgw01i4s3N+H9je+iuwu5+o1lmSxZfLEfH5jE6DXhR0HfjlLDo=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:37706 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyD7T-0002aR-Vo; Thu, 05 Mar 2026 13:08:20 -0500
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
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
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
Date: Thu,  5 Mar 2026 13:06:15 -0500
Message-ID: <20260305180651.1827087-1-hugo@hugovil.com>
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
Subject: [PATCH v2 00/15] var-som-6ul: improve support for variants
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series improves support for Variscite VAR-SOM-6UL based boards.

The first two patches fix DT/dmesg warnings.

The next patches fix the incorrect use of VAR-SOM-MX6UL to refer to the
VAR-SOM-6UL.

The next patches add support for the imx6ull CPU variant of the VAR-SOM-6UL.

Then improves/fixes the following features/options that are currently not
working on the concerto EVK board:
  - ethernet ports ENET1
  - LVDS display panel
  - Wifi/Bt

Note that the previous configuration of the optional Wifi/Bluetooth module
was copied from the original Variscite kernel tree, and required custom
shell scripts to properly configure the Wifi/Bluetooth module.

Also factor out optional features into separate DTSI include files, so it will
be easier to support them for other boards, and to make sure they are not
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

Link: [v1] https://lore.kernel.org/all/20260302190953.669325-1-hugo@hugovil.com/

Changes for v2:
- Place imx6ull-var-som-concerto.dtb in alphabetical order (Frank)
- s/include/dtsi in commit msgs (Frank)
- Clarify and improve patches to change VAR-SOM-MX6UL (Krzysztof)
- Collect tags for some acked patches (Krzysztof)
- Reorder pinctrl_gpio_leds in separate patch (Frank)
- Improve git commit messages ((Frank)/Krzysztof)

Hugo Villeneuve (15):
  ARM: dts: imx6ul-var-som: fix warning for non-existent dc-supply
    property
  ARM: dts: imx6ul-var-som: fix warning for boolean property with a
    value
  ARM: dts: imx6ul-var-som: change incorrect VAR-SOM-MX6UL references
  dt-bindings: arm: fsl: change incorrect VAR-SOM-MX6UL references
  dt-bindings: arm: fsl: add variscite,var-som-imx6ull
  ARM: dts: imx6ul-var-som: Factor out common parts for all CPU variants
  ARM: dts: imx6ul-var-som-concerto: Factor out common parts for all CPU
    variants
  ARM: dts: imx6ul-var-som-concerto: order DT properties
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
 copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (50%)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet1.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-enet2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-lvds-panel.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi


base-commit: c107785c7e8dbabd1c18301a1c362544b5786282
-- 
2.47.3

