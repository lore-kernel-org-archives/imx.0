Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018F330B08
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907992; cv=none; b=YnWCZg4bVCi880lcRvs1xh3+oHESw5USicfuV1aLCCTZ9Pcfm5G3waXM7czqSSJO4og9xRTY7Ot74Val+ifolgRubpomjYky6TLXMU4TYjbhuNMZ5Lpqz6fM376P05f5r1Qo7tIM07ZUUAgdreg/w6yaZzi1X/vGWgy4JfUestc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907992; c=relaxed/simple;
	bh=emDhk2MMrd8ZT9IWg/kP2hcjE9Z97TjWHRlexkv8XLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0EZiepNeVKV45uorxzIO0EYkfBrUA7YJuMr3S4+QnVwU61HeLCjfKC+DpKSROsLC3yz3MVAkcn9U3jr8ECatx84wKCpZHGKK0TPiz20+ZWnmCLClZVZqA+DssLYCKM2nSyfYv4GsfNWmWJ3JdZ2sp/+49tdzfrq3n8meXhknvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rlEm/gAv; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rlEm/gAv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4CE681A2256;
	Tue, 16 Dec 2025 17:59:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B9576071C;
	Tue, 16 Dec 2025 17:59:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38D9A119A97D5;
	Tue, 16 Dec 2025 18:59:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GmMyYFYj3nN0WWZncwkj3rSY84I1KnZQTlsrUpqIOyA=;
	b=rlEm/gAvrMbqr3Pj4NGgu9O+LbFKm4iDqhBczJ0MFSNJklRloeIRAsDfvYUSxHPtjJWmFM
	6cKCOdkflGuz5f+0Xzgl4l41lVU9rNcFeNpED8pEwgaK5E1Dh0Rx6A+hmEkY7o2ER5tac2
	iLb7R0CH6J9upYVCg2ct4zQpvQ4DLr1Uu61thZsTh+NsXqpghIXzsPTWE58VzrBsT7RY8m
	zIbD39BzKVIUskMhJL9ZTmLtiEw1VU1Qae5G5aHZzgeHureeVPrrjAa0hhcNsCXOD4kS4Z
	thOY1qJd+CovZN8O/Go0lIxNieqk/vbiHGq4dK2f2WiTYpmeMRfXc52pPvzQCA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:39 +0100
Subject: [PATCH v3 06/22] drm/bridge: add next_bridge pointer to struct
 drm_bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-6-b5165fab8058@bootlin.com>
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

Many bridge drivers store a next_bridge pointer in their private data and
use it for attach and sometimes other purposes. This is going to be risky
when bridge hot-unplug is used.

Considering this example scenario:

  1. pipeline: encoder --> bridge A --> bridge B --> bridge C
  2. encoder takes a reference to bridge B
  3. bridge B takes a next_bridge reference to bridge C
  4. encoder calls (bridge B)->b_foo(), which in turns references
     next_bridge, e.g.:

       b_foo() {
           bar(b->next_bridge);
       }

If bridges B and C are removed, bridge C can be freed but B is still
allocated because the encoder holds a reference to B. So when step 4
happens, 'b->next-bridge' would be a use-after-free.

Calling drm_bridge_put() in the B bridge .remove function does not solve
the problem as it leaves a (potentially long) risk window between B removal
and the final deallocation of B. A safe moment to put the B reference is in
__drm_bridge_free(), when the last reference has been put. This can be done
by drivers in the .destroy func. However to avoid the need for so many
drivers to implement a .destroy func, just offer a next_bridge pointer to
all bridges that is automatically put it in __drm_bridge_free(), exactly
when the .destroy func is called.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/all/20251201-thick-jasmine-oarfish-1eceb0@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c |  2 ++
 include/drm/drm_bridge.h     | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64aa69dcf46f..6dcf8f6d3ecf 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -275,6 +275,8 @@ static void __drm_bridge_free(struct kref *kref)
 	if (bridge->funcs->destroy)
 		bridge->funcs->destroy(bridge);
 
+	drm_bridge_put(bridge->next_bridge);
+
 	kfree(bridge->container);
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8f10d2fd6016..63660256c4f5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1278,6 +1278,17 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @next_bridge: Pointer to the following bridge, automatically put
+	 * when this bridge is freed (i.e. at destroy time). This is for
+	 * drivers needing to store a pointer to the next bridge in the
+	 * chain, and ensures any code still holding a reference to this
+	 * bridge after its removal cannot use-after-free the next
+	 * bridge. Any other bridge pointers stored by the driver must be
+	 * put in the .destroy callback by driver code.
+	 */
+	struct drm_bridge *next_bridge;
 };
 
 static inline struct drm_bridge *

-- 
2.52.0

