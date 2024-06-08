Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A661758F
	for <imx@lists.linux.dev>; Sat,  8 Jun 2024 18:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717869909; cv=none; b=SD02Sm2C+qxah44P2CUyUYE4vFpL97dOOqqeZnRxibLCuP+iwdiC6Sb2q/ve0jjUufp/DHQbiEaxz9L6dv7tBXAJ6L7J8M66HUhxHW2zdBPr20Hm0X2cDCL3Di+YgQw3FtreWyKvaiyyA4j2rXDCxTgS9/GU1g1tdQvcqu7ec38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717869909; c=relaxed/simple;
	bh=klCNsdDciQLVPQOQtFjsrDvbqzVwdmU2FJRZkC3SOFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o83FTXMfQqFYHT48IIUQbn72iLmUiJP2u+lHD+++sHK7bMoMwELJb8vRFwERoEbeGpwwHjUD+uOndubDdlTRYyNEIU7/Xst0ACRaR8LUPT8/GKA1OBdnVYt/qY9U5F9OLVLLRCknhmKK4tO1GfnUTnj8MuL+VVBApJ8CEDOLOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HD8eB/mn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HD8eB/mn"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DB9A4CA;
	Sat,  8 Jun 2024 20:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717869895;
	bh=klCNsdDciQLVPQOQtFjsrDvbqzVwdmU2FJRZkC3SOFU=;
	h=From:To:Cc:Subject:Date:From;
	b=HD8eB/mnbubXg1PFjHZcHin5r5eOIQFZldxhbBit1lTLIAHYa92b3qst27J/SrbT4
	 Qc6YRUGF/NMVlp2YCWZXE16iMPCvyK3YgUQfvhe8qKAH2BuSUH9mPIeP1S+uvfBN5M
	 ZElE5MQwAZ9QoTByrWR93smRpwb8M32gbOKWy1Zk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Marco Contenti <marco.c@variscite.com>,
	Nate Drude <nate.d@variscite.com>,
	FrancescoFerraro <francesco.f@variscite.com>,
	Harshesh Valera <harshesh.v@variscite.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v3 0/4] arm64: dts: freescale: Add Variscite i.MX8MP DART8MCustomBoard v2
Date: Sat,  8 Jun 2024 21:04:43 +0300
Message-ID: <20240608180447.31378-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series adds support for the Variscite DART8MCustomBoard v2
carrier board with a DART-MX8M-PLUS module.

The device tree code originates from Variscite's BSP, and has been
heavily refactored to adapt to mainline DT bindings. Some features have
been left out:

- Camera: cameras should be enabled through overlays as they're not part
  of the carrier board itself. I have successfully tested both camera
  ports with modules that currently require out-of-tree drivers, so I
  haven't included them in this series.

- USB OTG: the carrier board has a PTN5150 but doesn't route its
  interrupt pin to the SoC. It should be possible to work around that in
  the driver by implementing polling, but that requires more work that I
  can perform at the moment.

- WiFi, Bluetooth and audio support: those are part of the DART SoM
  itself, for which schematics isn't available, so I can't easily
  troubleshoot them.

- PCIe: I lack test hardware for this.

May I tempt someone from Variscite to submit patches to enable at least
WiFi, Bluetooth, audio and PCIe ? :-)

The LVDS display panel is integrated in the carrier board device tree in
the BSP, I have split it out to an overlay in this series as it is
shipped with the development kit but isn't an integral part of the
carrier board. In the review of v2, Shawn pointed out that this overlay
caused the DT compiler to spit ou warnings. This is still the case here:

  DTC     arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:54.3-16: Warning (reg_format): /fragment@1/__overlay__/touch@38:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #address-cells value
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:52.11-68.4: Warning (avoid_default_addr_size): /fragment@1/__overlay__/touch@38: Relying on default #size-cells value
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtbo: Warning (graph_port): /fragment@3: graph port node name should be 'port'
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph endpoint node name should be 'endpoint'
arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso:85.15-87.3: Warning (graph_endpoint): /fragment@3/__overlay__: graph connection to node '/fragment@0/__overlay__/panel/port/endpoint' is not bidirectional
  DTOVL   arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtb

When compiling the overlay in isolation, the compiler doesn't know in
which context it will be applied, and thus lacks information to validate
the device tree. I don't think the issue is specific to this overlay,
and I don't know if there are plans to handle it. If this is a blocker
for the time being, patches 1/4 to 3/4 can already be merged without the
overlay.

Laurent Pinchart (4):
  dt-bindings: arm: fsl: Add Variscite DT8MCustomBoard with DART
    MX8M-PLUS
  arm64: dts: freescale: Add support for the Variscite DART-MX8M-PLUS
    SoM
  arm64: dts: freescale: Add support for the Variscite i.MX8MP
    DART8MCustomBoard
  arm64: dts: freescale: Add panel overlay for Variscite DART

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   3 +
 .../imx8mp-var-dart-dt8mcustomboard-v2.dts    | 529 ++++++++++++++++++
 .../imx8mp-var-dart-panel-gktw70sdae4se.dtso  |  99 ++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 340 +++++++++++
 5 files changed, 977 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-panel-gktw70sdae4se.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: 41f93a496af2696d970cbcb3814261a9b32dbaa2
-- 
Regards,

Laurent Pinchart

