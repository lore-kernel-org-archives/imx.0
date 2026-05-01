Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1865385504
	for <imx@lists.linux.dev>; Fri,  1 May 2026 09:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777629459; cv=none; b=JLUOs76Epy7hRQB7f4TOUeawvqS8vcg8gfX8FCGjYusdIhFfiBUDjg9pvwapDPNcH+DRTenA5GrI8+rywOeCknNT5JcWrSp9RVRTHFqBiX8ljn8mshBsRy0aJj1UB74I/Ij/Xh93D+2lfq42rTwg5JWZpVNXasjqq4dZ5Negb+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777629459; c=relaxed/simple;
	bh=XGBLXAIDkYUbzl5baaOUU6KR6BYYFAzHPw0R+XSs704=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzvw9Iz0i4slX9YYf0IRhzYMh9F4fmcUWrVDyLnXYofn4BiVHvcbO4UQyDWMPDOF+EhpD/ZKKsmLIdWKF+RdzdYdDgmAXuMA9KJXGe+OAm9a5AdlJ+iaNbHX79l8GgbEBMOXMp6V+Ri3m1MQ27/keL2KCLAftER13IvdA2/gTnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fK7wkFmr; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fK7wkFmr"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82418b0178cso966125b3a.1
        for <imx@lists.linux.dev>; Fri, 01 May 2026 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777629454; x=1778234254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3ovUkWgYWEpqqlsycCJZaa2Pww05sUjyxsTGBfrzAA=;
        b=fK7wkFmryid7SrC3ELGt3fHq1lMeKztaCCnu6Ufo5DAL1f+1adfkP/W/OdqjPECwGw
         mCy4NTWqRv2oVnmUPUr6FoRbIJIXjZNPgC2AvNj8/iwvrhp3iS40NRPYJOl6J1NAENks
         NFiuWEW1HfTEjGcG7vOzTX2wjAd+c3b/OnMUARhqgnLmWlZUTaWHZXkA3//VvBzU5Pq/
         KQlqyh9XzrJPO+4wCzvFBEA2AngleTX3DjsYa6JWpbMYdrPi1Tkj1PnOJrmx1No4Gy7f
         uVO5MItX9fjFXocbTny+AEmzxk9iPFLelAjrQYI+ANphgbR3Dvzn33JYIqTOsNWtN6pB
         Y9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777629454; x=1778234254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3ovUkWgYWEpqqlsycCJZaa2Pww05sUjyxsTGBfrzAA=;
        b=AuwkrAfuYpbx8aHYG10MrxBBYnD4NTVOHXe6O8FsOv0ac8UQq80VcXs4JnsKx+mFLh
         Zm2VOkjM5SJRAJ0MZCeAX2Pf2DarQwuqXV+YduWYuz8JhheQpQTzfkdiULYhWjDBc5sh
         qltFM/S4/EHc7wCm4/6I45EkfLYIlWyvHbVlgTWJQSssDZehFbHMaYLryEF7iKT1J1n9
         E+ovS0fKcjtaIw30fOLtV49vv3tVfsFLorl916W6pZkHiBtTzF53XInbyWfBGA0HEmjm
         asm9EI/bvhbQCJh/gCPAlEjRf2u7QJt/+0LnsisR1OI8I0/w/X/l0NZ4M50LS0T9+tKD
         e3RA==
X-Forwarded-Encrypted: i=1; AFNElJ+MRbHeasSXFFGXA5KqviqJK/G3cNOJ+dsTngAmJSmOBu36uCR5Q71qo+D8YibWIi0bf4Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRE1cGt+3OHnFFNvBjIqOPkzPZPHJu88WpXf0+yhwDKkgppp07
	A3KoDiUpNpdbxxHzDU0VXsx/ENiwK2xe4cqil+a3vWRM4IMHmtz7+Ia8
X-Gm-Gg: AeBDies1LcaRXj8IkCQ/1WMCZQuLMB/OUbovx1gvPU4HYQNTwKOmfhHf4L4MGdewkVi
	kYB4bjC60iIzS2hAsUKKr2FDrioEF9JSskUCQlm+HCLvkHGVDlg5R8248XKx9AXnAVul6nDV3De
	rTxPKKYulIzt0VeA6sPB1bcjllMuUIYvF1mem0sqJFK07hy0gi1a5grUPpmhgxSqSjdysh0Dya1
	TKLA11A9zit1AV80xqgdvcMX4nrel+TNXoV3JjqNgN9dQoG2QDFaUcv9063GW1j2EOKGcvnOr4V
	VrJd6mjazreD0OJH9uxStJDyIvkKoBT8mdiBOnqU7OOn/PnGfsYYx9klYV5CO5vyTYeq9AbmS9o
	3QyRKFH9QQQaZEswf+wWuARrHAejCup9hOzQtjgr2Q9xex1asNMyKljNOxx+rH9UeEMzCprDuJm
	RaPp9sUAvddWaiiA==
X-Received: by 2002:a05:6a21:6d88:b0:39b:da83:91aa with SMTP id adf61e73a8af0-3a3cf8cbdc5mr7983611637.51.1777629453564;
        Fri, 01 May 2026 02:57:33 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f36:7c14::f7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcac2cfsm1731381a12.32.2026.05.01.02.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:57:33 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 2/4] media: hi846: fix link frequency handling
Date: Fri,  1 May 2026 17:54:31 +0800
Message-ID: <20260501095433.1609309-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501095433.1609309-1-mitltlatltl@gmail.com>
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

link frequency is tied to PLL configuration, lane count, and external
clock rate, so use runtime here instead of hardcoding for specific
configuration. To implement this, this commit did

