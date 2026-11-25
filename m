Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629051;
	b=qj5dPhOT+JIkBpUXmrpeasHAI5336gFhkGJX1AFz1+uZKNxx9g+1h2EmqxAbJmi+5ibK
	 HLZ9GUGPWzJFLn1uG3RwT1C0QuZYwN7mH8evSOHGrkk7Tdqh8IgJf1O/iWXtkQJ34ylg1
	 2P0zbhk8m/jwiprtNbOkMu8gKNcuLSCFWTodCD8bP33vArjA/xT4wtAaA9/c8CqWK/p8I
	 jtPiUCIHXwNxa3N7I7WF3xw6q2s5tZDAdHfa7ErvORJX4wn75jgjDR/F4v33gSoP/iA4K
	 cRBnmKE7kdjjWyiVvpypD7P/Q+b1eeZ1hIJ5D0dqElQVhQjU5PZ+1N+64qy+VndVdaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629051;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=giu085QaspEnXwSjNWLtkioeYaQAEDFv7AkLSqD9D30=;
	b=y9XgsAzbAGxDBA5tmN5MQ7gYuyD8ljejhqNn5VvluVa6vM6cFiwlgNQ9mNAQJMqeZSdb
	 etX/aQvPQ1vnmgCcz9oTQg/psySnzndzQxIlf/gQtsPvWjpUh3Q8A0ZN+2MsadIVnk1tO
	 X1su3uryGMgh/M3WZW259WqNp7dtFWsEQ1dJWJ7xfPVEgB+GCVfrRC9rid0Y+0pCLXW9K
	 pkM+p7rc3wQlfJEmTvFmVUR/n+YGoDX6l1J2BeVqjo+e/29wSMFNUzQ2kq0uWGZaoYMJg
	 aJHYKyV5dmcAh31RZM/GH9cvl2CpRwR/CkPoyUz1tNCUKDxGVzNf8tJcBdEqg64Aq+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=G8Cz2uh1;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8834D606A330
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8834D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=G8Cz2uh1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 96ACCC6221E;
	Wed, 25 Nov 2026 17:50:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7928B60480;
	Wed, 25 Nov 2026 17:50:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AAD311E6B0C2;
	Wed, 25 Nov 2026 18:50:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=giu085QaspEnXwSjNWLtkioeYaQAEDFv7AkLSqD9D30=;
	b=G8Cz2uh1aBHhNH0mbYGVA8cWR35iWNumcfG5UDMuZpEXp9SmLYRJ5gKyPz8JpHCk8YsZun
	uO92OAuuu1RwXhM21/LgftS/7+cnCcQtjeSNFQPlC27spBrxhyUkGVUB/N611ofj8XS++x
	S4Z7RaWUYtnNXM+WnZqVi/BJ82rQtAIv87JkTMDnca3Rk9OfGGyyWl0GZJEAlzsVtYzuy0
	EXcGgpe/e4WovP2RI8zLR1ypHE0pzOM4cAR0uHJjFJ4ogF6rwHFNFzTjEgP5q0Bh8I9qw4
	3CyRbicZWtzWa8hPDk6hZLz0QpS5A2EP9AUfkAfdgru7nPLrXMKp0XaxWhFWzA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v4 00/32] drm bridge hotplug
Date: Wed, 25 Nov 2026 18:50:13 +0100
Message-Id: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Oy27DIBAF0F+JWIeKt0hW+Y+qC48Z20SJSQFbr
 SL/e7Gbh6J4eWHm3LmShNFjIvvNlUQcffKhL0FtN6Tuqr5F6l3JRDBhmOaaunimEL0rP13Il9P
 QUmWE0U5WorGalMVLxMb/LOjn139OAxyxzrN0m4j4PZS2/BzrfMoh/i6njHx+vbfu1lpHThlVG
 gU4kK4BdYAQ8sn3H3U4kxkcxQPhjPFVRBTEolQ7a1wNxr4j8olwblcROV+iACSoygrbvCLTNP0
 B+sRx4WcBAAA=
