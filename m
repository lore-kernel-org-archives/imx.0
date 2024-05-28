Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2F6169384
	for <imx@lists.linux.dev>; Tue, 28 May 2024 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716889185; cv=none; b=DGHEAYLr4QGhAeW5kFeQ/0W1VReey+jDS+rDGiUJa4J71Zr+cb/Ytw5NJXcfu5CRzqUdT2aNMF46xCEV8hBX+QGGiGT8u5Q4AGOIZHqosUgdTNrV8qUeA0rybUSK+uBIOXVgNV0fwqhXpEKTStiTUUpog3kATAJmdGlRVyC7IHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716889185; c=relaxed/simple;
	bh=nTTYiOeNyqQ0NyjPEVVnO1VfTHoV+DmgmjODFXYenxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u5vA8udRv8mbRwu58qH7REMAa+mdGEtUA6DJ+ywCk72KMn+8ElqdoEeb7h9m4Pht+qcPMjrCR90SVGWaMjKcTxGNo2Lq75iJlZbhwvofVJAzkBVXvp92livAzwtSJgZ3p5qKDDJnbHp62+JHptKQ2w+zHCIY7MsRy4WqGi9BAAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=J24DXYOT; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=BJ4R6F1C reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="J24DXYOT";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="BJ4R6F1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716889182; x=1748425182;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vqve763J/fnX5w3j8DDUs6X/uVtGpHOXdGrGBsbN7qA=;
  b=J24DXYOTJQmJ3f2eYfZa2HO23KLdniOF+mFW9KJJM/rrvqUzOMSo9ZQW
   c749J/UOnIvGpLMpnXo7ISAmKKyVTQqBa7VpPy8btUpz9Dq2d8hH4uDFI
   jlBBolrE8hhov3oXZXErcaLPlEsqNKNJSyU5VNZl5cL5ueugXCSliIXTw
   PMp+BBvcIL14EllsfCq6Fq7cvRmCBvv0b+elIIcfyzt1gpfsSuXigaj6S
   9wyObXspGGR1LVOz8fxALLTHcG0NaO0o4qQEMRsO0TpOpfFKTU3sKQtNM
   V5lHKBw+X2M3fZtRkPgUjICdRigxvXgczZhShFyMTYDOni0pylGZmFlr9
   Q==;
X-CSE-ConnectionGUID: 2k6GM/7jTsO5KvQ5L84hDw==
X-CSE-MsgGUID: YiUP1NdXTn+RyzxY1Ae8Bg==
X-IronPort-AV: E=Sophos;i="6.08,194,1712613600"; 
   d="scan'208";a="37100349"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 May 2024 11:39:33 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08CE4164806;
	Tue, 28 May 2024 11:39:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716889168; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Vqve763J/fnX5w3j8DDUs6X/uVtGpHOXdGrGBsbN7qA=;
	b=BJ4R6F1CzUj3NIBsbMaYLBCt2DbeFl2CI9KPvuf+j5wyxi/OuPHjHCHaViG8kabd5LMcLh
	7jF9z9C1IraKLgL1hUCINKUagX4RFZ6fw5U2LC5ki2TXATySWQ5A1Hze0oYRRJCJ6IAwt2
	ILnBSjQ3TqKJygFA2nBz8Y6tJCdx3o4NlvibJ8nkibKQGmAmo6pnpq0tnqZA2nf6URuua5
	saW0r6Rb1CqJuRNMWHurRqXJl0vN+YsmhdGqceuiaPqMtpQ8ASbGz6ALlV//fhz+oINt2c
	LFwppkiU9K4XKYEIJ0IvywXEuZpmLP84MpJPmF01OY4iFBNwG/12AvRn7WCUMg==
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
	Daniel Vetter <daniel@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm/bridge: imx93-mipi-dsi: Use dev_err_probe
Date: Tue, 28 May 2024 11:39:21 +0200
Message-Id: <20240528093922.194684-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Although very unlike to occur (media_blk_ctrl needs 'syscon' compatible
removed), it lines up with the other error paths in probe function.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 2347f8dd632f9..8331db3b4f054 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -841,11 +841,9 @@ static int imx93_dsi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dsi->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,media-blk-ctrl");
-	if (IS_ERR(dsi->regmap)) {
-		ret = PTR_ERR(dsi->regmap);
-		dev_err(dev, "failed to get block ctrl regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(dsi->regmap))
+		return dev_err_probe(dev, PTR_ERR(dsi->regmap),
+				     "failed to get block ctrl regmap");
 
 	dsi->clk_pixel = devm_clk_get(dev, "pix");
 	if (IS_ERR(dsi->clk_pixel))
-- 
2.34.1

