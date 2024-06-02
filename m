Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9C39FD8
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 12:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717329894; cv=none; b=dRWccPF8zhKp6dxJSLZtK0MgFOb40xafP8JlGteJTP+T+lXJWOcn6fxVUpGulSMXyM17ubspYHkF9073RBv9lqgr16d8+ZB+uG5AL3bvgpczqMCKgWPeokTPTLGGKby8XrWRln3HVrs50RFM2+6RacSGUq5wzKpSKlKyXYP3+0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717329894; c=relaxed/simple;
	bh=l7M3G39iu9nNrCk8sJLPBZk54Nd8nGO4KLe4Ou6kT5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kx8WrGjJj+NGrs8AHAlsN0pxwfMCZCE5rL1peIlgfFHkC3V/O3dy2Vz4JQk0+/R73H2VJAq5pivXgp5SgackkbrMp2IE71MWouK0d8Y0yATc9QzJ22cIFqya0x6wZ2BIIexV7SqwwBPD/HS5G0IcgqD5ZUXLwdMYApZV0BRvQPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhoUvnHg; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhoUvnHg"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so8720961fa.1
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 05:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717329891; x=1717934691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahx0B7IRhOU2KryLmin5A3x+RBjSRe40YtgpLFgn8h8=;
        b=rhoUvnHgU/x9XPnZplbRyzSPVswJ2vYzMa03Vi5W/9u8CJknVLYQ2OyAKvaveC3TTR
         aJCFRluSNvYXHb+Pw3xOz02RAgv6oI3/xuDaGH9OyNENsgNuF7SWahJpV5cuLMT3ECzd
         GtEZsFebPp4KGJ+0NVYj4IVOam1z8bXnyxXod5o7/DLe6Z3GZF5K8Nu8QlfIVEX9YCfI
         aXtx1oftXqRF1PpdHFCM43vkzCgYiPnesrMr8orrjoPA9S2xT1RpycB1EfJ5uHpLtMDg
         f+kRyVlFJ6lvN9L7BTymJoOFSRVdcQM4ZUHol89hjsfPoUKJT4an9S0d+Ji3DbP7K0sz
         2v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717329891; x=1717934691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahx0B7IRhOU2KryLmin5A3x+RBjSRe40YtgpLFgn8h8=;
        b=bLC7HG5IvgoXUpTFqt3Ed8nums2i1lY5/Z5kQoEnZ5uWRcMMH3CinoLwxctNwa3IMt
         OGeWpEVY+wLgbIhv+bFtSktcbZRkQtTNHUvO/A4xn+AEQ59QxFMeScOzxiccGvml1CY2
         qWkxkm5ZUoZHyvzRG5EFoG3mndiRz8x5+QLEpSw4J5sfniPTRJPQBaFwo8RX0FNSGwf1
         shbYGbD0jdaBEo8O5UL8lk9HSEmChFzSuj+nzZNhkDwlnmB7nxlO4pvFkhCxUTeZqxPw
         Q5fOND/Is3vGa61VBm275RA1/8fp/M3Mv6p4Mi1EKsOe5UToJY3JeUvL7/rcEIkCdUks
         3iqg==
X-Forwarded-Encrypted: i=1; AJvYcCUm9jhIJK8d1b8aNNeJahSArMKcWlPhCYTSmETb3prdkVepwZJRklwaTSJ9TNMRuP+KuAf9tIg4EEE2QCy2AUJIFPHz
X-Gm-Message-State: AOJu0YyVrIP75U3LzEbdD5+9DOpAvlDWCrza0HjduxO/ng+dG2PIEYvJ
	ptwYmjtg9QJlj+/LrBTwCgRFSLYu/eEibQwlKsPZ/wpeQb32JzXDMr1yiVI847I=
X-Google-Smtp-Source: AGHT+IE9DlkDZJ/q6anZcEZCR4WzqVIVNYRa7q0Ns7NW+snWcKddBdYHt8pvqycOhI6UxRrnqrZ28A==
X-Received: by 2002:a19:f603:0:b0:52a:e7c7:4ce6 with SMTP id 2adb3069b0e04-52b895633dbmr5188478e87.39.1717329890815;
        Sun, 02 Jun 2024 05:04:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b8b56867fsm759398e87.44.2024.06.02.05.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:04:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 02 Jun 2024 15:04:45 +0300
