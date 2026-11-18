Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020687;
	b=zh9qAd8S0uaiqZdlwBjBUtMtYMEdNWQho6spqp6UIoOkT7pbcvqU8i5yIqnp3Y0kduxu
	 W4/LFWds8UWSTcPr93d5JJX8kKIfIMf8U98Qg5EzB76GwIh+rooklKbT0xdT6TZZfQkJO
	 znSl4uig/8ycndWIhYHl7671ab4UmCbI5xI3a/nCMYE4xUFuzv0iNkCEdUu61DLwP/x/o
	 pg4qxV7/qSZy9hJfUAH6KaLa/jh4uIYoxcvWH3xdlB20vV4vdhp2DCgnBpupyNo308gY6
	 WmGFf7zljnWuCkak+sRIet9Yr+3oI2SE1+U9lEUsagGzPfTeKWxEDymcBXh2LwT8g6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020687;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=d35upQ/KjKfmtIlMfzNpcawpg+D1fRQcb8QyekXqnV4=;
	b=SpeGElFqvZ4yBM4h6y2iY7lz9nugAsDE5G6t04L0CbakXMbm/ZJY6zPWyTO1RNPu2WMy
	 qWmcF3fNr9aGa31rtMOctjyBw5ZkD50AcpGKbaDYZYHtaHnYqgaQTeMhJe3xkNRlSFZcB
	 nuIDNY3DVC7qbn8vES/tCTaVSKYIAuVd2+o29aomLuooZQccTUwuCYlCJ1xN6b91UhlZr
	 syfindLEyUlUq9oqdoLXtT0hrGe39vKvu6naP+Yiifyoatz6FIKmoz7vsWConh/WDfb1Q
	 oKgvPzIamYD3S602HpMpLI1QTV/D4ImJwqtpUKdr9J6DcgJgq4BQ5Qdu+ZW7QcrR6wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="a9xhLrX/";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF94D60A381F
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF94D60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=a9xhLrX/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A69984E41635;
	Wed, 18 Nov 2026 16:51:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DF205FE9B;
	Wed, 18 Nov 2026 16:51:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D6A711BC28B9;
	Wed, 18 Nov 2026 17:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d35upQ/KjKfmtIlMfzNpcawpg+D1fRQcb8QyekXqnV4=;
	b=a9xhLrX/XVThXKTotZKoL2Ibw32/JfguFaHMilaN4ZUS/W8IWzMfjYn590wUutFWfKN+o2
	tyMitVR83Gp+Ydo8Pf+QnzraMVDxzKiKekAIKGQoVoHjSr3UrnB/nRSxFU6VzcipgGhq5z
	Vnj4fW22wkcdQvuMbaNUiUFH8tczAvgVeyKQokNh/RK/kaIY/SsfIBo/iOGzNzVlIivrqC
	Xi4SrnKdaoMCcwIyI5tcu0yIOyCWNvGEjL3HeU/xRcntTVJAtz19LJKfIk0hxEAwtpxlM/
	WrOKQjqYrIKNLXtBjGgLnSff4vqL8ejQ85e8ZGr0TuyeYiBSrad0CslehQolVA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:55 +0100
Subject: [PATCH RFC v3 12/31] drm/bridge: initialize chain_node list head
 on allocation
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
Message-Id: <20261118-drm-bridge-hotplug-v3-12-44bb3b4a828f@bootlin.com>
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

In preparation to add a check to detect whether a bridge is not yet
attached, ensure the chain_node list_head is always empty [as in
list_empty()] since it is allocated, until it is attached.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 92f47dd962fc..f1a88c8c75af 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -419,6 +419,7 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 		return ERR_PTR(-ENOMEM);
 
 	bridge = container + offset;
+	INIT_LIST_HEAD(&bridge->chain_node);
 	INIT_LIST_HEAD(&bridge->list);
 	bridge->container = container;
 	bridge->funcs = funcs;

-- 
2.56.1

