Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB96A33CE86
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 17:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907990; cv=none; b=OerYoxbrsktHyRuyQARXEfdkpw9/gcXt3wYhKGYc3Db1/jHBodt4X6SFdDUAvC3bas1VGTJhgRideisfhhMBuwka1+FfZZpHqySDJHcI5vMe1lfEJkTrnQOKkS/gneeO1+A+JOWzQYUiL4AOQzJ/BqwMFUC3EBBv52coCFQM2XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907990; c=relaxed/simple;
	bh=TDzfZOU45y+PPMufjHKWLSupZDlQZDF5X/aOnpDXKNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a9XYBA9sYbPxy6LsTcPU1kedtyPQlQWK6WTt5bnTmH6znumch56OvDONzsOrzqyf4p8139I7UTlfv89IUZsTr0SKYq3lN4Q0TKPWV6GH/oxTwleXbDm7XUdmHHm027RKU9lJv8b1wPJ6euUbCsigHToq/L5UFPSKT8mzNfMnjBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UweAesrM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UweAesrM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6CB1F4E41C34;
	Tue, 16 Dec 2025 17:59:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FA456071C;
	Tue, 16 Dec 2025 17:59:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6840119A97ED;
	Tue, 16 Dec 2025 18:59:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5C0BAGW7reAC20F8Jw1cgzBVN6/7QGhQ6UeNBjiEyB4=;
	b=UweAesrMKoKyXjhtgPHMwvjcR+nXLJqYrzNYSGfBqPdLGztoHvr0OEKs6GsOEmCi7gTdhU
	zt3fPQFOd2VWiAgvNqY6wcHrcQbCaf4OLyf1Fz9T711+YVnwTrpRrdX7niIwQ55F1lz5A6
	tKCr34Zr9kYC/GAOSv2dvAfNCtq2m4R103yMaE4GU30XZfF1bxq7KfYtqCZI0M5CRNpOVB
	8wJ9BUjTqHClTfjIuxZarpd1MEmacQtay6ammRLMu9IrR0+uxB5jHg0vLBgY8lQCX+nrGm
	4XzT0SXT99sAuKEn5b2Xq5wgQH7O+KVEbG8ZJ0fQGyLaepHsqZDqWPJQkQz2pA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:38 +0100
Subject: [PATCH v3 05/22] drm/arcpgu: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-5-b5165fab8058@bootlin.com>
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

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put it when done.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- update after of_drm_get_bridge() -> of_drm_find_and_get_bridge() rename
---
 drivers/gpu/drm/tiny/arcpgu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 7cf0f0ea1bfe..505888497482 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -308,10 +308,9 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 		return ret;
 
 	if (encoder_node) {
-		struct drm_bridge *bridge;
-
 		/* Locate drm bridge from the hdmi encoder DT node */
-		bridge = of_drm_find_bridge(encoder_node);
+		struct drm_bridge *bridge __free(drm_bridge_put) =
+			of_drm_find_and_get_bridge(encoder_node);
 		if (!bridge)
 			return -EPROBE_DEFER;
 

-- 
2.52.0

