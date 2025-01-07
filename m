Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E61F37A9
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260773; cv=none; b=uhLnVP1pdMF+A2DkcNAo8NP5BTKHOlzWa0IM3NCacN8IGIHZVUfHxcaKZTWz81qtSKPKE/uhQ0VqizDHc8eJFI8VMQg2T6oqroBS8pWc+0/1blcu+nV6QpRMVM9AerVAYdX0eZNSfYneKCq2hVpok90QgT4zMpp3Apo1krdIY80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260773; c=relaxed/simple;
	bh=XWT2uhfUx7vF7rHsptlywIBKn4fnMYvdUd+pJhFZmww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bTWUkYIGT0O/KM9ckdX/FkVPnHGf70oSpAn/QoLFlTIOYTrsfGLJeSTJUjnJ776geaUHQokHeJCeAW9PyLrdQiSSZWyLqbH31uFbBB8+NMG3vJZyzpsiqS3q9aA7joINlA4v5jNzLPETACdaoicxBoOEKb1x2I1HAyNS4XqEH50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ZhH2gjgG; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Kz/TNRA2 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ZhH2gjgG";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Kz/TNRA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260770; x=1767796770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v6ZalIwFfK9vUB0/HSTtySwzznHuXDMQLLMZDZH/dAc=;
  b=ZhH2gjgGQjG6YsFx31yKWMxec6hynBXay0dGhSCT7XgaCxqObbZmPwUs
   w/KY171Gs8NCgPznLHQA29u3IBQV0pkK9RFOJBqJ9TPYmzxbOdJ7zDY9G
   7Vcc/3EYBmCl3K8Fwh1tkQrO1jqb5asG5vcEnFduqiGu1gUhQngInu/fq
   /LHe0QMWkIS3Jf2/z6kyA5salTtvuo+TuiORE6iGKGHI8PnaGPOP9Uu4K
   1FHAJOP82CBmQCsw2AGKBTxNe4iPYHZ0jzfMdS6b/6eN7rBO3gGJ7BDJN
   3QIO17Bt1w4JUpqWwgpnsZ1Q+pKlIuCvN/eh2qECUfhrVPrBXe+2yKXMt
   w==;
X-CSE-ConnectionGUID: OLkKxxOYQ2O7L3x2p5kTEg==
X-CSE-MsgGUID: kBmI3pPLQ6y9k7ktctXARQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897247"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:27 +0100
X-CheckPoint: {677D3C9F-1F-3C670366-E45AD810}
X-MAIL-CPID: 5D665BE28A4386F0867A29349A815CCC_4
X-Control-Analysis: str=0001.0A682F27.677D3C9F.00CA,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59956160B22;
	Tue,  7 Jan 2025 15:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v6ZalIwFfK9vUB0/HSTtySwzznHuXDMQLLMZDZH/dAc=;
	b=Kz/TNRA2k3u0PyJ5oHB+nYGayQGkRTxZ/4I43G45iHR3By/K8jB9CNTC3ABHnqQ+5j4yi1
	JK0iWidsvqz2r9mSf8ykklx9V5qMaTkR7iAxw2V8CPSar/qAY4r74lKL/noQSeVcC3VVOj
	je4FFLa5DIqPgszBZ3nBkUAmqXvJnXvKX30Y1XIgBDai1BUJ6zBIZ/BlC2qN9HwAzVqHmQ
	hNivDMYEMYc6BHoSSj8KRGOVdaMfOGRVTg8i89h8UNQBaLgqsi9GP1SeITDB3QCVktFNGH
	tENFAAGPUqz8kL4ALPtJ9jxdwF68cdWI7BZbASmcBCgXIL03jobcxGjHDJ+xOQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] drm/bridge: imx8qxp-ldb: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:38:58 +0100
Message-Id: <20250107143900.988567-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This simplifies the code and gives additional information upon deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 37 ++++++++----------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 7bce2305d6767..d5e123173f354 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -557,10 +557,8 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 
 	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
 	if (!imx8qxp_ldb->companion) {
-		ret = -EPROBE_DEFER;
-		DRM_DEV_DEBUG_DRIVER(dev,
-				     "failed to find bridge for companion bridge: %d\n",
-				     ret);
+		ret = dev_err_probe(dev, -EPROBE_DEFER,
+				    "failed to find bridge for companion bridge\n");
 		goto out;
 	}
 
@@ -590,22 +588,14 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	imx8qxp_ldb->clk_pixel = devm_clk_get(dev, "pixel");
-	if (IS_ERR(imx8qxp_ldb->clk_pixel)) {
-		ret = PTR_ERR(imx8qxp_ldb->clk_pixel);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "failed to get pixel clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb->clk_pixel))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb->clk_pixel),
+				     "failed to get pixel clock\n");
 
 	imx8qxp_ldb->clk_bypass = devm_clk_get(dev, "bypass");
-	if (IS_ERR(imx8qxp_ldb->clk_bypass)) {
-		ret = PTR_ERR(imx8qxp_ldb->clk_bypass);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev,
-				      "failed to get bypass clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb->clk_bypass))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb->clk_bypass),
+				     "failed to get bypass clock\n");
 
 	imx8qxp_ldb->dev = dev;
 
@@ -640,13 +630,10 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
 	}
 
 	imx8qxp_ldb_ch->phy = devm_of_phy_get(dev, ldb_ch->np, "lvds_phy");
-	if (IS_ERR(imx8qxp_ldb_ch->phy)) {
-		ret = PTR_ERR(imx8qxp_ldb_ch->phy);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get channel%d PHY: %d\n",
-				      imx8qxp_ldb->active_chno, ret);
-		return ret;
-	}
+	if (IS_ERR(imx8qxp_ldb_ch->phy))
+		return dev_err_probe(dev, PTR_ERR(imx8qxp_ldb_ch->phy),
+				     "failed to get channel%d PHY\n",
+				     imx8qxp_ldb->active_chno);
 
 	ret = ldb_find_next_bridge_helper(ldb);
 	if (ret)
-- 
2.34.1