Subject: [PATCH v3 05/12] drm/imx: ldb: drop custom EDID support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240602-drm-imx-cleanup-v3-5-e549e2a43100@linaro.org>
References: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
In-Reply-To: <20240602-drm-imx-cleanup-v3-0-e549e2a43100@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l7M3G39iu9nNrCk8sJLPBZk54Nd8nGO4KLe4Ou6kT5o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXF/dci5cApIh4CbjmDaF29E9SsPPCAy9IC1BP
 ookreVYSv6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlxf3QAKCRCLPIo+Aiko
 1cwKB/4xCsYHUgD+LgO7CvPxVhR6dSFIH9rYipIXrsQtH3yVtnXKxqJVgzCEVAa05JbbXYH4ozm
 RGrPvgpfVs5QGXj/4+MKxODCFxUFgqKcXQVdlh7exxMGFAAXoc1FMl7K7Kscd59HZM9ALmd95jO
 nkRvO0T+JiSJhIy4mucD6HAXICDqQ9iH64hAwCiC+og87UzNN4W4uWK+Qn5WpFYsn9h9eCL0GR5
 8Aa0ZHfyxbhjEw4Tpo5oN3TLUtg/FfUdILUEkXtOi4Dzy8tLxkjc7eP84g4JYJrwZytzOUmXqlo
 cj1OsANGFG1AJ4XbaaYw73OVV6ibGtMWOB3FKoFa7K2w3JKK
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Bindings for the imx-ldb never allowed specifying the EDID in DT. None
of the existing DT files use it. Drop it now in favour of using debugfs
overrides or the drm.edid_firmware support.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 793dfb1a3ed0..1924d8921c62 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -72,7 +72,6 @@ struct imx_ldb_channel {
 	struct device_node *child;
 	struct i2c_adapter *ddc;
 	int chno;
-	const struct drm_edid *drm_edid;
 	struct drm_display_mode mode;
 	int mode_valid;
 	u32 bus_format;
@@ -142,14 +141,17 @@ static int imx_ldb_connector_get_modes(struct drm_connector *connector)
 	if (num_modes > 0)
 		return num_modes;
 
-	if (!imx_ldb_ch->drm_edid && imx_ldb_ch->ddc) {
-		imx_ldb_ch->drm_edid = drm_edid_read_ddc(connector,
-							 imx_ldb_ch->ddc);
-		drm_edid_connector_update(connector, imx_ldb_ch->drm_edid);
-	}
+	if (imx_ldb_ch->ddc) {
+		const struct drm_edid *edid = drm_edid_read_ddc(connector,
+								imx_ldb_ch->ddc);
 
-	if (imx_ldb_ch->drm_edid)
-		num_modes = drm_edid_connector_add_modes(connector);
+		if (edid) {
+			drm_edid_connector_update(connector, edid);
+			drm_edid_free(edid);
+
+			return drm_edid_connector_add_modes(connector);
+		}
+	}
 
 	if (imx_ldb_ch->mode_valid) {
 		struct drm_display_mode *mode;
@@ -566,18 +568,10 @@ static int imx_ldb_panel_ddc(struct device *dev,
 	}
 
 	if (!channel->ddc) {
-		const void *edidp;
-		int edid_len;
-
 		/* if no DDC available, fallback to hardcoded EDID */
 		dev_dbg(dev, "no ddc available\n");
 
-		edidp = of_get_property(child, "edid", &edid_len);
-		if (edidp) {
-			channel->drm_edid = drm_edid_alloc(edidp, edid_len);
-			if (!channel->drm_edid)
-				return -ENOMEM;
-		} else if (!channel->panel) {
+		if (!channel->panel) {
 			/* fallback to display-timings node */
 			ret = of_get_drm_display_mode(child,
 						      &channel->mode,
@@ -744,7 +738,6 @@ static void imx_ldb_remove(struct platform_device *pdev)
 	for (i = 0; i < 2; i++) {
 		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
 
-		drm_edid_free(channel->drm_edid);
 		i2c_put_adapter(channel->ddc);
 	}
 

-- 
2.39.2

