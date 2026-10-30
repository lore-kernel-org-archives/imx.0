Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793358793;
	b=iPrjDwo9cQtgGJsFpnZTWIEki4Kz1iiW3Jsr9axSu98ApyR6l4g9zFMvnVUd+Q9ZL2uk
	 FRjMtpEAPxyD5j7cGFGbE1jVwj8RFQePTJVD0v4gMTY33JGPJrG+XSnj4tsC+7zFKHOVY
	 kgOT3z0NS0iexfGkyKuEYWCF3znux/HfW5ZX/CmEaJxLmJFtOWnXoPfTtqS59tepdwC7i
	 WH99ybshCzuXphEG1YQSiUPCE3dXbLvfqL9a7f8zMsHrKjii5WM3ky5CEH9PCxN/uhSQK
	 1MTRQ/XXhEOOV10iG8oPugDbEiU9oAx4T4JvwrAcGEb5r5RTfFeNe2F99/FxHbFV1Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793358793;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lA6TJOaRxsa4Fs8ttaPCMuiOdnwDekD+hly6/8eGHww=;
	b=zL4ZY6TzjgFrQEaW2RlwpU85bZ+HCtkemBkXcu+r/beUck2BjUSkmWec2X1YH30mG2at
	 1hPJI/5nOB2K5Pku2+kZgnBSFCqq8Xc+m+3Jkw3eYwMW3ZEeJXMs4gBdnMjBUT8rLXoUR
	 AQJJC81cRxGpIdr+8rLgjvfq0f1Hi+UxU7VGGl/C+mWEA0/Y+VeuuwIgJkNWYKXTqjO3H
	 DpLJiodU6KKU73E8Nbe/kr73EJ9ERiMrLnqkRVWVf++h+aYo3haBc+fowBsU2JXAB3x5+
	 4UbsQhQb3mxSL9dROF0eAweIslNwShi0wHBBkuWa/UVB0th0dbs6qOgunumEqygoVZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nFDu680s;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA82606A31D
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 11:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA82606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=nFDu680s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=nFDu680sWTPFHy4B3sLoILYc4GXFPEXQOnUHzZRCF31jhj38JpRrS62LE1t4+irWTmosP1frNFZYt
	 k6RlXiZRanJlMCR/fcbNXWwTLu6KCJCwSTGM/J856hWHtGRAsnB9zKMo3jWrKmDcjySb+ISAKg2q3F
	 KyIUzc06klWeWWIs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae47bbe5ca-14eed;
	Fri, 30 Oct 2026 19:13:07 +0800 (CST)
X-RM-TRANSID:2ee86ae47bbe5ca-14eed
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae47bc0125-5c588;
	Fri, 30 Oct 2026 19:13:07 +0800 (CST)
X-RM-TRANSID:2ee96ae47bc0125-5c588
From: laixiangwu <laixiangwu@cmss.chinamobile.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	laixiangwu <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] drm/imx/dcss: Fix clock leak on blkctl init failure
Date: Fri, 30 Oct 2026 19:13:03 +0800
Message-ID: <20261030111304.2205-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
References: <20261030083342.1531-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dcss_submodules_init() enables the DCSS clocks before initializing the
submodules, but if the first submodule (blkctl) fails to initialize the
function returns directly, without disabling the clocks again. All the
later error paths already jump to err_clocks, which calls
dcss_clocks_disable().

Since the clocks are only devm-managed for their reference (devm_clk_get),
a blkctl init failure leaves all five DCSS clocks prepared and enabled.

Jump to err_clocks so the clocks are disabled like on the other error
paths.

Also rename the error labels of dcss_submodules_init() to the more
common err_<x> style, which describes what is cleaned up from each
label on, and update the gotos accordingly.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Suggested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: laixiangwu <laixiangwu@cmss.chinamobile.com>

---
V1 -> V2: Also rename the error labels of dcss_submodules_init() and
update the gotos accordingly, as suggested in review.
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 7fd0c4c14..206679d52 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -70,45 +70,45 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
 
 	ret = dcss_blkctl_init(dcss, base_addr + devtype->blkctl_ofs);
 	if (ret)
-		return ret;
+		goto err_clocks;
 
 	ret = dcss_ctxld_init(dcss, base_addr + devtype->ctxld_ofs);
 	if (ret)
-		goto ctxld_err;
+		goto err_clocks;
 
 	ret = dcss_dtg_init(dcss, base_addr + devtype->dtg_ofs);
 	if (ret)
-		goto dtg_err;
+		goto err_ctxld;
 
 	ret = dcss_ss_init(dcss, base_addr + devtype->ss_ofs);
 	if (ret)
-		goto ss_err;
+		goto err_dtg;
 
 	ret = dcss_dpr_init(dcss, base_addr + devtype->dpr_ofs);
 	if (ret)
-		goto dpr_err;
+		goto err_ss;
 
 	ret = dcss_scaler_init(dcss, base_addr + devtype->scaler_ofs);
 	if (ret)
-		goto scaler_err;
+		goto err_dpr;
 
 	dcss_clocks_disable(dcss);
 
 	return 0;
 
-scaler_err:
+err_dpr:
 	dcss_dpr_exit(dcss->dpr);
 
-dpr_err:
+err_ss:
 	dcss_ss_exit(dcss->ss);
 
-ss_err:
+err_dtg:
 	dcss_dtg_exit(dcss->dtg);
 
-dtg_err:
+err_ctxld:
 	dcss_ctxld_exit(dcss->ctxld);
 
-ctxld_err:
+err_clocks:
 	dcss_clocks_disable(dcss);
 
 	return ret;



