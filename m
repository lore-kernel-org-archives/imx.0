Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0895B22422B
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 16:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752079751; cv=none; b=iVrCVUf8GB4okXvIvkcLWp4/dD1u5MtshdRZ2T7AyczGcUFbwLw3GaxR/kCF7xCDHrZCj9zgydKCuHGvOuYxMTNDK00A44kpQJWPSi4HSJU2ZWWzKAxQqS+L7R2dhjKv50sfgbKyJ3zDBqCAI/5foMzqKUzWFnTYrjQkwRpM0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752079751; c=relaxed/simple;
	bh=RPZLdfYiyvbwas5HPphWI6cLrEqp6AODAtGRXn0W1OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfkPnVBuhbA1EGVA1V+SKnCJxS00NZ86dEndEQEtifupDP90oGgwK+csnr9Z75PR7LKSFlmJ+wUajlpjGcA0goeijfgxFGonF8K2tHfVEKdch8F9zPGK9gjNUFprdkT+0lB6SV8R2N6WaNdxucd+TXiII6S+7dovzri9oDHvUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OlONOBfv; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OlONOBfv"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DA7042FF4;
	Wed,  9 Jul 2025 16:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752079739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vZUmY/4i27bu8sw/lSpf4W8qmkyZYrjeB6qHgDMMI70=;
	b=OlONOBfvVU8eqvMakfqazww0v79CWN77tNIX13ZaIpmhAk1J2yQ7k0DVLUFHAEuDw7LiBU
	xjO5gbEWiO/VDglUIaEByyIsC1zCWQcXDKZ0/iXmeDKwBsA8WAbSeOHRzt2o0Sd68JWqv4
	sz+6ggFQaSXogscexzaN0dDMKEELthzk3OcAAE/Fmx6OJk1DpR1wdEUHSq421dQpuD4gff
	qUGfp/swmpVtPbORevdNr8/T2fGZI2Mry+ZQuIwg8IBrz1934p8N1uKVkQ4RBgs6vo3Rb1
	6NhE465/JN7BBXB3R+rTzdRDYhsXD178bockYQpPFFwzmxPoWqnwuIEsuAxWSg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 09 Jul 2025 18:48:07 +0200
Subject: [PATCH 8/9] drm/bridge: put the bridge returned by
 drm_bridge_get_next_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-8-48920b9cf369@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieeiuedvffetgfeuudelheeutefggfejieettdetteekueeuueeukeevvedvueevnecukfhppeekjedruddvtddrvddukedrvddtjeenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepihhnvghtpeekjedruddvtddrvddukedrvddtjedphhgvlhhopegludelvddrudeikedruddrudefngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehvihgtthhorhdrlhhiuhesn
 higphdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: luca.ceresoli@bootlin.com

The bridge returned by drm_bridge_get_next_bridge() is refcounted. Put it
when done.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0b450b334afd82e0460f18fdd248f79d0a2b153d..05e85457099ab1e0a23ea7842c9654c9a6881dfb 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1147,6 +1147,8 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
 	} else {
 		next_bridge_state = drm_atomic_get_new_bridge_state(state,
 								next_bridge);
+		drm_bridge_put(next_bridge);
+
 		/*
 		 * No bridge state attached to the next bridge, just leave the
 		 * flags to 0.

-- 
2.50.0

