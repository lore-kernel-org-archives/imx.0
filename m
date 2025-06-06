Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69BE286D50
	for <imx@lists.linux.dev>; Fri,  6 Jun 2025 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212057; cv=none; b=a7FlFyQ/Gk2oXvnLWTCbj7QtPZA90TGXZCtJn3loBS2Lk6L0K7byPqlMK3mOTG4qY9ubM8H1SpNVkoRFjyHEYrSw4ZskQImsBL7OsH6oxLZBQt8moxSbewaqt1kuySrXHaG2/baU0HLFnBnRtePe2o03SphTwp9YoZrEibKhGoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212057; c=relaxed/simple;
	bh=OF+fLFPhM40cHFI5sXwjSZI1LzZUrHhaXoT6cLwZwLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9tGcIiygDAYAd8JwVUKSPsC4Q4/qmf2Hs2Xj9rFEHABERcqVPRb1qS6o79Gwc3BUk6JmbY7vKnLibJ50DQW3Kliww0fi2G3R1v8AUuqvgdqGCe9kTz6kkFtp6auiB9ep3GuuKdZMYb3QpvU4GtcP75n+usg0AhojABtxuBf3Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tRwK5q6d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tRwK5q6d"
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64DE91340;
	Fri,  6 Jun 2025 14:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749212050;
	bh=OF+fLFPhM40cHFI5sXwjSZI1LzZUrHhaXoT6cLwZwLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRwK5q6di5lo9Q0wUHSzJk10vOzi/8AYXUpYzqzuT3zS8AbVkWbyTP/PMFkIb/zzY
	 jVSUHL6ieqmNocDlBiZLNfimXbij4nbn79OO88DjtGgo8lkaoXcPIml+Fst1aJlUdt
	 vaa6sPqOvSthnAxGpvOAN7oDLSkz0b85Nc8d9BLw=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com,
	rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH 1/2] media: platform: Refactor interrupt status registers
Date: Fri,  6 Jun 2025 13:14:02 +0100
Message-ID: <20250606121403.498153-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
status sources which span multiple registers. The driver currently
supports two interrupt source registers, and attributes the
mipi_csis_event event entries to those registers through a boolean debug
field that indicate if the event relates to the main interrupt status
(false) or debug interrupt status (true) register. To make it easier to
add new event fields, replace the debug bool with a 'status index'
integer than indicates the index of the corresponding status register.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 64 +++++++++++-----------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d060eadebc7a..bbc549c22aff 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -249,7 +249,7 @@
 #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
 
 struct mipi_csis_event {
-	bool debug;
+	unsigned int status_index;
 	u32 mask;
 	const char * const name;
 	unsigned int counter;
@@ -257,30 +257,30 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
+	{ 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error"},
+	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error"},
+	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error"},
+	{ 0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error"},
+	{ 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
+	{ 0, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
+	{ 0, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
+	{ 0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error"},
+	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported"},
+	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
+	{ 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error"},
+	{ 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
+	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
+	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
 	/* Non-image data receive events */
-	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
-	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
-	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
-	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
+	{ 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame"},
+	{ 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame"},
+	{ 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame"},
+	{ 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"},
 	/* Frame start/end */
-	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
-	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
+	{ 0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start"},
+	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
+	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
+	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
 };
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
@@ -765,32 +765,30 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	struct mipi_csis_device *csis = dev_id;
 	unsigned long flags;
 	unsigned int i;
-	u32 status;
-	u32 dbg_status;
+	u32 status[2];
 
-	status = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
-	dbg_status = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
+	status[0] = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
+	status[1] = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
 
 	spin_lock_irqsave(&csis->slock, flags);
 
 	/* Update the event/error counters */
-	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
+	if ((status[0] & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
 		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
 			struct mipi_csis_event *event = &csis->events[i];
 
-			if ((!event->debug && (status & event->mask)) ||
-			    (event->debug && (dbg_status & event->mask)))
+			if (status[event->status_index] & event->mask)
 				event->counter++;
 		}
 	}
 
-	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
+	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
 		mipi_csis_queue_event_sof(csis);
 
 	spin_unlock_irqrestore(&csis->slock, flags);
 
-	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
-	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
+	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
+	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

