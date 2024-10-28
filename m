Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445C1922E8
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730103826; cv=none; b=Dwz9+w55HPBYJXD+0rE/X5j8KQLYKjCqxCDBu34xTQpnVJacHvva9AefvgUaGJOGoIOIkOvt6GaroC7EuB2Z7m0nvGAPBxfWX4GvybYVn6pCN8fkLnmBwAunI9CSe2ow14l51DVEUWx0baF6I1BynpBlfM1LjBMYUcHMGVMTia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730103826; c=relaxed/simple;
	bh=dD16BpGslc6XzAfGiaWKbPDUDenrHTt0OeyLntwpC18=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IouVcw8I3iu30JgSFKoqsQPWKIrUNGyGTctASKAWUfo8XX/dLTHivKuUwfy2UNYLccworhlCnUmLXWj9t4tRNlmVNXn1NXMMm7Rqii/0qAU3KZWol/hMrw+6REDfc1cIJhb9A1mq8eE8HWrG2Ie+oIR3ktAAgctKl4zMw40KV+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QYmutohY; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QYmutohY"
Received: from localhost.localdomain (89-186-114-4.pool.digikabel.hu [89.186.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BC5DA89072;
	Mon, 28 Oct 2024 09:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730103822;
	bh=N/ol6w5U/I3G5mumyd4ObEEvPxJoNR/D0sNXHyEsWpQ=;
	h=From:To:Cc:Subject:Date:From;
	b=QYmutohYKTpVo1JAIkpzTf+8DQAxG7ddtJ920JYMXW0bumFsCnBkzF3IF4i/mWXNU
	 D3sgM88cFhyWWsuuDN736mVptDHYrYUx8oQZDA5mEE6q7t50Wim85e5BcCalzY/qsV
	 tOwlaT7FUHjM1pE5QAbUk+Zi4Geqzt755TugNq6dlyZQvizboyf7HwplQcxjESXnRi
	 D7BJJREuw1TEzEJDFSExN2DegJID6gQyyQROW6Q3J0KlK96YWKXYsxcqjf86VGkCeh
	 wZgfL1VfJmAPwG0GhFw4AlF18eGryYINyJ2pq+MwU9Wsw2hC1DfJD8RpJxvn6AN6X6
	 mmoqZ8OBrrZRA==
From: Heiko Schocher <hs@denx.de>
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/2] arm64: dts: imx8mp: add support for the ABB SoM and carrier
Date: Mon, 28 Oct 2024 09:23:30 +0100
Message-Id: <20241028082332.21672-1-hs@denx.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The board uses a ABB specific SoM from ADLink, based on NXP
i.MX8MP SoC. The SoM is used on 3 different carrier boards,
with small differences, which are all catched up in
devicetree overlays. The kernel image, the basic dtb
and all dtbos are collected in a fitimage. As bootloader
is used U-Boot which detects in his SPL stage the carrier
board by probing some i2c devices. When the correct
carrier is probed, the SPL applies all needed dtbos to
the dtb with which U-Boot gets loaded. Same principle
later before linux image boot, U-Boot applies the dtbos
needed for the carrier board before booting Linux.

So intentionally, there are no full dtb images for all
carrier combinations, only dtbos which applied as needed
on boottime.

Patches to U-Boot mailinglist not posted yet, as U-Boot
uses the same dtb as linux, so hope to get the linux
files first in, and use them when posting U-Boot board
support.

series is based on:
819837584309 - (tag: v6.12-rc5, origin/master, origin/HEAD) Linux 6.12-rc5



Heiko Schocher (2):
  dt-bindings: arm: fsl: Add ABB SoM and carrier
  arm64: dts: imx8mp: add aristainetos3 board support

 .../devicetree/bindings/arm/fsl.yaml          |    2 +
 arch/arm64/boot/dts/freescale/Makefile        |    5 +
 .../imx8mp-aristainetos3-adpismarc.dtsi       |   64 +
 .../imx8mp-aristainetos3-adpismarc.dtso       |   14 +
 .../imx8mp-aristainetos3-helios-lvds.dtsi     |   89 ++
 .../imx8mp-aristainetos3-helios-lvds.dtso     |   13 +
 .../imx8mp-aristainetos3-helios.dtsi          |  103 ++
 .../imx8mp-aristainetos3-helios.dtso          |   13 +
 .../imx8mp-aristainetos3-proton2s.dtsi        |  176 +++
 .../imx8mp-aristainetos3-proton2s.dtso        |   13 +
 .../imx8mp-aristainetos3a-som-v1.dts          |   18 +
 .../imx8mp-aristainetos3a-som-v1.dtsi         | 1210 +++++++++++++++++
 12 files changed, 1720 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi

-- 
2.20.1

