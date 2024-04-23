Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5328208A5
	for <imx@lists.linux.dev>; Tue, 23 Apr 2024 05:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713850364; cv=none; b=dQ0KjN3D1dfuU/nASeEXZpyA7WyJvFfQNIfmCUQ3Ypf2f1vb0L/02GCKzQ2j7+XkgbxZNW8UVgRkh+Lyo6PFWvmsXfLAXKWokq3vYGuROfAl/CyZWkkQIWfE1Sflf5hM5PrhD7rvwzVSyf6dgH4Hvxn9sWMyTsHAn5/Qs08nqQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713850364; c=relaxed/simple;
	bh=+azLDfk/XeFroGKgVqni53cR/vzETd6dF45ytF23To8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=l2PDPZBgOCAqe7Up7qotyLXkJOqj4h162mpS2e3iKE9VQ+vj7OUZunzFfwxk2cN6IhDGaymHvGVD/2sTFWpKX55WaTe561v3kIyvT88aANcGqjQPVuCLb/dgW90RiCPIudQ+eCi71Zmp0wo/DM+eml5pe7gnGpYjfBzILaImfBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D33FA20081E;
	Tue, 23 Apr 2024 07:26:57 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B9532005F3;
	Tue, 23 Apr 2024 07:26:57 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 21EEC180222C;
	Tue, 23 Apr 2024 13:26:55 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	shengjiu.wang@gmail.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: imx: imx8mp: Use modern pm_ops
Date: Tue, 23 Apr 2024 13:08:37 +0800
Message-Id: <1713848917-13380-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Without CONFIG_PM, the driver warns about unused functions

../drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: warning: 'clk_imx8mp_audiomix_runtime_resume' defined but not used [-Wunused-function]
  363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: warning: 'clk_imx8mp_audiomix_runtime_suspend' defined but not used [-Wunused-function]
  356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Change the old SET_RUNTIME_PM_OPS()/SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()
helpers to their modern replacements that avoid the warning.

Fixes: 1496dd413b2e ("clk: imx: imx8mp: Add pm_runtime support for power saving")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 574a032309c1..e4231e9c8f05 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -368,10 +368,10 @@ static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops clk_imx8mp_audiomix_pm_ops = {
-	SET_RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
-			   clk_imx8mp_audiomix_runtime_resume, NULL)
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				      pm_runtime_force_resume)
+	RUNTIME_PM_OPS(clk_imx8mp_audiomix_runtime_suspend,
+		       clk_imx8mp_audiomix_runtime_resume, NULL)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				  pm_runtime_force_resume)
 };
 
 static const struct of_device_id clk_imx8mp_audiomix_of_match[] = {
@@ -386,7 +386,7 @@ static struct platform_driver clk_imx8mp_audiomix_driver = {
 	.driver = {
 		.name = "imx8mp-audio-blk-ctrl",
 		.of_match_table = clk_imx8mp_audiomix_of_match,
-		.pm = &clk_imx8mp_audiomix_pm_ops,
+		.pm = pm_ptr(&clk_imx8mp_audiomix_pm_ops),
 	},
 };
 
-- 
2.34.1

