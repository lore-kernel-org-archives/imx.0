Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B1E24BC09
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407327; cv=none; b=Q3eYvUe0Wmu5wYEwwlvN3i0OK63ONo8OFsAybMhyJ4LOcQnVFGqYWlq1wVgWytmkdWtK8Gij9V0gM3idtZJ+uhIMiObiSMLYZNtZ2hfGfg4twXOloRbBNyemQJ0NQoNNeWybmb/UxRm5UaCM/f+LrSO8SmMJeEgRrwNnzwGRw5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407327; c=relaxed/simple;
	bh=vjSkzZMm6hnVsnL4OBKLlEPTJr3DRcmbUtmaNmTWP28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgX3sDRYT8rJJFh5oiIGEooiSxxf8eKcIec2uuErZNKc5plNmaEVTzZw4aKOFaFYMhC594w77yTDWFx5G60GQdO94bRcHlp/SyZ5qmpQC/mlTt1DBikatTk2u0KYGAAj60rJD0r/TLeeUlKqRCBUhuvFDmxQsgKr/ZYCk+EcTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=HXcWeboP; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XdPt6QjP reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="HXcWeboP";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XdPt6QjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740407324; x=1771943324;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f163cXOml+YO0Ef+W322W1dfG/8cGPnD5lNX0O+cQgg=;
  b=HXcWeboPr9BMaDdvg9pHFJC+suD2BBFjt/vulWRgMr+pBk9YVaV1s24z
   nWzDtOg/A1v1aMH82WRghFRqEVklMb63w1x7noAmC7Ge0skEQbG0A0W/K
   6ouMkQawGu83o4NnLTJamB2XrtpeTYxJjLql8Sb9bmiXnpOuuYkPo+Q4+
   DG10rthCspS+9ROM+DwIimYPbCXF1Wc55KogbJp7AN5vl0H4Gdr4kYPPX
   OHr72IZSEZ+Fu3cmg74TOeyYZ/BG8khT1l+jk8P0zZmVYy2JDiXGStrB3
   5l66tGf131I17VsXb5SN1nI5IQb+uBeoyOx+BeVrfjtZ4uin6cgJf5GlE
   g==;
X-CSE-ConnectionGUID: Fl10DxnJTpqdmIPt8ZJkOw==
X-CSE-MsgGUID: FIP9+gYZSO6RU2rvvRug9g==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42042100"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 15:28:41 +0100
X-CheckPoint: {67BC8219-2F-B8541F8F-E50F9B0E}
X-MAIL-CPID: D7FE984E3EAE872F6989C03514BDF7EE_2
X-Control-Analysis: str=0001.0A002105.67BC8218.003B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B250E163EB7;
	Mon, 24 Feb 2025 15:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740407316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f163cXOml+YO0Ef+W322W1dfG/8cGPnD5lNX0O+cQgg=;
	b=XdPt6QjPC5bfyE59bCT3j/2fQcyS7YcghvcH3qz46Y39oEwWIPfuPnAg0oUMFP07l0ZF73
	1etv9Ca05+DeOmYO/RLc86RCj+sfx1UaQEmDOSxmo8WojwfdHhLTWfy6Ar/yaXYfZBRyZ0
	eFblQEocm9yKIYZkwHDlXpANU05KnWRqDzI1K7q8Wzf1CEzy29Eh7dI6HcbcSdVJb/YtvK
	BShermGzljlCOIFRJ30Pvt6BeVls99HmGLh5klohZciR3mkzI+6q8MRBrIFkAd/PdQ/shn
	0Zp0GE78xGZ5MPH7QoyhwZuDzw0SESyNIjWeE2H/YnW9pC5yEik6HyaKjVaH+g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/6] TQMa93xx on MBa93xxLA/CA LVDS support
Date: Mon, 24 Feb 2025 15:28:21 +0100
Message-ID: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

after a long time (v1 at [1]) this is v2 for the LVDS support on TQMa93xx
module series.

It consists of three parts:
1. New PLL configuration for 477.4 MHz
2. LVDS support for imx93
3. LVDS platform support for tqma9352-mba93xxla & tqma9352-mba93xxca

Patch 1 adds a video PLL configuration for 477.4MHz
Patch 2 is the imx93 equivalent of commit 1cb0c87d27dc ("dt-bindings:
  soc: imx8mp-media-blk-ctrl: Add LDB subnode into schema and example")
Patch 3 is the imx93 equivalent of commit 9cb6d1b39a8f ("soc: imx:
  imx8m-blk-ctrl: Scan subnodes and bind drivers to them")
Patch 4 is the imx93 equivalent of commit 94e6197dadc9 ("arm64: dts:
  imx8mp: Add LCDIF2 & LDB nodes")
Patch 5 adds LVDS DT overlay for tqma9352-mba93xxla platform
Patch 6 adds LVDS DT overlay for tqma9352-mba93xxca platform

Changes in v2:
* Rebased to next-20250221
* Reordered patches
* Added 'ranges' to bindings
* Use subnode constraint styles as suggested by Rob Herring
* Use IMX93_CLK_SYS_PLL_PFD0 as parent for IMX93_CLK_MEDIA_AXI
* Use 333MHz for IMX93_CLK_MEDIA_AXI
* Do not set board compatible in orverlays
* Add MBa93xxCA platform as well

I skipped the support for dynamic PLL configuration for now. This is a
separate task, see [2].

Best regards,
Alexander
    
[1] https://lore.kernel.org/all/20231020130019.665853-1-alexander.stein@ew.tq-group.com/
[2] https://lore.kernel.org/all/20250210160012.783446-1-alexander.stein@ew.tq-group.com/

Alexander Stein (6):
  clk: imx: clk-fracn-gppll: Add 477.4MHz config for video pll
  dt-bindings: soc: imx93-media-blk-ctrl: Add LDB subnode into schema
    and example
  soc: imx: imx93-blk-ctrl: Scan subnodes and bind drivers to them
  arm64: dts: imx93: Add LCDIF & LDB nodes
  arm64: dts: tqma9352-mba93xxla: Add LVDS overlay
  arm64: dts: tqma9352-mba93xxca: Add LVDS overlay

 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 51 ++++++++++++
 arch/arm64/boot/dts/freescale/Makefile        |  5 ++
 ...3-tqma9352-mba93xxca-lvds-tm070jvhg33.dtso | 40 ++++++++++
 .../freescale/imx93-tqma9352-mba93xxca.dts    | 27 +++++++
 ...3-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso | 40 ++++++++++
 .../freescale/imx93-tqma9352-mba93xxla.dts    | 27 +++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi      | 77 +++++++++++++++++++
 drivers/clk/imx/clk-fracn-gppll.c             |  1 +
 drivers/pmdomain/imx/imx93-blk-ctrl.c         |  7 ++
 9 files changed, 275 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso

-- 
2.43.0

