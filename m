Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F72857DE
	for <imx@lists.linux.dev>; Fri,  6 Jun 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200755; cv=none; b=KGiy4nhpt6bsxI89BSRSb7AzGbGP16iQ3U3V9ozkWmPuucu8Jwvf/YlZuNpXhQgZsaD4On9p7HhCcuLQNDAwUS+UGRviX3t13lHuqiWBe0POJKHWWQHFMyTg1TfronDdpse5s40eQKQhMAEQxj2p9LEUUgUK+9A6IhSl8YTADlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200755; c=relaxed/simple;
	bh=OEr//pCZxmZR0ItTKx8f8M3fAy5h3bsOeQI33nXAoYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8yj1onlmXVnEbcq+XfjCj7e2yN5ddXruhW5p5Fm3xAZIDNl5nnBwaBWXa2ihK0K6iFevlpXK4aKFVI/mBnOUK7OUJrVm6dtxJd0/YhcZB8/gqKY11n0BouKL0KF546f8OILFNzeBVXTyzoLjH2vRhcZhQFS03sIbCl8gECh/1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VHGcmUih; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VHGcmUih"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3A41593;
	Fri,  6 Jun 2025 11:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749200741;
	bh=OEr//pCZxmZR0ItTKx8f8M3fAy5h3bsOeQI33nXAoYs=;
	h=From:To:Cc:Subject:Date:From;
	b=VHGcmUih2rzvK2xEYB3nAj5IUzaiHaEgqlPnK98r6JWtiBZhm1JSxavEpSVzgEvxt
	 Jf/UsgRyUToqnFRboZp85r22Mf9/BpPNPf0nwEZcfKkcRRKIRSdHjK+q4z+7ylZt9N
	 +vMF+EWSEJdFWBq01eFXyPJI0qxch+pCiDAZ8TO0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	imx@lists.linux.dev
Subject: [PATCH] media: imx-mipi-csis: Use CSI-2 data type macros from mipi-csi2.h
Date: Fri,  6 Jun 2025 12:05:33 +0300
Message-ID: <20250606090533.10711-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx-mipi-csis defines custom macros for the CSI-2 data types,
duplicating the centralized macros defines in mipi-csi2.h. Replace them
with the latter.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 68 ++++++++--------------
 1 file changed, 25 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d060eadebc7a..2beb5f43c2c0 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -28,6 +28,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -229,25 +230,6 @@
 
 #define DEFAULT_SCLK_CSIS_FREQ			166000000UL
 
-/* MIPI CSI-2 Data Types */
-#define MIPI_CSI2_DATA_TYPE_YUV420_8		0x18
-#define MIPI_CSI2_DATA_TYPE_YUV420_10		0x19
-#define MIPI_CSI2_DATA_TYPE_LE_YUV420_8		0x1a
-#define MIPI_CSI2_DATA_TYPE_CS_YUV420_8		0x1c
-#define MIPI_CSI2_DATA_TYPE_CS_YUV420_10	0x1d
-#define MIPI_CSI2_DATA_TYPE_YUV422_8		0x1e
-#define MIPI_CSI2_DATA_TYPE_YUV422_10		0x1f
-#define MIPI_CSI2_DATA_TYPE_RGB565		0x22
-#define MIPI_CSI2_DATA_TYPE_RGB666		0x23
-#define MIPI_CSI2_DATA_TYPE_RGB888		0x24
-#define MIPI_CSI2_DATA_TYPE_RAW6		0x28
-#define MIPI_CSI2_DATA_TYPE_RAW7		0x29
-#define MIPI_CSI2_DATA_TYPE_RAW8		0x2a
-#define MIPI_CSI2_DATA_TYPE_RAW10		0x2b
-#define MIPI_CSI2_DATA_TYPE_RAW12		0x2c
-#define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
-#define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
-
 struct mipi_csis_event {
 	bool debug;
 	u32 mask;
@@ -357,116 +339,116 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 	{
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.output = MEDIA_BUS_FMT_UYVY8_1X16,
-		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
 	},
 	/* RGB formats. */
 	{
 		.code = MEDIA_BUS_FMT_RGB565_1X16,
 		.output = MEDIA_BUS_FMT_RGB565_1X16,
-		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
+		.data_type = MIPI_CSI2_DT_RGB565,
 		.width = 16,
 	}, {
 		.code = MEDIA_BUS_FMT_BGR888_1X24,
 		.output = MEDIA_BUS_FMT_RGB888_1X24,
-		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
+		.data_type = MIPI_CSI2_DT_RGB888,
 		.width = 24,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
 		.output = MEDIA_BUS_FMT_SBGGR8_1X8,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
 		.output = MEDIA_BUS_FMT_SGBRG8_1X8,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
 		.output = MEDIA_BUS_FMT_SGRBG8_1X8,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.output = MEDIA_BUS_FMT_SRGGB8_1X8,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.output = MEDIA_BUS_FMT_Y8_1X8,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
 		.output = MEDIA_BUS_FMT_SBGGR10_1X10,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
 		.output = MEDIA_BUS_FMT_SGBRG10_1X10,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
 		.output = MEDIA_BUS_FMT_SGRBG10_1X10,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
 		.output = MEDIA_BUS_FMT_SRGGB10_1X10,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
 		.output = MEDIA_BUS_FMT_Y10_1X10,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
 		.output = MEDIA_BUS_FMT_SBGGR12_1X12,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
 		.output = MEDIA_BUS_FMT_SGBRG12_1X12,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
 		.output = MEDIA_BUS_FMT_SGRBG12_1X12,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
 		.output = MEDIA_BUS_FMT_SRGGB12_1X12,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
 		.output = MEDIA_BUS_FMT_Y12_1X12,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
 		.output = MEDIA_BUS_FMT_SBGGR14_1X14,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
 		.output = MEDIA_BUS_FMT_SGBRG14_1X14,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
 		.output = MEDIA_BUS_FMT_SGRBG14_1X14,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
 		.output = MEDIA_BUS_FMT_SRGGB14_1X14,
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	},
 	/* JPEG */
@@ -494,7 +476,7 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		 * SoC that can support quad pixel mode, this will have to be
 		 * revisited.
 		 */
-		.data_type = MIPI_CSI2_DATA_TYPE_RAW8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}
 };
@@ -583,7 +565,7 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 	 *
 	 * TODO: Verify which other formats require DUAL (or QUAD) modes.
 	 */
-	if (csis_fmt->data_type == MIPI_CSI2_DATA_TYPE_YUV422_8)
+	if (csis_fmt->data_type == MIPI_CSI2_DT_YUV422_8B)
 		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
 
 	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);

base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
Regards,

Laurent Pinchart

