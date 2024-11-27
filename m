Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303CF199252
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 10:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732703476; cv=none; b=I27zWYJsrTCo6NQpB/VHE768fM3quDY03lK8fQ11Yc8KTlUTAm7+7AY31O1NZEFbvlbOVVeXZAki8mCTqIWLSPmQ228/ILhVLoYdc6sVixL1oqKYltqxUSapzorZiHdbSwUPAgIsPCTbxOT7GRYITbT4CfLOnIrvU3IZ58Qv7Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732703476; c=relaxed/simple;
	bh=kS5gD+gCPg6RitLvR7solXUmzeZfhRVQioQxVljM6y0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YmXXP/AD54RX/ahyi9daeKgRmdkZFdWx2BSR5k6TNc53rJZLtoz+GB9ePX1/U2ZODpIHSBorHLcAnTKnyNq/5drLJj3cfrpVxPowc2yrs+jYpWaMBWtZvPTypQxmmSiPisi13mbpPFK/0M1vi4gClNOpfmaMkt3f2YQqQQ4OXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=aASOeJoy; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="aASOeJoy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HDovDaEOFR4qUZaygP6Mpx2tbmWwjmnzTWmEO3UiYwo=; b=aASOeJoywklCeOh/F6TjHzBMJD
	mTL5Ymn8eus4irgeCOC5ll4doPl5wfve0rmQDmsf+9muLv/b1Avq/si6cQ1Ehj8t/6fKN05k10sc5
	yAnF7gaZpRoUElF+y3i9I0tk6y5V6kV4Dh/KBWzM/wxkB/HQwSwMBH+NN59+A2IEMuhCGCuMbt5IG
	/NvPtHinS3ioDY8ZXWLHW0tkP6S7Q8SUftXXxSN6PI4RcDhyeXZdo1yBzHUnb9OvvNYsZbi5/1orP
	PFDEmzwMcNnukb6MYWPA3p7jN68U2Cis/X9SoW/SBpnHN9e7DePeZcu5SnLoggNsltqhkIWd5gKkw
	UreS43aw==;
Received: from [89.212.21.243] (port=49750 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tGFK8-007Rx6-32;
	Wed, 27 Nov 2024 11:31:08 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vcom as optional property
Date: Wed, 27 Nov 2024 11:30:30 +0100
Message-Id: <20241127103031.1007893-3-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127103031.1007893-1-andrej.picej@norik.com>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Janine Hagemann <j.hagemann@phytec.de>

Add a optional property to change LVDS output voltage. This should not
be static as this depends mainly on the connected display voltage
requirement.

If the property is not present, the default value of 0x05 is used.

Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 57a7ed13f996..d6824f6501b6 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -147,6 +147,7 @@ struct sn65dsi83 {
 	struct regulator		*vcc;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
+	u32				lvds_vcom;
 };
 
 static const struct regmap_range sn65dsi83_readable_ranges[] = {
@@ -435,7 +436,7 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 		val |= REG_LVDS_FMT_LVDS_LINK_CFG;
 
 	regmap_write(ctx->regmap, REG_LVDS_FMT, val);
-	regmap_write(ctx->regmap, REG_LVDS_VCOM, 0x05);
+	regmap_write(ctx->regmap, REG_LVDS_VCOM, ctx->lvds_vcom);
 	regmap_write(ctx->regmap, REG_LVDS_LANE,
 		     (ctx->lvds_dual_link_even_odd_swap ?
 		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
@@ -580,6 +581,13 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 {
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
+	struct device_node *endpoint;
+
+	ctx->lvds_vcom = 0x05;
+
+	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	of_property_read_u32(endpoint, "ti,lvds-vcom", &ctx->lvds_vcom);
+	of_node_put(endpoint);
 
 	ctx->lvds_dual_link = false;
 	ctx->lvds_dual_link_even_odd_swap = false;
-- 
2.34.1

