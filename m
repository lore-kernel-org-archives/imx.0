Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA56367F31;
	Wed,  8 Jul 2026 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504615; cv=none; b=B09GKB8KUZhFLJbEtnHs1tC1kzNxALGsHjAu1DRKM7XdIJAnqOdfxIjTkrjgfCcTqg4Kygk6hS0DeBQut0VrSKoJHOSHVt9K9QwEOMipyEtv0CgW3+f+GKvv+TBqA8ws12rmRb6OnlbI7lEMROR8bBMykJmHKmfngA4ENATJFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504615; c=relaxed/simple;
	bh=JrsAw7bFLrtENAc7wlDmRUrZ9pXUdlTu7kcIAj7E7iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6gAZxwSLqF7v3xqenT7IVWaycrwVg16UUwe3ZqLrrdAcQVXu4VdWnW+yFrZhKfDyFatp4NXSmisZOnnEczCxVIkoG+a+dGro0+8yTmhN6w9r8y1ZwtmrgII9tSAn/0xzHHEJVkbHDEMlQpkoOEaljhmjESYZLkfNo1f1w6m9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlcTHUEs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlcTHUEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3B91F00A3A;
	Wed,  8 Jul 2026 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504614;
	bh=OSrEVIc8I4v07uohcflk865RNS4QPYoK87cBft0LbSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HlcTHUEsJFmDC0ZybPXosmPoLjcHJc1ZrYdI5BbtiFZFWW+fjLQB85cQhMZj6bxxP
	 7X92SlATxbpmo1NZCeZFgOch6oJz4E5ZiAppcOotnPwePTsYIFx1jci6fNTpKcDq0x
	 dTuMYaDswy5tyZzi6atIUSb7oHn2//ape9Tyayu+XhAhTOnsVFyviK8eaM/ypgiXO4
	 jzN5i4FW6QYjLc6/THZTj3BDKmG/cFLrbtVlFJAsH/9ukbaKXUzeqgqLmmzqXxm8P1
	 zv4gjQn0mIYDv5VZ5bNwmemtdOd2POWex0OffYJRTGGI9eJcGvD2ipxYfPBRDiaeDG
	 q3oiZA9dNNO7A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: victor.liu@nxp.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] drm/imx: include dc-drv.h to avoid sparse warning
Date: Wed,  8 Jul 2026 11:56:45 +0200
Message-ID: <20260708095645.385291-2-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708095645.385291-1-jirislaby@kernel.org>
References: <20260708095645.385291-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sparse (build with C=1) warns:
drivers/gpu/drm/imx/dc/dc-ic.c:273:24: warning: symbol 'dc_ic_driver' was not declared. Should it be static?

And it is right. Include dc-drv.h which declares the struct. This
ensures the types of both match.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dc/dc-ic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index d8aa46ee6a7a..0f2fc7aecf31 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -14,6 +14,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "dc-drv.h"
+
 #define USERINTERRUPTMASK(n)	(0x8 + 4 * (n))
 #define INTERRUPTENABLE(n)	(0x10 + 4 * (n))
 #define INTERRUPTPRESET(n)	(0x18 + 4 * (n))
-- 
2.55.0

