Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020706;
	b=2waMb2FRC4/PV5Y7O5v9WFqTo6vd9u7a74oR5e6xhIjoN5gFrw1ap5aYFCsOU77HZUO8
	 WCXA8kjDcMBd9TlsR6Y55VZICLFJqz1rut1J8P2VmrjxGIcTZpSDCQLrPv74ozBl11Z4T
	 7jscfpoWMPlJW3IKBy8myKTsWPNnNrokmtnhLsiqlnvACfnopNurSsQJhnX3uN3j4GqTi
	 rXKjBkrE2eYmLTiLqBncujA7wKhMpGfvR/uw5Rrev0Z8p1dpO/sWBxGks5OD4Nn9jFri1
	 FyyN9VrbFvBs5fAUEBwzuiNFJTYyfF4HFsrCviIbWK5Dh8Ei8W72oIpCJin1sAsTmiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020706;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+gnpBc9synDIKGRlYDbwpGZkwJIbWk7JkbUzq9+aVgs=;
	b=Jlv6Tw9CHmlbjHJEa1ydS96l0g5/Gd+aXEo06M03g5cJCiAFWCEEMAjRa03gAxTedSfU
	 hLo3zdO/60Z4njX4tyUp5+GnpJnqCDLrZpU+hu3Q7BPrBfr2FZpBkkvMtILecVzttTmt9
	 hTswBjHUMp0ggzzX+qOb/8FCT4jCnFWpUiQKKw9YUVp3UfsTnJIGgcvUopOUY+DKRlXIJ
	 ZQ927v76mhsz/cvOh4lJTOg7PsEte2UVj3aUXteopnEwpF9W0mY8pFmlvPJRkpEQRHKqt
	 QvL3+GdBknpiSHoXAYsCUitCAilrGeJONnNI8CQcegkj1gVcwd8hwliKPFSpyEl+4oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=H+lTydkf;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E207560A2633
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 16:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E207560A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=H+lTydkf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B1FD61A16CA;
	Wed, 18 Nov 2026 16:51:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78A0D5FE9B;
	Wed, 18 Nov 2026 16:51:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7555411BC27C2;
	Wed, 18 Nov 2026 17:51:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+gnpBc9synDIKGRlYDbwpGZkwJIbWk7JkbUzq9+aVgs=;
	b=H+lTydkfRATyFQnDcoY+R+GWl/BZjyUg4ecff1G/brsXOX+bUihMNt5xTeFxCZSMDjk9AQ
	LPv7JujcpJ5HB+Fw5vcVM0GzxUKR0CRj8lp97+horbT+xuJA+LRZ7WnIsn2R/BDqMYJhMr
	c8cxC7a9e2SfHp/dUYPnLcjVDuY+7sH0xhyZBp59QPpRXMUQYcawemXphHqdpi8E502D+R
	FOriwXmJFijaDd1Bmeb1A6WoZoY+soKRlc+p7jc6m9Hp+JzdVKHiVV+u6mPz1YrR4Wu/Kk
	l2NkWj2IMDpgrYBaDw6FfCkifr173jcLBzrIRN0ZjEVCegLIwe5YgsOgkA/lrw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:58 +0100
Subject: [PATCH RFC v3 15/31] drm/atomic: drm_atomic_private_obj_fini:
 protect private_obj removal from list
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
Message-Id: <20261118-drm-bridge-hotplug-v3-15-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
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

 * This patch was sent separately in the past [0]
 * The issue is still happening with hotplug without this patch
 * The issue has also been reported by sashiko when reviewing v2 [1]

[0] https://lore.kernel.org/dri-devel/20260324-drm-bridge-atomic-vs-remove-private_obj-v3-1-64deefe84044@bootlin.com/
[1] https://lore.kernel.org/all/20261001130542.A40D11F00898@smtp.kernel.org/
---
 drivers/gpu/drm/drm_atomic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 81591173265d..ad2099b4dffd 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1089,7 +1089,13 @@ EXPORT_SYMBOL(drm_atomic_private_obj_init);
 void
 drm_atomic_private_obj_fini(struct drm_private_obj *obj)
 {
+	struct drm_modeset_acquire_ctx ctx;
+	int ret = 0;
+
+	DRM_MODESET_LOCK_ALL_BEGIN(obj->dev, ctx, 0, ret);
 	list_del(&obj->head);
+	DRM_MODESET_LOCK_ALL_END(obj->dev, ctx, ret);
+
 	obj->funcs->atomic_destroy_state(obj, obj->state);
 	drm_modeset_lock_fini(&obj->lock);
 }

-- 
2.56.1

