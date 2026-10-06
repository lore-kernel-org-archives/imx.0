Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7867814B950
	for <imx@lists.linux.dev>; Tue,  6 Oct 2026 02:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253157; cv=none; b=KabbN//rMR91IGzs1G693sx+lQLQgKQUh5FEvjAAnEm15/Ae5PI1w0DOWY9hWQy0gvyiCA9SWEApJYOyXX4xp21lzgJ41M+hy8R5La0c64YN2PQJPv5yQHtTTwehzM0E4jG7IlQA96vXwMU5nuEaviMGqp6N5CGQ/KSAQ9FNGmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253157; c=relaxed/simple;
	bh=BmaEHSA4Sc5Ix5xoHHxmdmGUN9bsHAfm5IqRRWj5dtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VxA7m17mKJhclLe2Eu0h2ay7IAN6DV4BnJQUJf5tWmVY3Vb8kZwFsLvh9SLu24h8Y6OVFD0vb0+ASG2bqSgX+UBaCSjYnOFdG2Tib/HzCY1TaZNmSjb2peaH1lpGPFtGAx3BMyZVMKasxDi2LPunP3vX3utCDBKy8thMBdWTbgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqw8OKSQ; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqw8OKSQ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3115c4451c8so1632218eec.1
        for <imx@lists.linux.dev>; Mon, 05 Oct 2026 19:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791253154; x=1791857954; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goSUC8rOLbR1QanLKh3MMf1EmDUtSXdm+TglUr6s/zM=;
        b=Tqw8OKSQhpHbUGcMXJZ+YBNzDxbAgq+V0YtNQ99K6KWApWhkz5IpQRG3onWl7Fqe/3
         aeALYtLIfkZbsabTmqLzy1Xp//u3gKFlU37WTiP4Wj8v76+OeFcB13XnhPDDeJJ0Uqi8
         2jiO8Xb3n0JRiLjPr/NpJLuRMp/DdVgEKExxtPqtJC1vxhcGNpfKMKKFUHLY4GMlf8A5
         S54W9bnjLK4FOeZjAfEW3HK4e5Zk+YcjtCWgnpAp5LmZ3ZC/b/eXeL38R7cBm0VRKXbV
         AIrA4HiiyOYPyYbhA03eZZ/sw9uWdU+aJb86IazKMbdU8SuGPVHqJ3BVa/ZEVziDrD8S
         4aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253154; x=1791857954;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goSUC8rOLbR1QanLKh3MMf1EmDUtSXdm+TglUr6s/zM=;
        b=EOESbArqcC98eqarN4Og7c3q7AcaUTdQXjkViK7psNfW7LHcT/mIJimoFASYO8YbKe
         YwM/RkH61fGgph/RX442uG87kNTpNVPesDpCNjndXct7L0grP4XW1gj46kM5Z46Q/X5z
         mbpkY9a1N12CqYt+dLqXtfKfu9gwv+iBjbnfgMLRciG8BEeDx7679yGUiRr0Z4Oh+TeK
         jRpQyHuFafZsfGg0CCjoh1+Tl2cOTsjr25iTFrBVYRPEBPuNkL5ZpqBnYOlfjDZA9voC
         fTXzOh2O9071OJWmGDtOaQK76ByFY0WgKUABYYaduifxWAKnboskx/jQV9JObwS4MFcS
         6a/w==
X-Gm-Message-State: AFq9FYLJjtJym+dhgeGOsavYLhgnwMAwnFt13JyT5M2WspFLzEhOMPci
	cm9QOCUvNhYAO6mzdalqKE4ZtTcOZd8y9Ejy0j4wp6PlWp6RIFgLdoVR
X-Gm-Gg: AYBFou2TA9vFHT+h98YtM5e+e5aY/6OUs2hSzWVpUp2HhYvO5y1oBTRu75aMGPASMXw
	CoOVfsq6uyrcSqjHhKzNeVAWro5zkdUt2vLIEUFJJDAthJUDgHOIgeMxpBiZ6UFu/XUAyEP045A
	krz2dUyyNQVCnpmrYtUa1CGNswCRUGZ59aX5kUpfL/O0BWf4ogRhBNfdAw+K4qtGjDk3xkTIhIv
	kMSoAvOYaX9tGRUNg2eKiA45qUUxGAVQ6b8/ZS9ra6ADTzrYMSWR533fjRp+V9owB+PpXCfwO+P
	j8uLfrc9nK+jQ1F9EOlGf9pMWLWhUOX+NRquYMSTGZLOWz/QmZkB6MzC+aBTBpYuprOIzl6naR/
	yi4OCbOWQSUXJsOomRAnbHwzfQLh7p7b1xBe7RUZGYG6yfRxtFn4riknBs+dwsD5KlJv6FLDDJE
	N85aDuYsRMfJSvgMWTxKms0Hj/jGwgM9dHlHh8MAh+OaQkZEgJluiWQHStRKDn9ShA3U/kHOwS
X-Received: by 2002:a05:7300:e9d7:10b0:351:2200:1cde with SMTP id 5a478bee46e88-35145200a8emr1646887eec.8.1791253153514;
        Mon, 05 Oct 2026 19:19:13 -0700 (PDT)
Received: from arlo ([2607:fb90:742b:7290:cb9a:9a47:ea69:3868])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a5b004sm3016308eec.18.2026.10.05.19.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 19:19:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:19:08 -1000
From: Raiden Horner <raidenhornerdev@gmail.com>
To: slongerbeam@gmail.com, p.zabel@pengutronix.de, Frank.Li@nxp.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: imx: Fixed depricated implementations of
 80 char limit & open parentheses line ending
Message-ID: <asRanEEXSR2hDM_e@arlo>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed open parentheses line ending issues & readability.

I presume this syntax was there to meet the old 80 char limit, and
double checked the changelogs to make sure this was not already
submitted.

If not I apologize, I am still getting used to using the indexing
system.

Signed-off-by: Raiden Horner <raidenhornerdev@gmail.com>
---
Changes in v2:
	- Fixed line wrapping in the commit message to adhere to 75
	  columns
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

