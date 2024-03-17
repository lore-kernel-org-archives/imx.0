Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5511CA87
	for <imx@lists.linux.dev>; Sun, 17 Mar 2024 16:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710694136; cv=none; b=pEAPvtZUtjWrQ/kYy1KoUPziDkwnP8HSynb1EKbnjbMnjRs5DtK/BslityC5aG/YdrU+BHEkntLl6rR+V0edRInA6xvQ+jARu/3JBQd7SbhU6YsmO0NSN7QtnaSX3ptu8rPivyIt3W36Y3TJ9v8/sEUkY8dPHfWHcGjWLoHB7ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710694136; c=relaxed/simple;
	bh=arTo6+clTqlDmnzOYq4qQMZ5VjQfEODt0dbBe/7XEnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TQYYojif2bcLghZ1l+uCp9k8U2dbHZrzXA8zECzO0Aj4lTxfb+dyHPIkUHlgs6EgfbEQhDgannvQ7gDfdhOBSUKxp1/r/pG54LE5BaqD9+xER9MJ37x2LzOztITRonQs2d0ibcfHPABZYZfimg8cuq9QASG9p9cx3pP/bE+P+kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JxMgzQjv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JxMgzQjv"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1530B63C;
	Sun, 17 Mar 2024 17:48:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710694107;
	bh=arTo6+clTqlDmnzOYq4qQMZ5VjQfEODt0dbBe/7XEnQ=;
	h=From:To:Cc:Subject:Date:From;
	b=JxMgzQjvgSzW/4IpBdivssIVVXFxjkvNBiiucYuTFtJ/liIfUa15+N1uthMHqqsnZ
	 hJR6uqbwfZB+y0oQIuPQ/D1gMkJMVmM543XThx7NNZoxQR7cvVIHo9w/3nQU0T7whn
	 WJHPQF8D+QB/eMl2DUAn1kLe8zEV/sHf7zENgyr4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/5] Add DT bindings and device tree for Compulab SB-UCM-iMX8MPLUS
Date: Sun, 17 Mar 2024 18:48:45 +0200
Message-ID: <20240317164850.32708-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small patch series is a drive-by addition of the Compulab
SB-UCM-iMX8MPLUS to the Linux kernel device tree sources. While porting
the device tree from the Compulab BSP kernel to mainline, I thought I
could as well mainline it, along with related conversion of text DT
bindings to YAML.

The SB-UCM-iMX8MPLUS is a carrier board designed as a reference to
evaluate the Compulab UCM-iMX8MPLUS SoM. The SoM integrates the bare
minimal peripherals (DRAM, eMMC, ethernet PHY, EEPROM and RTC), while
the carrier board includes a much wider range of peripherals. I have
only enabled support for the ones I am interested in, or, as a strech
goal, the ones I could easily test.

The first patch in the series adds compatible strings for the SoM and
the board to the ARM FSL bindings. The next two patches then add DT
sources for the SoM and the carrier board.

I have split HDMI support out to patch 4/5, as it depends on patches
that have not hit linux-next yet (see [1]). Depending on which series
gets merged first, patch 4/5 can be left out for now.

Finally, patch 5/5 adds an overlay for the display panel shipped with
the Compulab evaluation kit.

The series is based on a branch that contains a backport of the HDMI
support series, as well miscellaneous patches I have submitted
separately to convert text DT bindings to YAML. You can find the series
applied on top of the base branch at [2]. With that base, the only DT
validation warnings are due to preexisting issues in imx8mp.dtsi.

[1] https://lore.kernel.org/all/20240227220444.77566-1-aford173@gmail.com/#t
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=nxp/v6.8/compulab

Laurent Pinchart (5):
  dt-bindings: arm: fsl: Add Compulab SB-UCM-iMX8MPLUS carrier board
  arm64: dts: freescale: Add device tree for Compulab UCM-iMX8M-Plus
  arm64: dts: freescale: Add device tree for Compulab SB-UCM-iMX8MPLUS
  arm64: dts: freescale: imx8mp-sb-ucm: Add HDMI output support
  arm64: dts: freescale: imx8mp-sb-ucm: Add DSI panel overlay

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 .../imx8mp-sb-ucm-panel-kd050hdfia020.dtso    |  81 +++++
 .../boot/dts/freescale/imx8mp-sb-ucm.dts      | 337 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-ucm.dtsi | 309 ++++++++++++++++
 5 files changed, 738 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm-panel-kd050hdfia020.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-sb-ucm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ucm.dtsi


base-commit: 64d8ca69f2f1e659c60ba509a2e91d2c8c0a3a4c
-- 
Regards,

Laurent Pinchart

