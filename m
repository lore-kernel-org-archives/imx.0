Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020629;
	b=USLNgZUp1Cs3YSF4dSwMI3jYTROK2Xnu8fOKQeKQi3EECSRoXU/ECMpdXYzTCCNHC4gT
	 zrctKOcV4Arc3clAvXUjvSiW9XTd++PVh/WnDF/o/8pYI/P9hPOsnoBKVTcWmi7ow+9m7
	 hfpthrxO3+tnWJHphczdyFGkwqXZEHbA2qQ3RqUUsdGF4apX9OXtQwWgGN5FU6seQzXnR
	 Dfa+HGBYmRlRF7SYVrxwp79JNF7winxPtNvbkKlal5twSotjTyAQIYhg4eE34vwVbxYMK
	 C7LKZ7neLhBD11612flxJg3c8T1bAm/cn1XDzHbjFoDYOutC/Viy05y5uVbY2S5uSaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020629;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=NSVFwobbVS+kCFYlT7jJw4a90W2mwlRdcZOgwxJZDjc=;
	b=J8kZzdK1FDWu+e8o9/aS9fpydXrYNNS0BdqJE5vu4QxAsceu6TmNt6yTh520ypdQzAhf
	 o5KMbEWqggNvaoq0fafVoiQM+pzSVcFXlmYACn31nJJwGi52QWW8ASXSXOFPECIE8nM2g
	 MnM479MSJdV0kMGGzvJxmN5raZ8ug78k7KkYCr0ty+kTE1p07dBSAJP1VYHxy46ExecSm
	 Q8Os5DVaP1rYy+MQoBMC2hkXhsIu67sK9dE1YV+02+1CeI6+hKwULdBW7KnqegXVZNQU7
	 Z+9g25TfEc/w1d1YxRine+pdOfbsnFXkQOfFiKlmuAXgb/Ev+Zjnyrm49JLWUHh5QHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yE9i9Pey;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D20606A325
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D20606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yE9i9Pey
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1237A1A16D4;
	Wed, 18 Nov 2026 16:50:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D67835FE9B;
	Wed, 18 Nov 2026 16:50:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4AD211BC278E;
	Wed, 18 Nov 2026 17:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020620; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NSVFwobbVS+kCFYlT7jJw4a90W2mwlRdcZOgwxJZDjc=;
	b=yE9i9PeyOMDUmzbeZzk28oqmmJ5cs09gATHb6NlL0c52HpJSZaeLZMOQ4qkqHD/h1rarJx
	r4E7GwIPvkJmNmWbaHe1LFnIDV8DAyGV8c9a1SdBlmhVh+RKFzzUBBHjbPvoPLkQuHDhao
	nyRdY4jlb3rV7asU4kUZiszeu+ODOZkM0sVH07QgbzzfKlczyl2YCQvxye+q95vKpfXQ6d
	+G53RndSN0kZj0iHCkBdbLbm6cEFLLCS1zAe51D/65Yw5+GUE9KeGbIoAWDMVuRQRsg2XU
	yfK716fAnXs0an85hi1GZ1PHW0vl6RrKzorNhaaPcdrMyZnh8WAhT09lPrn5Ig==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:46 +0100
Subject: [PATCH RFC v3 03/31] drm/display: hdmi-cec-notifier-helper: use
 drmm_ prefix for drmm action
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
Message-Id: <20261118-drm-bridge-hotplug-v3-3-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
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

