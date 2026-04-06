Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52CA2FFDCB
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512814; cv=none; b=Na0IkO20zhXcA9KYtieiWkheQBBpppSu+BQYsl530ecRn0gM9xUU7O4lCCD90KFcgBnl/qI9sPrtA4Y6WvJSDH28Wae15SgCSuBqcwPAeF571hIrCNqABHq5rDvK5h1OV+dW/iJzxgZujLnKKMjXzbVRKrFoEqJsCu/oXM6mp0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512814; c=relaxed/simple;
	bh=hrEl9i3JdFXbXCyw+Bh8Wy03eeFYGIDSd2ZEL/SbiUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFHwU1pWvDrPJPz8EmdcU69P9ACQPxVY0uSWwjfXqES55tlXBUYwAgUDf8ce7OIwvlsdCCpfqrImWbCWTk3nkX+/Dek1qEXrZoVKxN2hYy6ftMcw2nS40qcX9Wy8eQ5yc4WQ8hY9DJQwfxW7M9ZDs+CRDCcAa1vhv5HrcstV4tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=OmUvPPah; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="OmUvPPah"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E18B112362;
	Tue,  7 Apr 2026 00:00:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775512805; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=FJVrGWX8vC3dqrzViaIQCvHhRI3IuwHRMJ9B8hz+W0Q=;
	b=OmUvPPahzgBgEnXTUBwJAz6Bng9MsuKpe3QiD3dICrFMZ09BMXaxmEOyPweOXpk1J5NnKw
	U09pAatyHyZsm4J4nAsMqpJbu6svS2F/OC09pUYTG0aVj9A/mfhWYDLXG1ILlIMFdHfomN
	xf//YJH8/C5kk9ktM5933UQlpm9mAxZN4HpvHeLCpAPlUYpwUIijW9OBJEkUprMNRvcXd/
	jkC7O8f5LUIW2g2gXUCY2+Ervbq6H5nQo30g6hSZ3NDvbndv+VVw6V8l1TZeI0W/fNtpcg
	nlNMAjZGvJBACfzxE/AEJnv+VRz7Glgyv6jhyveeL435fX6ckNi/jwp7+ZSriQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx8mm: imx8mp: Add DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Mon,  6 Apr 2026 23:58:45 +0200
Message-ID: <20260406215959.184061-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1
providing additional UARTs, CAN, PWM Beeper, I2C, SPI and GPIO breakout.
This adapter can be optionally populated onto the eDM SBC.

Add DT overlay for the DSI-to-HDMI adapter eDM-MOD-iMX8Mm-HDMI populated
with Lontium LT9611 bridge. This adapter can be optionally populated onto
the eDM SBC.

Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
with Lontium LT9211 bridge. This adapter can be optionally populated onto
the eDM SBC. This adapter can be extended with multiple panels, currently
supported are the following:

- AUO G215HVN011
- Innolux G070Y2-L01
- Innolux G101ICE-L01
- Innolux G121XCE-L01
- Innolux G156HCE-L01
- Multi-Inno Technology MI0700A2T-30
- Multi-Inno Technology MI1010Z1T-1CP11

Note that in case of the i.MX8M Plus eDM SBC, the adapter name containing
iMX8Mm is not a typo, this is the adapter model string. The adapter was
originally developed for the iMX8Mm eDM SBC.

Add DT overlay which adds CM4/CM7 extras so that CM4/CM7 firmware could
be used with remoteproc and rpmsg, but without imposing the overhead
on every user of the platform. The CM4 variant applies to i.MX8M Mini,
while the CM7 variant applies to i.MX8M Plus .

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
DEPENDS:
- https://patchwork.kernel.org/project/devicetree/patch/20260404033709.340026-1-marex@nabladev.com/
- https://patchwork.kernel.org/project/devicetree/patch/20260404034123.340818-1-marex@nabladev.com/
- https://patchwork.kernel.org/project/devicetree/patch/20260404034321.341210-1-marex@nabladev.com/
  https://patchwork.kernel.org/project/devicetree/patch/20260404034321.341210-2-marex@nabladev.com/
- https://patchwork.kernel.org/project/linux-clk/patch/20260406215150.176599-1-marex@nabladev.com/
  https://patchwork.kernel.org/project/linux-clk/patch/20260406215150.176599-2-marex@nabladev.com/
  https://patchwork.kernel.org/project/linux-clk/patch/20260406215150.176599-3-marex@nabladev.com/
  https://patchwork.kernel.org/project/linux-clk/patch/20260406215150.176599-4-marex@nabladev.com/
  https://patchwork.kernel.org/project/linux-clk/patch/20260406215150.176599-5-marex@nabladev.com/
  https://patchwork.kernel.org/project/linux-clk/patch/20260406215150.176599-6-marex@nabladev.com/
