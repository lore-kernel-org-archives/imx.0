Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59833BB40
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907963; cv=none; b=i5O+6GHn6v6aYkW0kAbkYEYUvUhWs+5G6Lo3wHyUmc70qNBMa1eCkvgqa28nZrlxaS3KB6+sabXkAboz53Z2JfiLGODTXk5w3lcSKU8z0i6zYfST8e+VJadFpPuCUeSPDOFpDP47RHbKjppZKh5Xlf6CGMoIzTIHEX5LlWmdFrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907963; c=relaxed/simple;
	bh=SCUB7kNEG4wvG4hAUvKVY59dz9e9yQbxFRjekBjCRKA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TFmteqBp+K7mViVC5I1znrjB8m+QW823Cne/SIMkkxJukTvW5/NzXYpBWPHpINPSEDr+rMsmOzqztj4/N+7ojc8ZtwxWMd2iT4jL9hRbzkGM0tjkFabyPNF3ziXOYXnH8E1aqnkjUe2z3p0r9B4lKVrsGc7TezaPNUxL0VMJdwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pgUXcONW; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pgUXcONW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7AAF2C1A582;
	Tue, 16 Dec 2025 17:58:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2E7C6071C;
	Tue, 16 Dec 2025 17:59:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C05D119A97D5;
	Tue, 16 Dec 2025 18:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=s7w+5SWbQVcRFbUEI9luJAUTgulTAYAv1ba1KENKvHk=;
	b=pgUXcONWZp7w8xihJUPrVDo+CI940yhxtiQ5kP43628fm85Aw3HiYD3x+Jue9I+tt5+1J2
	p9sXppHnT8HkLTqlCjPqVItv46ltrLHJ29z6cpztNA810+ikcHbaTllz5it2d5Cqfzg01E
	ShOvjQK1UFngVwNKutdSpvISJ7e8YLEYH6293QDjCxaWf9iVUut5q9RUjNSV5bfiRETh3i
	6PbkWCJG2JgC5LwmcIt0Tytfbzkbo9aiTzTvI0WwMpzReOGoNYUY24WIpiVABhKI7pUbNZ
	bapMJ1HPvEywoxkgvKmWBfBwWuF3eqQvhfuIwCLR7Yz0Zz6qcZzfjhhrzp2dBA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 00/22] drm/bridge: add of_drm_find_and_get_bridge() and
 a managed *next_bridge, deprecate of_drm_find_bridge()
Date: Tue, 16 Dec 2025 18:58:33 +0100
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMmdQWkC/5WN0Q6CIBhGX8VxHQ2QArvqPVpzKKD/puKQWM357
 qGrrS69PN+3nTOjyXgwE7pkM/ImwgRuSJAfMlS3amgMBp0YMcJOlFKBte9x5UGnR3Wdq3Fjwvg
 I6146W1oYdPn5BS9Inp8F51KjJBy9sfDcYrd74ham4Pxra0e6rt9MsScTKSaY6KqQSljDBb9Wz
 oUOhmPterSGIvuRM7lLzpJcSisVJcLUiv3Ll2V5A8LcJjtDAQAA
X-Change-ID: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This series deprecates of_drm_find_bridge(), adds a replacement which
handles bridge refcounting, and converts some of the direct users.

This is part of the work to support hotplug of DRM bridges. The grand plan
was discussed in [0].

Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. ➜ of_drm_find_bridge()
          a. ➜ add of_drm_find_and_get_bridge(), convert some direct users
	  b. convert other direct users
	  c. convert bridge-only drm_of_find_panel_or_bridge() users
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
    B. … protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t

Almost all the functions returning a struct drm_bridge pointer have been
modified to drm_bridge_get() the returned bridge, and their users updated
to drm_bridge_put() it. See items 1.E.{1-6} above.

of_drm_find_bridge() could be modified easily in the same way, but it has a
lot of (direct + indirect) callers, and most notably
drm_of_find_panel_or_bridge() which is very hard to adapt without reworking
the panel_bridge lifetime.