1. dropped exposed link freqs as a v4l2_ctrl, since we are runtime
now, it is inconvenient and unnecessary to expose it, and
hi846_set_ctrl has nothing to do with it.

2. attached pll_cfg_2lane to current mode, and use it with clock, lane
count to calculate link frequency, we use 2-lane config as default,
but we can halve it easily for 4-lane case.

3. dropped mclk clock rate check.

Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 72 +++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 7f069aca0fce..3a0b1e124d9d 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -219,8 +219,8 @@ struct hi846_mode {
 	/* Horizontal timing size */
 	u32 llp;
 
-	/* Link frequency needed for this resolution */
-	u8 link_freq_index;
+	/* PLL configuration for 4-lane link at this resolution */
+	u16 pll_cfg_4lane;
 
 	u16 fps;
 
@@ -1040,13 +1040,6 @@ static const char * const hi846_test_pattern_menu[] = {
 	"Resolution Pattern",
 };
 
-#define FREQ_INDEX_640	0
-#define FREQ_INDEX_1280	1
-static const s64 hi846_link_freqs[] = {
-	[FREQ_INDEX_640] = 80000000,
-	[FREQ_INDEX_1280] = 200000000,
-};
-
 static const struct hi846_reg_list hi846_init_regs_list_2lane = {
 	.num_of_regs = ARRAY_SIZE(hi846_init_2lane),
 	.regs = hi846_init_2lane,
@@ -1061,7 +1054,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
-		.link_freq_index = FREQ_INDEX_640,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 120,
 		.frame_len = 631,
 		.llp = HI846_LINE_LENGTH,
@@ -1086,7 +1079,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.link_freq_index = FREQ_INDEX_1280,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 90,
 		.frame_len = 842,
 		.llp = HI846_LINE_LENGTH,
@@ -1112,7 +1105,7 @@ static const struct hi846_mode supported_modes[] = {
 	{
 		.width = 1632,
 		.height = 1224,
-		.link_freq_index = FREQ_INDEX_1280,
+		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
 		.fps = 30,
 		.frame_len = 2526,
 		.llp = HI846_LINE_LENGTH,
@@ -1161,7 +1154,6 @@ struct hi846 {
 	struct v4l2_ctrl_handler ctrl_handler;
 	u8 nr_lanes;
 
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
@@ -1192,21 +1184,37 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
 	return NULL;
 }
 
-static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
+static u64
+hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *cur_mode)
 {
-	return hi846->cur_mode->link_freq_index;
-}
+	u16 cfg = cur_mode->pll_cfg_4lane;
+	u64 mclk = clk_get_rate(hi846->clock);
 
-static u64 hi846_get_link_freq(struct hi846 *hi846)
-{
-	u8 index = hi846_get_link_freq_index(hi846);
+	/* NOTE: 6, 7 actually map to 8, 10, but the used won't be that big */
+	u8 post_div1 = 1 + FIELD_GET(GENMASK(10, 8), cfg);
+	u8 post_div2 = 1 << FIELD_GET(GENMASK(12, 11), cfg);
+
+	/*
+	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
+	 * [11:8]: 0x02 => pre_div = 3
+	 * [7:0]: 0x5a => multiplier = 90
+	 */
+	u64 link_freq = mclk / 3 * 90 / post_div1 / post_div2;
+	/*
+	 * for shared modes, since lane count is halved for 2-lane, then getting
+	 * link_freq doubled to match the same data rate. Since 720x480 is
+	 * 2-lane only(i.e. reg_list_4lane.num_of_regs == 0), no pll cfg for
+	 * 4-lane, the pll cfg is actually for 2-lane, so use the cfg as is.
+	 */
+	if (hi846->nr_lanes == 2 && cur_mode->reg_list_4lane.num_of_regs)
+		link_freq *= 2;
 
-	return hi846_link_freqs[index];
+	return link_freq;
 }
 
 static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
 {
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
 
 	do_div(pixel_rate, HI846_RGB_DEPTH);
@@ -1426,14 +1434,6 @@ static int hi846_init_controls(struct hi846 *hi846)
 
 	ctrl_hdlr->lock = &hi846->mutex;
 
-	hi846->link_freq =
-		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
-				       V4L2_CID_LINK_FREQ,
-				       ARRAY_SIZE(hi846_link_freqs) - 1,
-				       0, hi846_link_freqs);
-	if (hi846->link_freq)
-		hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
 	hi846->pixel_rate =
 		v4l2_ctrl_new_std(ctrl_hdlr, &hi846_ctrl_ops,
 				  V4L2_CID_PIXEL_RATE, 0,
@@ -1503,10 +1503,10 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
 	u64 frame_length;
 	int ret = 0;
 	int dummy_lines;
-	u64 link_freq = hi846_get_link_freq(hi846);
+	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
 
 	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
-		hi846_get_link_freq(hi846));
+		link_freq);
 
 	do_div(link_freq, fps);
 	frame_length = link_freq;
@@ -1749,7 +1749,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	mf->code = HI846_MEDIA_BUS_FORMAT;
 	mf->field = V4L2_FIELD_NONE;
 
-	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
 	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
 				 hi846_calc_pixel_rate(hi846));
 
@@ -1950,16 +1949,17 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	const s64 *freqs = hi846_link_freqs;
-	int freqs_count = ARRAY_SIZE(hi846_link_freqs);
+	int freqs_count = ARRAY_SIZE(supported_modes);
+	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
+		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
-			if (freqs[i] == ep->link_frequencies[j])
+			if (link_freq == ep->link_frequencies[j])
 				break;
 		if (j == ep->nr_of_link_frequencies)
-			return freqs[i];
+			return link_freq;
 	}
 
 	return 0;
-- 
2.54.0