- https://patchwork.kernel.org/project/devicetree/patch/20260404183547.46509-1-marex@nabladev.com/
  https://patchwork.kernel.org/project/devicetree/patch/20260404183547.46509-2-marex@nabladev.com/
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Deduplicate the DTOs further
---
 arch/arm64/boot/dts/freescale/Makefile        | 214 +++++++++++++++++-
 ...imx8mm-data-modul-edm-sbc-overlay-cm4.dtso |  56 +++++
 ...edm-sbc-overlay-edm-mod-imx8mm-common.dtsi |  59 +++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi |  98 ++++++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |  80 +++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi |  69 ++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso |  59 +++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi |  92 ++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso |  19 ++
 ...bc-overlay-edm-mod-imx8mm-lvds-common.dtsi | 117 ++++++++++
 ...-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi |  32 +++
 ...verlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi |  12 +
 ...verlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi |  12 +
 ...erlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi |  12 +
 ...erlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi |  12 +
 ...erlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |   7 +
 ...verlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi |  12 +
 ...verlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |   7 +
 ...rlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi |  12 +
 ...rlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |   7 +
 ...y-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi |  12 +
 ...y-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |   7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-single.dtsi |  20 ++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi |  26 +++
 ...edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso |  18 ++
 ...m-data-modul-edm-sbc-overlay-lvds-3v3.dtsi |  19 ++
 ...m-data-modul-edm-sbc-overlay-lvds-5v0.dtsi |  19 ++
 ...-data-modul-edm-sbc-overlay-lvds-dual.dtsi |  29 +++
 ...modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi |  31 +++
 ...odul-edm-sbc-overlay-lvds-g101ice-l01.dtsi |  31 +++
 ...odul-edm-sbc-overlay-lvds-g121xce-l01.dtsi |  31 +++
 ...odul-edm-sbc-overlay-lvds-g156hce-l01.dtsi |  31 +++
 ...modul-edm-sbc-overlay-lvds-g215hvn011.dtsi |  30 +++
 ...dul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi |  31 +++
 ...-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi |  31 +++
 ...ata-modul-edm-sbc-overlay-lvds-single.dtsi |  13 ++
 .../freescale/imx8mm-data-modul-edm-sbc.dts   |   8 +-
 ...imx8mp-data-modul-edm-sbc-overlay-cm7.dtso |  57 +++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |  68 ++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso |  46 ++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso |  19 ++
 ...verlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |   7 +
 ...verlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |  11 +
 ...rlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |   7 +
 ...y-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |   7 +
 ...l-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi |  39 ++++
 ...verlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso |  24 ++
 ...erlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso |  24 ++
 ...erlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso |  24 ++
 ...erlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso |  32 +++
 ...verlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso |  36 +++
 ...rlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso |  24 ++
 ...y-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso |  24 ++
 ...bc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso |  41 ++++
 ...bc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso |  14 ++
 ...l-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi |  79 +++++++
 ...edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso |  97 ++++++++
 ...edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso |  69 ++++++
 .../freescale/imx8mp-data-modul-edm-sbc.dts   |  10 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   2 +-
 66 files changed, 2162 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c990..44385fb05c533 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -115,7 +115,81 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk-pcie-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb
