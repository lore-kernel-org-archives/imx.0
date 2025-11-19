Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F65214A8B
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 02:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519421; cv=none; b=WKD2PVjaD4InTAgOnMXxJus8mYsqAY+m5dDh422ekhdUe+ZatfLroPV6HIewrKRAFarHM7W3j23HOf4c6IU2anMXHPLe3plXoiDzzxNcAkFxhAC9TQD1uf/Ba23M+2xCOTWGr+h4HDTplqIu4NOUtNCJmTdRoayRps45HPOdl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519421; c=relaxed/simple;
	bh=gxnoIS1YUWSbg6L9HKTQ9iY5F7GsbV7NeqoguP9aqVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f0qZ6JcL/YM0ymieHqvrX2OhepwoMIV+ntqYFKW9dQ9/2lSIiMkOv7LtkKmoekDZq9trjbcJxtsCirJvVLnkoUlZiGVSvBXmGZddNt6w58Y2hwvnPLru8e/4zqWW8hEFfGZxLfAJ7XR0Ve15Pex1r4dPU2zuMHLIlX8xDhnbLjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mla3SR+C; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mla3SR+C"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b9387df58cso2830015b3a.3
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 18:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763519419; x=1764124219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76T2SjmDIqZyZD3OqG0HjQASUCl7IRYbYAxLx4z4J70=;
        b=mla3SR+Cu1t2cep6WtHqNsczIIUc6jSyccXA9hAkznGgfkSQzp+pDS1R/FmBo423I5
         reebgO9ypW5gFdsDiFGmcLIQYADYag4HMIK2kr4J7BVgv0ck8FdiOYmaNgDJfILrszg9
         PaIxEZXtJXCcvC4CahdvyOIMJYecTLUiQx99JM5HQlPcAg9P0n3nYbjohy6vj8WOX/Zt
         frWW9NvCRNZphpE4wBJ4MMFrVvn3HSdLVJxX5NiBNMHm1YEdB40+fZ9IfhU42mi+njTd
         +FKatv4FETYX5jr+Ho1K97F0cItEUOLAf9Ldld2zQHWrpx/RRIVSKBZ1T9LQey4sQEkw
         VAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763519419; x=1764124219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76T2SjmDIqZyZD3OqG0HjQASUCl7IRYbYAxLx4z4J70=;
        b=Yj5bGvi115vQhDcV5ns+JAkF8pdcupeBMZiCr+zGwWuPrW8z/0DOWIcfAqO8qo5het
         ZTK+qXn/RNdUZ+CYRZlJ3Q1wS2bESdr0Y6kk3YRcFH1veo4GcQvJnf1rtMUSrq2R8Idb
         x8lC017/KruIoDjHAhWuyIEHyt/GsOL3Cj/48U/WeXdeCNiRKMSNi8N6ujY0tTCzxAa/
         ZlQwTtqbf2TSlqIJKRKDieYNP4OPsqtwTk4GtR2gQG6I0i4bigxqdO8Y4KTgHe6+kte1
         EbzEwdZVRwj8MwUmTWSJUdCFaBXguEU2xt4n4rpH3YYOfV01LALfBVZYkP9d5k8iNKAY
         Qjhw==
X-Forwarded-Encrypted: i=1; AJvYcCUfSsnqGQ3FPP7AQRp65DvFkdsmpBdfeP4TG2sjvirvJK7HC+R71jxxNG3jJtAfbs6MGHA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJOUA6xGUpzyqaLLc48zJ8Q1fmeyDMlLbuV//pQ+JdC3MsSb0H
	Ito9yCgAlcsZxzZJlixLVD/FXI8hXFSB6HefiVLIZqzaeaKPBQj8qOpM
X-Gm-Gg: ASbGncvGz13UAdzl7gnZmeSJhOG/CqJRelFKloKdopNOKfS17oeLF+Vd28kMf47rTOl
	3IIj69N3FXeRebY5dFhkbFjct6YgjLQlrjxnG5uzTO10v+nHFHRU2kU4mmpDBMkOKvy4JIiq+uS
	msTM70jgcl+yd2Hg4WIoUR7CIs8aAcAyHjrWPqk52Fe3L2QC67ty0jv/JwpHsJnDIas+whYW6f8
	4FYAl5Esa85wUVM+TerjLnnG+B/SexDEohPnwKxSCznlHAqTp/yWqRoXL/8xO2Y4sHMnDAN4Ktd
	kjHIYtuJzoiEpMUSP/UedBEZ05uhOKgdxqbLq+jfAhbJznrTI36RVtnBZrFY9pBTBS+hElSQDzp
	gxJ+VLf8Y+Rfw01vslsuJlTtALKLb6ZXi+pTfUgqTrsEwFd+3T5kbWC/8XROGvfVawIn0zh5qRz
	/xyjhBu7tjFNZYPQJgANc9E5yx
X-Google-Smtp-Source: AGHT+IFWZ5/K4rKe/g3YbwS6+fpTcdZCtTl6icmOpbHtBhpTsB7wajSZbBxQF3fAXwGOOtNoN85Uqg==
X-Received: by 2002:a05:7022:ef04:b0:119:e56b:c749 with SMTP id a92af1059eb24-11b40f92c5emr8189781c88.14.1763519418927;
        Tue, 18 Nov 2025 18:30:18 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8863:100d:2a2a:9a74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm65842955c88.0.2025.11.18.18.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 18:30:18 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: Laurent.pinchart@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	Frank.li@nxp.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] drm/bridge: fsl-ldb: Allow the termination resistor to be enabled
Date: Tue, 18 Nov 2025 23:29:46 -0300
Message-Id: <20251119022946.268748-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119022946.268748-1-festevam@gmail.com>
References: <20251119022946.268748-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LVDS Control Register (LVDS_CTRL) register has an HS_EN bit that allows
the 100 Ohm termination resistor in the chip to be enabled.

Add support to setting the HS_EN bit when the optional property
"nxp,enable-termination-resistor" is present.

The motivation for introducing this property was a custom i.MX8MP board
that was showing visual artifacts. After enabling the 100 Ohm termination
resistor the LVDS signal quality improved causing the artifacts to
disappear.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Change the property name to nxp,enable-termination-resistor (Frank).

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
 
+	if (of_property_present(np, "nxp,enable-termination-resistor"))
+		fsl_ldb->termination_resistor = true;
+
 	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
 	if (IS_ERR(fsl_ldb->panel_bridge))
 		return PTR_ERR(fsl_ldb->panel_bridge);
-- 
2.34.1

