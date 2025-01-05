Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846E81B78E7
	for <imx@lists.linux.dev>; Sun,  5 Jan 2025 19:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736104054; cv=none; b=FP74ET1o7lyqK+Uc3f9wFIglI+ulJRL+oHZl3cSRMcgRSuyBt4hTJC3o5RHisvai+KYpHb1Q1QDJC5wRFe4ekBrr17HMnM3f/fp4pDTIuwDDwqYBzKFxDp93UqYG3p51ITYrMazr/2bew2HmPiI7fDHHKwuKbuMD9uV5BTGi8Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736104054; c=relaxed/simple;
	bh=J12ZuudKX/EiiiMFhl8ZG4yts0tjziUbn4vHdsslr/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLP+O41WDzT2apQW4g7AuqX0p9h7laRnng4qmsZIRxaHhBV6Gj9YqBi0+zJSW+HkBKmLEOCW37I3sheeA5eSSWMcXjTZLToSYquQV432N8zHz4AA8bTRjPqRmQ/5uicg3dQzFhSZhDoWv+ikrx/cvw67CJjcPF5dXmxojS42h3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=fqVm5ZlV; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="fqVm5ZlV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBC74104811FC;
	Sun,  5 Jan 2025 20:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736104049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gOuDV8a14zXoIoSeFvjSZmd07jSEQLJMy50etppxByE=;
	b=fqVm5ZlVF64yMGqkhmXc1JZKUP0YaZCtHd3rtYMxRb43FkbnhAruX/L2doszWy1IVk54AB
	jxLJQZv56VpyoNrLoE9cgX2BaeiWZouSJAGUULwNfmyZxeEBPyVl/s+PZQMBaTJ6+oEr8Q
	VEYhOkJPkKTPpqttwl++W3loV56O5FV0S5mJTeDhNc2pZozkHIEMxwLaD2vSE65tIEGbaJ
	j/VjMYq5v7C71i9Eby5eSSlIRrkmhSP9PpizTmthZYZ5QzNyKrgL08EJEeXdoA6JbdhPub
	tsB4iuRu0oT1Cii6LdotfL+NazokwyDDFO4FqXMiRrXEIyEa3YC9cE/mbntPwg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/4] drm/bridge: imx8mp-hdmi-tx: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Sun,  5 Jan 2025 20:06:04 +0100
Message-ID: <20250105190659.99941-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250105190659.99941-1-marex@denx.de>
References: <20250105190659.99941-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The dw-hdmi output_port is set to 1 in order to look for a connector
next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
The output_port set to 1 makes the DW HDMI driver core look up the
next bridge in DT, where the next bridge is often the hdmi-connector .

Similar to 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")

Note that looking at the upstream arch/arm64/boot/dts/freescale/imx8mp*dts ,
the oldest commit which adds HDMI support is commit:

3e67a1ddd56d ("arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL")

That already contains the HDMI connector node. Most follow up additions
of HDMI support to another devices has been a variation of the same commit,
including connector node, which is the proper way of eanbling HDMI on the
i.MX8MP.

The rest should be covered by output_port_optional which should make systems
with DTs without HDMI connector node work, but such DTs should be updated and
the HDMI connector node should be added.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: No change
V3: - Update commit message
    - Move select DRM_DISPLAY_CONNECTOR to DRM_IMX8MP_DW_HDMI_BRIDGE
    - Enable output_port_optional
V4: - Remove select DRM_DISPLAY_CONNECTOR
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 1e7a789ec2890..3d63200e468bf 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -101,6 +101,8 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
 	plat_data->phy_name = "SAMSUNG HDMI TX PHY";
 	plat_data->priv_data = hdmi;
 	plat_data->phy_force_vendor = true;
+	plat_data->output_port = 1;
+	plat_data->output_port_optional = true;
 
 	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
 	if (IS_ERR(hdmi->dw_hdmi))
-- 
2.45.2

