Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629156;
	b=BtIwY4utK3nePl9ChLI/6bw/Qz5MbrQ4GByMN1DzSJ5qSAHohcFSKLqe0eQFyI+pt9ji
	 HV9easjTz49y4DBn6A71JafLjK1nNNUFxpeaGCiix7fXL7w304i1F6ZgmcxndKBoOhmhP
	 LRLimLjY9qSUezT+8d30kH6wMlUm3EcakC6qbzbrMHmzdeLhRT3fvcY5kiPjfULKK1wTC
	 UMBfKWb8tAfaYUa3owBPpYbd+SAg/PuwT8xR0D9T3ipV7XWalyn6GuyoRk17UBY6ChOhl
	 5Wqt6iNg8heUn0mg8C5W4X9FodNH+U7SEnbsyQsQaw/l/Q0jaQKbggamETX63FtqOag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629156;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=K/q1yAvr6XkI84cojadbVWLoEVrZ2+B7AbCD60d4iaI=;
	b=s2ooZZBfv8UvH9IJff6hU+OsG0FccB35TICS68Yf8Zusq46f93jya9b6Ap5pnob8kdvb
	 4kJnTLrgKhE+c0ZSVDPVyMxmxp7m5TWj2U4aAOJ6HvQUbKkomAYKNgp3BHevKA13+QySx
	 7ZzR4CmsBITvrQb3wrhvefmvW0lVoeIrgzbw6slMnKU04YNj9ZBHYvTys9MIciMWUg1nC
	 0xaz9KZQE04yh6B8r0XN6hlQQzc5LdJ39E8ChJtsJijHV3eulpYcMIV+QIgZvFQNGuxq5
	 WxpV4T4yISmjwi/LXJuOj/b21/BN12cujbD4SgrfLXYjzwxYekUXae0iARyCDKzVm2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=shAo7SdN;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74DA60A260C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E74DA60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=shAo7SdN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C85E51A17FA;
	Wed, 25 Nov 2026 17:52:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C9E060480;
	Wed, 25 Nov 2026 17:52:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC1C811E6B0D2;
	Wed, 25 Nov 2026 18:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/q1yAvr6XkI84cojadbVWLoEVrZ2+B7AbCD60d4iaI=;
	b=shAo7SdNlXc1r7UxuO7i9mk83cTF+LUto5PoOa2Brwk0Lh/A4DY7a7ccttQQT5RQkbb0iJ
	2pmbSAL7oZzDwTgL6bjk7ia4uvxzzSVYWPzUVMKDgWQzbN3YZ19ffD2MQV913semqpp5Hy
	dbPxW8nZmD7O3c/mZo2Bdo0rT2PJl9M4w02p4cffcXujcf9elqOZeqScq2xo+U7FS3R9pR
	xMUYgP6VM1Uboea7pPAR1cMarXhawpG3/++O+fqJ7tpP9jyOFVrboJC21kQ8JPU9cxr0Pc
	gnM6lZLsuurXaFuXdc1fqUYVKPCxZUrKN2TVBk4SFjYszvp6NVnhn0+aeQI0Nw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:28 +0100
Subject: [PATCH v4 15/32] drm/atomic: drm_atomic_private_obj_fini: protect
 private_obj removal from list
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-15-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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

Currently drm_bridge_detach() expects that the bridge private_obj is not
locked by a drm_modeset_acquire_ctx, and it warns in case that happens:

  drm_bridge_detach()
  -> drm_atomic_private_obj_fini()
     -> list_del(&obj->head) // removes priv_obj from
                             // dev->mode_config.privobj_list
     -> obj->funcs->atomic_destroy_state()
     -> drm_modeset_lock_fini(&obj->lock)
        -> WARN_ON(!list_empty(&lock->head)) // warn if priv_obj->lock
	                                     // is still in ctx->locked

The expectation is not respected when introducing bridge hot-plugging. In
such case the warning triggers if the bridge is being removed concurrently
to an operation that locks the private object using a
drm_modeset_acquire_ctx, such as in this execution scenario:

  CPU0:
  drm_mode_obj_get_properties_ioctl() // userspace request
  -> DRM_MODESET_LOCK_ALL_BEGIN()
  .  -> drm_for_each_privobj() // loop on dev->mode_config.privobj_list
  .     - lock the privobj mutex
  .	- add priv_obj->lock to ctx->locked
  .	  (list of locks to be released later)
  .
  .                         CPU1:
  .                         drm_bridge_detach() // bridge hot-unplug
  .		            -> WARN triggers!
  .
  -> DRM_MODESET_LOCK_ALL_END()
     -> for each lock in ctx->locked
	- remove priv_obj->lock from ctx->locked
        - unlock the privobj mutex

Fix this by using DRM_MODESET_LOCK_ALL_BEGIN/END() around the list removal
in drm_atomic_private_obj_fini() to ensure the two threads above
(CPU0/CPU1) cannot happen concurrently.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v4:
- fixed conflicts after commit 6386ba453468 ("drm/atomic: Fix private obj
  error handling")

Notes:
 * This patch was sent separately in the past [0]
 * The issue is still happening with hotplug without this patch
 * The issue has also been reported by sashiko when reviewing v2 [1]

[0] https://lore.kernel.org/dri-devel/20260324-drm-bridge-atomic-vs-remove-private_obj-v3-1-64deefe84044@bootlin.com/
[1] https://lore.kernel.org/all/20261001130542.A40D11F00898@smtp.kernel.org/
---
 drivers/gpu/drm/drm_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1c3fe07b327e..096f85419b36 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1106,6 +1106,9 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
 void
 drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
 	/*
 	 * Some callers ignore drm_atomic_private_obj_init() failures
 	 * and unconditionally register a teardown action that calls
@@ -1117,7 +1120,10 @@ drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 	if (list_empty(&obj->head))
 		return;
 
+	DRM_MODESET_LOCK_ALL_BEGIN(obj->dev, ctx, 0, ret);
 	list_del_init(&obj->head);
+	DRM_MODESET_LOCK_ALL_END(obj->dev, ctx, ret);
+
 	obj->funcs->atomic_destroy_state(obj, obj->state);
 	drm_modeset_lock_fini(&obj->lock);
 }

-- 
2.56.1

