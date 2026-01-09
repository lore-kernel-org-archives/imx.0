Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D442ECD39
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943912; cv=none; b=WjE7y62UvnUwx5/EqZD4TgRpkOCJEypi7vjg2p+Xd6c6Obcf6+SdqXs0c6FabhKETyHMRFacoJ4aQIJYBt4qtVnW/aPqlHiM3e0xHujXKLEnaEt0yoel4vpmbJjs840b2wTgxH3Y9kImoUoSuYkJETPuFf1fFHDsx83lm0eAi7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943912; c=relaxed/simple;
	bh=pW8Rqlf9CIE7RE0N7FuyghveRIlSbCH8G1NmOkF9Fkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCp2cCeLWY2gfNQ8mCozUhPFKskwq31YtvbCWP2I4sioGJyL9hvP656Lsv6Jqp03JI6ehXXhgP9Wqr78iMyR8zRMxbx5DHjBforCk/FGdNiQVx9SJntAM8d8zWSYCD/nigjLVqYC5IdjOEUOuc2tFEt0wjhwV7Gx41S1uzvcwgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jABOhxKZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jABOhxKZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 859DB1A273A;
	Fri,  9 Jan 2026 07:31:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5418060734;
	Fri,  9 Jan 2026 07:31:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2901103C87F9;
	Fri,  9 Jan 2026 08:31:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7G0VQZhCL0E1RG/9vT5q4DhtmO9Jz5X+7mGnytpns6k=;
	b=jABOhxKZYevXq35Y/dw2OauCpOzC4O5PvKI4NVE0SWcsexbyfyRaVjJEYfkRcMOwLrsmmc
	JZsZZPMU/tn1RZ11AeFV8wudEjS0FpNduTmCweyYhIkpHZhJ6Eqj2YAzo7y3tpHyMpO4YE
	lf02ZwqPTxUlrPRJYx7USyhoZDAaBgqH6PjXGbMgb0ZGuWHclq6JKI+OXUdiyPMtc8YV7l
	sMbWc//+lnblF9FnL3mL3ARa2rq3yVQ5ZdEL3l30W+0O2P5acKrZd8YvanmZS8E0MAlh4B
	G0CYNTSrWZ/AqT+N+3Ve0DGrsyljbGn7k5/X8BP40arYYyIZ5oRMhZipOEXDPQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:32 +0100
Subject: [PATCH v2 01/12] drm: of: drm_of_panel_bridge_remove(): fix
 device_node leak
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-1-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

drm_of_panel_bridge_remove() uses of_graph_get_remote_node() to get a
device_node but does not put the node reference.

Fixes: c70087e8f16f ("drm/drm_of: add drm_of_panel_bridge_remove function")
Cc: stable@vger.kernel.org # v4.15
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_of.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 7f0256dae3f1..f3e55ea2174c 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -5,6 +5,7 @@
 #include <linux/err.h>
 #include <linux/of_graph.h>
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
+#include <linux/of.h>
 #include <drm/drm_bridge.h>
 #endif
 
@@ -173,6 +174,8 @@ static inline int drm_of_panel_bridge_remove(const struct device_node *np,
 	bridge = of_drm_find_bridge(remote);
 	drm_panel_bridge_remove(bridge);
 
+	of_node_put(remote);
+
 	return 0;
 #else
 	return -EINVAL;

-- 
2.52.0