X-Change-ID: 20260515-drm-bridge-hotplug-46265d3a2f85
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello,

this series adds support for devices with a DRM pipeline whose final
components, including one or more bridges, can be hot-plugged and
hot-unplugged.

For more about the use case see the v1 cover letter:
https://lore.kernel.org/lkml/20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com/

Design
======

The drm_bridge_connector is nowadays the recommended way to implement DRM
connectors when a chain of bridges is used.

This series proposes a small helper (drm_hotplug_helper) which drivers can
use to make their encoder able to:

 * receive hotplug-relevant events
 * add a drm_bridge_connector when a new bridge is added making the
   pipeline complete in the hardware
 * remove the drm_bridge_connector when a bridge is removed
 * start/stop HPD polling when the connector is added/removed
   (despite the name, HPD is pretty much orthogonal to bridge hotplug)

Series layout
=============

There are various preparation steps before the last patches introduce
bridge hotplug itself.

 A. Add a dynamic variant of drmm_connector_hdmi_init() and non-drmm
    hdmi-cec API
    (needed for the bridge-connector to allocate the connector dynamically)

      1 drm/display: hdmi-cec-helper: use drmm_ prefix for drmm action
      2 drm/display: hdmi-cec-helper: add non-drmm API variant
      3 drm/display: hdmi-cec-notifier-helper: use drmm_ prefix for drmm action
      4 drm/display: hdmi-cec-notifier-helper: add non-drmm API variant
      5 drm/connector: split drmm_connector_hdmi_init() in 3 parts
      6 drm/connector: add drm_connector_hdmi_dynamic_init()

 B. bridge-connector: use a dynamic drm_connector

      7 drm/display: bridge-connector: split allocation code from initialization code
      8 drm/display: bridge-connector: hoist error management to common code
      9 drm/display: bridge-connector: use a dynamic connector
     10 drm/display: bridge-connector: add APIs to add/remove the connector dynamically

 C. Misc preparation work

     11 drm/bridge: constify of_drm_find_and_get_bridge() device_node parameter
     12 drm/bridge: initialize chain_node list head on allocation
     13 drm/bridge: initialize chain_node list head on detach and attach errors
     14 drm/bridge: ti-sn65dsi86: protect device resources on unplug
     15 drm/atomic: drm_atomic_private_obj_fini: protect private_obj removal from list
     16 drm/probe-helper: add per-connector polling enable/disable

 D. Add notifier mechanism to let common code (the bridge-connector)
    take actions on hotplug events

     17 drm: event-notifier: add mechanism to notify about hotplug events
     18 drm/bridge: notify about added and detached bridges
     19 drm/mipi-dsi: notify about DSI attach

 E. Let bridges return their next bridge
    (allows to know when the pipeline is complete)

     20 drm/bridge: add drm_bridge_get_next() and supporting func
     21 drm/panel: implement .get_next_bridge
     22 drm/bridge: display-connector: implement .get_next_bridge
     23 drm/bridge: ti-sn65dsi83: implement .get_next_bridge
     24 drm/bridge: ti-sn65dsi86: implement .get_next_bridge
     25 drm/bridge: samsung-dsim: implement .get_next_bridge

 F. drm_bridge: stop pipeline when a bridge is removed

     26 drm/bridge: add drm_bridge_detach_from()
     27 drm/atomic: add drm_atomic_shutdown_encoder()
     28 drm/tests: atomic: add tests for drm_atomic_shutdown_encoder()
     29 drm/bridge: clear bridge->encoder on detach
     30 drm/bridge: shutdown encoder and detach downstream bridges on bridge unplug

 G. Implement bridge hotplug in bridge-connector, enable it in a driver

     31 drm: drm_hotplug_helper: new helper to implement bridge hotplug
     32 drm/mxsfb/lcdif: enable bridge hotplug

== Grand plan

This is part of the work to support hotplug of DRM bridges.

