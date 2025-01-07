Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8385F1F2374
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260766; cv=none; b=MaPAGINuJXBRKuMH7jwWAAw16MTCXuWspfhTB8R3I2/U4l7DrCYDaS26xDbO1EBLhUtMm1b8HcMArpCq5qh8a6MMkK7NhLvlwwCTtc6l5SMehrehlyfAvZk1GeCJpTerFfvqbQE5AreF8Mr2tC3feicsMWFzb/iECeYnscra+RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260766; c=relaxed/simple;
	bh=e+0X1BggzI17wpNLe/RyuVsMjKUn0ApW1Dj5ZWUGf74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DDK46qqBik12xjkqyBPM+ylXLxzvvr5ibcR+8hMGOGFCcydm0S/CKYeqVze9fan/vPWOmIAWuv+tykb8+nKai81kCeCOwGdTKwir4pAx1MJJq85C2Ua/0N7YarQBq1mQUct5XHRW4OR9Zm+iP9NQF3GCujXxBTVTSI9v6BihaSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=doI0a3x0; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=akmXuBPK reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="doI0a3x0";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="akmXuBPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260763; x=1767796763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J1yM4GW4YkH4sSr6aDIK6r6U62z1pZvrPK786Xfjgcc=;
  b=doI0a3x0pSRJj9JqnBlbxJgDJtnvb8vnm68n75PYUoc0kjivXrXRe3MK
   7DCiYPA2uiSFWniRnAjRtLh64II0pO/Vbwe0DZfzndcGoujizVsSU1ynh
   TmiUX5qGAI6wxTHn1nluFHk8kWneca+90ZfNQI5KsTB90AKjPrPj/Ijtk
   /LCKBzhQOKyOEpb9ftN0l+cog61UCYQFcjtEzbwZxGnRggBFXLGrJl9IS
   Zf2x42rOAkzohW613vEsUM3RCt3XrPD568mHK0jRgtK7bNkXO8s7eL7fk
   1KPqzjCazgyGLVAy6NMH2RdB0hceTQ4yX9vPvkSVSmDsVzEI9bgu3drv3
   A==;
X-CSE-ConnectionGUID: QyWCmoWdR92sY8SQ4BDnPQ==
X-CSE-MsgGUID: d1obu0ihSym4Fk1pIal47Q==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897242"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:21 +0100
X-CheckPoint: {677D3C99-4B-9B2B6168-EB6F31C5}
X-MAIL-CPID: AF5E493BE366F514177D66585BB4F2B7_5
X-Control-Analysis: str=0001.0A682F20.677D3C9A.001E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A593A160B22;
	Tue,  7 Jan 2025 15:39:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1yM4GW4YkH4sSr6aDIK6r6U62z1pZvrPK786Xfjgcc=;
	b=akmXuBPKfC17Ejx73+QbFvd05OTCIsI5Dt+hgvY83nLqR4nzyp502jEuUCNexo9oc/i2Ro
	eq6T4ruk2tSVjGYgPC/Tm7Y2jbGe4yqfm9dYCdHMWjBO9tIfVEFjNWS0rB4kV/BCygFWE/
	1YTfIfmwx7aWVM/Sg40deUJLtk71JVSvue1EiO7rWpeqa3hp34cqcmJmuhBsm95g0keP3Z
	k2R7R34HKxMaNHDVIsUtjm1kE4UAI8zfTTfFaj57JI5HukXGkF1Yx01W0QWF8kEGO8l8z5
	M8CUzn75n1WAm2zG17icnbnMRCQW8WFYcKTNVQcQeOvExjM7nZk/Rwm4mfUfTQ==
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
Subject: [PATCH v2 1/4] drm/bridge: imx8qxp-pxl2dpi: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:38:57 +0100
Message-Id: <20250107143900.988567-2-alexander.stein@ew.tq-group.com>
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 26 ++++++--------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 65cf3a6c8ec69..038eaff889bb7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -398,20 +398,12 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	p2d->regmap = syscon_node_to_regmap(np->parent);
-	if (IS_ERR(p2d->regmap)) {
-		ret = PTR_ERR(p2d->regmap);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get regmap: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->regmap))
+		return dev_err_probe(dev, ret, "failed to get regmap\n");
 
 	ret = imx_scu_get_handle(&p2d->ipc_handle);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
-				      ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
 
 	p2d->dev = dev;
 
@@ -422,13 +414,9 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	}
 
 	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
-	if (IS_ERR(p2d->next_bridge)) {
-		ret = PTR_ERR(p2d->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(p2d->next_bridge),
+				     "failed to find next bridge\n");
 
 	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
 	if (ret)
-- 
2.34.1

