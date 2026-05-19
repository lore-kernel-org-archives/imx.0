Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F604EA365
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187206; cv=none; b=gZwtLXTbZC80iRh4EVTKvHEhU6FM9XF/4AhbAh5j2UzDW4WMnGwabS0+Zs4JUZL0gzChzCHksZaSlBef25H2SH0Dl3Os6Hb/cPLqJi7TUXoOz6rNAwqftflCHixTfMHQ3gcjhGYvXCz160SPnS0z0DuUuRGKEBwEzFE/7XkzKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187206; c=relaxed/simple;
	bh=PoYOaRghUOfWGLxaEbr2QA7/OZlcBeliMCvSSCN8B0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8OVcKVF/Gzxn/VzOYmDGQH9HoTlWVtjC0tozHwwRWf5oSg7wS7tq4KJYmg8QnrkpmdZcvTP6NxUlx8nVgXFKX4YFwdoIYrs5C/5H4JDlB2lRdRnVgET4sxvA1vVbK4OS29Vc0AGIZjFY1R3u7s6FmhEsI+gtnyzbmb5sFRRT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gOj+U7Xa; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gOj+U7Xa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2F05B4E42CF3;
	Tue, 19 May 2026 10:40:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EBB4D606E9;
	Tue, 19 May 2026 10:40:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7FCA107E8AFA;
	Tue, 19 May 2026 12:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eN6pL5kosuLFHDQOEEYHtqbm7sPqAq+GeT70rFRs0LQ=;
	b=gOj+U7XaOXqqhRiCtqoWTExaKf57PI5lsbopBhQnoItip50VmAyxc5ehIE2oflvHG9ssjM
	SY2QhjswtmJaiFlXE2fcoiAAFVRNt/bNNH9qvjYCh44CZ5RZLyZUKi9NB00u1U1O4nIpmD
	3fstKXeQ+gjFJKnvVqHhY/oaMSlQLlZ2oBMbR4i7XqsAmmzQhUBr+pPcDGm51TZd7JkdjC
	CpDEeniTkrfzAnRnE1usFaMKGot0iD0zkjzV/t3LPdDRpBXqktYjQfa7VpDWAwu2tuUfDl
	K0WM4fjVBfEuLNN+5YCy564YQaejBvOokM+sigsyWrvjry5asQGLnJMiJazsuQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:44 +0200
Subject: [PATCH 27/37] drm/bridge: notify about detached bridges
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-27-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

In preparation to support DRM bridge hotplug, let the drm_bridge code emit
an event when a bridge is detached, so that this event can trigger the
actions needed to deconfigure the pipeline and unregister the connector as
appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/Kconfig      | 1 +
 drivers/gpu/drm/drm_bridge.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 18eb33e0e5a0..081660f3a0f2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -17,6 +17,7 @@ menuconfig DRM
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
 	select VIDEO
+	select DRM_EVENT_NOTIFIER
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d45fb74ec8c2..c62d17e84d4f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -34,6 +34,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_event_notifier.h>
 #include <drm/drm_file.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
@@ -638,6 +639,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 		bridge->funcs->detach(bridge);
 
 	list_del_init(&bridge->chain_node);
+
+	drm_event_notifier_notify(DRM_BRIDGE_DETACHED, bridge);
+
 	bridge->dev = NULL;
 	drm_bridge_put(bridge);
 }

-- 
2.54.0

