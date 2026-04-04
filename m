Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A043431E6
	for <imx@lists.linux.dev>; Sat,  4 Apr 2026 20:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775333465; cv=none; b=LTQnD4dnGKNtuipclIvi34TTjfYTfLV5Hgb5CkC12dD8OdTx5Mm/NhKrB7gxp6Z8m0Hsp32jFxjQw1wH+JBByVA2bDV3c3nOY3T57d3YcxagiK+Kamk0Ceo7hJrFQYIGrIwjyy0x6GhFjLZ/IsDn1wTwFsNt6nnxJJRda1gxjDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775333465; c=relaxed/simple;
	bh=VmhjMpttQ6/6enIOAtMZrpVAy7wlRNRAPvVtLOM4YhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTKeUuzmIWb3X5KPmyu79LfdzPYOkB0frl1ZCiEM7AsamGiEkHL+opLz6+n/YEK1/wl9HF6l4KYJkV4zZLAPlImlTvgiOccMI3iZyC5+DSVa67sb4qPS3+UHO21ng0ZEv+3Rj3zFxlgrOabgsDyaD7U4Zl7W5lJlEAvahgBTLFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Q/5JwY6l; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Q/5JwY6l"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 383E3108425;
	Sat,  4 Apr 2026 22:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775333455; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ABh/Y7keMTgHWGaguJoVg/OBeIJKsjvbWJS3LkhOijg=;
	b=Q/5JwY6lw0n3SVF78IgThx25m8BZymgPaQmrK6iZYN/MnPyaDRILIlh0Mw8d2n8WzNv5L1
	e8Vhfd0hoWzX77jajyy0g05Kdf0aJzll13MYqJ6jiFrCrFZ0a4ZiawifSbNrdSR1ZIxJzV
	SOi4mOeBgQSnmn63YUbbNYaiFLfnoeknS1js0GjGqWEDhmZN8B1vqVKLBHghK3TEUHPWhi
	L9hlIWhWyRGp5oNC0f1aGN5sR+PqBhG6IafTgaq2anoydLeJugumItVflRWpaErTH8pPsN
	ZCXECWCzDahE/F1kBt/NGQD1ObJmP7oSRzO5TDnUkNmANEE+iS7QBwYMRmYRpg==
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
Subject: [PATCH] arm64: dts: imx8mm: imx8mp: Add DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Sat,  4 Apr 2026 22:09:08 +0200
Message-ID: <20260404201038.52093-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlay for the feature connector expansion module eDM-MOD-iMX8Mm-FIO1
providing additional UARTs, CAN, PWM Beeper, I2C, SPI and GPIO breakout. This
adapter can be optionally populated onto the eDM SBC.

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
- https://patchwork.kernel.org/project/devicetree/patch/20260404183419.46455-1-marex@nabladev.com/
  https://patchwork.kernel.org/project/devicetree/patch/20260404183419.46455-2-marex@nabladev.com/
  https://patchwork.kernel.org/project/devicetree/patch/20260404183419.46455-3-marex@nabladev.com/
  https://patchwork.kernel.org/project/devicetree/patch/20260404183419.46455-4-marex@nabladev.com/
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
 arch/arm64/boot/dts/freescale/Makefile        | 214 +++++++++++++++++-
 ...imx8mm-data-modul-edm-sbc-overlay-cm4.dtso |  56 +++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso | 163 +++++++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso | 118 ++++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso | 102 +++++++++
 ...verlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |  70 ++++++
 ...erlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |  70 ++++++
 ...erlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |  70 ++++++
 ...erlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |  95 ++++++++
 ...verlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |  94 ++++++++
 ...rlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |  70 ++++++
 ...y-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |  70 ++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi | 165 ++++++++++++++
 ...edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso |  18 ++
 .../freescale/imx8mm-data-modul-edm-sbc.dts   |   4 -
 ...imx8mp-data-modul-edm-sbc-overlay-cm7.dtso |  57 +++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso | 151 ++++++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso | 107 +++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso | 102 +++++++++
 ...verlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |  28 +++
 ...erlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |  28 +++
 ...erlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |  28 +++
 ...erlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |  40 ++++
 ...verlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |  40 ++++
 ...rlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |  28 +++
 ...y-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |  28 +++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi | 172 ++++++++++++++
 ...verlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso |  24 ++
 ...erlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso |  24 ++
 ...erlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso |  24 ++
 ...erlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso |  32 +++
 ...verlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso |  32 +++
 ...rlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso |  24 ++
 ...y-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso |  24 ++
 ...bc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso |  41 ++++
 ...bc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso |  14 ++
 ...l-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi | 116 ++++++++++
 ...edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso |  97 ++++++++
 ...edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso |  69 ++++++
 ...modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi |  50 ++++
 ...odul-edm-sbc-overlay-lvds-g101ice-l01.dtsi |  50 ++++
 ...odul-edm-sbc-overlay-lvds-g121xce-l01.dtsi |  50 ++++
 ...odul-edm-sbc-overlay-lvds-g156hce-l01.dtsi |  66 ++++++
 ...modul-edm-sbc-overlay-lvds-g215hvn011.dtsi |  66 ++++++
 ...dul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi |  50 ++++
 ...-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi |  50 ++++
 .../freescale/imx8mp-data-modul-edm-sbc.dts   |   6 -
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |   2 +-
 48 files changed, 3086 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso
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
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi

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
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
new file mode 100644
index 0000000000000..a5e80383533e7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "imx8mm-pinfunc.h"
+
+&{/} {
+	can_osc: can-osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SGTL5000-Card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,widgets = "Headphone", "Headphone Jack";
+		simple-audio-card,routing = "Headphone Jack", "HP_OUT";
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&sgtl5000>;
+		};
+	};
+};
+
+&ecspi2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		clocks = <&can_osc>;
+		interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
+&i2c4 {	/* Feature connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgtl5000: codec@a {
+		#sound-dai-cells = <0>;
+		clocks = <&sai5clk 1>;
+		compatible = "fsl,sgtl5000";
+		reg = <0x0a>;
+		VDDA-supply = <&buck4_reg>;
+		VDDD-supply = <&buck5_reg>;
+		VDDIO-supply = <&buck4_reg>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-asynchronous;
+	fsl,sai-bit-clock-swap;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
new file mode 100644
index 0000000000000..e2eef78cfb40f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "imx8mm-pinfunc.h"
+
+&{/} {
+	beeper {
+		compatible = "pwm-beeper";
+		beeper-hz = <1000>;
+		pwms = <&pwm3 0 250000 0>;
+	};
+
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
+	can@0 {
+		compatible = "microchip,mcp2515";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		clocks = <&can_osc>;
+		interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <5000000>;
+	};
+};
+
+&i2c4 {	/* Feature connector I2C */
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
new file mode 100644
index 0000000000000..b39532253d4dd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
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
+&i2c3 {	/* Display connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&buck5_reg>;	/* X400 pin 51, +1V8_S0 */
+		vcc-supply = <&buck4_reg>;	/* X400 pin 55, +3V3_S0 */
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
+&lcdif {
+	status = "okay";
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..4930339d0f980
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <216000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel {
+	compatible = "innolux,g070y2-l01";
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+			remote-endpoint = <&lt9211_out_a>;
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this G070Y2-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this G070Y2-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this G070Y2-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
new file mode 100644
index 0000000000000..a5e8db0b4557c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <515000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel {
+	compatible = "innolux,g101ice-l01";
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+			remote-endpoint = <&lt9211_out_a>;
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this G101ICE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this G101ICE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this G101ICE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
new file mode 100644
index 0000000000000..46a26189f2fa0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <470000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel {
+	compatible = "innolux,g121xce-l01";
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+			remote-endpoint = <&lt9211_out_a>;
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this G121XCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this G121XCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this G121XCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
new file mode 100644
index 0000000000000..e606e9dbb098d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <864000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel {
+	compatible = "innolux,g156hce-l01";
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
+				remote-endpoint = <&lt9211_out_b>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_lvds_a: endpoint {
+				remote-endpoint = <&lt9211_out_a>;
+			};
+		};
+	};
+};
+
+&reg_backlight_pwm_level {	/* G156HCE-L01 can do both 3V3 and 5V IO */
+	/* Always only output 3.3V on this G156HCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {	/* G156HCE-L01 can do both 3V3 and 5V IO */
+	/* Always only output 3.3V on this G156HCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this G156HCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
new file mode 100644
index 0000000000000..4ed5afc4cee2c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <864000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel {
+	/* The G215HVN01 is replacement for T215HVN01, which is supported. */
+	compatible = "auo,t215hvn01";
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
+				remote-endpoint = <&lt9211_out_b>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_lvds_a: endpoint {
+				remote-endpoint = <&lt9211_out_a>;
+			};
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 5V on this G215HVN01.1 panel unit. */
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 5V on this G215HVN01.1 panel unit. */
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
+
+&reg_panel_vcc {
+	/* 6.5 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <40000>; /* 30.5ms <= T1 + T2 <= 60 ms */
+
+	/* Always only output 5.0V on this G215HVN01.1 panel unit. */
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
new file mode 100644
index 0000000000000..a471451684295
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <216000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel {
+	compatible = "multi-inno,mi0700a2t-30";
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+			remote-endpoint = <&lt9211_out_a>;
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this MI0700A2T-30 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this MI0700A2T-30 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this MI0700A2T-30 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
new file mode 100644
index 0000000000000..830a8916bbe03
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <400000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel {
+	compatible = "multi-inno,mi1010z1t-1cp11";
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+			remote-endpoint = <&lt9211_out_a>;
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this MI1010Z1T-1CP11 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this MI1010Z1T-1CP11 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this MI1010Z1T-1CP11 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
new file mode 100644
index 0000000000000..36f425234202d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	reg_backlight_en_level: regulator-backlight-en-level {
+		compatible = "regulator-gpio";
+		regulator-name = "Backlight_SEL_EN";
+		regulator-type = "voltage";
+		gpios = <&gpio_display 3 GPIO_ACTIVE_HIGH>; /* SEL_EN */
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
+
+	reg_lt9211_vcc18: regulator-lt9211-vcc18 {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9211_VCC18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&buck5_reg>;	/* X400 pin 51, +1V8_S0 */
+	};
+};
+
+&i2c3 {	/* Display connector I2C */
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
+&iomuxc {
+	/* Free &pinctrl_panel_expansion from hog for lt9211_codec above */
+	pinctrl-0 = <&pinctrl_hog_misc>, <&pinctrl_hog_feature>,
+		    <&pinctrl_hog_panel>, <&pinctrl_hog_sbc>;
+};
+
+&lcdif {
+	status = "okay";
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
+	compatible = "regulator-gpio";
+	regulator-type = "voltage";
+	enable-gpios = <&gpio3 6 0>;
+	enable-active-high;
+	status = "okay";
+
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
+
+	/* Default setting: lowest supported voltage. */
+	gpios-states = <0 0>;	/* Default GPIO state is LOW/LOW, so 3V3 out */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index 472c584fb3bd2..d695ea0643e32 100644
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
index 0000000000000..0f70eb5086a03
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "imx8mp-pinfunc.h"
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
+		cpu_dai_fio: simple-audio-card,cpu {
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
+	can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		clocks = <&can_osc>;
+		interrupts-extended = <&gpio2 10 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
+&i2c2 {	/* Feature connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgtl5000_fio: codec@a {
+		#sound-dai-cells = <0>;
+		clocks = <&sai5clk 1>;
+		compatible = "fsl,sgtl5000";
+		reg = <0x0a>;
+		VDDA-supply = <&buck4>;
+		VDDD-supply = <&buck5>;
+		VDDIO-supply = <&buck4>;
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-asynchronous;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
new file mode 100644
index 0000000000000..0270443c667e3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "imx8mp-pinfunc.h"
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
+	can@0 {
+		compatible = "microchip,mcp2515";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		clocks = <&can_osc>;
+		interrupts-extended = <&gpio2 10 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <5000000>;
+	};
+};
+
+&i2c2 {	/* Feature connector I2C */
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
new file mode 100644
index 0000000000000..3b5da71273c09
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
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
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		interrupts-extended = <&gpio4 19 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+		vdd-supply = <&buck5>;	/* X400 pin 51, +1V8_S0 */
+		vcc-supply = <&buck4>;	/* X400 pin 55, +3V3_S0 */
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
+&lcdif1 {
+	status = "okay";
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..78b5557e870a2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <216000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&lt9211_out_a>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
new file mode 100644
index 0000000000000..28e94fe0cdd63
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <515000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&lt9211_out_a>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
new file mode 100644
index 0000000000000..a8918b5bc8d71
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <470000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&lt9211_out_a>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
new file mode 100644
index 0000000000000..673a574c6f3ea
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <864000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel_lvds_a {
+	remote-endpoint = <&lt9211_out_a>;
+};
+
+&panel_lvds_b {
+	remote-endpoint = <&lt9211_out_b>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
new file mode 100644
index 0000000000000..5e3fc1ca1bf16
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <864000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel_lvds_a {
+	remote-endpoint = <&lt9211_out_a>;
+};
+
+&panel_lvds_b {
+	remote-endpoint = <&lt9211_out_b>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
new file mode 100644
index 0000000000000..443b3b3132372
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <216000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&lt9211_out_a>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
new file mode 100644
index 0000000000000..c979cf3a9ae65
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi"
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
+&mipi_dsi {
+	samsung,burst-clock-frequency = <400000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&lt9211_out_a>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
new file mode 100644
index 0000000000000..4fcb553f7c669
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	reg_backlight_en_level: regulator-backlight-en-level {
+		compatible = "regulator-gpio";
+		regulator-name = "Backlight_SEL_EN";
+		regulator-type = "voltage";
+		gpios = <&gpio_display 3 GPIO_ACTIVE_HIGH>; /* SEL_EN */
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
+	reg_panel_bl_supply: regulator-panel-bl-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "BKLT0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
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
+		vin-supply = <&reg_panel_bl_supply>;
+		/* Used by panels which enable PWM signal before BL ON/OFF */
+		status = "disabled";
+	};
+
+	reg_lt9211_vcc18: regulator-lt9211-vcc18 {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9211_VCC18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&buck5>;	/* X400 pin 51, +1V8_S0 */
+	};
+};
+
+&i2c2 {	/* Display connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	lt9211_codec: bridge@2d {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
+		compatible = "lontium,lt9211";
+		reg = <0x2d>;
+		interrupts-extended = <&gpio4 19 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
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
+&iomuxc {
+	/* Free &pinctrl_panel_expansion from hog for lt9211_codec above */
+	pinctrl-0 = <&pinctrl_hog_misc>, <&pinctrl_hog_feature>,
+		    <&pinctrl_hog_panel>, <&pinctrl_hog_sbc>;
+};
+
+&lcdif1 {
+	status = "okay";
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
+	compatible = "regulator-gpio";
+	regulator-type = "voltage";
+	enable-gpios = <&gpio3 6 0>;
+	enable-active-high;
+	status = "okay";
+
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
+
+	/* Default setting: lowest supported voltage. */
+	gpios-states = <0 0>;	/* Default GPIO state is LOW/LOW, so 3V3 out */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..b6bd41f10de6b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi"
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
index 0000000000000..4f80da399b7f2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi"
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
index 0000000000000..7f2ad9f41882c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Wael Karman <wkarman@data-modul.com>
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi"
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
index 0000000000000..b438bcfceda26
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi"
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
index 0000000000000..4a1dad3e75394
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
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
index 0000000000000..93cecbe521188
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi"
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
index 0000000000000..65050c616155b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mp-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi"
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
index 0000000000000..5a184b2ca1a59
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	reg_backlight_en_level: regulator-backlight-en-level {
+		compatible = "regulator-gpio";
+		regulator-name = "Backlight_SEL_EN";
+		regulator-type = "voltage";
+		gpios = <&gpiolvds 5 GPIO_ACTIVE_HIGH>; /* SEL_EN */
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
+		gpios = <&gpiolvds 4 GPIO_ACTIVE_HIGH>; /* SEL_PWM */
+		states = <3300000 0x0>,
+			 <5000000 0x1>;
+
+		/* Default setting: lowest supported voltage. */
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
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
+
+	reg_panel_bl: regulator-panel-bl {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_backlight>;
+		regulator-name = "PANEL_BL";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpiowifi 0 0>;
+		enable-active-high;
+		vin-supply = <&reg_panel_bl_supply>;
+		/* Used by panels which enable PWM signal before BL ON/OFF */
+		status = "disabled";
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
+&reg_panel_vcc {
+	compatible = "regulator-gpio";
+	regulator-type = "voltage";
+	enable-gpios = <&gpiowifi 4 0>;
+	enable-active-high;
+	status = "okay";
+
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
+
+	/* Default setting: lowest supported voltage. */
+	gpios-states = <0 0>;	/* Default GPIO state is LOW/LOW, so 3V3 out */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
new file mode 100644
index 0000000000000..d7df9454c39a4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
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
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this G070Y2-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this G070Y2-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this G070Y2-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
new file mode 100644
index 0000000000000..673cb77caaf2c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
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
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this G101ICE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this G101ICE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this G101ICE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
new file mode 100644
index 0000000000000..2be8b35b5c185
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Wael Karman <wkarman@data-modul.com>
+ */
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
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this G121XCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this G121XCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this G121XCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
new file mode 100644
index 0000000000000..bff5f5f99321a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
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
+
+&reg_backlight_pwm_level {	/* G156HCE-L01 can do both 3V3 and 5V IO */
+	/* Always only output 3.3V on this G156HCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {	/* G156HCE-L01 can do both 3V3 and 5V IO */
+	/* Always only output 3.3V on this G156HCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this G156HCE-L01 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
new file mode 100644
index 0000000000000..8b48bae448f30
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+&backlight {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_panel_backlight>;
+	enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
+	power-supply = <&reg_panel_bl_supply>;
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
+
+&reg_backlight_pwm_level {
+	/* Always only output 5V on this G215HVN01.1 panel unit. */
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 5V on this G215HVN01.1 panel unit. */
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
+
+&reg_panel_vcc {
+	/* 6.5 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <40000>; /* 30.5ms <= T1 + T2 <= 60 ms */
+
+	/* Always only output 5.0V on this G215HVN01.1 panel unit. */
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
new file mode 100644
index 0000000000000..bc77dc4021f6c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
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
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this MI0700A2T-30 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this MI0700A2T-30 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this MI0700A2T-30 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
new file mode 100644
index 0000000000000..f7d06002dcd5c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
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
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+		};
+	};
+};
+
+&reg_backlight_pwm_level {
+	/* Always only output 3.3V on this MI1010Z1T-1CP11 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	/* Always only output 3.3V on this MI1010Z1T-1CP11 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
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
+
+	/* Always only output 3.3V on this MI1010Z1T-1CP11 panel unit. */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index cb28cf1cdd23f..67d4343a8b59f 100644
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

