Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5609C329E52
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 17:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623004; cv=none; b=q8I+GC5iEoK1WjrfGw2slnOEgqFQa/dOb2Zf7sZw7zcbcQIQl/hB6twNRwDQe8BsBF95nAhgegb7vvRF/nx9LmM2egHdXKChboMU73XNTV6DO/FI4lrOUCfDXxJMAjn6+cL0iuqhaZ8l8GyyMIxo4KUTlUaC1IyIGRtdH4EDT7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623004; c=relaxed/simple;
	bh=fceEZs+f0HtuOOxWKwpZCk1Lj9njmp8LG4rEooJFeFc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i8fdDG3UN4qaDMojkwmLUFoJOY/JJzCxdMP9VOynTSFmYMeHNSmdGflf3LXkRxglrFDK54SWZsmsh4D6g6NsZqGDWKLW95QX8WhWl1jv9Grq4vDXBx13K+UxKC9S9Bl+ereUtpeosEQ7rLRDGs0edxnSaoduIeiEiRj/1bCmo4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yN+4QHWX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yN+4QHWX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 91FD7C211ED;
	Wed, 28 Jan 2026 17:56:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C2F6071F;
	Wed, 28 Jan 2026 17:56:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5B70119A8687;
	Wed, 28 Jan 2026 18:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769622996; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=hVKMA1mgA2HarFubchDZxxQcSE3jYQpdUJ9TpOSCc5s=;
	b=yN+4QHWXe6CnQTP+XwB3m49VFo6G76tnT/zYzEvY0lAX5ySVppGySpmZRZiiSi2ZZE+Vn5
	CLKx4KldLsoahjIf+rb7Iaceu5zbtk33Lw786p6PjC80o7afcQ/cEJAlxo6CSukA3vd5GL
	4p9/OSkfM3a5hmXddf/RtJ84O2WXIuEcxUB3GF17hNGvt2RJn1aJfuoZR7yfCztF3Ppyzf
	pKkcEeX24bfhs3bU6NZINsoxexD7j37xjNt013w/Ml8Jne+jOVCQBqCqWEelIk/R0nzL7q
	bu7TAZTJ8HTbvwUdmy2Ko2qMCHS0UYp5Cmk69GUp3/mDrwNl6+yjZ2/uQPeakQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH for drm-misc-fixes] drm/bridge: imx: A few fixes - backport
Date: Wed, 28 Jan 2026 18:55:08 +0100
Message-Id: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-0-2138d0933cf1@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHxNemkC/yWN2wrCMBBEfyXsswttqiX6K9IHm2x0ITc3KIHSf
 zfFxzkznNmgkjBVuKkNhL5cOacexpMC+3qkJyG7nkEPeh5GbdBJxFXY9cZzQ47NvFvBwo0C2hx
 XTiSYPiGgIyGP3pyvfp4mN100dG3psI+Pyzv4LOowRq4W/3jZ9x9fgUswlgAAAA==
X-Change-ID: 20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-f849f633d352
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

A series was sent with 3 fixes for drm-misc [0]. Patch 3 of that series
should be on drm-misc-fixes (the bug is in current master since v6.17) but
does not apply there due to conflicts.

This 1-patch series has a backport of that fix for drm-misc-fixes, so that
master can be fixed ASAP.

[0] https://lore.kernel.org/lkml/DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (1):
      drm/bridge: imx8qxp-pixel-combiner: Fix bailout for imx8qxp_pc_bridge_probe()

 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
base-commit: e535c23513c63f02f67e3e09e0787907029efeaf
change-id: 20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-f849f633d352

Best regards,
--  
Luca Ceresoli <luca.ceresoli@bootlin.com>