Here's the work breakdown (➜ marks the current series):

 1. … add refcounting to DRM bridges struct drm_bridge,
      based on devm_drm_bridge_alloc()
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. … add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. ✔ protect encoder bridge chain with a mutex (v7.2)
       7. ✔ of_drm_find_bridge
          a. ✔ add of_drm_get_bridge() (v7.0),
               convert basic direct users (v7.0-v7.1)
          b. ✔ convert direct of_drm_get_bridge() users, part 2 (v7.0)
          c. ✔ convert direct of_drm_get_bridge() users, part 3 (v7.0)
          d. ✔ convert direct of_drm_get_bridge() users, part 4 (v7.1-v7.2)
          e. ✔ bridge-only drm_of_find_panel_or_bridge() users (v7.2)
       8. … panel_bridge lifetime
          a. ✔ cleanup DRM_PANEL in bridge drivers (v7.4)
	  b. ✔ embed a drm_bridge in every drm_panel (v7.4)
	  c. ✔ remove *_of_get_bridge(): non-OF drivers (v7.5)
	  d. ✔ remove drmm_of_get_bridge() (v7.5)
	  e.   remove devm_drm_of_get_bridge(), part 1
	  f.   remove devm_drm_of_get_bridge(), part 2
       9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. ✔ handle gracefully atomic updates during bridge removal
    A. ✔ Add drm_bridge_enter/exit() to protect device resources (v7.0)
    B. ✔ Add drm_bridge_clear_and_put() (v7.1)
 3. ✕ DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. ✔ Migrate i.MX LCDIF driver to bridge-connector (v7.2)
 6. ➜ DRM bridge hotplug
    A. ➜ Bridge hotplug management in the DRM core
       1. ✔ bridge-connector: attach encoder to the connector (v7.2)
       2. ➜ drm bridge hotplug
    B.   Device tree description

---
Changes in v4:
- Fix UAF in HPD support by adding a new API in drm_probe_helper to disable
  HPD per-connector (implemented in new patch 16, used in patch 32)
- Fix locking bug in HPD support
- Fix OF node leak in HPD support
- Link to v3: https://patch.msgid.link/20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com

Changes in v3:
- Handle use cases where the first bridge after the encoder is hotpluggable
  (in v1 and v2 the first bridge was required to be always present)
  as well as all cases where the first bridge is a DSI host
   - Removed "samsung-dsim: move drm_bridge_add() call to probe", not
     needed anymore
- Handle hot-pluggable bridges supporting HPD, add TI SN65DSI86 DSI-to-DP
- Fully implement dynamic connector in drm_bridge_connector (CEC helpers
  were missing in v2)
- Fixed shutdown to not shutdown the whole card
   - as a consequence, removed (not needed anymore)
     "drm/atomic: move [...] from drm_atomic_helper to drm_atomic"
- Many smaller fixes and improvements
- Link to v2: https://patch.msgid.link/20261001-drm-bridge-hotplug-v2-0-8e34986dcb68@bootlin.com

Changes in v2:
- Rewrote: added new drm_hotplug_helper, dropped most changes to
  drm_bridge_connector
- Added get_next_bridge func, dropped is_tail func, and stop
  using -EPROBE_DEFER to mean a next bridge is needed but currently absent
- Rebased on drm-misc-next, which required a few reworks
- Fix dynconn mutex locking
- Fix sashiko-reported bugs
- Drop "drm/display: bridge-connector: store the drm_device pointer", not
  strongly needed, and adapt the remaining patches
- Simplify handle_hpd code types
- Lots of other smaller improvements
- Link to v1: https://patch.msgid.link/20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com

