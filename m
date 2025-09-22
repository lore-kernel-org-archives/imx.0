Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAADF302CBA
	for <imx@lists.linux.dev>; Mon, 22 Sep 2025 11:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758539489; cv=none; b=PmVHxXnhmrtKX0C3c8ojkpnnZPsL/s3/Wfacx6JaTCCsY+4vQhOi6nxJ3/0U+1fo3z+kdJPd1+9lO7QEcnmE8jw9EL0JU2f1as3NcrH2jwY4zgNySwJFM2dUKGhiyaj1/XsKI6t9MJCZvq/FtqCdLYETwvFWQu2p9t4YXCJN4m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758539489; c=relaxed/simple;
	bh=7QFjO8uzNm9hY4U+sWRX9qDV5/YD4htnFLFO4rr5rZA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l/eQPB/+2e2LSQkj5+cLsn+WoZKFtCMahecaCAVvFcC2xyeHne0/LHN9PgLBq5IM3YSATwaRkd7XwilWACg5H59DG4+z1Xy7B+G/cAi/DOdYYQEAZx1orAVQdLSmgMZItfH1NJnSi+TNyUJGGnI2ScQLr5xbFv64uQwR4ylWBB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1v0eRk-0002HM-ET; Mon, 22 Sep 2025 13:11:04 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v2 0/5] arm64: dts: imx8mp-skov: add new 10" variant
Date: Mon, 22 Sep 2025 13:10:51 +0200
Message-Id: <20250922-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v2-0-abbb759cf8ef@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALsu0WgC/52NQQ6DIBBFr2JYdxogWrUr79G4sDLotBEIILEx3
 r3UI3T18/7ivZ0F9ISB3YudeUwUyJoM8lKwcR7MhEAqM5NcVryRAtINRA3ROhqBlq1ZHIS3TaB
 igNca7TrOIDiZPC3qVg9DXVWiZFnoPGraztijzzxTiNZ/znYSv/evTBLA4Vm2EnXDayVk59BMa
 /TW0HZVyPrjOL4D5acR6QAAAA==
X-Change-ID: 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-9ef9faa75514
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 10" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v2:
- add wider compat "eeti,exc80h84" after "eeti,exc81w32" to pass CHECK_DTB 
- add Acked-by and Reviewed-By
- Link to v1: https://lore.kernel.org/r/20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de

---
Steffen Trumtrar (5):
      dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
      dt-bindings: display: simple: Add JuTouch JT101TM023 panel
      drm/panel: simple: add JuTouch JT101TM023
      dt-bindings: arm: fsl: add compatible for Skov i.MX8MP variant
      arm64: dts: imx8mp-skov: support new 10" panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 .../bindings/display/panel/panel-simple.yaml       |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../imx8mp-skov-revc-jutouch-jt101tm023.dts        | 79 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++
 6 files changed, 120 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-9ef9faa75514

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