This has been discussed in [1] and Maxime proposed an incremental approach:

> So maybe we can just create drm_of_find_bridge() that takes a reference,
> make of_drm_find_bridge() deprecated in favour of drm_of_find_bridge(),
> add a TODO, and call it a day. People will gradually switch to the new
> API over time.

That proposal is implemented by this series with the various changes
discussed after the initial proposal. Some of the direct callers are also
converted: a few of the simple ones plus two complex cases. One of the
complex cases also shows how to use the .destroy func when the next_bridge
is not enough.

Follow-up series will:
- convert remaining direct callers of of_drm_find_bridge()
- convert simple cases of drm_of_find_panel_or_bridge()

[1] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- Completely rewrote using the __drm_bridge_free() idea to prevent
  use-after-free of the next_bridge for the common cases
- Added needed cleanups to the imx8qxp-pixel-link and imx8qxp-pxl2dpi
  drivers
- Removed various patches converting simple cases, to reduce the number of
  e-mails sent; will be moved to the follow-up series
- Link to v2: https://lore.kernel.org/r/20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com

Changes in v2:
- All patches: renamed drm_of_find_bridge() -> of_drm_get_bridge()
- Various fixes and improvements to patches 1-6, see individual patches
  changelog
- Removed bouncing recipient: Edmund Dea <edmund.j.dea@intel.com>
- Link to v1: https://lore.kernel.org/r/20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com

---
Luca Ceresoli (22):
      drm/bridge: add of_drm_find_and_get_bridge()
      drm/bridge: deprecate of_drm_find_bridge()
      drm/todo: add entry about converting to of_drm_find_and_get_bridge()
      drm/bridge: make of_drm_find_bridge() a wrapper of of_drm_find_and_get_bridge()
      drm/arcpgu: convert to of_drm_find_and_get_bridge()
      drm/bridge: add next_bridge pointer to struct drm_bridge
      drm/bridge: ite-it66121: get/put the next bridge
      drm/bridge: imx8qxp-pixel-combiner: get/put the next bridge
      drm/bridge: simple-bridge: get/put the next bridge
      drm/meson: encoder_cvbs: get/put the next bridge
      drm/meson: encoder_dsi: get/put the next bridge
      drm/meson: encoder_hdmi: get/put the next bridge
      drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers
      drm/bridge: imx8qxp-pxl2dpi: remove excess error message
      drm/bridge: imx8qxp-pxl2dpi: imx8qxp_pxl2dpi_find_next_bridge: return int, not ERR_PTR
      drm/bridge: imx8qxp-pxl2dpi: get/put the next bridge
      drm/bridge: imx8qxp-pxl2dpi: get/put the companion bridge
      drm/bridge: imx8qxp-pixel-link: simplify logic to find next bridge
      drm/bridge: imx8qxp-pixel-link: simplify freeing of the remote device_node
      drm/bridge: imx8qxp-pixel-link: remove excess error message
      drm/bridge: imx8qxp-pixel-link: imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
      drm/bridge: imx8qxp-pixel-link: get/put the next bridge

 Documentation/gpu/todo.rst                         | 16 +++++
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  9 ++-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    | 56 ++++++++----------
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       | 63 ++++++++------------
 drivers/gpu/drm/bridge/ite-it66121.c               |  7 +--
 drivers/gpu/drm/bridge/simple-bridge.c             | 15 +++--
 drivers/gpu/drm/drm_bridge.c                       | 69 +++++++++++++++++-----
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  7 +--
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |  7 +--
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  9 ++-
 drivers/gpu/drm/tiny/arcpgu.c                      |  5 +-
 include/drm/drm_bridge.h                           | 16 +++++
 12 files changed, 162 insertions(+), 117 deletions(-)
---
base-commit: 441223656cd43291f4f8277ab98fd3e9e61eeb33
change-id: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

