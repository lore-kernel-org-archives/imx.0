Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E18121CA00
	for <imx@lists.linux.dev>; Thu, 20 Mar 2025 15:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742485362; cv=none; b=Qr5T/MaVvSddLlRnViULr12lm0FIkozJflwF6TNryVhbqhOCs2wXm0AT7UBfMbdGE0j5bGE3x/X+ZkqMgxnrQmcg2ezmFCAcNLliPYLzzmKiA866z/E+qzrNbdaZuXVQ9dtTL1dfvw9hdMM8CwPcfwapL0fgPqq/oKym7Ryqq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742485362; c=relaxed/simple;
	bh=h/LzKZbNTgj+gZc92rlcauCerhCDhQNVV9eF+GpfrE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlqRHcYRygpOvc6SZEykvizcMmvY+3X9llZZSmoPwgMdkjy7DwCvPf7Rd5hzyXsOExmrbv/+yIk3rGSCF6x7UI5yR/jMNHxGplx34+KrQYFZqafSL0LKycGzaMkJgNH/yhdH8bb1ReSN6Bordl7bjAe11LZBetodz8O5Hmkiz28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BOwk98/T; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BOwk98/T"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E2B444417;
	Thu, 20 Mar 2025 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742485359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyBNDLsArbdd7WHk93rkhCfp9ThfO49YHtAhELFf8JY=;
	b=BOwk98/TpGkOxzJx4oiUhpGhy8r0YMvaGQJYOINSzpbd20HMenb3xP12VjS//hVhI72Iam
	t9Dpvqpn8S9iRISG6Tg5phGO/QXvlbJB2vfZGxLCXG957uZvZcbWhedktWUQnkjPAoXxIs
	HkQAv1VRQ7IgMzM3YKaxo4NQO0jqfvwhuwPuz9VTzVxZXedGBuvGeTx06uh/oLs4vzRkd5
	JxTYtaW0T0J4NlVjtMed+UKicoT37q+vyPsn0wG71dm+a7wyCghXMAbpy1ZMeukJ1pdC8t
	Qkzr8akHHSnnpISG93yuGxJDUJ54W0Ipu4fHEWwA6kW7Ab289RadMxvwAhSdfQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 20 Mar 2025 16:42:12 +0100
Subject: [PATCH v8 3/5] drm/bridge: deprecate old-style bridge allocation
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-drm-bridge-refcount-v8-3-b3ddaa9f1368@bootlin.com>
References: <20250320-drm-bridge-refcount-v8-0-b3ddaa9f1368@bootlin.com>
In-Reply-To: <20250320-drm-bridge-refcount-v8-0-b3ddaa9f1368@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehimhigs
 ehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

All DRM bridges are now supposed to be allocated using
devm_drm_bridge_alloc(), which is cleaner and necessary to support
refcounting.

Deprecate old school allocation using kzalloc and derivatives. In the
absence of a drm_bridge_init() or such initialization function, document
the deprecation on the first DRM bridge core function that is called after
allocation, i.e. drm_bridge_add().

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v8.
---
 drivers/gpu/drm/drm_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 2f2ecb73308e601b1a53ec8e7110933cef59b5da..17659b1cbdeae04e10b76f2aabc8ebba65c4f6e1 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -295,6 +295,10 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  * drm_bridge_add - add the given bridge to the global bridge list
  *
  * @bridge: bridge control structure
+ *
+ * The bridge to be added must have been allocated by
+ * devm_drm_bridge_alloc(). Old-style allocation by kzalloc(),
+ * devm_kzalloc() and similar is deprecated.
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {

-- 
2.48.1

