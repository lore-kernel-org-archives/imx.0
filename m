Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B65419C556
	for <imx@lists.linux.dev>; Fri,  1 Aug 2025 17:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754067939; cv=none; b=GVTj1VzECByHOC+ypwfmkkFAP19c7hIABRAORXePN0QuQHrDwIwET301I1fKWNZraASw6TCOCTjp8kE5HiQ/K48yrul8qHoy3Dq7nhbn2V9u1eAWIH4btAFTm1/B3zdcTCYLbSfKV3nt7CzNR6zMaSgUmcp0DOzklyUzH4UNMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754067939; c=relaxed/simple;
	bh=77LGnkqRlcQzJx7xZ4uWapnv8ICF3iNyaEBAchhFd5I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MHuZaitfEaIwY8jM4UD9ylc/Db2zIJ+lAgU2FVWoO7p/bqubDS1EQywM52PtyAeOjk2PtDo/kyw9krRG0Lfxpm0bBA+KybKe6wYgenlOPzxjpDmvkDoMvirhUNE2Jw/uuB0rBgbnfA37PAuOjzhVuEuz27o6J7LLrflweG6yNPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dYo82Kz2; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dYo82Kz2"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95A064422B;
	Fri,  1 Aug 2025 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754067935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aD/nGiCc+YDCCx8g28qn2jStr5eOipu4kAA3wazt60A=;
	b=dYo82Kz2g0XG37+HAIyUSe1wvU/3lqmUzqgOGOc9XPTUIlYZXzUXtV/IuhOsd6EoE5LdpW
	/KHotDEkI8Pixvc/6UCyqmqxp/jL9YfbkF7MacTeVxn8Lx984eyNJzCXn8MY5aQuZgUCLr
	dcjRsyaPqhVTBVy1PWbv61YJek8DpIa3MKriReGpRzPsedNf0KxQv8EvvcRab9cWnNcVOF
	JX+3ShYH+RdKUOFnrv/zqTKRvK8DvPWfkFRURGyc53X5OaCrkzauS5PYHw0nuLEFoPoP5t
	mYwc4VfRJZ7APdUF+Z3nEThkc7a61kyrWgSkuJ6xgANLoQ44Lvgn5C3IHJNNyA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/9] drm/bridge: get/put the bridge returned by
 drm_bridge_get_next_bridge()
Date: Fri, 01 Aug 2025 19:05:22 +0200
Message-Id: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANLzjGgC/6WOTQ6DIBhEr2JYlwawpcVV79EYg/zolygYoMbGe
 Pei7Q26fG+SmVlRNAFMRFWxomBmiOBdBnYqkOql6wwGnRkxwq7kRgTWYcRtAJ0TOQxe4c6k6ZV
 233x9k03jzJJ+jKm2XErLGS05ysVTMBaWY/RZZ+4hJh/ex4eZ7vavuZligi93wUgrlC25eLTep
 wHcWfkR1du2fQA+e3GR9gAAAA==
X-Change-ID: 20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-1df6aaf62136
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Zijun Hu <quic_zijuhu@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdegvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehprdiirggsvghlsehpvghng
 hhuthhrohhnihigrdguvgdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh

Note: the cover in v1 was mentioning by mistake
drm_bridge_get_last_bridge() instead of drm_bridge_get_next_bridge().
               ^^^^

This series adds drm_bridge_get/put() calls for DRM bridges returned by
drm_bridge_get_next_bridge().

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [1].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (in v6.16-rc1)
    B. ✔ convert all bridge drivers to new API (now in drm-misc-next)
    C. ✔ kunit tests (now in drm-misc-next)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (now in drm-misc-next)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
       2. ✔ drm_bridge_get_prev_bridge()
       3. ➜ drm_bridge_get_next_bridge()
       4. … drm_for_each_bridge_in_chain()
       5. drm_bridge_connector_init
       6. of_drm_find_bridge
       7. drm_of_find_panel_or_bridge, *_of_get_bridge
    F. debugfs improvements
 2. handle gracefully atomic updates during bridge removal
 3. … avoid DSI host drivers to have dangling pointers to DSI devices
 4. finish the hotplug bridge work, removing the "always-disconnected"
    connector, moving code to the core and potentially removing the
    hotplug-bridge itself (this needs to be clarified as points 1-3 are
    developed)

There are various users of drm_bridge_get_next_bridge() which cannot be
converted easily. Luckily they are not really looking for the next bridge,
but for something else, such as getting the last bridge in the encoder
chain or checking whether a bridge is the last in the encoder chain. So
introduce better functions for those users and use them instead of
drm_bridge_get_next_bridge(), making the code cleaner at the same time.

Finally add a drm_bridge_get() to drm_bridge_get_next_bridge() and
drm_bridge_put() to the remaining, and legitimate, calls.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Use cleanup action in patches 4, 8 and 9
- Fix: replace get_last -> get_next in cover
- Link to v1: https://lore.kernel.org/r/20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com

---
Luca Ceresoli (9):
      list: add list_last_entry_or_null()
      drm/bridge: add drm_bridge_chain_get_last_bridge()
      drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()
      drm/omapdrm: use drm_bridge_chain_get_last_bridge()
      drm/bridge: add drm_bridge_is_last()
      drm/display: bridge_connector: use drm_bridge_is_last()
      drm/bridge: get the bridge returned by drm_bridge_get_next_bridge()
      drm/bridge: put the bridge returned by drm_bridge_get_next_bridge()
      drm/imx: parallel-display: put the bridge returned by drm_bridge_get_next_bridge()

 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c    | 12 ++++------
 drivers/gpu/drm/display/drm_bridge_connector.c |  5 ++--
 drivers/gpu/drm/drm_bridge.c                   |  3 +--
 drivers/gpu/drm/imx/ipuv3/parallel-display.c   |  4 ++--
 drivers/gpu/drm/omapdrm/omap_drv.c             |  6 ++---
 include/drm/drm_bridge.h                       | 32 +++++++++++++++++++++++++-
 include/linux/list.h                           | 14 +++++++++++
 7 files changed, 57 insertions(+), 19 deletions(-)
---
base-commit: b13c47e0f6f5a7be56ed93d596f80eb9d8e12c77
change-id: 20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-1df6aaf62136

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