+
+imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-emcon-avari.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-emtop-baseboard.dtb
@@ -237,7 +311,143 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
+
+imx8mp-data-modul-edm-sbc-overlay-cm7-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900-dtbs := \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902-dtbs := \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-drc02.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
new file mode 100644
index 0000000000000..8d681c0eff0d4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {	/* CM4 reserved memory */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		m_core_reserved: m_core@b7000000 {
+			reg = <0 0xb7000000 0 0x1000000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@b8000000 {
+			reg = <0 0xb8000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@b8008000 {
+			reg = <0 0xb8008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@b80ff000 {
+			reg = <0 0xb80ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@b8400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0xb8400000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_CORE>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi
new file mode 100644
index 0000000000000..8a95dc05b1fcf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	reg_backlight_en_level: regulator-backlight-en-level {
+		compatible = "regulator-gpio";
+		regulator-name = "Backlight_SEL_EN";
+		regulator-type = "voltage";
+		states = <3300000 0x0>,
+			 <5000000 0x1>;
+
+		/* Default setting: lowest supported voltage. */
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_backlight_pwm_level: regulator-backlight-pwm-level {
+		compatible = "regulator-gpio";
+		regulator-name = "Backlight_SEL_PWM";
+		regulator-type = "voltage";
+		gpios = <&gpio_display 2 GPIO_ACTIVE_HIGH>; /* SEL_PWM */
+		states = <3300000 0x0>,
+			 <5000000 0x1>;
+
+		/* Default setting: lowest supported voltage. */
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_panel_bl: regulator-panel-bl {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_backlight>;
+		regulator-name = "PANEL_BL";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 0 0>;
+		enable-active-high;
+		/* Used by panels which enable PWM signal before BL ON/OFF */
+		status = "disabled";
+	};
+};
+
+&reg_panel_vcc {
+	compatible = "regulator-gpio";
+	regulator-type = "voltage";
+	enable-active-high;
+	status = "okay";
+
+	/* Default setting: lowest supported voltage. */
+	gpios-states = <0 0>;	/* Default GPIO state is LOW/LOW, so 3V3 out */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
new file mode 100644
index 0000000000000..a4d503d1d3b63
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	can_osc: can-osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+	};
+
+	sound-fio {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SGTL5000-FIO1";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&codec_dai_fio>;
+		simple-audio-card,frame-master = <&codec_dai_fio>;
+		simple-audio-card,widgets = "Headphone", "Headphone Jack";
+		simple-audio-card,routing = "Headphone Jack", "HP_OUT";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		codec_dai_fio: simple-audio-card,codec {
+			sound-dai = <&sgtl5000_fio>;
+		};
+	};
+};
+
+&ecspi2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	can_fio: can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		clocks = <&can_osc>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
+&i2c_feature {	/* Feature connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgtl5000_fio: codec@a {
+		#sound-dai-cells = <0>;
+		clocks = <&sai5clk 1>;
+		compatible = "fsl,sgtl5000";
+		reg = <0x0a>;
+	};
+
+	gpio_feature: io-expander@20 {
+		compatible = "nxp,pca9554";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio5>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"GPI0", "GPI1", "GPI2", "GPI3",
+			"GPO0", "GPO1", "GPO2", "GPO3";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-asynchronous;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&uart2 {	/* RS422 J12 */
+	linux,rs485-enabled-at-boot-time;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* UART4 is blocked by RDC and used as CM4 console UART */
+&uart4 {	/* UART to 1-Wire J5 */
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
new file mode 100644
index 0000000000000..f446938b74006
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+#include "imx8mm-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi"
+
+&can_fio {
+	interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_codec_mclk: codec-mclk_feature-grp {
+		fsl,pins = <
+			/* GPIO4_IO27 */
+			MX8MM_IOMUXC_SAI2_MCLK_SAI5_MCLK		0x2
+		>;
+	};
+
+	pinctrl_sai2: sai2_feature-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXC_SAI2_RX_BCLK		0x90
+			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0		0x96
+			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0		0x90
+			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC		0x96
+		>;
+	};
+};
+
+&pinctrl_hog_feature {
+	fsl,pins = <
+		/* GPIO5_IO03 */
+		MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3				0x40000006
+		/* GPIO5_IO04 */
+		MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4				0x40000006
+
+		/* CAN_INT# */
+		MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25			0x40000090
+	>;
+};
+
+&sai2 {
+	assigned-clocks = <&clk IMX8MM_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	fsl,sai-bit-clock-swap;
+};
+
+&sgtl5000_fio {
+	VDDA-supply = <&buck4_reg>;
+	VDDD-supply = <&buck5_reg>;
+	VDDIO-supply = <&buck4_reg>;
+};
+
+&spba2 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	sai5clk: clock-controller@30050000 {	/* SAI5 */
+		compatible = "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
+		reg = <0x30050000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX8MM_CLK_SAI5_IPG>,
+			 <&clk IMX8MM_CLK_SAI5_ROOT>;
+		clock-names = "bus", "mclk1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_codec_mclk>;
+		assigned-clocks = <&clk IMX8MM_CLK_SAI5>,
+				  <&clk IMX8MM_CLK_CLKOUT1_SEL>,
+				  <&clk IMX8MM_CLK_CLKOUT2_SEL>;
+		assigned-clock-parents = <&clk IMX8MM_CLK_24M>,
+					 <&clk IMX8MM_CLK_24M>,
+					 <&clk IMX8MM_CLK_24M>;
+		assigned-clock-rates = <24000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
new file mode 100644
index 0000000000000..7851ca73ccd8e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	can_osc: can-osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+	};
+};
+
+&ecspi2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	can_fio: can@0 {
+		compatible = "microchip,mcp2515";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		clocks = <&can_osc>;
+		spi-max-frequency = <5000000>;
+	};
+};
+
+&i2c_feature {	/* Feature connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gpio_feature: io-expander@20 {
+		compatible = "nxp,pca9554";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_expander>;
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"GPIO1_output", "GPIO1_input",
+			"GPIO2_output", "GPIO2_input",
+			"GPIO3_output", "GPIO3_input",
+			"PCA9511A_READY", "";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+&uart1 {	/* J500/J501 */
+	status = "okay";
+};
+
+&uart2 {	/* RS485 J302/J303 */
+	linux,rs485-enabled-at-boot-time;
+	uart-has-rtscts;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
new file mode 100644
index 0000000000000..ad410db5f5b76
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi"
+
+&{/} {
+	beeper {
+		compatible = "pwm-beeper";
+		beeper-hz = <1000>;
+		pwms = <&pwm3 0 250000 0>;
+	};
+};
+
+&can_fio {
+	interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_can: can-feature-grp {
+		fsl,pins = <
+			/* CAN_INT# */
+			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x400000d6
+			/* CAN_RST# */
+			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x6
+		>;
+	};
+
+	pinctrl_gpio_expander: gpio-expander-feature-grp {
+		fsl,pins = <
+			/* GPIO4_IO27 */
+			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x6
+		>;
+	};
+
+	pinctrl_pwm3: pwm3-buzzer-feature-grp {
+		fsl,pins = <
+			/* Buzzer PWM output */
+			MX8MM_IOMUXC_SPDIF_TX_PWM3_OUT			0x100
+		>;
+	};
+};
+
+&pinctrl_hog_feature {
+	fsl,pins = <
+		/* GPIO5_IO04 */
+		MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4			0x6
+	>;
+};
+
+&pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm3>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
new file mode 100644
index 0000000000000..c91b7a2781d27
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+};
+
+&i2c_display {	/* Display connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+
+		/* Audio I2S not described */
+		#sound-dai-cells = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mipi_dsi_bridge1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&iomuxc {
+	/* Free &pinctrl_panel_expansion from hog for lt9611_codec above */
+	pinctrl-0 = <&pinctrl_hog_misc>, <&pinctrl_hog_feature>,
+		    <&pinctrl_hog_panel>, <&pinctrl_hog_sbc>;
+};
+
+&mipi_dsi {
+	/* HDMI 148.5 MHz x2 (DDR) x3 (24bpp / 8) */
+	samsung,burst-clock-frequency = <891000000>;
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_bridge1_out: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				/* Clock and data lanes have DN/DP swapped */
+				lane-polarities = <1 1 1 1 1>;
+				remote-endpoint = <&lt9611_a>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
new file mode 100644
index 0000000000000..49f9d3073748c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi"
+
+&lt9611_codec {
+	interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+	vdd-supply = <&buck5_reg>;	/* X400 pin 51, +1V8_S0 */
+	vcc-supply = <&buck4_reg>;	/* X400 pin 55, +3V3_S0 */
+};
+
+&lcdif {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
new file mode 100644
index 0000000000000..971468e4edc80
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&{/} {
+	reg_lt9211_vcc18: regulator-lt9211-vcc18 {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9211_VCC18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+};
+
+&i2c_display {	/* Display connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+
+	lt9211_codec: bridge@2d {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
+		compatible = "lontium,lt9211";
+		reg = <0x2d>;
+		interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&reg_lt9211_vcc18>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9211_a: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_bridge1_out>;
+				};
+			};
+		};
+	};
+
+	gpio_display: io-expander@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "SEL_12V", "SEL_5V", "SEL_PWM", "SEL_EN";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&reg_backlight_en_level {
+	gpios = <&gpio_display 3 GPIO_ACTIVE_HIGH>; /* SEL_EN */
+};
+
+&reg_backlight_pwm_level {
+	gpios = <&gpio_display 2 GPIO_ACTIVE_HIGH>; /* SEL_PWM */
+};
+
+&reg_panel_bl {
+	gpio = <&gpio3 0 0>;
+};
+
+&iomuxc {
+	/* Free &pinctrl_panel_expansion from hog for lt9211_codec above */
+	pinctrl-0 = <&pinctrl_hog_misc>, <&pinctrl_hog_feature>,
+		    <&pinctrl_hog_panel>, <&pinctrl_hog_sbc>;
+};
+
+&mipi_dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_bridge1_out: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				/* Clock and data lanes have DN/DP swapped */
+				lane-polarities = <1 1 1 1 1>;
+				remote-endpoint = <&lt9211_a>;
+			};
+		};
+	};
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/*
+	 * AP63300 voltage divider settings:
+	 *   R1=16k2
+	 *   R2=5k23 with optional series Rs=7k68 (5V) or Rt=1k5 (12V)
+	 *
+	 * 1 / Rx = (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
+	 * Vout = 0.8 * ((R1 / Rx) + 1)
+	 */
+	gpios = <&gpio_display 1 GPIO_ACTIVE_HIGH>,	/* 5V */
+		<&gpio_display 0 GPIO_ACTIVE_HIGH>;	/* 12V */
+	states = <3300000 0x0>,
+		 <5000000 0x1>,
+		 <12000000 0x2>,
+		 <3900000 0x3>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi
new file mode 100644
index 0000000000000..abe50eb8b4b61
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&lt9211_codec {
+	ports {
+		port@2 {
+			reg = <2>;
+
+			lt9211_out_a: endpoint {
+				remote-endpoint = <&panel_lvds_a>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			lt9211_out_b: endpoint {
+				remote-endpoint = <&panel_lvds_b>;
+			};
+		};
+	};
+};
+
+&panel_lvds_a {
+	remote-endpoint = <&lt9211_out_a>;
+};
+
+&panel_lvds_b {
+	remote-endpoint = <&lt9211_out_b>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi
new file mode 100644
index 0000000000000..cca52464a695e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <216000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..5d1ea31f33de3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi
new file mode 100644
index 0000000000000..52d216fbba432
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <515000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
new file mode 100644
index 0000000000000..2d1bbdd065227
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi
new file mode 100644
index 0000000000000..aba3c9a1a3e8a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <470000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
new file mode 100644
index 0000000000000..bc2f6fef6256e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi
new file mode 100644
index 0000000000000..f478f4e557cce
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <864000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
new file mode 100644
index 0000000000000..5f77946e042e3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
new file mode 100644
index 0000000000000..21bec8a01287e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <864000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
new file mode 100644
index 0000000000000..75ae12dfd7fc6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi
new file mode 100644
index 0000000000000..38a3a9a4c75b3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <216000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
new file mode 100644
index 0000000000000..ee2c79664e355
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi
new file mode 100644
index 0000000000000..98b5c5883cfd0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <400000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
new file mode 100644
index 0000000000000..d05f0dcc3137c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi
new file mode 100644
index 0000000000000..9e70c1481c1eb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&lt9211_codec {
+	ports {
+		port@2 {
+			reg = <2>;
+
+			lt9211_out_a: endpoint {
+				remote-endpoint = <&panel_lvds>;
+			};
+		};
+	};
+};
+
+&panel_lvds {
+	remote-endpoint = <&lt9211_out_a>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
new file mode 100644
index 0000000000000..200bc8be0353b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi"
+
+&lt9211_codec {
+	interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_lt9211_vcc18 {
+	vin-supply = <&buck5_reg>;	/* X400 pin 51, +1V8_S0 */
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	enable-gpios = <&gpio3 6 0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso
new file mode 100644
index 0000000000000..14038215f298c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&fec1 {
+	phy-handle = <&fec1_phy_ath>;
+};
+
+&fec1_phy_ath {
+	status = "okay";
+};
+
+&fec1_phy_bcm {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi
new file mode 100644
index 0000000000000..0955764c0ebff
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&reg_backlight_pwm_level {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_panel_vcc {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi
new file mode 100644
index 0000000000000..70ad6bb9b80ac
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&reg_backlight_pwm_level {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
+
+&reg_backlight_en_level {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
+
+&reg_panel_vcc {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi
new file mode 100644
index 0000000000000..65f9ad81cfbc7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&panel {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			panel_lvds_b: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_lvds_a: endpoint {
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
new file mode 100644
index 0000000000000..80f7b74f1ea08
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 6.3 POWER ON/OFF SEQUENCE, T9 >= 10 ms */
+	pwm-off-delay-ms = <10>;
+	/* 3.2 BACKLIGHT UNIT fPWM=200 Hz (Typ.), value below in ns */
+	pwms = <&pwm1 0 5000000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "innolux,g070y2-l01";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <10000>; /* T8 */
+	off-on-delay-us = <550000>; /* T9 + T6 + T3 + T7 + T4 + T1 + T2 + T5 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 6.3 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <1000>; /* 0.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
new file mode 100644
index 0000000000000..1a2bd204c30b1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 6.3 POWER ON/OFF SEQUENCE, T9 >= 10 ms */
+	pwm-off-delay-ms = <10>;
+	/* 3.2 BACKLIGHT UNIT fPWM=200 Hz (Typ.), value below in ns */
+	pwms = <&pwm1 0 5000000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "innolux,g101ice-l01";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <10000>; /* T8 */
+	off-on-delay-us = <950000>; /* T9 + T6 + T3 + T7 + T4 + T1 + T2 + T5 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 6.3 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <1000>; /* 0.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
new file mode 100644
index 0000000000000..f87e8c821dacb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Wael Karman <wkarman@data-modul.com>
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 6.2 POWER ON/OFF SEQUENCE, T9 >= 10 ms */
+	pwm-off-delay-ms = <10>;
+	/* 3.2 BACKLIGHT UNIT fPWM=200 Hz (Typ.), value below in ns */
+	pwms = <&pwm1 0 5000000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "innolux,g121xce-l01";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <10000>; /* T8 */
+	off-on-delay-us = <1180000>; /* T9 + T6 + T3 + T7 + T4 + T1 + T2 + T5 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 6.2 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <1000>; /* 0.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
new file mode 100644
index 0000000000000..46c8bc7021a4f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 4.6 POWER ON/OFF SEQUENCE, T9 >= 10 ms */
+	pwm-off-delay-ms = <10>;
+	/* 4.3.2 BACKLIGHT UNIT fPWM=200 Hz (Typ.), value below in ns */
+	pwms = <&pwm1 0 5000000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "innolux,g156hce-l01";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <10000>; /* T8 */
+	off-on-delay-us = <1170000>; /* T9 + T6 + T3 + T7 + T4 + T1 + T2 + T5 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 4.6 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <1000>; /* 0.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
new file mode 100644
index 0000000000000..3585170bd59dd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi"
+
+&backlight {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_panel_backlight>;
+	enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
+	/* 6.5 POWER ON/OFF SEQUENCE, T6 >= 10 ms */
+	post-pwm-on-delay-ms = <10>;
+	/* 6.5 POWER ON/OFF SEQUENCE, T7 >= 0 ms */
+	pwm-off-delay-ms = <10>;
+	/* 5.2 BACKLIGHT UNIT 200Hz..20kHz, value below in ns */
+	pwms = <&pwm1 0 66666 0>;	/* 15 kHz = 66666ns */
+	status = "okay";
+};
+
+&panel {
+	/* The G215HVN01 is replacement for T215HVN01, which is supported. */
+	compatible = "auo,t215hvn01";
+};
+
+&reg_panel_vcc {
+	/* 6.5 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <40000>; /* 30.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
new file mode 100644
index 0000000000000..4a077e6e6b8af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 1.5 POWER ON/OFF SEQUENCE, T4 >= 200 ms */
+	pwm-off-delay-ms = <200>;
+	/* ELECTRICAL CHARACTERISTICS, BL_ADJ Frequency 20K HZ Typ., value below in ns */
+	pwms = <&pwm1 0 50000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "multi-inno,mi0700a2t-30";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <200000>; /* T3 */
+	off-on-delay-us = <1450000>; /* T4 + T5 + T6 + T1 + T2 + T3 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 1.5 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <60000>; /* T1 + T2 >= 1 ms (typ. 60ms) */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
new file mode 100644
index 0000000000000..e8d8cd85d04ae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 3 POWER ON/OFF SEQUENCE, T7 >= 200 ms */
+	pwm-off-delay-ms = <200>;
+	/* ELECTRICAL CHARACTERISTICS, BL_ADJ Frequency 20K HZ Typ., value below in ns */
+	pwms = <&pwm1 0 50000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "multi-inno,mi1010z1t-1cp11";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <200000>; /* T6 */
+	off-on-delay-us = <1450000>; /* T7 + T3 + T4 + T5 + T1 + T2 + T6 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 3 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <60000>; /* T1 + T2 >= 1 ms (typ. 60ms) */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi
new file mode 100644
index 0000000000000..68c20692241a1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&panel {
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index 472c584fb3bd2..df857de0375cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
@@ -30,11 +30,8 @@ memory@40000000 {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_panel_backlight>;
 		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
 		default-brightness-level = <7>;
-		enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm1 0 5000000 0>;
 		/* Disabled by default, unless display board plugged in. */
 		status = "disabled";
@@ -66,7 +63,6 @@ reg_panel_vcc: regulator-panel-vcc {
 		regulator-name = "PANEL_VCC";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 6 0>;
 		enable-active-high;
 		/* Disabled by default, unless display board plugged in. */
 		status = "disabled";
@@ -454,7 +450,7 @@ pcieclk: clk@6a {
 	};
 };
 
-&i2c3 {	/* Display connector I2C */
+i2c_display: &i2c3 {	/* Display connector I2C */
 	/* IMX8MM ERRATA e7805 -- I2C is limited to 384 kHz due to SoC bug */
 	clock-frequency = <320000>;
 	pinctrl-names = "default", "gpio";
@@ -465,7 +461,7 @@ &i2c3 {	/* Display connector I2C */
 	status = "okay";
 };
 
-&i2c4 {	/* Feature connector I2C */
+i2c_feature: &i2c4 {	/* Feature connector I2C */
 	/* IMX8MM ERRATA e7805 -- I2C is limited to 384 kHz due to SoC bug */
 	clock-frequency = <320000>;
 	pinctrl-names = "default", "gpio";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
new file mode 100644
index 0000000000000..21e2a8c0bab0a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {	/* CM7 reserved memory */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		m_core_reserved: m_core@54000000 {
+			reg = <0 0x54000000 0 0x1000000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
+	};
+
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7-mmio";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
+		fsl,iomuxc-gpr = <&gpr>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+		syscon = <&src>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
new file mode 100644
index 0000000000000..8df1a860348d5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "imx8mp-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi"
+
+&can_fio {
+	interrupts-extended = <&gpio2 10 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_codec_mclk: codec-mclk_feature-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI5_MCLK	0xd6
+		>;
+	};
+
+	sai2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00	0xd6
+		>;
+	};
+
+	uart1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__UART1_DCE_TX		0x49
+			MX8MP_IOMUXC_SD1_CMD__UART1_DCE_RX		0x49
+			MX8MP_IOMUXC_SD1_DATA1__UART1_DCE_CTS		0x49
+		>;
+	};
+};
+
+&sai2 {
+	assigned-clocks = <&clk IMX8MP_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
+};
+
+&sgtl5000_fio {
+	VDDA-supply = <&buck4>;
+	VDDD-supply = <&buck5>;
+	VDDIO-supply = <&buck4>;
+};
+
+&spba5 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	sai5clk: clock-controller@30c50000 {
+		compatible = "fsl,imx8mp-sai-clock", "fsl,imx8mq-sai-clock";
+		reg = <0x30c50000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+			 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>;
+		clock-names = "bus", "mclk1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_codec_mclk>;
+		status = "okay";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
new file mode 100644
index 0000000000000..0eccb7f7c0a8c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi"
+
+&can_fio {
+	interrupts-extended = <&gpio2 10 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_can: can-feature-grp {
+		fsl,pins = <
+			/* CAN_INT# */
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10		0x400000d6
+		>;
+	};
+
+	pinctrl_gpio_expander: gpio-expander-feature-grp {
+		fsl,pins = <
+			/* GPIO4_IO27 */
+			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27		0x6
+		>;
+	};
+};
+
+&pinctrl_sai2 {
+	fsl,pins = <
+		MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+		MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+		MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+	>;
+};
+
+&pinctrl_hog_feature {
+	fsl,pins = <
+		/* GPIO5_IO03 */
+		MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x40000006
+		/* GPIO5_IO04 */
+		MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x40000006
+	>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
new file mode 100644
index 0000000000000..22ded48fc8ccf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi"
+
+&lt9611_codec {
+	interrupts-extended = <&gpio4 19 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+	vdd-supply = <&buck5>;	/* X400 pin 51, +1V8_S0 */
+	vcc-supply = <&buck4>;	/* X400 pin 55, +3V3_S0 */
+};
+
+&lcdif1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..6b6b160c0f3a1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
new file mode 100644
index 0000000000000..549ea2ab8819a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
new file mode 100644
index 0000000000000..c8c4328218152
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
new file mode 100644
index 0000000000000..033eb210917cd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g151hce-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
new file mode 100644
index 0000000000000..faf2c06fc50c3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl_supply>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
new file mode 100644
index 0000000000000..359a8b1521b01
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
new file mode 100644
index 0000000000000..525cedb64a776
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
new file mode 100644
index 0000000000000..86aa8d5e822d3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi"
+
+&{/} {
+	reg_panel_bl_supply: regulator-panel-bl-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "BKLT0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lt9211_codec {
+	interrupts-extended = <&gpio4 19 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_lt9211_vcc18 {
+	vin-supply = <&buck5>;	/* X400 pin 51, +1V8_S0 */
+};
+
+&reg_panel_bl {
+	vin-supply = <&reg_panel_bl_supply>;
+};
+
+&reg_panel_vcc {
+	enable-gpios = <&gpio3 6 0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..7a4126214a4f6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The G070Y2-L01 panel requires 29.5 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 206.5 MHz , since 206.5 MHz / 7 = 29.5 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <206500000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
new file mode 100644
index 0000000000000..817d4ec62d0e8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The G101ICE-L01 panel requires 71.1 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 497.7 MHz , since 497.7 MHz / 7 = 71.1 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <497700000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
new file mode 100644
index 0000000000000..729f477038b17
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Wael Karman <wkarman@data-modul.com>
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The G121XCE-L01 panel requires 64.9 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 454.3 MHz , since 454.3 MHz / 7 = 64.9 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <454300000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
new file mode 100644
index 0000000000000..86163d6ddd5c6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The G156HCE-L01 panel requires 141.86 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 993.2 MHz , since 993.2 MHz / 7 = 141.86 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <993020000>;
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_b>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds_a>;
+};
+
+&panel_lvds_a {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
+
+&panel_lvds_b {
+	remote-endpoint = <&ldb_lvds_ch0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
new file mode 100644
index 0000000000000..a6d13c3609796
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl_supply>;
+};
+
+&media_blk_ctrl {
+	/*
+	 * The G215HVN01 panel requires 148.8 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 1041.6 MHz , since 1041.6 MHz / 7 = 148.8 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <1041600000>;
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_b>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds_a>;
+};
+
+&panel_lvds_a {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
+
+&panel_lvds_b {
+	remote-endpoint = <&ldb_lvds_ch0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
new file mode 100644
index 0000000000000..76bfbd307ba2d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The MI0700A2T-30 panel requires 33 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 231 MHz , since 231 MHz / 7 = 33 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <231000000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
new file mode 100644
index 0000000000000..4066bac28f3df
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The MI1010Z1T-1CP11 panel requires 51.2 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 358.4 MHz , since 358.4 MHz / 7 = 51.2 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <358400000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
new file mode 100644
index 0000000000000..427585b78e45d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	reg_panel_vcc_raw: regulator-panel-vcc-raw {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_vcc_reg>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "PANEL_VCC";
+	};
+};
+
+&panel {
+	power-supply = <&reg_panel_vcc_raw>;
+};
+
+&reg_backlight_en_level {
+	status = "disabled";
+};
+
+&reg_backlight_pwm_level {
+	status = "disabled";
+};
+
+&reg_panel_bl_supply {
+	status = "disabled";
+};
+
+&reg_panel_bl {
+	gpio = <&gpio3 0 0>;
+};
+
+&reg_panel_vcc {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso
new file mode 100644
index 0000000000000..a21fea27e0b41
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&reg_panel_bl {
+	gpio = <&gpio3 0 0>;
+};
+
+&reg_panel_vcc {
+	enable-gpios = <&gpio3 6 0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
new file mode 100644
index 0000000000000..b06af369a9245
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi"
+
+&{/} {
+	reg_panel_bl_supply: regulator-panel-bl-supply {
+		compatible = "regulator-gpio";
+		regulator-type = "voltage";
+		regulator-name = "PANEL_BL_SUPPLY";
+		enable-gpios = <&gpiolvds 0 0>;
+		enable-active-high;
+		status = "okay";
+
+		/*
+		 * MP2328 voltage divider settings:
+		 *   R1=51k1
+		 *   R2=5k62 with optional series Rs=2k21 (12V)
+		 *
+		 * 1 / Rx = (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
+		 * Vout = 0.5 + ((R1 / Rx) * 0.5)
+		 */
+		gpios = <&gpiolvds 1 GPIO_ACTIVE_HIGH>;	/* 12V */
+		states = <5000000 0x0>,
+			 <12000000 0x1>;
+
+		/* Default setting: lowest supported voltage. */
+		gpios-states = <1>;	/* Default GPIO state is HIGH, so 12V0 out */
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&reg_backlight_en_level {
+	gpios = <&gpiolvds 5 GPIO_ACTIVE_HIGH>; /* SEL_EN */
+};
+
+&reg_backlight_pwm_level {
+	gpios = <&gpiolvds 4 GPIO_ACTIVE_HIGH>; /* SEL_PWM */
+};
+
+&reg_panel_bl {
+	gpio = <&gpiowifi 0 0>;
+	vin-supply = <&reg_panel_bl_supply>;
+};
+
+&reg_panel_vcc {
+	enable-gpios = <&gpiowifi 4 0>;
+	/*
+	 * MP2328 voltage divider settings:
+	 *   R1=51k1
+	 *   R2=9k09 with optional series Rs=5k62 (5V) or Rt=2k21 (12V)
+	 *
+	 * 1 / Rx = (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
+	 * Vout = 0.5 + ((R1 / Rx) * 0.5)
+	 */
+	gpios = <&gpiolvds 2 GPIO_ACTIVE_HIGH>,	/* 5V */
+		<&gpiolvds 3 GPIO_ACTIVE_HIGH>;	/* 12V */
+	states = <3300000 0x0>,
+		 <5000000 0x1>,
+		 <12000000 0x2>,
+		 <14000000 0x3>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso
new file mode 100644
index 0000000000000..ec861aa64541e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-pinfunc.h"
+
+&eeprom900 {
+	status = "okay";
+};
+
+&eeprom902 {
+	status = "disabled";
+};
+
+&eqos {	/* First ethernet */
+	phy-handle = <&phy_eqos_ath>;
+};
+
+&fec {	/* Second ethernet */
+	/* pinctrl_wifi is ENET2_INT# */
+	pinctrl-0 = <&pinctrl_fec &pinctrl_wifi>;
+	phy-handle = <&phy_fec_ath>;
+};
+
+&gpiolvds {
+	status = "disabled";
+};
+
+/*
+ * External pull ups on R242 and R243 on I2C2_SCL_3V3 and I2C2_SDA_3V3
+ * are not populated on this early board revision, activate in-SoC pull
+ * up resistors instead to work around the missing external pull ups.
+ */
+&pinctrl_i2c2 {
+	fsl,pins = <
+		MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL			0x400001c4
+		MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA			0x400001c4
+	>;
+};
+
+&pinctrl_i2c2_gpio {
+	fsl,pins = <
+		MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16		0x1c4
+		MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0x1c4
+	>;
+};
+
+&pcie_phy {
+	status = "disabled";
+};
+
+&pcie {
+	status = "disabled";
+};
+
+&phy_eqos_ath {
+	/*
+	 * The software support for combination of EEE capable PHY and EEE
+	 * capable MAC is so far missing from the Linux kernel. By default,
+	 * the AR8035 PHY does enable EEE functionality on the PHY side,
+	 * while the EQoS/DWMAC MAC expects to handle the EEE functionality
+	 * on the MAC side. Because the Linux kernel is currently unable to
+	 * align EEE configuration of the PHY and MAC, enabling EEE leads
+	 * to unreliable link. Disable EEE until the kernel support is in
+	 * place.
+	 */
+	eee-broken-100tx;
+	eee-broken-1000t;
+	status = "okay";
+};
+
+&phy_eqos_bcm {
+	status = "disabled";
+};
+
+&phy_fec_ath {
+	status = "okay";
+};
+
+&phy_fec_bcm {
+	status = "disabled";
+};
+
+&reg_pcie0 {
+	status = "disabled";
+};
+
+&tpm {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso
new file mode 100644
index 0000000000000..0141b5d77c6bd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-pinfunc.h"
+
+&pinctrl_hog_misc {
+	fsl,pins = <
+		/* ENET_WOL# -- shared by both PHYs */
+		MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x40000090
+
+		/* PG_V_IN_VAR# */
+		MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01		0x40000000
+		/* CSI2_PD_1V8 */
+		MX8MP_IOMUXC_NAND_DATA02__GPIO3_IO08		0x0
+		/* CSI2_RESET_1V8# */
+		MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09		0x0
+
+		/* DIS_USB_DN1 */
+		MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21		0x0
+		/* DIS_USB_DN2 */
+		MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22		0x0
+
+		/* EEPROM_WP_1V8# */
+		MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14		0x100
+		/* PCIE_CLK_GEN_CLKPWRGD_PD_1V8# */
+		MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21		0x0
+		/* GRAPHICS_PRSNT_1V8# */
+		MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x40000000
+
+		/* CLK_CCM_CLKO1_3V3 */
+		MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1		0x10
+	>;
+};
+
+&pinctrl_pcie0 {
+	fsl,pins = <
+		/* M2_PCIE_RST# */
+		MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x2
+		/* M2_W_DISABLE1_1V8# */
+		MX8MP_IOMUXC_SAI5_RXD2__GPIO3_IO23		0x2
+		/* M2_W_DISABLE2_1V8# */
+		MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24		0x2
+		/* CLK_M2_32K768 */
+		MX8MP_IOMUXC_GPIO1_IO00__CCM_EXT_CLK1		0x14
+		/* M2_PCIE_WAKE# */
+		MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x40000140
+		/* M2_PCIE_CLKREQ# */
+		MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B		0x61
+	>;
+};
+
+&pinctrl_uart4 {
+	fsl,pins = <
+		MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x49
+		MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x49
+	>;
+};
+
+&gpiowifi {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index cb28cf1cdd23f..a229670992a48 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -30,11 +30,8 @@ memory@40000000 {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_panel_backlight>;
 		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
 		default-brightness-level = <7>;
-		enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm1 0 5000000 0>;
 		/* Disabled by default, unless display board plugged in. */
 		status = "disabled";
@@ -86,9 +83,6 @@ reg_panel_vcc: regulator-panel-vcc {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "PANEL_VCC";
-		/* GPIO flags are ignored, enable-active-high applies. */
-		gpio = <&gpio3 6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
 		/* Disabled by default, unless display board plugged in. */
 		status = "disabled";
 	};
@@ -454,7 +448,9 @@ pcieclk: clk@6a {
 	};
 };
 
-&i2c2 {
+i2c_display: &i2c2 { };
+
+i2c_feature: &i2c2 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c2>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 90d7bb8f5619e..42a3216daed44 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
 			#access-controller-cells = <3>;
 			ranges = <0x30c00000 0x30c00000 0x400000>;
 
-			spba-bus@30c00000 {
+			spba5: spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				reg = <0x30c00000 0x100000>;
 				#address-cells = <1>;
-- 
2.53.0

