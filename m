Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629064;
	b=GRKMfmgDJx9xImnVIMjojVCTNTyJe5Et1NetTI/mThVaNz/N95uzWu4kywGSGsVa/nrE
	 jDEs99Gb14iRLlgPrecnfFTUA6rDj1b6/n9VQzkkdaZ1zv+doC3cOaHhTBLNr6svb9xVI
	 o8B/W80Ml5NFSl1kfTMUKa87kFeaibpfFjC0Wr7krSLNEwMQ1C/dVNLcTGO1dgGGfC3fA
	 i9212aUIti8tnmalhVAiXNgBfZd70vEiv4Qnvk+tY6gbWYPy0PbFBMRzoq9zi6lv+0S2V
	 Iz3E1hBazxS2hmwVNCmyTkjrnmQxtut1c+cvr20SM1dY/YSoRmY5bnPnR8B/XE4+0sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629064;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=NSVFwobbVS+kCFYlT7jJw4a90W2mwlRdcZOgwxJZDjc=;
	b=oNSVj7HZIEAT4WyRez3kzMaCuGg2OcwZJEaZrN70Xj2Tk5wxkfDXqpdjcSiaCjNP8U3i
	 UjxtEJcBZGtBjW0Je0KuGhn6Y+rbR7O8DetV8Z1KRSHI2jjY+6m9+X1J/te9u4sP5ajqJ
	 NZfoOW10CTU+Qd1mnSlHxTcM3uVl+nXfwyBjzbub0qd8wX2rwk/tT8kNbeKtdRGjT2NWS
	 FhojumTXfzJ4hMpRs6uWxuvVKgNuU4DHNsWGnW1krvt2mjHp1TWLwtQkdP2dQg/sHuMNc
	 GVLNJ1TETLcPIHJrhe3l1iAEKyaYGKyOXsWp7ZcyrSIQ2eyoSAUzlsxL8mqfA8l8NhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Xvj90NZO;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADF1606A329
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ADF1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Xvj90NZO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C1518C69149;
	Wed, 25 Nov 2026 17:51:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C492460480;
	Wed, 25 Nov 2026 17:51:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16CA211E6B0C2;
	Wed, 25 Nov 2026 18:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NSVFwobbVS+kCFYlT7jJw4a90W2mwlRdcZOgwxJZDjc=;
	b=Xvj90NZOjovPN9vPRfnQJgKIl11B7lHWDG49Iv3SgSbmjrbDkrm0XAVu4ewjF13Z4ohmwd
	p8eUVPvzW2iczDIcAokJYiH5gsM1Ao4LEBK25MXa+kvI8U50G/qU9RLN3D2bUG7RUrE7IN
	cFvxGGlknMApLv4rKMi/X9Sd/RFLBOaVaVOPeYcLBZ7xAbWbz1ENrrog7j0YWr/PhKgUHz
	gzL2uvN/k+Z9kW2Wj5HNTQlnDpJrR3PKvKhEL7d0CQ73h/MhMWNuw140C74CokJAbsN4hr
	IX/yDYIM9bXzzXyAT/okiQ9C6YpFF3AUDJy8n35c7tPxYYXPkMKSdH86rJ56hQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:16 +0100
Subject: [PATCH v4 03/32] drm/display: hdmi-cec-notifier-helper: use drmm_
 prefix for drmm action
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-3-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

For bridge hotplug drmm allocations are not suitable because a connector
may have to be added and removed multiple times in the lifetime of a card.

In preparation to support hotpluggable HDMI bridges (and the
drm_bridge_connector) we need a non-drmm variant of the CEC notifier
(de)registration API, with an explicit unregister API.

To differentiate the new explicit unregister API from the existing drmm
cleanup action, use the drmm_ prefix for the latter.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3.
---
 drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
index 31b8e4a93e24..47662bdc5d08 100644
--- a/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_cec_notifier_helper.c
@@ -25,7 +25,7 @@ static void drm_connector_hdmi_cec_notifier_phys_addr_set(struct drm_connector *
 	cec_notifier_set_phys_addr(connector->cec.data, addr);
 }
 
-static void drm_connector_hdmi_cec_notifier_unregister(struct drm_device *dev, void *res)
+static void drmm_connector_hdmi_cec_notifier_unregister(struct drm_device *dev, void *res)
 {
 	struct drm_connector *connector = res;
 
@@ -59,7 +59,7 @@ int drmm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
 	mutex_unlock(&connector->cec.mutex);
 
 	return drmm_add_action_or_reset(connector->dev,
-					drm_connector_hdmi_cec_notifier_unregister,
+					drmm_connector_hdmi_cec_notifier_unregister,
 					connector);
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_cec_notifier_register);

-- 
2.56.1

