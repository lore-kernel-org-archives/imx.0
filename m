Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AC3374739
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583955; cv=none; b=gi9zXZUnMke3V/T1NxJCQICPiUdCb7fKDeU3Yh8yzwNl0aoNHyrk8rtMXXNwGF64jVJ7tjqoUszMkJh3kFzFRqOL5wBCAZenbgvJgZpI1SPyWt0sURvDkO1OVxVQh6ZKBewh2y3FobWY6xn1qvYUikhM+F49Wk5MQkokJVTsvTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583955; c=relaxed/simple;
	bh=k21HcNtRfGOfdGEdLFtlrPAUJg8uMPRTOaO8fu5/tX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jymURsB/RZSkDeqkTpUaiBLdf6GNtR19UtKDywAyoB6s6hrGMpwMVaFTp3yY00qVRm2a6qGVC/Ajg54QpC3Ia9WJdRg1Y49qM2ZjeF6WOXenUyunaojsIK7FXKM8OAriok09nOb/c7gs6pKdGU7SdbPNVlSw2/pZymE35Sd4ggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sY2GUhiw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY2GUhiw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so546309a91.0
        for <imx@lists.linux.dev>; Thu, 04 Jun 2026 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780583953; x=1781188753; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DOMV3x2yG7P0NW9CHIRVjoVTM78K6MUr+RoZlGHPHew=;
        b=sY2GUhiwtY3fTT+MavJ8ImQElVZ6d7X+ArYtp0V2ImYJDzo01UqDE9s6GiSxqq6xk8
         xgio+0VWfk8grAgPx/WQWmSJx4y9MlJ+izLkrpWW179eblIOsuXbvUQzF3cjgW7cON/5
         12cKJmjw2LWanFzDGpfnsLKVr/tE+fGCzyBA/AK+TM4ay21GWbmo3AiJmWIf7E/eiM5F
         V7qbTY26VHO8QG2iZAoM/YlA8yvlhq447UUsexiJMugNnoGz7rrebQbdCsCArgPlxESq
         WGvtBZ6mweh7Q1ixrDw+LtiyfGfAiCRPfHerb/NFm/u65WMbqB0wh0BV75XwAEj2/zmj
         bVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583953; x=1781188753;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOMV3x2yG7P0NW9CHIRVjoVTM78K6MUr+RoZlGHPHew=;
        b=KavUX5l1T01em9jogi6ZiIKpIXjv+aAUIp1ldARO85CiagOyDKtNnnQJc1BgEHQV9O
         E60ORsfhXrRDLj2X5qHrRyKrkdeeLwGj7XLBNi0+btTFLFuZw0Fee/QjiLqa3CmPFwp9
         gIgstdP1YWhRtCxz/hrA+ZwTUTIp+krc/Sb+pKAlB4LOr+kpW6AnASgcEmKOb0TxwZ+g
         g3LMloFRNP/3fPBECg4gJdxMbRBsOXuulFP58DvLQa0Zir/e2ptwFFDdZdWnmCYE/58P
         XHy8EAcFFtQyqfhf1/3nBHhONJEI6SaXjKkWc6Lh/ItrS4a+ouRBz6VWzwY49RuXfqqN
         Y15A==
X-Forwarded-Encrypted: i=1; AFNElJ+bxwxYVllpcOinPzfHzuhEGYH0B2cXty2m0gWstNc1r7fGlYsRoOrgAGWQcbGC3RGOJQI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1QMomdrn0ng4bza4ebUIDDL+DBj2umxbyQpCkI4xlhswhOuje
	blkwqcWK/bZ+k48u/YBuBRGYVmqo3oVpMf8IHAimgLR+bqj7FSPbhU74
X-Gm-Gg: Acq92OH7ApWXGZDjOFLkWSZtvo4h/HewIe49XgD9wKEaunE5FjXjF7RaAzBX9iSDjuO
	rJCiyYeyz89yODngAlcyhf5mymk83ghkjktq65HPNBxVwZ6eSgw8wY6D/w34lAjGQdRG9a+RIFR
	rNxog3YeIco77WFVSbQFaLvLzawNY6Dm6eZFMQL6p/vx7Qkqj67qjJwZ/xPgWBEiwPODM0HChL4
	rMRUuRuwMmIAGS/eSGMs7kXwBV74UZBoouEquIlLqUywAkhrt02asE4myyVvfaNHzrHTgNHCKSM
	5950CK/GyO2kNQDAp6jv5XMMQcRlyyL/PxOr28/b1ah1tzO95uKVwFdbNVPO9wBfb7PQteyDx7z
	9YIPksHYE5PYmaegZpmmHq72ZQ9bgW5girTK+F1gEaqMIfFAtpY5T398mFhWPS5Ue7M2w2ktw8I
	kSKlH74v/086oQbH7TvCnNWOLmej35OBK1f+O6oLxOMfde1RyFPcgaP3FzLnAIExfPe/kLAvcbd
	k4AsapAda9+dh+ThQUkgi9+wkwNu7cUrNVEZcI=
X-Received: by 2002:a17:90b:58d0:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-36f76d559d7mr2969085a91.5.1780583953117;
        Thu, 04 Jun 2026 07:39:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf830b2sm3118696a91.4.2026.06.04.07.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:39:12 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 04 Jun 2026 22:39:07 +0800
Subject: [PATCH] phy: freescale: imx8qm-lvds-phy: Fix missing
 pm_runtime_disable() on probe error path
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-lvds-v1-1-b8e1ff1bdee7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAqOIWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwMT3ZyylGLdFDPz5CQzQ8uUNENzJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tALOMGkpoAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780583949; l=2666;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=k21HcNtRfGOfdGEdLFtlrPAUJg8uMPRTOaO8fu5/tX0=;
 b=jhHig4d+JEEW8lyIX24qIbqNx+rDwN/vC6NWkW86ZaeYwEzeYggjta+nO9Lfo878+ax0rH+ol
 7jOKNHUbE0iDMCul78SSZxFsmrifomdo6iadGIx5pvJmozsEMf3g6HN
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

If mixel_lvds_phy_reset() fails in probe after pm_runtime_enable(),
the function returns directly without calling pm_runtime_disable(),
leaving runtime PM permanently enabled for the device.

Fix this by using devm_pm_runtime_enable() so that cleanup is
automatic on any probe failure or driver unbind. This also allows
removing the manual err label and the .remove callback.

Fixes: 06ff622d61d2 ("phy: freescale: Add i.MX8qm Mixel LVDS PHY support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
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

