Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF938E54C
	for <imx@lists.linux.dev>; Thu, 23 May 2024 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479498; cv=none; b=NWCDieS9flleCyROviaZbdX8ybURIcYSOMBKeivvb44Uw1OCG5vBQZ/14B2404FWJ6IDBEhGlOoyzEW6a4Hs/65wHsgdLw/Fl1nYX5QkQxcY+CTjt2H9W9MgLOBEDmMY5ZI7+1vCSvxqAx9srhv31HwK7ozyyzkca31m/+xAePU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479498; c=relaxed/simple;
	bh=9fYv1QeB6WK06AnnzgZ8h5bb4qnXHz4G7xbA7xVKRSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GvTidaYtnt8DGrBxldIXVb8o8k8kvO6fTtwDWuq2TKIKEmq5YcT54AO2vUFghuYoeYgAOcF8hf/Jg+Ygkil9Atfi2UcpP8rFiShEd04hdV5zRxtJYZ966ar3G/DXRTaMq/bY279dpY2jhT0wug6M+dR5jcgP2+09vb3DY1maXPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ilfjOes6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilfjOes6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716479494; x=1748015494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9fYv1QeB6WK06AnnzgZ8h5bb4qnXHz4G7xbA7xVKRSA=;
  b=ilfjOes6mE/PudxpOzaX1UVFnn3kX0+9noxRVllKDHpbDy0hUmZyerJV
   FtaQ4lHRwIoroRfpFd2Ugpdq08TxcSFciDd3QwcpEV/gCkNO0GQ6YB3Am
   i+hOcd6/KCEKBrqlEUb/Ceh4+1Xb1gBtoSL5mJ9K8Jf0VgyW57MXUIAid
   OIppE7JE0TYekAFKXGn4mTfPnexmUo9ikLkRGNSUsFTEkmCV0rU1G//Ms
   oIMZ8LIJ63SJ1YOKBwBRcUy2j+28AjDY8KDpw1cduqmTKInwpW3pCqYdP
   FpTp0oLzp1b32nqM74NbzIacS3N+vuEatKuZ/va/B2dDbCnU9o/lEtT/X
   w==;
X-CSE-ConnectionGUID: WQRM4g/kQWKmkEsVMlobtA==
X-CSE-MsgGUID: YxLq3vYGSnONjy3wH7R5nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16644300"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="16644300"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:33 -0700
X-CSE-ConnectionGUID: fw3YigMGQgmGMLtqUIo16g==
X-CSE-MsgGUID: 4DkX+wT7R9y6f8dqz8tXNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="34324959"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:51:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/4] drm/imx: fix -Wformat-truncation warning in imx_ldb_probe()
Date: Thu, 23 May 2024 18:51:08 +0300
Message-Id: <c257c4174743f35bafee8492ec60e1d2734450cf.1716479340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716479340.git.jani.nikula@intel.com>
References: <cover.1716479340.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Enabling -Wformat-truncation yields the following warning:

../drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function ‘imx_ldb_probe’:
../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: error: ‘_sel’ directive output may be truncated writing 4 bytes into a region of size between 3 and 13 [-Werror=format-truncation=]
  658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
      |                                                         ^~~~
../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: ‘snprintf’ output between 8 and 18 bytes into a destination of size 16
  658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Silence the warning by checking the snprintf() return value.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 71d70194fcbd..46f779fe60ee 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -654,8 +654,12 @@ static int imx_ldb_probe(struct platform_device *pdev)
 	 */
 	for (i = 0; i < 4; i++) {
 		char clkname[16];
+		int len;
+
+		len = snprintf(clkname, sizeof(clkname), "di%d_sel", i);
+		if (len >= sizeof(clkname))
+			dev_err(dev, "clkname truncated\n");
 
-		snprintf(clkname, sizeof(clkname), "di%d_sel", i);
 		imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
 		if (IS_ERR(imx_ldb->clk_sel[i])) {
 			ret = PTR_ERR(imx_ldb->clk_sel[i]);
-- 
2.39.2