---
Luca Ceresoli (32):
      drm/display: hdmi-cec-helper: use drmm_ prefix for drmm action
      drm/display: hdmi-cec-helper: add non-drmm API variant
      drm/display: hdmi-cec-notifier-helper: use drmm_ prefix for drmm action
      drm/display: hdmi-cec-notifier-helper: add non-drmm API variant
      drm/connector: split drmm_connector_hdmi_init() in 3 parts
      drm/connector: add drm_connector_hdmi_dynamic_init()
      drm/display: bridge-connector: split allocation code from initialization code
      drm/display: bridge-connector: hoist error management to common code
      drm/display: bridge-connector: use a dynamic connector
      drm/display: bridge-connector: add APIs to add/remove the connector dynamically
      drm/bridge: constify of_drm_find_and_get_bridge() device_node parameter
      drm/bridge: initialize chain_node list head on allocation
      drm/bridge: initialize chain_node list head on detach and attach errors
      drm/bridge: ti-sn65dsi86: protect device resources on unplug
      drm/atomic: drm_atomic_private_obj_fini: protect private_obj removal from list
      drm/probe-helper: add per-connector polling enable/disable
      drm: event-notifier: add mechanism to notify about hotplug events
      drm/bridge: notify about added and detached bridges
      drm/mipi-dsi: notify about DSI attach
      drm/bridge: add drm_bridge_get_next() and supporting func
      drm/panel: implement .get_next_bridge
      drm/bridge: display-connector: implement .get_next_bridge
      drm/bridge: ti-sn65dsi83: implement .get_next_bridge
      drm/bridge: ti-sn65dsi86: implement .get_next_bridge
      drm/bridge: samsung-dsim: implement .get_next_bridge
      drm/bridge: add drm_bridge_detach_from()
      drm/atomic: add drm_atomic_shutdown_encoder()
      drm/tests: atomic: add tests for drm_atomic_shutdown_encoder()
      drm/bridge: clear bridge->encoder on detach
      drm/bridge: shutdown encoder and detach downstream bridges on bridge unplug
      drm: drm_hotplug_helper: new helper to implement bridge hotplug
      drm/mxsfb/lcdif: enable bridge hotplug

 MAINTAINERS                                        |  16 +
 drivers/gpu/drm/Kconfig                            |   5 +
 drivers/gpu/drm/Makefile                           |   2 +
 drivers/gpu/drm/bridge/display-connector.c         |   7 +
 drivers/gpu/drm/bridge/samsung-dsim.c              |   9 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |   9 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  85 +++++-
 drivers/gpu/drm/display/Kconfig                    |   7 +
 drivers/gpu/drm/display/Makefile                   |   2 +
 drivers/gpu/drm/display/drm_bridge_connector.c     | 233 +++++++++++----
 drivers/gpu/drm/display/drm_hdmi_cec_helper.c      |  62 ++--
 .../gpu/drm/display/drm_hdmi_cec_notifier_helper.c |  34 ++-
 drivers/gpu/drm/display/drm_hotplug_helper.c       | 325 +++++++++++++++++++++
 drivers/gpu/drm/drm_atomic.c                       | 151 ++++++++++
 drivers/gpu/drm/drm_bridge.c                       |  87 +++++-
 drivers/gpu/drm/drm_connector.c                    | 131 ++++++---
 drivers/gpu/drm/drm_hotplug_event_notifier.c       |  62 ++++
 drivers/gpu/drm/drm_mipi_dsi.c                     |   3 +
 drivers/gpu/drm/drm_panel.c                        |   8 +-
 drivers/gpu/drm/drm_probe_helper.c                 |  92 ++++++
 drivers/gpu/drm/mxsfb/Kconfig                      |   2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c                  |  42 +--
 drivers/gpu/drm/tests/drm_bridge_test.c            | 209 +++++++++++++
 include/drm/display/drm_hdmi_cec_helper.h          |  21 ++
 include/drm/drm_atomic.h                           |   1 +
 include/drm/drm_bridge.h                           |  27 +-
 include/drm/drm_bridge_connector.h                 |   4 +
 include/drm/drm_connector.h                        |   6 +
 include/drm/drm_hotplug_event_notifier.h           |  52 ++++
 include/drm/drm_hotplug_helper.h                   |  30 ++
 include/drm/drm_probe_helper.h                     |   2 +
 31 files changed, 1567 insertions(+), 159 deletions(-)
---
base-commit: 479e381e77dcde0dfcc9d51e89ff3273da199804
change-id: 20260515-drm-bridge-hotplug-46265d3a2f85

Best regards,
--  
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

