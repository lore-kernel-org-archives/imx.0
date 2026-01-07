Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A150C320A20
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791619; cv=none; b=Qo0ZLgvfYZmZWU/kGbg0k/sMw4FldUqz8hpwKNrv0zOqqL+pnViFNHcmyNN3BiVHeOHVPYFwLNVqd7WRN+A9rLfrOkJ8mI0q5ANKiWvehT9Iql82dhvmr64atpJT6hZ/eiW1hnDgE7B0gbp0nFMHMM1VE13WUoyn60Pd5srobfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791619; c=relaxed/simple;
	bh=e7OuU5PQTDxxyGryoJlz9nFTc75MzS+uKYedGlzdWZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEcnSbG8i8/aWzVLr+YjFLvgDXGlEeDB0oIugssNujeCWAAhm6HwNNhfneaBCl6thM+yYY6ZitqLcOJ7cHTfE74RhQd5sDhCso8m5cWdme+v/w7C70q6u3AHbNaFHTxYa8GNsOZlRNfqredbY1kvepJ15d5bOvCb5qpgloTpQnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U4Knzitt; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U4Knzitt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 46DF5C1EC8B;
	Wed,  7 Jan 2026 13:13:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63E39606F8;
	Wed,  7 Jan 2026 13:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB669103C821A;
	Wed,  7 Jan 2026 14:13:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qD3g6EnD8+rcSwnk3c6GZ/METpYqJBufhGXSRbaDSWE=;
	b=U4Knzitt5PLyQhIm35aPNRNQjblPaBg8FX2aqGtdsEeHi3qTJWdo9U1wf+xe0cgUEsnhQQ
	Uu3uf4/xT6JYYwUE3fJi2S7adFqBqKL2occnkU33mNx4g0RT/5PxJ++MWt3UJplWMihusp
	vfyB8Y6Mw1nmBa3uMBYYeuMgnUP9DsVuIK+On4aeYRpPbBVY4SxXvrcXm3iSBEOpqyXQFp
	iorKDMm4BRJMk+qqcr2DjKWuwHR2/kJfrDGW/UTtBbD/pKlJjI35q+q6HHQHFBD2t4v72r
	v/JoOeBuf14FdeKDQU4gcG4AzFcJ8vmAd7uMKChPzsuGxuHKfoMGdoKy3s9cCw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:53 +0100
Subject: [PATCH 02/12] drm: of: drm_of_panel_bridge_remove(): convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-2-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_of.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index f3e55ea2174c..f2f2bf82eff9 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -171,9 +171,10 @@ static inline int drm_of_panel_bridge_remove(const struct device_node *np,
 	if (!remote)
 		return -ENODEV;
 
-	bridge = of_drm_find_bridge(remote);
+	bridge = of_drm_find_and_get_bridge(remote);
 	drm_panel_bridge_remove(bridge);
 
+	drm_bridge_put(bridge);
 	of_node_put(remote);
 
 	return 0;

-- 
2.52.0

