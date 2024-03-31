Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE70D147C97
	for <imx@lists.linux.dev>; Sun, 31 Mar 2024 20:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711916956; cv=none; b=VI9vrwYtrBZr7mNtFSkSoN83SlMZJoLsCspRg4QC3aVJgvZ+aFxcBW8gOTughOsigVmdhZ39yg8mpDjRv0u0gGAU64iwK2CNAhLRlBznSX0IF6R9ZqSVNUoKqmpncZDETsxArmbr/SZNdme83sk+x2fxFu+W2eYX9Ib07BdRqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711916956; c=relaxed/simple;
	bh=hxbKkqcQVL6lamyV1sJxDUeKsmUL5K/DPfRJzqUHXP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRrh7KVbAesB6pXt8AleOFqtfMCuC8k0zCtSmwQQIAa6W79hWW+S5ZPV6LC9PQ0vqQ90PNozshWhuQo9X7Fodb5rOXhdG/liLSp2K7egV6BUmOMk7pY+EJ2ji7PXqNzIYmBHtOTiDivNz6rkT47DIf+HGNIaYGxPx0FSEEnZy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXyNSnk5; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXyNSnk5"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513e89d0816so3967809e87.0
        for <imx@lists.linux.dev>; Sun, 31 Mar 2024 13:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711916953; x=1712521753; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1A7wX6hNUy8P/zQgxOCI5nxQ7K8DEqd4NjplmpDLtE=;
        b=bXyNSnk5cTyiF8ZsqTZcrEjEOLbk9fMDg4+OqNper94yXzgecCxOoNWUFSqj5KtdkC
         PQAR6x2qbkcHaZufQe46D9pU3OE1obFIQhwEYmPj9HJGMqN3O6xE0mKo0leRD5quq1U1
         9BpxGmfAIWPU+AcjQ5q6OAU5361/T8AZhGCIle9i9LtCVg2MmgInO4YDsD4p37tV3IB1
         ndP2Ulb3bq2GUzEmCKz4knhx+NRnEZO5d3avMO/j3CEXAs8j1dVcu2OsRGUuprYroCu6
         R/l1WmKusswGmHWqDaohVM0j4Z9DjsEoS42n+JAgFLpv8XMAhlzyofxItrenXFT/2smn
         ZqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711916953; x=1712521753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1A7wX6hNUy8P/zQgxOCI5nxQ7K8DEqd4NjplmpDLtE=;
        b=hX/AwVudIqGvM3T8K7mkhT/BtxMSFnWZxUIymYZEmXkBR25Kc74lTKFzi9ImLpl2rj
         rCEUc3zMsRbuKoQBsFwi1J132f5COKCpw8WjvX0vVp1g0SHoPXuDtqXpD9rKB6pV5in8
         kn81NFmg70Ch7/Q8Z33gwOw3bB0P3+K9PgFzGM/qvjuqT8fsltlhQV67Vit2sfqYA0qy
         pa3Pj8CGuFwswiCuNFJg4IbPQrScw7l8fvZX8hjO85Zil3kJDzQwlFjsNmZRn2PfGVFQ
         5cLcbuFepwW3rB3gnbQzmg4OL5W+vKr6f3R7NiVJCjvQdG6Me9Non8N4UTqK7VT6e0WM
         OwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM9G5NqSVtZPyTP1+J02LlbcKDiRUeCDSUJxLXbLYgvSp0oVLHZGSUnqgeGU3f2v4u6gQVVyNgs99zA8OwZak4qVhS
X-Gm-Message-State: AOJu0YyOO5yil3Vv9i22Msj9z1cz1TZDQtapp1hCWm6rEEeu2GkDb21J
	2i8cZO/n3IN0ao5DQOa+Xa1fAqCpD6p/ZPeLqMGFtN+YcuXBwiYT7EDnUMxm6r8=
X-Google-Smtp-Source: AGHT+IFeEoM8GV8Dslk18QS96m4eggtkhs8tlJAqZBtQtN8yS93vJNhUK8FsHkm5EtHKM8q5pMJXzA==
X-Received: by 2002:a05:6512:526:b0:515:d5c6:16ec with SMTP id o6-20020a056512052600b00515d5c616ecmr3266515lfc.10.1711916953132;
        Sun, 31 Mar 2024 13:29:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 13:29:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:06 +0300
Subject: [PATCH v2 09/12] drm/imx: add internal bridge handling
 display-timings DT node
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-9-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4905;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hxbKkqcQVL6lamyV1sJxDUeKsmUL5K/DPfRJzqUHXP0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceP1c/UajzRsbpS3x8XnHVlfzmTQvPuCd3+5
 jTxebl4Y0iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHjwAKCRCLPIo+Aiko
 1ZLgCACeDb8Bblu2K94cHFSwyB441Rf7xL7iwtjmzImMhrnu5em43wI2ZsuNUoFKqlPSidDaw1b
 lL5kPJ553MBXYYTUEgb+fFpDyeyC8eSJ7qow+lfpz0LyOz5pUWiDgD6cTMilL8GHjAf/3MfBR1n
 lQ+wavMGNVI/w174nh9+DLZmD2Ff+D5348JS8pFCDKUY+P64euq1jT2rLpcSd4d47so1cFRLIa7
 b3WJKksgA9RE6X/bdihxEzh4LRSu4a5AKHdQYajyGSZytA4d4ghiOmDnNkb7bjRmNYCK3S34bvb
 +fTqx1fpv0rbNJVSm9Xi7z8M+kC5w3NWp8W9qfyyfOo76GSc
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

