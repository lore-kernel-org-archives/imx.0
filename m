Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECBD3043A9
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 13:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904779; cv=none; b=tiT2z3XEjvIaLpItD5aQC+uy8RFD2/1ecoEaynSTgm6m948jouGii3e9sdWYXI/R8g6J1xi+ox/D5CYazq6zrlIHRCSCRcG7DsWxau97GRZWx1aLI0C5ItusNBVvHG4F6BACxLxWvJuwhlbVt5BP6XenxhVZPLjVx4ZmC2JtKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904779; c=relaxed/simple;
	bh=C2b/lGNp7VVSS2EkZMFFaHG3SCT0X2zMvuLCo4TMi7Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZQL5bDatdF1A7IP/9JOPOkqt8w9S+6Cvw43SxJ1Y84R71fYZpodc0+N3qMM6Naj6OzLJ1yLbgOi6Lv9spUF33xf3nSHeOEwS9KnupAlKY1P6SHnS609dyY1JGVzLGgwruR9J1ZUmV0pOGce6HxSZgxMP4mAxnptrA0amDKuba+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1utnBl-00006Z-Hg; Wed, 03 Sep 2025 15:06:13 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 00/11] i.MX SDMA cleanups and fixes
Date: Wed, 03 Sep 2025 15:06:08 +0200
Message-Id: <20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEE9uGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNj3TIzXUMz3ZL8gsxk3eKU3ERdk2SLtBTjpCQDc2MLJaC2gqLUtMw
 KsJHRsbW1AHQt96hiAAAA
X-Change-ID: 20250903-v6-16-topic-sdma-4c8fd3bb0738
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

the current i.MX SDMA driver doesn't honor current active DMA users once
the i.MX SDMA driver is getting removed. Which can lead into very
situations e.g. hang the whole system.

This is fixed by cleaning up the driver and adding devlink support to
the SDMA driver.

This series also fixes the i.MX SDMA handling on i.MX8M* devices, which
do have multiple SPBA buses.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (11):
      dmaengine: imx-sdma: drop legacy device_node np check
      dmaengine: imx-sdma: sdma_remove minor cleanups
      dmaengine: imx-sdma: cosmetic cleanup
      dmaengine: imx-sdma: make use of devm_kzalloc for script_addrs
      dmaengine: imx-sdma: make use of devm_clk_get_prepared()
      dmaengine: imx-sdma: make use of devm_add_action_or_reset to unregiser the dma_device
      dmaengine: imx-sdma: make use of dev_err_probe()
      dmaengine: imx-sdma: fix missing of_dma_controller_free()
      dmaengine: add support for device_link
      dmaengine: imx-sdma: drop remove callback
      dmaengine: imx-sdma: fix spba-bus handling for i.MX8M

 drivers/dma/dmaengine.c |   8 +++
 drivers/dma/imx-sdma.c  | 188 +++++++++++++++++++++++-------------------------
 2 files changed, 97 insertions(+), 99 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250903-v6-16-topic-sdma-4c8fd3bb0738

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>

