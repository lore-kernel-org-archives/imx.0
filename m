Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FB15663
	for <imx@lists.linux.dev>; Mon, 27 Nov 2023 05:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1r7UGM-0001yZ-SE; Mon, 27 Nov 2023 06:34:30 +0100
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1r7UGL-00Bs5f-Gv; Mon, 27 Nov 2023 06:34:29 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1r7UGL-009ETK-1O;
	Mon, 27 Nov 2023 06:34:29 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: kernel@pengutronix.de,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH] MAINTAINERS: reinstate freescale ARM64 DT directory in i.MX entry
Date: Mon, 27 Nov 2023 06:34:14 +0100
Message-Id: <20231127053414.2200563-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The MAINTAINERS entry's F: currently only matches the 32-bit device trees,
as commit 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
inadvertently dropped the 64-bit DT match when it added the 32 bit
matches. The entry has a N: imx, which reduced the impact a bit, but
still some board device trees may not contain the substring and would
thus not be covered by the entry.

Reinstate the missing F: line to restore previous behavior.

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: imx@lists.linux.dev
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea790149af79..8e9fc7f3e66b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2155,6 +2155,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
 F:	arch/arm/boot/dts/nxp/imx/
 F:	arch/arm/boot/dts/nxp/mxs/
+F:	arch/arm64/boot/dts/freescale/
 X:	arch/arm64/boot/dts/freescale/fsl-*
 X:	arch/arm64/boot/dts/freescale/qoriq-*
 X:	drivers/media/i2c/
-- 
2.39.2

