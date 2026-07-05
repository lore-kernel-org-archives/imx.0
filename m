Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBC286D5E
	for <imx@lists.linux.dev>; Sun,  5 Jul 2026 16:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783269363; cv=none; b=uYoIo5We3E0VJz5nrvxa+wkzybi1cL2+zheGhXoQqms5OXV8J2WXxLHWrh9K/k4l/6TWm4WUZKlSFGufFhxWXOl+G9zltga5nV8B5LIDK8s97U7y3uH9B0ynMT2kzNEZYwCF7P+WCfNPWluaLgioJiV+yjIDTYkMYJmaAOQirnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783269363; c=relaxed/simple;
	bh=ntNZhSM1ZKlrfPVRzskXw5sJhLfKgFkRGt2MLPtAM7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZqXfqRjNLegvNdhXqaoWnFLKPDH1AicDWM7c16JcVdnBVZAX0kqYAR0RWCQUe+DP5pJ2PLG8reX99JF4W/1DxByCSYZA8Y0oRvJeqGCjzm3y3uxzW6WeB3jvqqLGGkYviqiPDIZw0DGDGcXGrxObhJSbn9qhzx4y/ipiAkjQmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CLKxkZdi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CLKxkZdi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=inqQYC9Nnuk7LQ
	ATOBE0fYD9nNEE+MN3hpNMd5FAQ58=; b=CLKxkZdirAzgQDWRv6H5kqkMdzhwNn
	KH8nqC0WhBGR8Ol64Z29kLIY+itzhQ2wWubMmLv2U9OaKQRyp3J/u1sbqeyhxrDl
	aBgupDQ+i9gPlq3+M9Vs5JT3CZhIbYOtQHetdLHNRYHJxW6QwA51787pCxMAgC76
	dk6fbZeQAkofZ3k4nZD4a6hFl0iySi1wUWUheKP7xSQOefaP+wh7b1VTdJUy4ZNZ
	AsbBVnj7/5om3yq8QQ3ZGldVXlV+dH/h0rBnDfaYx4XBCxB4nh44HwvSyTwgeGxQ
	D/+5kVeyer65C6NYCZs2QE4qQDGGDQRtKNrccXny0bYcl5tC5fDsikfw==
Received: (qmail 2287250 invoked from network); 5 Jul 2026 18:35:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:35:57 +0200
X-UD-Smtp-Session: l3s3148p1@w1yXwN9Vp0ZtKjFj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	imx@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Liu Ying <victor.liu@nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/3] drm: remove unneeded 'fast_io' parameter in regmap_config
Date: Sun,  5 Jul 2026 18:35:35 +0200
Message-ID: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using MMIO with regmap, fast_io is implied. No need to set it
again. No dependencies, can be applied directly to the subsystem tree.
Buildbot is happy, too.


Wolfram Sang (3):
  drm/bridge: remove unneeded 'fast_io' parameter in regmap_config
  drm/imx: remove unneeded 'fast_io' parameter in regmap_config
  drm/rockchip: remove unneeded 'fast_io' parameter in regmap_config

 drivers/gpu/drm/bridge/synopsys/dw-dp.c          | 1 -
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c   | 1 -
 drivers/gpu/drm/imx/dc/dc-cf.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-de.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-ed.c                   | 2 --
 drivers/gpu/drm/imx/dc/dc-fg.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-fl.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-fw.c                   | 2 --
 drivers/gpu/drm/imx/dc/dc-ic.c                   | 1 -
 drivers/gpu/drm/imx/dc/dc-lb.c                   | 2 --
 drivers/gpu/drm/imx/dc/dc-tc.c                   | 1 -
 drivers/gpu/drm/imx/ipuv3/imx-tve.c              | 2 --
 drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c | 1 -
 13 files changed, 17 deletions(-)

-- 
2.51.0

