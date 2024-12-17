Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C1A1F5426
	for <imx@lists.linux.dev>; Tue, 17 Dec 2024 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446274; cv=none; b=e2A7RbNK17/QBke2hDm8XVczyKq3LW05W1gsePNu9KKauiBgzSy+BrBo4ocL1dXoisEKSHWiWaIg41PcrBIrRrA/6ZU0fcRA4uZj440y7OaJqYAmyInjop37tpHKHDtko/YYln2Ju/KTTrgxNLj2sin9ZH89XRpcnvt8OTmAL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446274; c=relaxed/simple;
	bh=uqsbZet3jjyzWXtNmIO9OuuOe2QEQ4lIaSY05B1rLLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p6yS4u3VC3f29PBpJEmHtJQt6Yl826cB0+Ua9N7Ik2Fk2xaJ7pEzERDw6ph4dwdyanKWLTSiiFYz3MkJ5yyEjScQEMYwUU9ZZtejkTaI+tvBNFLGdBZRttQNpZy+uaREaVbhvjN3wLTlK/Sjh3ZOLoPXQ4ahetZoySb2oge7wMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:43e0:bbcf:34a4:f7a0])
	by albert.telenet-ops.be with cmsmtp
	id pqdh2D00R53u7h606qdhJB; Tue, 17 Dec 2024 15:37:44 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tNYhd-001XtD-VX;
	Tue, 17 Dec 2024 15:37:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tNYhh-00CHWN-Ao;
	Tue, 17 Dec 2024 15:37:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
Date: Tue, 17 Dec 2024 15:37:40 +0100
Message-Id: <28f88e536cab0abd5712787350b012bb0f1eacb5.1734445715.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX System Controller Management Interface firmware is only present
on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
asking the user about this driver when configuring a kernel without
Freescale i.MX platform support.

Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/imx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
index 907cd149c40a8b5f..c964f4924359fcd3 100644
--- a/drivers/firmware/imx/Kconfig
+++ b/drivers/firmware/imx/Kconfig
@@ -25,6 +25,7 @@ config IMX_SCU
 
 config IMX_SCMI_MISC_DRV
 	tristate "IMX SCMI MISC Protocol driver"
+	depends on ARCH_MXC || COMPILE_TEST
 	default y if ARCH_MXC
 	help
 	  The System Controller Management Interface firmware (SCMI FW) is
-- 
2.34.1

