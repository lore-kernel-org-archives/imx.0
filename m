Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0113C317707
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472264; cv=none; b=q6xz4FHX7eWZlJ5wEXH/PAPGsEXuCfhqnPO8SPkjfD8rd98TdfAlyRUVn6rZzp6wGfLyuUZturNM4/KlKj3NS7K4l9R0RXUmXNCmf0/uwpt5xGWHyULwpNKDcW6GhS/SKdFSl+ZuVla4PrS9l0qTtqzG7pejBbnqq8Aa9v+ROgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472264; c=relaxed/simple;
	bh=nrVvKVPMDys7+pn51iht7pFwzCmFfYNRJnrvmozCIhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=giFjcahvWWKCVpJRTuG5iZdx+tC6VFuLOVxw9/4bUHQe3vf/nivXt/OikvMWhPZ9Gz56FNBqrCNNw2awY6bfGVp0paYistrJIdQx2Xi3kG1S5BGTB9TqDJbQV3NtDi19E9odnfz0xsBS/j1RkzVFwOodk4dgMnRNXIGr5H6Og8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5xNHEGj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5xNHEGj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so4386917b3a.3
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 05:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763472262; x=1764077062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hXSbnHm6t1xwsrf3rAhpWlksErvS9cqFGgpRmks8TA=;
        b=B5xNHEGjWUwo2h6IhJqElzhJyOCiVIxQZ+yeLDkl15F6z0lt674oqG0DzgvqYofqPw
         tyNIECOArc8dXlEGKUfoxlALddYTpVKiPgoFs2FXw3OdN5GOtiEx5B5LbcuO2gxg1GRP
         Npx/tpf/Fz5zAwbfN/Onlxs0bQ8G+NRB+ZmlshSwToD4V+vt0UtxU0A6qsikTGBn+ynm
         HpBJDiSSVsO1fM9AKsNBzCbo+THIIH6Xc33eH/Y7obq7LgViP+poYg/5TS+PwmY4M6G9
         BxKQCAaNW0voBYl3nzwEPEgxCdoW623VxBw234JCOXg7n5caiEyglaialn3TmLNuMyLW
         KnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472262; x=1764077062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6hXSbnHm6t1xwsrf3rAhpWlksErvS9cqFGgpRmks8TA=;
        b=BDG3gibwbyCWk24CF+FKvnCeVo5AE5oe5JiGt1O+TICWXjO08rFPlg40tCQTFbdhB6
         KSFKVqY/WOHiteLKmCgNXlA35A2sJUaAd0St0GZhfh6ri4d7m7+npJrCUvWqG35tyHWw
         belj81Ziu1gzYPzupLYrP2rSRPnaAhag/BwlaJv6HaQIjr5BVCpPm8NOnVgLiW7fF853
         M45uB0z9cJNwgu6VkSOT2cO0Jz27BIbBsl0GES0XwMAcQWB2WZaba1DV8LpDyKVdhsnk
         ZJBl84ckuemZ9kafjOwC1mKkKpzjl5s9hXy5vShe8MS+Y9VIsF6OBWsyUlqPNm2bXTyq
         +C3A==
X-Forwarded-Encrypted: i=1; AJvYcCUahiCznpPW2wCwQkvGj5JSsom2bNPmrWStSluNRdTFruuDyHO8lzcq/f+MAvTiJzPvh7w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpkGulWe3ReYeirJmOPAfW2vaDvEwge08srm/jtZ9L37Rb9P9P
	VnRsxxiSgdpoX34xtq+6SlVxpGMLpxBpClQWvD9On90BeID79Yc4bJ909jE6ivOb
X-Gm-Gg: ASbGncvv5+EC7yUW36j9I3wtxyhShDMMuI75WbyIiwbYzTWLoA1DjnCTWxEWHh+HMFP
	mtzBBuvG3sdaK5bsbZCf/htVz2KieWtmi3Vw8tC/53h0s+aNPVWY3/smLd/66Dze9x4AGSNN4Yw
	Gr797Ei9TVOuhWXgHdQ6NHHRGKncvWi8GOhsn9mZ9m4aVrRNxHp/0xUQkF0z0OdnjCjevoNLWjn
	bVuyvo3JP7CwZUq9/Uq7W4ay9zOJfFdfr/2Y02JI9o+G7A+8Us3bI+Xwrsnv8D42ia0Q/o1L8eQ
	JIzkQnfcbxwaoWKZJuvs4xC5mIVU3eNp6CvikIGUNwE13/aW4O63/JFp+/SXPEyu1mLD6VuNivw
	W/80KrWzMUnBRFSKre0BLLY4WR7Qqzt9eK55SmVeqRjRH8dntX2JFzm3/O+tkVNoy+ZghTlU3tf
	9gAo2lVaCmDxvqoJ3d4ns+vswZ
X-Google-Smtp-Source: AGHT+IFhUJLNI6WkwxrwX6i+ajwcFC2UIUOOt+osC0yXDq0Qu22iYDG4x3pZGm/s+SlIjd1xxE4mmA==
X-Received: by 2002:a05:7022:221:b0:119:e56b:98ac with SMTP id a92af1059eb24-11b411ff181mr5715909c88.19.1763472262203;
        Tue, 18 Nov 2025 05:24:22 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8863:100d:2a2a:9a74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885d8sm66885134c88.2.2025.11.18.05.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:24:21 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] drm/bridge: fsl-ldb: Allow the termination resistor to be enabled
Date: Tue, 18 Nov 2025 10:22:08 -0300
Message-Id: <20251118132208.143315-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118132208.143315-1-festevam@gmail.com>
References: <20251118132208.143315-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LVDS Control Register (LVDS_CTRL) register has an HS_EN bit that allows
the 100 Ohm termination resistor in the chip to be enabled.

Add support to setting the HS_EN bit when the "nxp,termination-resistor"
optional property is present.

The motivation for introducing this property was a custom i.MX8MP board
that was showing visual artifacts. After enabling the 100 Ohm termination
resistor the LVDS signal quality improved causing the artifacts to
disappear.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bc..b4b9130de32c 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -92,6 +92,7 @@ struct fsl_ldb {
 	const struct fsl_ldb_devdata *devdata;
 	bool ch0_enabled;
 	bool ch1_enabled;
+	bool termination_resistor;
 };
 
 static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
@@ -212,6 +213,10 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
+
+	reg &= ~LVDS_CTRL_HS_EN;
+	if (fsl_ldb->termination_resistor)
+		reg |= LVDS_CTRL_HS_EN;
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
 
 	/* Wait for VBG to stabilize. */
@@ -292,6 +297,7 @@ static const struct drm_bridge_funcs funcs = {
 static int fsl_ldb_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
 	struct drm_panel *panel;
@@ -340,6 +346,9 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
+	if (of_property_present(np, "nxp,termination-resistor"))
+		fsl_ldb->termination_resistor = true;
+
 	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
 	if (IS_ERR(fsl_ldb->panel_bridge))
 		return PTR_ERR(fsl_ldb->panel_bridge);
-- 
2.34.1

