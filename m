Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAAA377EB8
	for <imx@lists.linux.dev>; Mon,  5 Oct 2026 23:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791244187; cv=none; b=dh3AATidxbIAypAxfRBtoQkxypPBdgf3oRQjlqru1Q3qguIKMebi6kZM55zvAOAZSkYh/JAsquBwfkeLIe1tjYPhXjpKUewryw7LL3lNvk/Fr2LleutPmTuSys6eaAm2wY9zOy6V+LYb5blkoSIz4T9TTvKiAEfrUi/XJrtYCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791244187; c=relaxed/simple;
	bh=YflqftK0tOs+oYdHjc0Iyq6b3erf2NCTF7El+MU1zD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJy0ObFz7jbXd7bnOYukgJ/8WqRdtCdmgQLe/wjfpeSdyI/67yI0fWCUx5qAn7OzF5iB7H6ETSYV4IRXmZhYO52k9RQIMkhWyj+/DwnpXo3F/U4t4tvxaczmZnMxS3HaysxbDIxV9xLa/5tskAr2YKYrv/FX9RSQ3A4f2BgJ3a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+Lq57ML; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+Lq57ML"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34daf1b9a1fso2003695eec.2
        for <imx@lists.linux.dev>; Mon, 05 Oct 2026 16:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791244185; x=1791848985; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jg7eC6O8sczD/5bWQmAv3EpmSexdLgJjBCRuuQxdedo=;
        b=V+Lq57MLNMKDPP1920b8TsXbaBMoWXHAVM1m2CPNLdcQ6is/W2phA8fQ3yJC01gTUi
         fU1qD9ry2QJNeWv9pH1yk9mgWJUH2dqW+8JLl7IyGR/JDxcQ+73MBi5ERFs/G0z0Leqb
         qWlDtsjzmWjaaPePoqgxoGseq6mJQw00UP3zHkk2UlOk1qds5PhB6urBozt09a6bk5lm
         bgEyKTEUqNOSUH22dq2rNcJMJev9aTx9se2Q2TE/tRE7+9zu52sWPNBmCayVOqJB62LP
         6g5QnwzARCwYvjB/DSfYBL7dGBLIw8RAbjob44mWYx2ZnMoB7+NA7+4jW8Pbk9RbY5mr
         l5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791244185; x=1791848985;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg7eC6O8sczD/5bWQmAv3EpmSexdLgJjBCRuuQxdedo=;
        b=ZQz2NiJ8dJhtX4SIJaTcSMb+KU6W2+AtRV90J7Chkdu5/khoDB7eFmYEKOE77C+fT+
         PRsWntG26lpWQ1A7xr+I4H1BY4Kin6bm78OVIJzy8CN0pkALAmh8sIdQwVWFAFwa1MiF
         3XO6ff7RLyIQv4SMrGMPbmN0IHJeTDc9fE0eu3+1vdGxJOWumaHY4ZurIGxfT8naTW+9
         3+JamloNwE5RPLK/hINVVRfN2zw2ZOzRV/rwixst1iIvZlZeIK1b6c2kofzUKB67zZnr
         LbZk7SXPHzdU7xUoWSKxG7Sp2u4fO21eYAmUEd0skmUEKOmICt6uNtxOCnYVpHzxvEcw
         dJnA==
X-Gm-Message-State: AFuF++mSDoHM/MTC0L9NlZu28JSbr43+cvp+yXNKGXLxMR+M7cCy9bEK
	j6ksjb5BvmwpzA+Q/R9U3hH7ht8wqFd2URCgT+Lk1JL24YwXCRuwfQTC
X-Gm-Gg: AYBFou0btJC/SQDL1myE4P4DkpKqHTx/8vTFXfOPfUnKyMwPWYBO6DEHBYEyPtIHpJX
	EnV/zFW12P05JpSXkizl8lDKOalsrEVROtGf4aq26QXZlDTShXDa+ODVah6OhKaGUhSncoopgoU
	9dbzvMg5DjakBIJiUrykDIOKi0LoP6H2MTPPc8d0XG+Y39ACqPD371Dm1bLfguqMx2v+p0GFo5l
	0kmTKuz/2bsBQBWRbnNDW2Du9EcQyILpT2+CeeyJwyzLrKWovLL4dSBV/yUvemXP3yA9eXFFDqY
	XHqRx5DyLsS210C8OvDQ3rBuw/6NHVmufCtklW1jJcZr0eh6MOTq0bW6fUC9JQy6uLL9lR1PZMX
	zNx8PgoWizCfC8/4rcA1NJmetI180eVU3Vz4voSYBhOB3u3LUWTmYZdj0llERc9xFpqPCDJakhl
	yH1hpxRghIdOX8TLunBORn0kMay1cxs9HxcKkLH6RAmNqKgSCQ342GvJv09Dgc+nCN
X-Received: by 2002:a05:701b:4587:b0:14b:992f:c168 with SMTP id a92af1059eb24-14f58fd2a19mr13452231c88.4.1791244184897;
        Mon, 05 Oct 2026 16:49:44 -0700 (PDT)
