Received: from mail-108-mta210.mxroute.com (mail-108-mta210.mxroute.com [136.175.108.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811FB153BC9
	for <imx@lists.linux.dev>; Wed, 27 Mar 2024 23:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581782; cv=none; b=TF7+pY9bKJ35eZB5oclL/qdYGpV2Sw+YlZhLBARU2wCTyjd4f7LPvPIBBAtmrnmnc5S+wTsY7yjVgRP2YP/XI2mlmTajL5UmkmTX0j4hy0O1aQIAJHzqYxIKxUHevPu+/aDH3R3eq57HwEnpwA/KItDIBcCVGahyUZfrtYrmvck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581782; c=relaxed/simple;
	bh=3LJ/xx4vsrKiCRk97kvpCp6ago1CACySem7BQV4Xz5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBO4eW64eA7enrkpOiVar3a2d7YCjY4j2ZmhkdTF0j9sO/e7UeyTSWOemUAqIIaczis4UB4byOBKTqGhijK4UReXpDcHxXPHNvwOBre7dEVBkBMIVNuaUjINk8dpynsECwc/5+4PP2cC0JXlGk1ROsfLMLv+ctz1vHYw8oQVQPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=hTxbudJR; arc=none smtp.client-ip=136.175.108.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="hTxbudJR"
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta210.mxroute.com (ZoneMTA) with ESMTPSA id 18e8234967b0003bea.00a
 for <imx@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 23:17:48 +0000
X-Zone-Loop: c24189ade7ea0586d099d5512b26a525ebfea04a53d0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NKk0T+d3dsRrMPw1XZzJJ8j4Y7WxSYSZmFULC91tvv0=; b=hTxbudJRSiFPMc+ihEv8FupVz3
	k8LehyTrGLjdIxqWCNs6So6isud70oR3Q0ThwGcNRdqOX/Ou1r6/yfBKPCvXd9Ksp/+LbvIF0NYxM
	htbsIktfGtMI6pqsuH+EMib1iTiaSjaj+Nih63nFOGB9Tl+YCYfOOBI5P3yEQefSbzUnGuHsgD4Mz
	7rNDnYpwBcjd50kw1hriv3WMo107A09lWSE1bmfdOcyjV6VaP8bnuTP00goRptSb4yGdHMhUUNfJe
	UgFuTJdhzdooQcAwd9IFDe8DbwPqEj5Dw4l+Wl2tNDs0JCEWW0tRjaJshDdQRX2u/h2zEGYtKApRb
	EMWqO8iQ==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Luigi311 <git@luigi311.com>
Subject: [PATCH 15/23] media: i2c: imx258: Set pixel_rate range to the same as the value
Date: Wed, 27 Mar 2024 17:17:01 -0600
Message-ID: <20240327231710.53188-16-git@luigi311.com>
In-Reply-To: <20240327231710.53188-1-git@luigi311.com>
References: <20240327231710.53188-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

With a read only control there is limited point in advertising
a minimum and maximum for the control, so change to set the
value, min, and max all to the selected pixel rate.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luigi311 <git@luigi311.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index a62ed8c26663..66022088e4da 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -978,7 +978,8 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 
 		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
 		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
-		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
+		__v4l2_ctrl_modify_range(imx258->pixel_rate, pixel_rate,
+					 pixel_rate, 1, pixel_rate);
 		/* Update limits and set FPS to default */
 		vblank_def = imx258->cur_mode->vts_def -
 			     imx258->cur_mode->height;
@@ -1269,8 +1270,7 @@ static int imx258_init_controls(struct imx258 *imx258)
 	struct v4l2_ctrl *vflip, *hflip;
 	s64 vblank_def;
 	s64 vblank_min;
-	s64 pixel_rate_min;
-	s64 pixel_rate_max;
+	s64 pixel_rate;
 	int ret;
 
 	ctrl_hdlr = &imx258->ctrl_handler;
@@ -1301,18 +1301,13 @@ static int imx258_init_controls(struct imx258 *imx258)
 	if (vflip)
 		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate_max =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
-					imx258->nlanes);
-	pixel_rate_min =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1],
-					imx258->nlanes);
+	pixel_rate = link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
+					     imx258->nlanes);
 	/* By default, PIXEL_RATE is read only */
 	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
 				V4L2_CID_PIXEL_RATE,
-				pixel_rate_min, pixel_rate_max,
-				1, pixel_rate_max);
-
+				pixel_rate, pixel_rate,
+				1, pixel_rate);
 
 	vblank_def = imx258->cur_mode->vts_def - imx258->cur_mode->height;
 	vblank_min = imx258->cur_mode->vts_min - imx258->cur_mode->height;
-- 
2.42.0

