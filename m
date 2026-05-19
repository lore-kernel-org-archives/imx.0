Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4693A1A38
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187101; cv=none; b=csfxOwXu2xohjXOwPZGeG7AF2Vd27XGtWO48OSHRAwOUD9KCWSZcWfpkSmedbZJ8frK4OkOiy43Qexd4U9x1qC1j9uO1E4As5RYRqeFDCQZk/9fIxhubirZs0IEO02MFzAOIhtUqyNRD8sY1qW/g0HswNAa0+qPetl0Bi2Xf2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187101; c=relaxed/simple;
	bh=qa0OFXjHmmzKFPRmIR0Zm2i2uzdIC0kuazb1S7D17vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PgQrKmxedjJ9Z6jPCl9jARm6bztrEvuBIthHZwOfOOdwz3M7WPJjKvqTntHVkVciT6SWKZpeQ4xUHNvGNV6AW+BZs9X4XF95iho3LOwMbNxzsZfVjs14MSxRCpfcZ6fEgx1lKAs10YbUUZsdP06jBWHyWnNGl0FBUfUpT7FUIso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fl4SN8gA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fl4SN8gA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB4581A3627;
	Tue, 19 May 2026 10:38:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88012606E9;
	Tue, 19 May 2026 10:38:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E6BD107E8AC3;
	Tue, 19 May 2026 12:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fRIgFduSx5LrCBKqsod6YR/tv16FPuPFSGj6OkltIK0=;
	b=fl4SN8gAWvj/PAiytK2mcEd2traVpn5cG4m+z9kQKTNCNDfgWVHadA/ResQaAPMBDhSf2a
	2fcKYgI8FG4j2mS/8mivgiNk2FGbRzn7YJhQ/FYmvJTAtl9MlKS9Azt+aY7Z5WYYPYF6iA
	6y1j39oW/ih8WimyqqcBX9t6mZwHjaeV81Xv58upXqf3DR1ufWU4A8hi1rpEnepdec3/zi
	sOUhea5qCZrzitRgzqn5ugyewn87IguREaVbkLxu+iI+X9rk+5wmp/wa5Yh6cSZIZkCbRk
	DvmhUpAML1cXNeCUw/gYfGdVZj01oNQwMsqGO6OBLdrB6kdyPCYZEocOYFhJ1g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:20 +0200
Subject: [PATCH 03/37] drm/display: bridge-connector: rename variable for
 consistency
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-3-45e2bdb3dfb4@bootlin.com>
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

All struct drm_bridge_connector pointers are called bridge_connector except
this one. Rename it for consistency.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 649969fca141..bf9b8a6bca78 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -153,10 +153,10 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	}
 }
 
-static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
+static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *bridge_connector,
 					    enum drm_connector_status status)
 {
-	struct drm_connector *connector = &drm_bridge_connector->base;
+	struct drm_connector *connector = &bridge_connector->base;
 	struct drm_device *dev = connector->dev;
 
 	mutex_lock(&dev->mode_config.mutex);

-- 
2.54.0

