Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455D1F2371
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736260778; cv=none; b=g5hLFaJ80rju6P5wzA+ptTACCza6Cqx7ILpq2xkYfyB0lTzuK0sWis185AgCi/V+983OY6/cZrOUTePPikMahS+h/Fv0wc9LtkwKvvpPl6VaT7kCq8CcGbdi3ZOhuIk45Y3g/SD47YaGGgSS6dXvQxE5qrXwTxuD8NIq+JTxzHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736260778; c=relaxed/simple;
	bh=/iNk5xHjFRCqBD6QAw52Fh9wUZngC7T+eM1bie/g0tU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h1NHEXwEgc/KeyaC1E57ahhj5RyLcD3oVAFTXE8vyrL5eqr8kW6WOCljZSbRoa2nBuoozqOb6wu+GyINfH01Fv7+grQjWhaLkBBYks2mjguUuQ6NfIBI83I7rAPDobmYvBTcvq0WZvO/mDZz8G6wW4iuXCPRGp/pHx1aDn2tY18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=WBTSAxUR; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=EllWyCh9 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="WBTSAxUR";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EllWyCh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260774; x=1767796774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XVzJm2W1uVdEFEZWkXxZ+spN7k+YpzBUagSYY5jbkr0=;
  b=WBTSAxUR9mNrGrB+BIXE05KLc1UrUR4nXpOfezQo/ygIPECuTJXORTi5
   0sl8K38wfYq6X/QK/RISe43td7xKG++7PnM14jUDhv7mSnUQGc54JbXIH
   myuFffUwCYP5ZsYWzPrnPi3Lu8ouCnAc6IBfrZSNlYAo87vAFQKIIprZZ
   z2OajiDg1t5UAqz7gq+k60F0SaCEnHB/e5W6EPYWvLrZwUifF7LatIbUD
   xxuvBZZk6MvdvSEYE2pHpRZvjCqVLehwn2HO9ReHvkP6xrX++VDN3TCEX
   XYuyx/WCmrzgYsmgrmgjdcA7xgFTZm4s5yPnVjhg2IxRTET+uLCEotr9I
   A==;
X-CSE-ConnectionGUID: jIb3ypKkSKyrja3ThHtuZg==
X-CSE-MsgGUID: kaeze2RMQtO2pwYlPLFHvg==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897250"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:33 +0100
X-CheckPoint: {677D3CA5-14-1D00F64B-E6C57517}
X-MAIL-CPID: 800858C3296ADFDF66C2AAAF0E539E43_3
X-Control-Analysis: str=0001.0A682F15.677D3CA5.0092,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D6A6160B22;
	Tue,  7 Jan 2025 15:39:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XVzJm2W1uVdEFEZWkXxZ+spN7k+YpzBUagSYY5jbkr0=;
	b=EllWyCh9SvK4sD0noz8TqzYTsz87MPpHWGJx3iLQ+dsF4rFFUyeHuv1JxV6vKmssHezoYt
	vTdohZGKG3dXtwtlZPtTrrjWt5N4YboIORAs9Sua9hyqOX2tZrst+K+QI/46AENHPx5Pw0
	LRUGxZsTI2SXuJAqQnIHZtgybEKhB7Kq5+b6bb5DkO5n0mwCI6BmGb88YONYQfvZFhN1gF
	sWAcDONNQjMJ5WIPpwnVFPPf/RGNKz9onpxeEdDQF5q52W9kMbfuCT0pEvHGP2KgKpCx/l
	kT08aoo4YIE8s/bk77hnylJcSUn4UaxoDyMs+6u/T44ThUXJk788xpTPUAhhuA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/bridge: imx-ldb-helper: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:38:59 +0100
Message-Id: <20250107143900.988567-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This simplifies the code and gives additional information upon deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 9b5bebbe357dd..2c9b862af74af 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -167,7 +167,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 {
 	struct device *dev = ldb->dev;
 	struct ldb_channel *ldb_ch;
-	int ret, i;
+	int i;
 
 	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
 		ldb_ch = ldb->channel[i];
@@ -177,14 +177,9 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 
 		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
 							     1, 0);
-		if (IS_ERR(ldb_ch->next_bridge)) {
-			ret = PTR_ERR(ldb_ch->next_bridge);
-			if (ret != -EPROBE_DEFER)
-				DRM_DEV_ERROR(dev,
-					      "failed to get next bridge: %d\n",
-					      ret);
-			return ret;
-		}
+		if (IS_ERR(ldb_ch->next_bridge))
+			return dev_err_probe(dev, PTR_ERR(ldb_ch->next_bridge),
+					     "failed to find next bridge\n");
 	}
 
 	return 0;
-- 
2.34.1

