Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A97B2F39C2
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114945; cv=none; b=Kx0sRNJ8YfaaeFIr/1UQa57E+G8ahSqB6UDmP/ouTTtadJ7RTeUD1ecGAAa5Z/F8iFhBvblvvbaoco7QT8keYd+CS6fDRdrP6KLwKAtxC2P5ko64MxcUvg/9dFJ06w6ZJ6+M3LrJjlaqlDxIGXN07KH/H6CoaJPxllYYIz7i19o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114945; c=relaxed/simple;
	bh=V/TFnWBnaq0QUbJ4rlu1/nT8pMIJRhCmFowvUBFqT5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YHRe7g/LrbCUtdQvKQHALspdnEw7J6281nv98yblugN4GZJav8ScjAws8xYXAU9g6IXmRH71FD4thr9muT29fvPbFJ2JNB1Hil7mpdgXkVUlwIr5MjDaULXqMMYCG/2btth9DVjlmfEABZH6n8LGh2q6NrtVNuxalQoIRJxiiew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CHWLALww; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CHWLALww"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E68F71A2BB6;
	Tue,  3 Feb 2026 10:35:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B938F60728;
	Tue,  3 Feb 2026 10:35:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C0E0119A8888;
	Tue,  3 Feb 2026 11:35:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770114939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=bRfBR2ihr1Hvugw6vtHQLI0Ym/lkBNhBRCmAfREIyxE=;
	b=CHWLALwwA2F5W2UxPktS6mEnQMxcVu4RX39BagTkuj/jK2nchiKFQjS810l9U+vr0iGF1L
	tDlprtqF4vq0anoK7Kxkddos5DULV1Y5b85Vu3FYHVOx7jeYMcIYYY1lB3G9pcmIU8McDp
	iglo5d+8XB1svWRBGcUOlm3OR10eOzNZVObDG7scU2pnAcyzGsNSB/B8Nh2Tu0Vbz7c3E2
	lga4RG/kd+j4rlEUQ/TBHWopnMeSijDwNbT+KxOFknzC9ld+Mhx1PitjJtm/HgIJiI61I3
	zLGRi5AyHLJA8/HIuh4D4roTAPwX2ZN6KPXAsffCfrC56+X55j9AMdt0/e/9cQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v5] drm/bridge: add of_drm_find_and_get_bridge() and a
 managed *next_bridge, deprecate of_drm_find_bridge()
Date: Tue, 03 Feb 2026 11:35:24 +0100
Message-Id: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGzPgWkC/5XOy2rDMBAF0F8JWldF70dX/Y9SjGRJyYBjBdk1L
 cH/3nFoaEtWXt47cO5cyZQb5Im8HK6k5QUmqCMG/XQg/SmMx0whYSaCCc05tzS1M40NEl7CMNS
 eHvN8+Zi3vqulKzCm7udulWdSGquUSwTBS8sFPm9jb++YTzDNtX3dthe+tfcZv2dm4ZRRlqJ3w
 ZasrHqNtc4DjM99PZNtaBF/cOF24QJx54oLnNncB/GIy19ccLMLl4hHzY0uITqm3SOu7rhh+MA
 uXCEejIhKeh9MLP/xdV2/ASz84Rj9AQAA
X-Change-ID: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15-dev-5464f
X-Last-TLS-Session-Version: TLSv1.3

This v4 contains the leftovers of the v3 series that deprecated
of_drm_find_bridge(), added a replacement which handles bridge refcounting,
and converted some of the direct users. All patches have been applied
except the imx8qxp-pixel-link ones, which still need a review for the first
patch.

@Liu, patch 1 is waiting for a review and it's non-trivial, it would be
nice if you could have a look at that one at least.

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
          a. ➜✔… add of_drm_get_bridge(), convert basic direct users
	         (v6.20?, one driver still pending)
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v5:
- Changed the only remaining patch after Liu Ying's requests for code
  readability
- Link to v4: https://lore.kernel.org/r/20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com

Changes in v4:
- Added review trailers
- Link to v3: https://lore.kernel.org/r/20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com

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
Luca Ceresoli (1):
      drm/bridge: imx8qxp-pixel-link: get/put the next bridge

 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)
---
base-commit: 4a0f7d0f51c0965a8a394a8c5d65be2d24e362df
change-id: 20251117-drm-bridge-alloc-getput-drm_of_find_bridge-74903367448d

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>

