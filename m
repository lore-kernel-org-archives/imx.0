Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8597637C110
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780660647; cv=none; b=exWh72/QcGOIVOIYElmgaIxgdw3j+YYsLEMBJbEwA60aReAaUzijHXjUcMTHtFf2nmoyULDxsysZ7R5k88dCb8NzUdAah7erLIM7ejBAQSPm41evN3/arGiTMCNkfTrkZ677nDwjmis3o4XfkZcFJ/UTUlCGRiZ5czH/vU/Dfmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780660647; c=relaxed/simple;
	bh=1jnluH9nXmYHy1Syp5EUFcWQBdyNd19PmSpPNf0WAEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Xnw7vNah53Beqsa/ptfyI8xayzxA6I0Tp7qirSRh27FuBJdFUB4nomBarT0NB0FS/WQqdT/v2ggJaURbZjxSe5PFUZaBfAC73yz8Yl8bQjpgMHduHS50/P99WLdG8Qk1S1hwymy0E34nd7oKk+r/nXqJ7vMvXgXhA2jud3MjNgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjtOcu6+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjtOcu6+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c2a68d01so12613225ad.1
        for <imx@lists.linux.dev>; Fri, 05 Jun 2026 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780660646; x=1781265446; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eF8yh/ZhaXDNZn8doXue2BXI/ROFqbRF9hALOIAEVU4=;
        b=kjtOcu6+mWt2SlE6+Vy6qVUTE4bieNzU1mYzmif172gj7NdZSGyHAlAuTU27BTKS10
         Os2Gks2geL/XgCly/lcsiMyVcWc9MfSppVdjWE0tHS5fu4sXEbssnhTmB6uYMTe1STtO
         kuKsAHvhdseNTis8poHDMg5O0i4DFbixadHHPQtcKGdoqclWv99gpUtRd03oCfqBg9HP
         Xsigy3KGGLwO4IImv+BPuP6qw8sfkHWbmPy1HZovtFtwJ69anTqtwhS0B1lGWjKM1Ubc
         EE8jxrWRh2YAZrMv1MV+pTijyM1uc0id2ZO5HJAktDygV7/cBXZTr0CMoyRcM2mEEkqd
         YZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780660646; x=1781265446;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eF8yh/ZhaXDNZn8doXue2BXI/ROFqbRF9hALOIAEVU4=;
        b=gCtS+pOLfSGPBriftVlMM26513IDBoGQVShmX0g6Ir6PLSdG+H5fMx5AP4t5Gfjcqq
         /a3i/pSmQtGUXh9kdQNUI0kd0zYL2YCUoTz4rH4k0TtgHhlL0idgNfQ/C+dCbKC5i+cJ
         PJOxtbSh6yB/Mbl1B++32gxwe7tmS3/qobyVk7kyJSIb1p2NYzdHaUtxVejDTBrLtj+v
         YOeUvXPQIYdKqLQkvEqNIVTWp6/NHyKsdL3qo/VTXCxwQ3Flkof0ZsCaFnNGbPuzMtvd
         nVbCnvZVqEWc5Vl4G5vxMlNVz9xQrLs3WQSoQQRIbBx6xKMrSW+BFuV3uGaiHYyEURga
         5KUw==
X-Forwarded-Encrypted: i=1; AFNElJ+FtDRfi7MobWFFeHPxsIGbF5x35EL3pzp7d45d5LULlAVMSvAaw4hXvZ2cWKIfnSOM/u0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywco7o+Lhm9ulyAYUTrYKUeis7qSSHWKrG2sAwdFZdUiSr7N7XN
	0WDddwnaPrM8B7pn4O9ArQqb8yT4qclnbRxu13/n0xu5rqfp3ILSocXi
X-Gm-Gg: Acq92OGerb292he+fo7LKFniXspACW/nYrYew8JXAfUYmf88/z9xKceZFdkmxasOhMj
	H43W6H9c9t7yfl22T8S1RedATQHgiyGYn/scHS0FvSGFW2HSmAFsI1p2ADJL0WpvemrnKhmyot3
	jlLNhruAUxLPqLubc1VK8KO3uDOD35j01N5rt9on/JBpfnBmTyF1G5OvWpLtMPL5VR8Um/WZFms
	stUq344RJOMOmDxgJKRjZJSPJl6jqstmF/frQysTQswbbHRWqClfEUpKItyB6Nt7p98mfozTcp1
	1waXzB5KyeW+mKkDN/gOsFoQP55UvBHmNGwMAmjBuGdtTWfjksKoCDyw/15+azFIeOXbQE3f/h1
	EdBTsqxLROKafLXVoKtfeAYoK60LUahP4FAUxQWAxqiIGDSPryBB3IbXHRTfkmmwQ6swPRXeiZn
	F5haONfPYTkzTVaVMh/XcWocxuwXX3i1Cqp/Efd3zjby1+FXCh5eyRuhs7m01YL/erFot64G+dH
	co9lvreBf0qSaDYro3ohp3bJZwHwwD5CXN4lWw=
