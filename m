Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BC3FBB5E
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547662; cv=none; b=bC/jljetIofQ+NM/qtjW7JTn0PyIJmRxoYKbuK/mESQYQbrE5hrS8dDHm+FHjNZpC0RBI7M6LT3vCzB/CVreJEioB/f6uOKURUJRPO1Ec5CDHohdWx91TONtjVJ7p3eBVrrazFfzwH9h5lEsh6Dz+23Af+psPxvLHO4XcpPTvsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547662; c=relaxed/simple;
	bh=mYO2vEWxO84mPWA2NS2Y7rpAH5cxlgNY1vFZOBHYWKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrFfEc8pUfvmKM+gm+lsdK9rL1wxY2WqRyQCHix7Y3myjWITo8tjEuXy/WLFcr6vy26lK9aRYEM78YMUT/SIXfJnqRYe/uAOlUkvcM6FRGVMFwouB9Pd+qrf9nMGFHAjt/+NZCGkLTO2890fka28x5JnD9+1nQN39XVCQh3WnwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BllcJG/q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BllcJG/q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b27c7451so3829765e9.0
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783547659; x=1784152459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=864WgdCGKVvhVw+X58LxeAIhuiQbwracGrd3VXI+iDM=;
        b=BllcJG/q3hEbKqeYg0YSA+gKnOkbhxaaxLxGrO/GGEU3/kXfNdNBa7dhVJFkkOElQ7
         jTjQFDAQ2kyjImOvtyseeijDMhxZr+eGqqW6jM/8+vd3VshrFRPVYdpwJUQKoZYD2aB0
         q5dZBxOS2YfBNWLyr6kudoy3W9QlFCkWxOQST0OGUNCIO9IiRtiyjBerNybXHb7rwBSh
         l80Ue/wxWnV+YhIFMqaQAo8xBZgQ9wfBO5GfxXC9lIFCgdTzORHUHBGmeQtn2BMsRnRa
         JP50MArMy3cjRMYCco3Dc4kae2DgDiXZajRGio/h6uL16GByiyg2nOvRYXemaULbYvVh
         px6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547659; x=1784152459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=864WgdCGKVvhVw+X58LxeAIhuiQbwracGrd3VXI+iDM=;
        b=mM+nl4ywElo0chu+hju9iZD4IyaWPsaGpqi4udegpdv2nvSHsrObKjRAZwiNd6/ZvJ
         UuLDr9OgfFPlwYLwg5chPffoajOLUDHOpH8v8DfhpXXEnKfd4hqey7aDBUMWOED/V6gW
         7JGMBO8T1+FY7TR8/CALkvpL5ERmT+XPWGId3wjm4Fgbp1rlcKSHNOhrAesgwN9nRO3f
         9W9nWU5MdmHIgbvTOsmSPcU0rVKwGlCB7U6l2T1vS1gzTv+2bK7NX8Nownw09cbIJ+ZY
         CXacqc9CTsDz86ShiW3OUYQxymMkzU2LmiKTHaf8CSIYsA/SxwkhjY6PnKoxHGwd2utu
         dyDw==
X-Forwarded-Encrypted: i=1; AHgh+RqKbGJYbDrG4VtJZoxBkQ3sfcBwp0QPK7UscP1nE4wbOP18K+R/qBZSNXdBwoj79uFkKzo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/FRGMOa4HGr/4OGcBoQBYBaYeKmwhqHmN7xr/3FaT/MfRArlH
	Ynha0fPYl2mKAFF+4VUx0B02x+OM6K6PsYbACgXBK1ZmE12mGi2uRc3J
X-Gm-Gg: AfdE7clXjCKCvw7Hf+0NslyyMVtFB8A4qNHo8NzrXglWGQYC1HUiaSB5wKOXbvksCm2
	lgqV7k546fGVh4TdkiEvopmC3ue96WbLz8xMoSmpHCAuw9xYhwxcQ/EKJcOZbqrIdmG5UtIpeWO
	8MXhDv/D9rp7zBNXcmBETCM4UMSzP2q+SvsdOeEnVGw88HZhMS1BSErXY7WDY1N4qmiLwg67nFo
	vhcpPBcGW7Iz0DFtQdxdWxaUiIthH96c319QzO7kQtuAAIrTI/lHBP3+tCL9GoHkvXrVQEF0Sj2
	Xf0qEFdkobd8vEo/1akwL4J26GccvMvzmRONvBIli/zL+szZWDWOlEqOXSzRjbBfSQTGuMGv+0o
	migMl9df+Chke7RtGNULGXMupXOjaKztAC7tnEJ+pmWo7xLLLdxXpmXT6koIQNz5FWNA808IZ4t
	IY6iL9TDH0Nz5qQmUPN+orT98OZEqwOHA9UueU5Rp2IlMBt7piwA==
X-Received: by 2002:a05:600c:3421:b0:493:cbd4:8925 with SMTP id 5b1f17b1804b1-493ec55d788mr490785e9.4.1783547658604;
        Wed, 08 Jul 2026 14:54:18 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:7550:b182:7bdf:fbd0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47df6a31dd5sm1032704f8f.16.2026.07.08.14.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:54:18 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] drm/imx: ipuv3: handle PRG channel configuration failure
Date: Wed,  8 Jul 2026 23:54:16 +0200
Message-ID: <20260708215416.147586-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu_prg_channel_configure() can fail when no PRE is available for the PRG
channel, but ipu_plane_atomic_update() ignores its return value.

Atomic check is expected to prevent this condition. If it still happens,
warn and abort the update instead of continuing with the original
framebuffer address after the PRG/PRE setup failed.

Fixes: 00514e859335 ("drm/imx: use PRG/PRE when possible")
Cc: stable@vger.kernel.org
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index d6806d1ae6e1..78a3ea0581c0 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -629,10 +629,14 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	 */
 	if (ipu_state->use_pre) {
 		axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
-		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id, width,
-					  height, fb->pitches[0],
-					  fb->format->format, fb->modifier,
-					  &eba);
+		if (WARN_ON_ONCE(ipu_prg_channel_configure(ipu_plane->ipu_ch,
+							   axi_id, width,
+							   height,
+							   fb->pitches[0],
+							   fb->format->format,
+							   fb->modifier,
+							   &eba)))
+			return;
 	}
 
 	if (!old_state->fb ||
-- 
2.43.0

