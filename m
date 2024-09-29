Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0002D17C992
	for <imx@lists.linux.dev>; Sun, 29 Sep 2024 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727617444; cv=none; b=ohSSFrN/r+C+M7Uhdy2POeQnRM7aSAaBE+giCY4xVtEaxbafGh8z6sxv6M9qYb+CxM9RJgZStOkTeCeU+RVP5tYnI/yLR/2lJbazpt3PfjK9lwT3X7tfuManC2xJOG4gyab+73NwJYFWgO/Tm2G44t7RTQCPEYlW6fKHRrO0nLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727617444; c=relaxed/simple;
	bh=oMfSYlB7P9eLwoLyD1PZzgkE2aC3vO/4RvgIGutTDEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQpHgd6AkygpRgi9MwLQxE1Ng3VkSlHcgrubryDUOLa/0PXFFXsVykbUVqxVAGIq5otL6Louvn5lLRc1tPNBWHzYi4FfZH0JUAPKPYsaiJPRR26n1WDonTevLlOrkKHGHDzKVuxNtiCIJOaggGz4kWcTW+D6IXqpgJhj0b8RrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DUbrEfjU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DUbrEfjU"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 805556DE;
	Sun, 29 Sep 2024 15:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727617349;
	bh=oMfSYlB7P9eLwoLyD1PZzgkE2aC3vO/4RvgIGutTDEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUbrEfjU5GOgNz54YsMVhBoPA5Ag4Lc8j4f07vmRdQ20/4uokamIH8Kz085KY02Xv
	 vN3zHeUBLZKOcbnH2T5A9QBBwCASp7Nlmxi9woCiJbnqEjFqdkcdJ3AuBMd/CoEuLa
	 EKgX4jdPMf11BeQWLU/QFZM3h/Muw6dDq+t/1KFE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: guoniu.zhou@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: imx8mq-mipi-csi2: Drop ST_SUSPENDED guard
Date: Sun, 29 Sep 2024 16:43:53 +0300
Message-ID: <20240929134354.20735-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ST_SUSPENDED flag is set at system suspend and cleared at either
system resume or runtime resume. It is then used in two locations:

- In .s_stream(), when starting the stream to return -EBUSY if the
  device is suspended. This can't happen, As the function calls
  pm_runtime_resume_and_get() just before the check, which clears the
  ST_SUSPENDED flag.

- In imx8mq_mipi_csi_resume() to skip resuming if the device isn't
  suspended. As imx8mq_mipi_csi_resume() is the system resume handler,
  the device is by definition suspended.

The ST_SUSPENDED flag is therefore not needed. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 8eb9c7049425..0f56a40abf33 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -64,7 +64,6 @@
 
 enum {
 	ST_POWERED	= 1,
-	ST_SUSPENDED	= 4,
 };
 
 enum imx8mq_mipi_csi_clk {
@@ -404,11 +403,6 @@ static int imx8mq_mipi_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	mutex_lock(&state->lock);
 
 	if (enable) {
-		if (state->state & ST_SUSPENDED) {
-			ret = -EBUSY;
-			goto unlock;
-		}
-
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
 		ret = imx8mq_mipi_csi_start_stream(state, sd_state);
 		v4l2_subdev_unlock_state(sd_state);
@@ -673,8 +667,6 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 		ret = imx8mq_mipi_csi_clk_enable(state);
 	}
 
-	state->state &= ~ST_SUSPENDED;
-
 	mutex_unlock(&state->lock);
 
 	return ret ? -EAGAIN : 0;
@@ -682,24 +674,13 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 static int imx8mq_mipi_csi_suspend(struct device *dev)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csi2_state(sd);
-
 	imx8mq_mipi_csi_pm_suspend(dev);
 
-	state->state |= ST_SUSPENDED;
-
 	return 0;
 }
 
 static int imx8mq_mipi_csi_resume(struct device *dev)
 {
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct csi_state *state = mipi_sd_to_csi2_state(sd);
-
-	if (!(state->state & ST_SUSPENDED))
-		return 0;
-
 	return imx8mq_mipi_csi_pm_resume(dev);
 }
 
-- 
Regards,

Laurent Pinchart