Received: from arlo ([72.235.71.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84ec510dsm2126430c88.13.2026.10.05.16.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:49:43 -0700 (PDT)
Date: Mon, 5 Oct 2026 13:49:40 -1000
From: Raiden Horner <raidenhornerdev@gmail.com>
To: slongerbeam@gmail.com, p.zabel@pengutronix.de, Frank.Li@nxp.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: imx: Fixed depricated implementations of 80
 char limit & open parentheses line ending
Message-ID: <asQ3lNQ2kZ_hBHZt@arlo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed open parentheses line ending issue & readability. 
I presume this syntax was there to meet the old 80 char limit, and double checked the changelogs to make sure this was not already submitted.
If not I apologize, I am still getting used to using the indexing system.

Signed-off-by: Raiden Horner <raidenhornerdev@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 13 +++--
 drivers/staging/media/imx/imx-media-csi.c     |  4 +-
 .../staging/media/imx/imx-media-dev-common.c  |  2 +-
 drivers/staging/media/imx/imx-media-fim.c     |  5 +-
 drivers/staging/media/imx/imx-media-utils.c   | 54 +++++--------------
 5 files changed, 24 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..69f5ca280454 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -704,11 +704,11 @@ static int prp_start(struct prp_priv *priv)
 	}
 
 	if (ipu_rot_mode_is_irt(priv->rot_mode))
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu,
+						      priv->rot_out_ch, IPU_IRQ_EOF);
 	else
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu,
+						      priv->out_ch, IPU_IRQ_EOF);
 
 	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
 			       prp_eof_interrupt, 0,
@@ -761,9 +761,8 @@ static void prp_stop(struct prp_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&priv->last_eof_comp,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index ef22a083f8eb..4eb621ddda25 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -679,8 +679,8 @@ static void csi_idmac_wait_last_eof(struct csi_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp, msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&priv->last_eof_comp,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(&priv->sd, "wait last EOF timeout\n");
 }
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 0d0ee8627a2d..be445df93518 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -377,7 +377,7 @@ struct imx_media_dev *imx_media_dev_init(struct device *dev,
 EXPORT_SYMBOL_GPL(imx_media_dev_init);
 
 int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
-			    const struct v4l2_async_notifier_operations *ops)
+				    const struct v4l2_async_notifier_operations *ops)
 {
 	int ret;
 
diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..9e9bacf9dcec 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -205,9 +205,8 @@ static void fim_acquire_first_ts(struct imx_media_fim *fim)
 	if (!fim->enabled || fim->num_skip > 0)
 		return;
 
-	ret = wait_for_completion_timeout(
-		&fim->icap_first_event,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&fim->icap_first_event,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(fim->sd, "wait first icap event timeout\n");
 }
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..00cd391b5ff7 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -16,18 +16,12 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_UYVY8_2X8,
-			MEDIA_BUS_FMT_UYVY8_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8, MEDIA_BUS_FMT_UYVY8_1X16),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_YUYV,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_YUYV8_2X8,
-			MEDIA_BUS_FMT_YUYV8_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_YUYV8_1X16),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 	}, {
@@ -71,10 +65,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.cycles = 2,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_RGB24,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_RGB888_1X24,
-			MEDIA_BUS_FMT_RGB888_2X12_LE
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_2X12_LE),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
 	}, {
@@ -132,55 +123,36 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SBGGR10_1X10,
-			MEDIA_BUS_FMT_SBGGR12_1X12,
-			MEDIA_BUS_FMT_SBGGR14_1X14,
-			MEDIA_BUS_FMT_SBGGR16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SBGGR12_1X12,
+				       MEDIA_BUS_FMT_SBGGR14_1X14, MEDIA_BUS_FMT_SBGGR16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SGBRG10_1X10,
-			MEDIA_BUS_FMT_SGBRG12_1X12,
-			MEDIA_BUS_FMT_SGBRG14_1X14,
-			MEDIA_BUS_FMT_SGBRG16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SGBRG12_1X12,
+				       MEDIA_BUS_FMT_SGBRG14_1X14, MEDIA_BUS_FMT_SGBRG16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SGRBG10_1X10,
-			MEDIA_BUS_FMT_SGRBG12_1X12,
-			MEDIA_BUS_FMT_SGRBG14_1X14,
-			MEDIA_BUS_FMT_SGRBG16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SGRBG12_1X12,
+				       MEDIA_BUS_FMT_SGRBG14_1X14, MEDIA_BUS_FMT_SGRBG16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SRGGB10_1X10,
-			MEDIA_BUS_FMT_SRGGB12_1X12,
-			MEDIA_BUS_FMT_SRGGB14_1X14,
-			MEDIA_BUS_FMT_SRGGB16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SRGGB12_1X12,
+				       MEDIA_BUS_FMT_SRGGB14_1X14, MEDIA_BUS_FMT_SRGGB16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_GREY,
-		.codes = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_Y8_1X8,
-			MEDIA_BUS_FMT_Y10_1X10,
-			MEDIA_BUS_FMT_Y12_1X12
-		),
+		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y8_1X8, MEDIA_BUS_FMT_Y10_1X10,
+				      MEDIA_BUS_FMT_Y12_1X12),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
-- 
2.47.3