i.MX DRM DT bindings allow using either a proper panel / bridge graph to
provide information about connected panels, or just a display-timings DT
node, describing just the timings and the flags. Add helper bridge
driver supporting the latter usecase. It will be used by both LDB and
parallel-display drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/imx/Kconfig             | 10 +++
 drivers/gpu/drm/bridge/imx/Makefile            |  1 +
 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 85 ++++++++++++++++++++++++++
 include/drm/bridge/imx.h                       | 13 ++++
 4 files changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
index 5965e8027529..708faf0b75ae 100644
--- a/drivers/gpu/drm/bridge/imx/Kconfig
+++ b/drivers/gpu/drm/bridge/imx/Kconfig
@@ -3,6 +3,16 @@ if ARCH_MXC || COMPILE_TEST
 config DRM_IMX_LDB_HELPER
 	tristate
 
+config DRM_IMX_LEGACY_BRIDGE
+	tristate
+	depends on DRM_IMX
+	help
+	  This is a DRM bridge implementation for the DRM i.MX IPUv3 driver,
+	  that uses of_get_drm_display_mode to acquire display mode.
+
+	  Newer designs should not use this bridge and should use proper panel
+	  driver instead.
+
 config DRM_IMX8MP_DW_HDMI_BRIDGE
 	tristate "Freescale i.MX8MP HDMI-TX bridge support"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
index edb0a7b71b30..dd5d48584806 100644
--- a/drivers/gpu/drm/bridge/imx/Makefile
+++ b/drivers/gpu/drm/bridge/imx/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
+obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
 obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
 obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
 obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
new file mode 100644
index 000000000000..fb3a030928f0
--- /dev/null
+++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Freescale i.MX drm driver
+ *
+ * bridge driver for legacy DT bindings, utilizing display-timings node
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/bridge/imx.h>
+
+#include <video/of_display_timing.h>
+#include <video/of_videomode.h>
+
+struct imx_legacy_bridge {
+	struct drm_bridge base;
+
+	struct drm_display_mode mode;
+	u32 bus_flags;
+};
+
+#define to_imx_legacy_bridge(bridge)	container_of(bridge, struct imx_legacy_bridge, base)
+
+static int imx_legacy_bridge_attach(struct drm_bridge *bridge,
+				   enum drm_bridge_attach_flags flags)
+{
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int imx_legacy_bridge_get_modes(struct drm_bridge *bridge,
+				       struct drm_connector *connector)
+{
+	struct imx_legacy_bridge *imx_bridge = to_imx_legacy_bridge(bridge);
+	int ret;
+
+	ret = drm_connector_helper_get_modes_fixed(connector, &imx_bridge->mode);
+	if (ret)
+		return ret;
+
+	connector->display_info.bus_flags = imx_bridge->bus_flags;
+
+	return 0;
+}
+
+struct drm_bridge_funcs imx_legacy_bridge_funcs = {
+	.attach = imx_legacy_bridge_attach,
+	.get_modes = imx_legacy_bridge_get_modes,
+};
+
+struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
+					      struct device_node *np,
+					      int type)
+{
+	struct imx_legacy_bridge *imx_bridge;
+	int ret;
+
+	imx_bridge = devm_kzalloc(dev, sizeof(*imx_bridge), GFP_KERNEL);
+	if (!imx_bridge)
+		return ERR_PTR(-ENOMEM);
+
+	ret = of_get_drm_display_mode(np,
+				      &imx_bridge->mode,
+				      &imx_bridge->bus_flags,
+				      OF_USE_NATIVE_MODE);
+	if (ret)
+		return ERR_PTR(ret);
+
+	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
+
+	imx_bridge->base.funcs = &imx_legacy_bridge_funcs;
+	imx_bridge->base.of_node = np;
+	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
+	imx_bridge->base.type = type;
+
+       ret = devm_drm_bridge_add(dev, &imx_bridge->base);
+       if (ret)
+               return ERR_PTR(ret);
+
+	return &imx_bridge->base;
+}
+EXPORT_SYMBOL_GPL(devm_imx_drm_legacy_bridge);
diff --git a/include/drm/bridge/imx.h b/include/drm/bridge/imx.h
new file mode 100644
index 000000000000..e14f429a9ca2
--- /dev/null
+++ b/include/drm/bridge/imx.h
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2012 Sascha Hauer, Pengutronix
+ */
+
+#ifndef DRM_IMX_BRIDGE_H
+#define DRM_IMX_BRIDGE_H
+
+struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
+					      struct device_node *np,
+					      int type);
+
+#endif

-- 
2.39.2

