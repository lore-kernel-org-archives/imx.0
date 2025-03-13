Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7102686AD
	for <imx@lists.linux.dev>; Thu, 13 Mar 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741879298; cv=none; b=ZrTQyHuOmFE3DZ4tbgItSX1tqRw/Jy9nqVdLeu8Y6d+HDQ8kpYEfYXoFdP03Br9TCvKT0J0N8900tcnzN+gvb2vohe9fO2Y9Jz96rx3LA7rUhxpjYhb8Is9vLPEzYq2TVmrELrptriP04sZ0Qt89WpTcK3DwmqeUagjmFzHqKl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741879298; c=relaxed/simple;
	bh=PhQ9D8VZhUrXGMAXt+SHdTTqLgyaOspnB9Zx+xPd1wI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AHxC/h+SOyYIGxewnwjktMGPWMZn4XxbISslnCdt/Atb5ljk+kHJulVbir70CLfXsCSPZr8erH8L7YtqyfV4OUD8dV/UXOhChsqlR1R3vCUziDd45I8944Ao+8L/0BmbrxFyh5Z8HLuAlbX2+xJfFCtneGpYBk38wW1zZpOB4L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d28oktsv; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d28oktsv"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7BA5431EB;
	Thu, 13 Mar 2025 15:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741879294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xZt+mlQFBZxNvQEdnGuW9k4Ji7TcJ+Lb9gt53WNlSq0=;
	b=d28oktsvrAkQowL9pEDD/JzIlNrJDAZM/UTHlfLgMS4DV51FmxXs1xDvXlKV64K7q55WhQ
	FdR6xI6M0/1qAwJxwqI2KERfwK9B+O7DRAznF2+CKl64T65e9+hOMo5dDvubeY4E+/NKOe
	hYHI13TGxa+CdqMSa0nSxW+eaqN6681i4a5+z6wxxitvfL/9J9AvwDZeDBNUlmTzQIgrjs
	24Aeny2Q5wxvEOASYlYxLkVmBFIbqDxtUQcc9VQvyECusNNxxWOhAsokvZRCg4ni4FoJKB
	S7gptuM4TGUKFjYsVWPp3MAkU/6aD1K2WCF7A+aT8xAsSouGFsqzqPHM3156AQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 13 Mar 2025 16:21:25 +0100
Subject: [PATCH v2] drm/mxsfb: fix missing rollback on failure in
 mxsfb_probe()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-mxsfb_probe-fix-rollback-on-error-v2-1-38374088e8c7@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPT30mcC/5WNWwqDMBBFtyL57pQ8LNZ+dR9FiomTGqoZmYhYx
 L03dQf9PJfLOZtIyAGTuBWbYFxCChQz6FMhXN/GF0LoMgst9UUaZWBck7fPicki+LAC0zDY1r2
 BIiAzMRhZlbaWV+lNKbJnYszHo/FoMvchzcSfI7mo3/qPfVGgoO20t1XdYens3RLNQ4hnR6No9
 n3/Aoq4bDbUAAAA
X-Change-ID: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfffgeekhfdtveffheeuudeltefhfeduteekleffvefgfffgkeevfeejtdekkeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepmhhitghhrggvlhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: luca.ceresoli@bootlin.com

When aperture_remove_all_conflicting_devices() fails, the current code
returns without going through the rollback actions at the end of the
function, thus the actions done by drm_dev_alloc() and mxsfb_load() are not
undone.

Fix by moving this call at the very beginning of the probe function, so
that no rollback is needed if it fails. Conflicting drivers need to be
kicked out before setting up DRM anyway.

Fixes: c8e7b185d45b ("drm/mxsfb: Remove generic DRM drivers in probe function")
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
The offending commit is not yet merged into master, and even less in a
released kernel, so this does not need to go through stable.

Changes in v2:
- move this call at the beginning instead of adding a goto
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index c183b1112bc4e9fe4f3b048a2b6e4c98d1d47cb3..ee64053d381448360140c419fed1dc4fe9f7c68e 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -352,14 +352,6 @@ static int mxsfb_probe(struct platform_device *pdev)
 	struct drm_device *drm;
 	int ret;
 
-	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
-
-	ret = mxsfb_load(drm, device_get_match_data(&pdev->dev));
-	if (ret)
-		goto err_free;
-
 	/*
 	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
 	 * located anywhere in RAM
@@ -369,6 +361,14 @@ static int mxsfb_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "can't kick out existing framebuffers\n");
 
+	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	ret = mxsfb_load(drm, device_get_match_data(&pdev->dev));
+	if (ret)
+		goto err_free;
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;

---
base-commit: f9f087d946266bc5da7c3a17bd8fd9d01969e3cf
change-id: 20250313-mxsfb_probe-fix-rollback-on-error-3074b9080f34

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

