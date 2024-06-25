Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9747914B965
	for <imx@lists.linux.dev>; Tue, 25 Jun 2024 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719316679; cv=none; b=gQ7lfbF9XY55kdYRj6e1H0X7qmvrsZ6XoHVophzz1uH6OsQXu5un1FWtX0H6W9RZOGkRSprU/RgqGlNhVwnoChD67+ocUy/4YcSiTSzdirrezMZALC7I6XYFGUF9hoVAQgCZ+ZaMLJ3nK2grI9jcoXriBOh81UXqWYdTorTDAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719316679; c=relaxed/simple;
	bh=qefgQ2G5ufqpvQJb6grWZ8/56m9FStxqeu0exVtC6FY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fbmDCgZL803VK5/aID12YAfJyxVKr13L5eTa+en3+gZhVtyt4PSq1QNAXx3roiarkioQLirIo4QV+iwb56EqLmKxIkw8UHOTU3MAeKktNuaKjsnIFZ+2+TYtLrKsnavfePvQCzhUcX38ZQr1gYgyjJegVRWL6FegX/ZC2f9OZy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:4e71:737f:f905:c457])
	by michel.telenet-ops.be with bizsmtp
	id fnxq2C0045EKelT06nxqGJ; Tue, 25 Jun 2024 13:57:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sM4ny-000Ln0-I8;
	Tue, 25 Jun 2024 13:57:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sM4o1-00AR1V-T1;
	Tue, 25 Jun 2024 13:57:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] reset: RESET_IMX8MP_AUDIOMIX should depend on ARCH_MXC
Date: Tue, 25 Jun 2024 13:57:48 +0200
Message-Id: <6d8116a56186fbf468229e823c7c8dfcd9488959.1719316665.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8MP AudioMix reset controller is only present on Freescale i.MX8
SoCs.  Hence add a dependency on ARCH_MXC, to prevent asking the user
about this driver when configuring a kernel without i.MX SoC support.

Fixes: fe125601d17cc1ea ("reset: imx8mp-audiomix: Add AudioMix Block Control reset driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/reset/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index e59da17ea0b2d620..36cfdb81cd345f94 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -93,6 +93,7 @@ config RESET_IMX7
 
 config RESET_IMX8MP_AUDIOMIX
 	tristate "i.MX8MP AudioMix Reset Driver"
+	depends on ARCH_MXC || COMPILE_TEST
 	select AUXILIARY_BUS
 	default CLK_IMX8MP
 	help
-- 
2.34.1

