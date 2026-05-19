Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9A8370AF1
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187140; cv=none; b=N/oD6+15fENm06mTbZ4bp3DTdSGGSaNJG6cigXadn4eSV2HP2PNjs/zRSFxDv1J2dGkO0O83XGsyS6KXttAYPWHTdkMN0VFtUSsVdH0OfrwrUp8ro6jhdWMPvoq+Yacjo72kFMECeQS/qPUaZ7BaJEPy6ro0Y/gNPgLr0Kbx6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187140; c=relaxed/simple;
	bh=tD6jz0tluUfAZZTuF9nGIm1I3KFiy45BKgqgNs80pY4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2ctHcj6LnSS/GddGlX25AcaAkZpxydWsC2QMUmSPY6tArfr42rQ2FbCczYKefP9hpGZraV5EDgwm9TYopQlnvtkBcjCtt/FRrAA4fBdn8kxxuv1cMrFhonVy/GzMdr7tGCALydmBa14Dpr4cHsppi6gPVMXSxc+3fHH3kPo+Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O3s+Psyf; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O3s+Psyf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BC2B8C2B9DB;
	Tue, 19 May 2026 10:39:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90BF0606E9;
	Tue, 19 May 2026 10:38:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C29D107E8AD7;
	Tue, 19 May 2026 12:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZsHKRRMUeu27tf1v274f8WMZN92s4xeRokkanZhzAqA=;
	b=O3s+Psyf4Zu4itRxyHYLnWzhOGp9YTgdPLH/FoA1MJLe7MCR0AASwOwyBuGOx9TPSXHNO4
	QKDh2+Qaf9CCmvXE4JrfAaSFfe00UZxQRXogi/O179EBZEy+i5Hj11ocVOrBpw0iR7XPj/
	SRjRTptJJS2Rfp/grqwqVlS6BP1eqK2iQ0PMGDn9g11Owx+vPvU+UoyqeKF6RS7dkIZ4Ad
	ek5axwNTgeru/q1xdMBI+29FKMxVAeH9oYWkwSTf8thEc+um+dv/0gLWCSYooiuG4u5I4H
	wj9mHWB7ALGae5AXrmEEElVNwt87uCgXQ2spDIjHq0U4EZ6KVVsH0c/3HrctRQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:29 +0200
Subject: [PATCH 12/37] drm/display: bridge-connector: hoist error
 management to common code
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-12-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

In prepataion to add more error management code common to the HDMI and
non-HDMI branches, move error management to be common to both cases.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 982bc64d8361..defe29e339b0 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -1038,15 +1038,13 @@ static int drm_bridge_connector_add_connector(struct drm_bridge_connector *bridg
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-		if (ret)
-			return ret;
 	} else {
 		ret = drmm_connector_init(bridge_connector->drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-		if (ret)
-			return ret;
 	}
+	if (ret)
+		return ret;
 
 	ret = drm_bridge_connector_init_hdmi_audio_cec(bridge_connector);
 	if (ret)

-- 
2.54.0

