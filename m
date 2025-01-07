Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A421F3D24
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260786; cv=none; b=sgFJ8H3dDZVpJJkWU9yhcheqaWLA2jFQJ884tgUN8vcRGmsZ0rLHV5DmhGoueYnciIx2GayP4npyp5QFTCDvv9TF0bNw6bzJW2qkNbskM2OIlyYMm26gHxRPjzHJUmLMxZILJnsGOkCSIrA6FCtxiJfsbFRa3UPq2HXFKelYuNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260786; c=relaxed/simple;
	bh=AYotZSVHf9trc9nuQO+1cOi+4lUPYi0qGW5C8a7h0ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z+01tTwaZyINn/EUkeNwKKgz81bs81++7E0bYEZGddl3/5UXDptdPZdCGXz81A8wT8E/SVHedKt1FqjPTh6alldkYDDrdTVvrH48+fCtRPmTmd4i30dXR2UWOyVtI5OKOFiYJ4Wl2m52kOHMnMDnJe38kubXoFUHIZ8CdlmHiDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=gEOG+cXW; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QS2VxVpT reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gEOG+cXW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QS2VxVpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260780; x=1767796780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0iI7T0R6eCAxaxyKlzF/ND6AcM0EauPs1fZKfAI3pZM=;
  b=gEOG+cXWPNt+itM76HGpJWvgZWia6KbiaChICUwvjKPHUENrPC7Cq0M0
   sVihrAEjRoSD+T1Ml2TiXz0Ov6qrkFPedMTjOw/n+n3enUPpYnEZOlkE4
   5UssG+qffxvpHZaZkzHHkuUee0g+enUwcAVtAtm6QILFXAeQbGEEAc574
   xiFH8EypcKsIRYoDLst6FNthMyjz222sexXQsp5TyEu2wVJHUKduNwm21
   jEY5ID1c18Mo10pVSL+V3QfW70gLc2Fbm0DskIXaPo0yofxIYEPEqFlxM
   pVbBwxxlJfr5FwLO1hf3KMyKMk/kHjDBtpq5Ej50E6nZGmDiVQ3F7186u
   Q==;
X-CSE-ConnectionGUID: odyyrwlQR9WlvSB13BRqAw==
X-CSE-MsgGUID: PbEUURTTTSyZGDyba87qpA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897254"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:39 +0100
X-CheckPoint: {677D3CAB-12-31397509-E321C4C4}
X-MAIL-CPID: 562AC94789849B901363AA16315BFA9E_0
X-Control-Analysis: str=0001.0A682F26.677D3CAB.0077,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8806160B22;
	Tue,  7 Jan 2025 15:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0iI7T0R6eCAxaxyKlzF/ND6AcM0EauPs1fZKfAI3pZM=;
	b=QS2VxVpTVdB1WaEfGv+GWDm26X5wPDOXJYAeb5LFd6sdrOCKvcrAsiQFkkTKTIwhf9Om84
	cLyNjddXLlyONdDEl5jW2W3gtmgcTh+iQt+QArc0fEpAnPk2n3D3eNwjqMSTbwmoQa6trn
	TGdOicsp3Is0Mw5xurF9t1BUZn612LRJNc0RbM+67sIbLELBy+J78juLWh3IIWl/R285nm
	AuW4GY6vTWvxpSRdwXfO503WYUbC9rqoAGFBC+GWnG99fUgRpGSA+yFzW6ReazhvqJ6va1
	r51N/cjz1WleLpweyKC/tYovISHm7yiCsq7fCQlu20hyvaobUqHl3cXibN/oTw==
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
Subject: [PATCH v2 4/4] drm/bridge: imx8qxp-pixel-link: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:39:00 +0100
Message-Id: <20250107143900.988567-5-alexander.stein@ew.tq-group.com>
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
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 4b0715ed6f38c..6391038f3949f 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -333,12 +333,9 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = imx_scu_get_handle(&pl->ipc_handle);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to get SCU ipc handle: %d\n",
-				      ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get SCU ipc handle\n");
 
 	ret = of_property_read_u8(np, "fsl,dc-id", &pl->dc_id);
 	if (ret) {
@@ -374,13 +371,9 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 		return ret;
 
 	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
-	if (IS_ERR(pl->next_bridge)) {
-		ret = PTR_ERR(pl->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(pl->next_bridge))
+		return dev_err_probe(dev, PTR_ERR(pl->next_bridge),
+				     "failed to find next bridge\n");
 
 	platform_set_drvdata(pdev, pl);
 
-- 
2.34.1

