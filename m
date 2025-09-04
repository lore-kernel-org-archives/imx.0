Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A566926A087
	for <imx@lists.linux.dev>; Thu,  4 Sep 2025 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999962; cv=none; b=rbclsGVc/m/cV/R+LqWf1/AoTTiY9NulfFX+1y0qoZJgQHZLYk5Os53XU32Oh87KXppUKDFvmDGltS/ShM1xjXUlA31DtWpu7NI9+S+2Zlt8jhFuXMw4hW5Kg9eEf/sFTiuwlJk1OC5iN4/PmRZ52LGqP26voPx9OVy4XtrkaQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999962; c=relaxed/simple;
	bh=vWEmOfULIMbOa+I8Rp9AhJsfOG3nW5pSaOETyuUOaw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDoa/Fs8MdSVcZdLQBC56EVx+o6SGSfxoUsbe9kdeom+x3F9PFie4wRoK3cJ55ueEmITZMsnq/0d/6ypHw/odJzhiR1v3cNHhcp7088dWNsSgtWYSujttS0BB6/fi5jDhNE+iaitIDqIwtin0XSYDLHwwLIhnF0gIUk6adkCStw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958DAC4CEF1;
	Thu,  4 Sep 2025 15:32:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/bridge: imx8qxp-ldb: Remove dummy Runtime PM callback
Date: Thu,  4 Sep 2025 17:32:36 +0200
Message-ID: <c7436cda28409f0080dca6cd2ca13f142d6dc489.1756999913.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
->runtime_suspend|resume callbacks"), unassigned
.runtime_{suspend,resume}() callbacks are treated the same as dummy
callbacks that just return zero.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 5d272916e200980f..1225029689271e2f 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -683,11 +683,6 @@ static void imx8qxp_ldb_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int imx8qxp_ldb_runtime_suspend(struct device *dev)
-{
-	return 0;
-}
-
 static int imx8qxp_ldb_runtime_resume(struct device *dev)
 {
 	struct imx8qxp_ldb *imx8qxp_ldb = dev_get_drvdata(dev);
@@ -700,7 +695,7 @@ static int imx8qxp_ldb_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops imx8qxp_ldb_pm_ops = {
-	RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend, imx8qxp_ldb_runtime_resume, NULL)
+	RUNTIME_PM_OPS(NULL, imx8qxp_ldb_runtime_resume, NULL)
 };
 
 static const struct of_device_id imx8qxp_ldb_dt_ids[] = {
-- 
2.43.0

