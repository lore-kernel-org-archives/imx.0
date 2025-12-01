Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500C733769C
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609138; cv=none; b=SqyZ3oZxy3OThX9dhXKWvAjm6ozeXIiAe5tSbHDTpE9hKdnOZwC23ntK6ZrNiUjneXyQNyeqnRZEO59RuUwiybDTH1cMEjeSbTgxzJiqOL0+w3xpQQS7lyCvGFfQKOV2NUOpkkEiRXIlwvTQBtz5GkmYtylnQNgb2qjX30ByC/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609138; c=relaxed/simple;
	bh=zSwofAJNITs/gz244K8KSNxIOrxGyDD+1aCeJ44J5AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFyJiJdiReG/+nf8krbzU9dwzrTXxT3GuXhsa9eAK8jhDthAMgqf5OBTHDy1G9Yg7foz1aOvITQqeig3/Jqq2KolpWjHWPz4rXASOBYpZCn4ufvWxU/8LptoPl+8mrFLmpXPA+uL8YGwujoD2H2zn+29p7vjmhPb+9/Anmxdt/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vQ7RX-0002dz-FK; Mon, 01 Dec 2025 18:12:07 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 01 Dec 2025 18:12:07 +0100
Subject: [PATCH 3/3] pmdomain: imx93-blk-ctrl: add support for optional
 subnodes
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-v6-18-topic-imx93-blkctrl-v1-3-b57a72e60105@pengutronix.de>
References: <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
In-Reply-To: <20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de>
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

This particular block can have DT subnodes describing the LVDS LDB, MIPI
DSI and parallel DPI bridge.

Scan for possible sub-devices within the driver, instead of misusing the
simple-bus to perform the scan.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 13b0de6dd689cf944e034f7666a4e97b0118e3bd..8f79cabe07face872cb396bfb7329c230c4a97fe 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -311,6 +312,10 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add genpd_provider release callback\n");
 
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to populate blk-ctrl sub-devices\n");
+
 	return 0;
 }
 

-- 
2.47.3

