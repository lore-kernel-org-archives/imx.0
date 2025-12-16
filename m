Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B936F33C1A9
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 17:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907977; cv=none; b=PczVgxvjR7IrEMNjje8K70iqgb4839Z8wpyp5Vl51+PUCLJ65VQM0d27XB4yEfjf4sapxjI1xJ+PkbsxYnQ8Bt6bQuBOjtoI6F5NhDkG3V4ONDqrqj+VthghRzjV2qStboZJ9cjoaOYx0liD9sq8Qj7XM8LJcX8KYCz01oC7Pd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907977; c=relaxed/simple;
	bh=a2JM8z3c10fTHOVueCHPF1UygFtFgtwofDSz74lu6pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xcg8KFuW8K+WbTiHWmgcsZFiyUDTkQ1tTomV5Izj5AkObF5DpK/geAQkKTcScCI84nfTFXgyC2um8e2A2wV1ScK/FRSCaOYiVRtiEM0xVpPrY3Gw0AEiBYDV0kCai764blr7H2e4FSIsfjriPCXq4ZUnsVs5QlZjd5tJoh0adxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uYmhz63h; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uYmhz63h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D5EAC1A582;
	Tue, 16 Dec 2025 17:59:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECA186071C;
	Tue, 16 Dec 2025 17:59:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C03FD119A97D5;
	Tue, 16 Dec 2025 18:59:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NPqr5fYrnS8CLbVsYlAAOMPINrx1k7wIo/fj4ildkQw=;
	b=uYmhz63hDysFTP2ZdC5B7bg5N5SyGTrUKhFkZpvYpwMAj2KPZvqH7tPbMLpSBqlEph7Ra3
	t+StPoRWnNDnUtDKMk9XaatE/J3/+rP3sLJ9eKYNRCyGrRW+Ds1ssvVFyxHLDpO0ZUeqX+
	zuXWK/DQ7dmGRjlN1+Jvaq1whtQlK2IT0y9ef5cxY+lpapJQeZq3gWW8UWDgkbHafDTHsI
	jSej3zPzP9+WmEUnthexDvX5wwJdziYiZU6E1z/mkzdKn2+mUrguy7GwCJgrBWd0QrfsGv
	kY4WBP3U/lAdTSCwICo4P+clwcUJbyh85mSJsbhuC0hixYH7PC7jO31C3/B3jg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:35 +0100
Subject: [PATCH v3 02/22] drm/bridge: deprecate of_drm_find_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-2-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
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

of_drm_find_bridge() does not increment the returned bridge
refcount. of_drm_find_and_get_bridge() is to be used as a replacement.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

Changes in v3:
- update after of_drm_get_bridge() -> of_drm_find_and_get_bridge() rename

Changes in v2:
- expand comment to mention why this function is dangerous and what users
  should do about refcounting
---
 drivers/gpu/drm/drm_bridge.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0dbc8b59c3be..f612d486cad0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -361,7 +361,7 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  * @bridge: bridge control structure
  *
  * Add the given bridge to the global list of bridges, where they can be
- * found by users via of_drm_find_bridge().
+ * found by users via of_drm_find_and_get_bridge().
  *
  * The bridge to be added must have been allocated by
  * devm_drm_bridge_alloc().
@@ -422,9 +422,9 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  * @bridge: bridge control structure
  *
  * Remove the given bridge from the global list of registered bridges, so
- * it won't be found by users via of_drm_find_bridge(), and add it to the
- * lingering bridge list, to keep track of it until its allocated memory is
- * eventually freed.
+ * it won't be found by users via of_drm_find_and_get_bridge(), and add it
+ * to the lingering bridge list, to keep track of it until its allocated
+ * memory is eventually freed.
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
@@ -1510,6 +1510,20 @@ EXPORT_SYMBOL(of_drm_find_and_get_bridge);
  *
  * @np: device node
  *
+ * This function is deprecated. Convert to of_drm_find_and_get_bridge()
+ * instead for proper refcounting.
+ *
+ * The bridge returned by this function is not refcounted. This is
+ * dangerous because the bridge might be deallocated even before the caller
+ * has a chance to use it. To use this function you have to do one of:
+ * - get a reference with drm_bridge_get() as soon as possible to
+ *   minimize the race window, and then drm_bridge_put() when no longer
+ *   using the pointer
+ * - not call drm_bridge_get() or drm_bridge_put() at all, which used to
+ *   be the correct practice before dynamic bridge lifetime was introduced
+ * - again, convert to of_drm_find_and_get_bridge(), which is the only safe
+ *   thing to do
+ *
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */

-- 
2.52.0

