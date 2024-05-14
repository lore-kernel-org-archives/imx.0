Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654A55C0A
	for <imx@lists.linux.dev>; Tue, 14 May 2024 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715691402; cv=none; b=dgJU8BK4SKseS6oVV5xtunFBYy1NMLHg4fNEUmciCAnJXBK59V0EyihoJ9dvZHarDnti4TJq++CxdgfDpLA9kHfxma3CBQJ/PvpD2DhCXDtqyn7OhsxR2cA/kQ3a/pfXsfyeW918a8MNDsqh7/WlI0vdg343wrjG8dqAPl7vETc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715691402; c=relaxed/simple;
	bh=sncs7CxlVP7FlPsWW7vAI9GxSz7YTTUFsPvqj+KbprM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R/qiu2006WDfljB7E44CiVKVY/1aYWARd4o582okkPhZf+MdTMbj2uVGbetSmhDm7pUQgGpEMfdOuDEbNrB5jMpWoBjhnk9Dgd4M65oI1cbhpk6uSz4YA6eVLoThho7xq/8NLGkLJ3hri0s8SZ6hjAUmTMaykhPaEZqy9yd0OnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lii6+N3Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lii6+N3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715691401; x=1747227401;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sncs7CxlVP7FlPsWW7vAI9GxSz7YTTUFsPvqj+KbprM=;
  b=Lii6+N3Z1ruyXUJlVUFXA37GSzMwDzH2bRX8PcDnbbfu7rOB4sIINlOq
   xtIw8D/kuSGcmkRHYXVu9fATygvnjCMpM5GJbGsZlGMiQBkPtZZdusdFO
   trqzEfOtWBDk+oXb7MW+1iBsumXW2T9PdfVEh1CwrQXJ9YL65NHPvXAKU
   uwKLO6rhwikBzDvrQ/zgskm/xCkV3qCTjLl/iq/7Amboe2favFxjV362M
   IoVfubuQhWgtog9HsZ3TkekSx1+GwRBXzHFRICXrKaCirHnqoLYFdiG0Z
   qbVEThxpXxFCK9O/xQnQsCRfsItR/zo3nXL9ykjQuz1a9C6uRsOoMpv7R
   A==;
X-CSE-ConnectionGUID: o+EAiTiQTe6C0Vkoc560Ug==
X-CSE-MsgGUID: PX8zguuSSUe9uiWMzZOj2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11613868"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11613868"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 05:56:33 -0700
X-CSE-ConnectionGUID: gjyKdEViQC633PClo/RP0w==
X-CSE-MsgGUID: f4LA4gsvSUWO93oy333Ywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="31232409"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.91])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 05:56:29 -0700
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
Subject: [PATCH 10/11] drm/imx/tve: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:16 +0300
Message-Id: <2f59a7ad10c29c21f08223ef19221cef48623cc8.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Prefer the struct drm_edid based functions for reading the EDID and
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
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index b49bddb85535..29f494bfff67 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -201,18 +201,16 @@ static int tve_setup_vga(struct imx_tve *tve)
 static int imx_tve_connector_get_modes(struct drm_connector *connector)
 {
 	struct imx_tve *tve = con_to_tve(connector);
-	struct edid *edid;
-	int ret = 0;
+	const struct drm_edid *drm_edid;
+	int ret;
 
 	if (!tve->ddc)
 		return 0;
 
-	edid = drm_get_edid(connector, tve->ddc);
-	if (edid) {
-		drm_connector_update_edid_property(connector, edid);
-		ret = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
+	drm_edid = drm_edid_read_ddc(connector, tve->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
-- 
2.39.2

