Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6FA3559D3
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071337; cv=pass; b=ajzRMsp/Qpo5NZqCHecxMxecTL1apMBFU1YkLZC7+jx+a7gKdgIPBruQD26fLdTV0NGiuXwz/Gj0EVCmeVZ2JYh/CGlvK0ZWIavevYMcDJMYKySKlbkA32hks5QZk/40ARrCktL5AtLX0hWngtXxfsXVRKe9nsdNKttsWEg1Qes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071337; c=relaxed/simple;
	bh=XQ46J/0Q/s1txq+6yOGv2tGq9CYnPBG5axSq5J5swGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZJKHnV/hp7nFj3rl4kV/85Pyl81URbarRtqRo2CMzdC9uE3OF8CJaXcu0O+++zUhd1GZ5pcwa32wEvJ0Wb/TDsdx/tIC44bGO/c0ErSms1Z3PCHTH4xRptsyBnWj+FXVLvboqjFCXs2iTigRNQkuYO71SKr56h9c7p6GSLs5HlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AS3fsJHl; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AS3fsJHl"
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071288;
 b=WXfrKlHO2Burs3CuVBIaXeAJL3s0DZMKvK/TjcgQvqMNX4pWYFcQuI/nJtAXUPghVSFjRKsK
 3yR6QQBLhkNSH2Qe/1/7Je60vumDIOchYytg6Cil1xCE7Z7Fqg7ncLe9C3w2AVSMDvjFPhlwof+
 kFo8jAirWadUb0oyqaHRC5ImAqgXW4pyAtOqfqzXxyJZ9LwLMrx2ZYL/qtqFHZgUDLjeb4tq+pQ
 V0+xMRrqdSrCVqhxterssdX2g6d99axgXGIE96AZDKIkjde4HMfCoxhHmm9P2QjrT0uz85vFRkg
 ifofUt4ACofncx/hH7A5Fx5BYOdcaSkBpkVMXoFwwdn8Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071288;
 b=sLqNEM2No/DHDVOSRyal/+HnlAwE8sidE/c5UcPaMmSV3aEJK0ceBwpPxH2TaTO74SvZOi51
 ZHQnOKeR7neQrK8Q3hcO9OSXNSUZ3dZTXUsWPseOdkwZYObUnTbpm/tkDqFr1xUAuzIhFQIDZoO
 7z8nnNGE3axKT73UxouM0Syv6ItIPqJT8EBuWILV9FfvHQ+GsdZGn27S/FIjdTNyR3F+U++nERL
 HDEOwTnlThFVboMo6mLak5W9jQmerRyyPVQ9pQ5hEB57td50pOf+YYz+f5o/KFwOboYmPhsnw8e
 2MwSPlKXwAzs34z6aklc4gE+7u8rPS9Xp7BWRjLeR+EKg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 18 Dec 2025 16:21:28 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 16D9ACC0D31;
	Thu, 18 Dec 2025 16:21:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/6] Support TQMa8QM
Date: Thu, 18 Dec 2025 16:20:47 +0100
Message-ID: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4dXDrx4SHSz4F929
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:836eb70413c5acce62e457440dd9da8d
X-cloud-security:scantime:4.420
DKIM-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071287; v=1;
 b=AS3fsJHlncnl/kwptZewvlajDGMz+QhC2IZRhIEr7H6jKF9t4a5Hz0ubydlJtzSRMAJIqJn3
 1DIBjBw98Ugu58vMEfn06ICOrdEk1DZy51EXEraEOoVOtNbXIq58Q9LXkPVWrmbrOGnBcyJRM4K
 b5VpPlAi7tC26KUb73a3BL5Z/AAEgT1MDBIbdhXI/vePr3+NmofRDMqawzYzg3qwwViANLTocvY
 YzswGqDwdc7P9ndd39IxcbkIoSSPrIbw6naOso9Ld29ZmD4Zk+3l0k1hPdqB9iKROBntAbFbUXh
 FPUv+nIcpEi86aGSsNYQkSAJaeyZbbV4lAm3aC0aMQXFA==

Hi,

this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
property on the parent clock.

2. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

3. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

4 & 5. Device bindings and platform DT

6. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (6):
  dt-bindings: clk: rs9: add clock-output-names property
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: Add TQ imx8qm based board
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../bindings/clock/renesas,9series.yaml       |  37 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |  11 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 869 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 322 +++++++
 7 files changed, 1253 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0