X-Received: by 2002:a17:903:2d0:b0:2c0:bcff:e18c with SMTP id d9443c01a7336-2c1e833c99dmr35270255ad.37.1780660645598;
        Fri, 05 Jun 2026 04:57:25 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d45csm127241615ad.14.2026.06.05.04.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:57:25 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 05 Jun 2026 19:57:20 +0800
Subject: [PATCH v2] phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix missing
 pm_runtime_disable() on probe error path
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ+5ImoC/12Nyw6CMBBFf4XM2hqmMUVd+R+GBW2nMIaH6WCjI
 f13AXcuT3LuuQsIRSaBa7FApMTC07iCPhTgumZsSbFfGXSpTWnKk+qTF+VN5azBiw9Ywao+IwV
 +75l7/WN52Qe5edtuRscyT/Gz/yTcvL9kQoXKnglDQOuJqls7NNwf3TRAnXP+AsrHQS+qAAAA
X-Change-ID: 20260604-lvds-d67cb619df17
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780660643; l=3323;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=1jnluH9nXmYHy1Syp5EUFcWQBdyNd19PmSpPNf0WAEY=;
 b=7iDgxZg0jOVAtl0CfL5XzlraW/8xEH/XzKMKF01We1Z9PtFrPxoWEZ7Gws4uWlANtj/DvKuXF
 kE/kdaqfFtiAU//wXVWMgQLI/oqzCJ0IIZknDig3s4ZhBATn21hx99I
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

If mixel_lvds_phy_reset() fails in probe after pm_runtime_enable(),
the function returns directly without calling pm_runtime_disable(),
leaving runtime PM permanently enabled for the device.

Fix this by using devm_pm_runtime_enable() so that cleanup is
automatic on any probe failure or driver unbind. This also allows
removing the manual err label and the .remove callback.

Fixes: 06ff622d61d2 ("phy: freescale: Add i.MX8qm Mixel LVDS PHY support")
Acked-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Change the patch's subject prefix requested by Liu Ying.
- Add Liu Ying's Acked-by.
- Link to v1: https://patch.msgid.link/20260604-lvds-v1-1-b8e1ff1bdee7@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: linux-phy@lists.infradead.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
index ece357443521..c662f91e598c 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
@@ -345,7 +345,9 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, priv);
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = mixel_lvds_phy_reset(dev);
 	if (ret) {
@@ -355,17 +357,15 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
 
 	for (i = 0; i < PHY_NUM; i++) {
 		lvds_phy = devm_kzalloc(dev, sizeof(*lvds_phy), GFP_KERNEL);
-		if (!lvds_phy) {
-			ret = -ENOMEM;
-			goto err;
-		}
+		if (!lvds_phy)
+			return -ENOMEM;
 
 		phy = devm_phy_create(dev, NULL, &mixel_lvds_phy_ops);
 		if (IS_ERR(phy)) {
 			ret = PTR_ERR(phy);
 			dev_err(dev, "failed to create PHY for channel%d: %d\n",
 				i, ret);
-			goto err;
+			return ret;
 		}
 
 		lvds_phy->phy = phy;
@@ -379,19 +379,10 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy_provider)) {
 		ret = PTR_ERR(phy_provider);
 		dev_err(dev, "failed to register PHY provider: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	return 0;
-err:
-	pm_runtime_disable(dev);
-
-	return ret;
-}
-
-static void mixel_lvds_phy_remove(struct platform_device *pdev)
-{
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int __maybe_unused mixel_lvds_phy_runtime_suspend(struct device *dev)
@@ -432,7 +423,6 @@ MODULE_DEVICE_TABLE(of, mixel_lvds_phy_of_match);
 
 static struct platform_driver mixel_lvds_phy_driver = {
 	.probe = mixel_lvds_phy_probe,
-	.remove = mixel_lvds_phy_remove,
 	.driver = {
 		.pm = &mixel_lvds_phy_pm_ops,
 		.name = "mixel-lvds-phy",

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260604-lvds-d67cb619df17

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

