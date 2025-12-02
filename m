Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336EE313264
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764682399; cv=none; b=EOSOtfoUoS6Z342bRurEwZO+HbkRI5Pl8OPjIQl69uPy2YQZc6RXXa6RzLRPqS0jfzA+e/jeKsSrcTacAt+equJKqkYoRS62MJnRAkEZu2gZgP84nDMQNthBTFcRKgkfGow7HvkaMFGxzGJMefMv/2RyNAId+CbhzQpJrDhT2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764682399; c=relaxed/simple;
	bh=Lsfz8Gt4mUG3kvnFYe36Xl318XcwkcWJqa/gE3aPXhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JXpjOKVFAI8AinX6XUS7MOpTHW8LNQ3ZNgOMQUk//z7WaOaHASYFU9ZOZKYQlL87Y3IixF3/P7zatRTrTI1fnaYXQhLuUiNJttIB1Xwh3dr226Gmgu9v2i/cvE37mLYdILbIXLpQgo7runTGxpw9XuQ5qapL/hY0QC8L88LTZvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vQQVD-0005Gc-9D; Tue, 02 Dec 2025 14:33:11 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v7 0/3] Add i.MX91/93 parallel display support
Date: Tue, 02 Dec 2025 14:32:57 +0100
Message-Id: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInqLmkC/5WNQQ6DIBBFr2JYdxrAgrWr3qNxgTjqJFQIWKMx3
 r3UG3T5fn7e21nCSJjYo9hZxIUS+SlDdSmYHc00IFCXmUkulZBcwKJB3GH2gSzQe61LCCYa59B
 BRyk4s0Gt+lqWt7bX1rIsChF7Ws/Iq8k8Upp93M7mon/rX/p84VC1XGkUqFqBz4DT8Jmjn2i9d
 sia4zi+FtEyotkAAAA=
X-Change-ID: 20251201-v6-18-topic-imx93-parallel-display-95f9234bf6cc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

this patchset adds the driver, dt-bindings and dt integration required
to drive a parallel display on the i.MX93.

Since the i.MX91 register layout equals the one from the i.MX93, I added
the support for both but tested only the i.MX93 use-case.

This patchset depends on:
 - https://lore.kernel.org/all/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de/

@Conor Dooley
I dropped your r-b tag since I added the 'bus-width' property.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes in v7:
- Link to v6: https://lore.kernel.org/r/20251201-v6-18-topic-imx93-parallel-display-v6-0-7b056e1e5b1e@pengutronix.de
- Add missing bits.h and bitfield.h headers (lkp)

Changes in v6:
- Link to v5: https://lore.kernel.org/all/20250304082434.834031-1-victor.liu@nxp.com/
- Add bus-width support
- rebase onto v6.18-rc1
- add review feedback (Alexander)
- driver license "GPL v2" -> "GPL" (checkpatch)
- make use of reg of-property
- fix to short Kconfig description (checkpath)
- add OF integration

---
Liu Ying (2):
      dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC subnode to schema and example
      drm/bridge: imx: Add i.MX93 parallel display format configuration support

Marco Felsch (1):
      arm64: dts: imx93: Add parallel display output nodes

 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  92 +++++++++
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  57 ++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  12 ++
 drivers/gpu/drm/bridge/imx/Kconfig                 |  11 +
 drivers/gpu/drm/bridge/imx/Makefile                |   1 +
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c            | 227 +++++++++++++++++++++
 6 files changed, 400 insertions(+)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251201-v6-18-topic-imx93-parallel-display-95f9234bf6cc

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

