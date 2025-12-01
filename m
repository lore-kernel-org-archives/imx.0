Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5B2337699
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609139; cv=none; b=R38byx5B3i4HuyIKtTQOgPnMWKfq3LU2S89VMkC0dPUrdQSH3KfzgDF/kRhxY4s9hkvg1x4Wor2GL5R89IMmiuI/FZO3otgIqzHgjmcBYj4A2k/4GLdmOaZyPexSHSGbXckvGJKVX05xakvwi+MpcdGKluoZmRMtaf9eSHKVQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609139; c=relaxed/simple;
	bh=e8qpdiCrIoL30n3IAsDaOKDW8BKByqih+SzRyU9v5kw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=faKglG5xAeqlYAZNX4NNmib+apTod5ling+R3gpYayh6gujtSM/GvT4VfNjyy13dKK21gr0h62HYXrY7VMhnoizZ3f5N+njUu7g72K8x8wDdcyif/UkT0+Pc1QDoAHYXbd6+AUWIQmazwU2qhJ8nHFWYdipbiDn9fylLUwZbvK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vQ7RX-0002dz-AR; Mon, 01 Dec 2025 18:12:07 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/3] i.MX91/93 BLK-CTRL improvements
Date: Mon, 01 Dec 2025 18:12:04 +0100
Message-Id: <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTMLWkC/x3MQQqDMBBA0avIrB3IjLa1XkVcaDK2Q62GREQI3
 t3g8i3+TxAlqERoiwRBdo26LhlUFmC/w/IRVJcNbPhBbAj3J1KD2+rVov6Pd4Xj/LNbmLGqidl
 ML9PUDnLvg0x63O+uP88LNDKcwWsAAAA=
X-Change-ID: 20251201-v6-18-topic-imx93-blkctrl-341220f7084d
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

there were several approaches to bring the sub-devices population
mainline [1,2] but non of them made it upstream. Both approaches were
part of either the i.MX93 LVDS or MIPI-CSI enablement.

This small patchset decouples the blk-ctrl changes which allows the
MIPI-CSI and LVDS patchstack to be rebased ontop of this patchset.

Before adding the sub-device supprt, I converted the driver to devm_*
only API.

Regards,
  Marco

[1] https://lore.kernel.org/all/20250701-95_cam-v1-3-c5172bab387b@nxp.com/
[2] https://lore.kernel.org/all/20250304154929.1785200-4-alexander.stein@ew.tq-group.com/

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (3):
      pmdomain: imx93-blk-ctrl: cleanup error path
      pmdomain: imx93-blk-ctrl: convert to devm_* only
      pmdomain: imx93-blk-ctrl: add support for optional subnodes

 drivers/pmdomain/imx/imx93-blk-ctrl.c | 75 ++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 41 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251201-v6-18-topic-imx93-blkctrl-341220f7084d

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

