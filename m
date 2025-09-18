Received: from finn.localdomain (finn.gateworks.com [108.161.129.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9821171B;
	Thu, 18 Sep 2025 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=108.161.129.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210306; cv=none; b=jVXT9rFgQB4JM8tzG1+m80qAjinu+dndsBY6Z19rrpr5hPDKYsy1A23cKRe6TYwzkJKa50/JdjBiV9m8bkzut0+Ir61Ciggp5keLJNFx/9JhXGTwj9zr0BU0GX1ypINFckJgNon/PBfgWXWYP+kieJP8E0Bfg5I/3mxvkmt3ktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210306; c=relaxed/simple;
	bh=RUmv7s1jitvc1BSZi/7LjTeH/MS5Ezj+kTTcCo4TgR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lkCcw8sIsTFdfVh4pdTq9fj9SRRdkYHnI0vvOkhifdXqv2IghriHpPh1dtOEgdA3X82sMSgcqajX/FN6rdzjC3p/1kUApGNvMSXBMl5G4b+3PvaXp+5cteEKfokR5wmBB+mFNEKF4L8ICtQzaC3C+ijQKxYzBhilqR1KiCyAY8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; arc=none smtp.client-ip=108.161.129.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Received: from syn-068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
	by finn.localdomain with esmtp (Exim 4.95)
	(envelope-from <tharvey@gateworks.com>)
	id 1uzGoX-00B1eF-8d;
	Thu, 18 Sep 2025 15:44:53 +0000
From: Tim Harvey <tharvey@gateworks.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tim Harvey <tharvey@gateworks.com>
Subject: [PATCH v2 0/7] various imx8m*-venice dt fixes
Date: Thu, 18 Sep 2025 08:44:44 -0700
Message-Id: <20250918154451.2531802-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series contains various imx8m*-venice board dt fixes.

v2:
 - add additional info to commit explaining changing TXC slew rate for
   improved signal quality and emiisions (Peng)
 - add tags

Tim Harvey (7):
  arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate
    usdhc1 props
  arm64: dts: imx8m{m,n,p}-venice: disable unused clk output for TI PHY
  arm64: dts: imx8mp-venice-gw702x: reduce RGMII CLK drive strength
  arm64: dts: imx8mm-venice-gw700x: reduce RGMII CLK drive strength
  arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
  arm64: dts: imx8mp-venice-gw702x: remove off-board uart
  arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1

 .../dts/freescale/imx8mm-venice-gw700x.dtsi   |  3 +-
 .../dts/freescale/imx8mm-venice-gw72xx.dtsi   | 11 ----
 .../dts/freescale/imx8mm-venice-gw7902.dts    |  1 +
 .../dts/freescale/imx8mn-venice-gw7902.dts    |  1 +
 .../dts/freescale/imx8mp-venice-gw702x.dtsi   | 54 +------------------
 .../dts/freescale/imx8mp-venice-gw72xx.dtsi   | 11 ----
 .../dts/freescale/imx8mp-venice-gw74xx.dts    |  1 +
 7 files changed, 7 insertions(+), 75 deletions(-)

-- 
2.25.1

