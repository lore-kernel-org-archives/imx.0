Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5818A3CF684
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 11:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438355; cv=none; b=JZIWqeWk7xrwWVpvlxLMF3ipZko3v762tD1S2yGgSpEg6gKOIj57xMNuyxAlMuHlOa3cxOMI6CrZSn001HgRIPt1aRXMeUJFK8zHS32isS8DBA/V9Ho+sz7lqEb9Zrc2byh3AcfmAm47vGIIkvXrzMjOnbjelGctdN0+0mg+hes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438355; c=relaxed/simple;
	bh=+XXErtBT9l3jHXKMI9B/GasEuynDnr70FevXlmMygbY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QH1qH1WJ2YMeKaKfad7Nr3kRavUL1NCFEf1+DY9ztgBExlyIpNKteWLJ1QAfF4vBl0iYV89F4I8R1Z5xIsUTIO5eCAY8r4Pr3mUO969lhZeYxhAYrsnDXUqQPZUxxVfK6vWrFcMS2r29+UZ3RMrkt5gzWHqHXyqzVqVD4ucOrs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1w5MT7-0005WU-3u; Wed, 25 Mar 2026 12:32:13 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/4] arm64: dts: imx8mp-skov: add new 7" variant
Date: Wed, 25 Mar 2026 12:31:58 +0100
Message-Id: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7Hw2kC/yXNyw7CIBCF4VdpZu0kCNaqr2JclIt2agqEAdKk6
 buLujnJt/nPBuwSOYZbt0FylZiCbzgeOjDT6F8OyTaDFPIslOyxDigwh0gGaVkvS0R+h4o2M84
 lh2ImHMi3VVYbferFqK4GWi4m96T1d3V//M1Fz87kbx/2/QPSDRtvjAAAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Steffen Trumtrar (4):
      dt-bindings: display: simple: Add JuTouch JT070TM041 panel
      drm/panel: simple: add JuTouch JT070TM041
      dt-bindings: arm: fsl: add compatible for new Skov I.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 .../bindings/display/panel/panel-simple.yaml       |  2 +
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 32 +++++++++
 5 files changed, 115 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

