Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E818A3A16A0
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728749; cv=none; b=kWT3dH67tME/ez/0BVi7cHUWNZp7t6ewW2njUdhSEPbNa+vfM7NcEYI0Dob6unqrL1+NlMtxkTGeBwXi71Gmtumr36O6ZdN2LaFmJS0ZTn0GESTMza3aSSCQJsUoG3aEk3zeLZDlSz1dGObUC+d3rSKBErjthCFRsaCj8kM5l+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728749; c=relaxed/simple;
	bh=//CQjfR7zPjIRqWoqZkMJSRVoIGnxDnkGxdvD5fCEQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QWxcdgzRVCdZ9nM8SDEUjTZwUjZOxtKEf3KaWqoRVIGLaCJ690fDzm0P3qdiUvyW3v6ml59infvvUsn/EwEE/BUgQxacPPzQGM3rm1BnjPFC9YAKKujp9B+0E+xjDt2Wyzgt3ae50cFeSSIjIGJq+zWrEngShKKdpTRHGVTG9sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=sNlBByWS; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="sNlBByWS"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id B46C51FBD0;
	Thu,  9 Apr 2026 11:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728746;
	bh=A2mqKUW1SyP566v1hAOfRogvg2iqOsrakCIZpNHok8Y=; h=From:To:Subject;
	b=sNlBByWS54nX5Q5f6PTY1jIzEHK5tYu9uG84nhF5FbF3e+RiJsGbDP/AIGlv8Al5D
	 AIJpyrba6/exz4KLjVu9S2VRpa4DKdmFB5yVNlfVKe8hnSs9oXRIzpihBSa4QLwMHd
	 6G4ABbfO2fY2obiD9jjHkFXGZ8+Gi8U4VbxWl5+AZ1YtvvufH8PgRdGcfwtEBmBygC
	 1dgwwNev+5N3sB/rPDfdMYx+GnJexMESOQY4B3YGgpTFpzy3MgaZMoPhhHbf4Q0UB1
	 Q+G6RAAi9iNp3OaOt8b9hODHS3GPLWeRzzGGyMkE5iVb4fEVpsrdajr2fnrG6jgMNC
	 D1oZlU4/8PzKQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/7] Add verdin imx8m[mp] and imx95 zinnia board
Date: Thu,  9 Apr 2026 11:58:46 +0200
Message-ID: <20260409095855.61252-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Zinnia Carrier Board mated with Verdin iMX8M Plus, Verdin iMX8M Mini and
Verdin iMX95.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
2 x 1GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Some small fixes and cleanup are done on the SOM dtsi file, in preparation
for the Zinnia addition.

Shawn, Frank: bindings/arm/fsl.yaml still list Shawn as maintainer, maybe
confirm that this is wanted.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board

Francesco Dolcini (7):
  dt-bindings: arm: fsl: Add verdin imx8m[mp] and imx95 zinnia board
  arm64: dts: freescale: imx8mm-verdin: Split UART_2 pinctrl group
  arm64: dts: freescale: imx8mm-verdin: Add Zinnia
  arm64: dts: freescale: imx8mp-verdin: Split UART_2 pinctrl group
  arm64: dts: freescale: imx8mp-verdin: Add Zinnia
  arm64: dts: freescale: imx95-verdin: Split UART_2 pinctrl group
  arm64: dts: freescale: imx95-verdin: Add Zinnia

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   6 +
 .../imx8mm-verdin-nonwifi-zinnia.dts          |  21 +
 .../freescale/imx8mm-verdin-wifi-zinnia.dts   |  21 +
 .../dts/freescale/imx8mm-verdin-zinnia.dtsi   | 383 ++++++++++++++++
 .../boot/dts/freescale/imx8mm-verdin.dtsi     |  16 +-
 .../imx8mp-verdin-nonwifi-zinnia.dts          |  21 +
 .../freescale/imx8mp-verdin-wifi-zinnia.dts   |  21 +
 .../dts/freescale/imx8mp-verdin-zinnia.dtsi   | 422 +++++++++++++++++
 .../boot/dts/freescale/imx8mp-verdin.dtsi     |  14 +-
 .../freescale/imx95-verdin-nonwifi-zinnia.dts |  21 +
 .../freescale/imx95-verdin-wifi-zinnia.dts    |  21 +
 .../dts/freescale/imx95-verdin-zinnia.dtsi    | 429 ++++++++++++++++++
 .../boot/dts/freescale/imx95-verdin.dtsi      |  18 +-
 14 files changed, 1408 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-zinnia.dtsi

-- 
2.47.3

