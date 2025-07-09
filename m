Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05834231858
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752079734; cv=none; b=lkjjsdOSGmh7jwGG/PKA2TRI8RA2sT9vvqJ+Z9d1rohgdxzcQvVfU4cje7+vN1EskLtL64GwUs4sogNrEPY9TN45R3hPI+MoIlZc/Z6GQY2WeHosFbQNdpIH4e2NGpCLtfe/gTS5mDSSq/7owoRK4LavRxSiv1BHdPALWPPxYMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752079734; c=relaxed/simple;
	bh=wvGRxb0UUwJ+V0T5hdnimzGPwA1MPy9erAlbUlFe6d4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoKzpT9iuckYRAi45elM89LusJhZ8kCj+xX1fRHHIbQ4FgcWEL5ai5AZ4hP7R7cNMROphLD1PSk2pHA6TviWsgDJJCQCN5mTetv5GUDh8i+7oC7cpUkEJc7XYtloOPgfFdpYsKmyEZnF1WBN1ofgOHtK7DLtt2YXAwiC9lVHsrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RVNBPnjD; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RVNBPnjD"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A0D144479;
	Wed,  9 Jul 2025 16:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752079731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmZt4ZatQt1QqdraJhsr036GH0ECWNW4Inh1COYLPgI=;
	b=RVNBPnjDkSwsRvqY83r+lXRKhCv7yy558oV8mojizx2H++eGvdWHeNpkdtblC0Ewu0Wzu8
	214SmRNyvvwW653I9ncqCsbeOAyXBRsL91M6+RneHw0IUJb0925ugo9ckbYN3PD9HyQWeW
	uUDiwYcMznNgayNDhfac3ACtyRE/0fMenyv/667dpff8X3PyF825zVYYxvv8OPLT3Hp4u5
	AS4owRIEn2n9jRWVQ+Z7SrlHethK6P/F95PEmliJiro6GR1lCeCshUffreTmmUG63MEgY7
	DBb5ZqiPLK+JNnBI9Fo6yb+KtZylobEGXb/kdBW2Pmful4ajySedu9uxviD9EQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 09 Jul 2025 18:48:03 +0200
Subject: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-4-48920b9cf369@bootlin.com>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegludelvddrudeikedruddrudefngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehvihgtthhorhdrlhhiuhesn
 higphdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: luca.ceresoli@bootlin.com

Use drm_bridge_chain_get_last_bridge() instead of open coding a loop with
two invocations of drm_bridge_get_next_bridge() per iteration.

Besides being cleaner and more efficient, this change is necessary in
preparation for drm_bridge_get_next_bridge() to get a reference to the
returned bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 054b71dba6a75b8c42198c4b102a093f43a675a2..3bbcec01428a6f290afdfa40ef6f79629539a584 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -378,12 +378,12 @@ static int omap_display_id(struct omap_dss_device *output)
 	struct device_node *node = NULL;
 
 	if (output->bridge) {
-		struct drm_bridge *bridge = output->bridge;
-
-		while (drm_bridge_get_next_bridge(bridge))
-			bridge = drm_bridge_get_next_bridge(bridge);
+		struct drm_bridge *bridge =
+			drm_bridge_chain_get_last_bridge(output->bridge->encoder);
 
 		node = bridge->of_node;
+
+		drm_bridge_put(bridge);
 	}
 
 	return node ? of_alias_get_id(node, "display") : -ENODEV;

-- 
2.50.0

