Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207B1CEADD
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 17:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348615; cv=none; b=LaPoJwOMXrjKxhGVFZGv5JtjtYwmMno8q9/0sPZncfsU8s0WTDhtL9kfnM3ATf9HoDbzcUoelS0FsybghQRANMwDjxD3MMZWQfgOq96snVd1cD2WgJegPEqYYr3F/LVXFhv/hVeXCEa7YiO8HGqQjPScjYOL8HLrYpNtP+z0u9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348615; c=relaxed/simple;
	bh=cInaH5YhWjMHXB+Tiq+aUkG/UqKzahFJ+y1X1Oh0Rj8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DQeLl2UEkz449YdDvJIzLy1Wi0L0MZkIFV1/k18b6FmH+ZVbIhAYW0noVkikIa+qIlZlsbrh0uky7PUuIVBFpWl9L3Kr43c0Z+zg3T+IpK3D5iFIS4mIslwY41QQtOWh8NNQ5e5wE2qVU4aKW+auskpBlCosRbhj702ZRmo53Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QhLESs4V; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhLESs4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724348614; x=1755884614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cInaH5YhWjMHXB+Tiq+aUkG/UqKzahFJ+y1X1Oh0Rj8=;
  b=QhLESs4VxNpG6t7Vu/1e3GqL9uM4HF8cY++9sfYoQT1iQCbnQC8ZKe8W
   uFVusoweuyJ1ekO+hHqWcjYxiFq9wZQfiUtLq3bjjz2NVcUFmo6qFkvg4
   VFgcVJAbG4JccR+zO5WTDXP60twTF7I3A0sNdwTLSgp7+soRJYo7OUt9Q
   n3hgZH586h8eS6LZ9DyG8jBEAS+wlvCG0xtrjTczEliwADKI64yyCOvNO
   BRt73eQoE1dsXIuE18E9F+5HgwQwoVDWV0BZ3G9tT4qI6BhgaxNqefySH
   Yt4GbPtTZQo7d8e3nS+dn309/eF1ihBB6NOlD3txyXKCGBtnTLKNjlITB
   g==;
X-CSE-ConnectionGUID: 7YNc0YOQRt2ljNUCF6IFSg==
X-CSE-MsgGUID: PY+jxR5jTgGzpjimgTwZ3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22955424"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22955424"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:43:33 -0700
X-CSE-ConnectionGUID: xddZFUq+STWsls54hLqKCA==
X-CSE-MsgGUID: p9mUht6HSpSCc/xMX6OHSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="65862403"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.121])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:43:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/6] drm/ipuv3/parallel: convert to struct drm_edid
Date: Thu, 22 Aug 2024 20:42:51 +0300
Message-Id: <a1698044d556072e79041d69b8702099fd17bd90.1724348429.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724348429.git.jani.nikula@intel.com>
References: <cover.1724348429.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Prefer the struct drm_edid based functions for storing the EDID and
updating the connector.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 55dedd73f528..91d7808a2d8d 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -34,7 +34,7 @@ struct imx_parallel_display_encoder {
 
 struct imx_parallel_display {
 	struct device *dev;
-	void *edid;
+	const struct drm_edid *drm_edid;
 	u32 bus_format;
 	u32 bus_flags;
 	struct drm_display_mode mode;
@@ -62,9 +62,9 @@ static int imx_pd_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (imxpd->edid) {
-		drm_connector_update_edid_property(connector, imxpd->edid);
-		num_modes = drm_add_edid_modes(connector, imxpd->edid);
+	if (imxpd->drm_edid) {
+		drm_edid_connector_update(connector, imxpd->drm_edid);
+		num_modes = drm_edid_connector_add_modes(connector);
 	}
 
 	if (np) {
@@ -331,7 +331,7 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 	edidp = of_get_property(np, "edid", &edid_len);
 	if (edidp)
-		imxpd->edid = devm_kmemdup(dev, edidp, edid_len, GFP_KERNEL);
+		imxpd->drm_edid = drm_edid_alloc(edidp, edid_len);
 
 	ret = of_property_read_string(np, "interface-pix-fmt", &fmt);
 	if (!ret) {
@@ -355,7 +355,11 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 static void imx_pd_remove(struct platform_device *pdev)
 {
+	struct imx_parallel_display *imxpd = platform_get_drvdata(pdev);
+
 	component_del(&pdev->dev, &imx_pd_ops);
+
+	drm_edid_free(imxpd->drm_edid);
 }
 
 static const struct of_device_id imx_pd_dt_ids[] = {
-- 
2.39.2

