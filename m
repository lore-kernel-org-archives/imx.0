Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ADF28CF69
	for <imx@lists.linux.dev>; Fri,  1 Aug 2025 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754067951; cv=none; b=OoN7ySja6sjNW92zXwZR9cteHv8qAYrw0/RjJ07J++lxy0Gwtf4pbEbk5HouaQ3IWaGlSAnD80MAqyrxfRdb+dUxtVOshQDr+uOaAbNQ6PBq1XCRGNvs7X1+bHm8Dn58wugulOEAWFJU8yz0nROo5oIQJjBXW63oxhPggDANF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754067951; c=relaxed/simple;
	bh=1wr4pY14Qj/rPk9kE44VPUFNzqhn6DC/DOgNWyn6Pag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAg61B8BLWF7N4qVji7ZeDtwi5yYtooscl5ypcwdvlAZiSz/HwjkoSxtnyxqxPzYMehUTpu4l/eaH2kUD9WetGFuuySHGPJ7G2q/eyzAkX6bs/VigKxTpEkqo+OmMJJFQ5tKhfofmNPkExEv922olivzAm7xL86ZETtcjqAtync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pIEkt1tI; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pIEkt1tI"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64C054422B;
	Fri,  1 Aug 2025 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754067948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VUbWo+HM/+5fZzrD1h8tncqWns2kiFAltInydiNDyQw=;
	b=pIEkt1tIgtIuAOV+uyZSK/B2X3qrnkAvkdgBR3hVAyjnHsg+2/bGz4iziO3mtGnVRWSzRb
	SDjpiGli2i6K64kfsSl2Y8uQ0KgBATVJL0SGcwuhHKAUj1Hv5An/DWg2B3IHhSQ5V/Dbw+
	MYrZ9MfQOGb8OitCySAf5FfKBLikr36cggWZ5/QOM3RjBBLBMrkBpQ+WnadxpSYKidX56H
	MTjUbrSkoIm2S6M0wkNfVRQDcUs2J0EW5V4FPr5BeW1Phz6jb46sDQKMWJZsYMfkEYTVkF
	tlAXVzM1whjJdZUcgMFa436TCsVEKqEGsNhvsY1qZCz7mZbGcRpwiGyPMWXnDA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 01 Aug 2025 19:05:28 +0200
Subject: [PATCH v2 6/9] drm/display: bridge_connector: use
 drm_bridge_is_last()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-6-888912b0be13@bootlin.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdegvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphdriigrsggvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm

Simplify code to know whether a bridge is the last in the chain by using
drm_bridge_is_last().

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 51f30307d445e5ce1345d11cda391f72e7323533..16cef81d9e115f177fca19fbd9d2f1aaa043a84e 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -749,12 +749,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				return ERR_PTR(-EINVAL);
 		}
 
-		if (!drm_bridge_get_next_bridge(bridge))
+		if (drm_bridge_is_last(bridge))
 			connector_type = bridge->type;
 
 #ifdef CONFIG_OF
-		if (!drm_bridge_get_next_bridge(bridge) &&
-		    bridge->of_node)
+		if (drm_bridge_is_last(bridge) && bridge->of_node)
 			connector->fwnode = fwnode_handle_get(of_fwnode_handle(bridge->of_node));
 #endif
 

-- 
2.50.1

