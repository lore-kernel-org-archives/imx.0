Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BC288C2D
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752695261; cv=none; b=tNEEq+fhM/1o97AivgcOPKq32NaVx1AVbrpHyxzlArsXl2fODR3ujhi3d6sjskwzZBOdn0rIbATCHGwXlfE8LszI3uZUdDg0RtR/LpzSshtoCMmydR+QVxyBi5OJ6bxf9WNnvdp+4PwY6N8AhH2C5cb/vn6PSzq39LG6wRPpQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752695261; c=relaxed/simple;
	bh=VIvKiAu57glx8OBUXhgigGV8r6azz78jvj6eZu2+N0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H4HAJEdQrAswV5LWg9e01YA6XsjL1hU41viKDyfPvzBtmK6iHWigsHVxgun4gJh7Ub7kCCbWiLSxsUcJ6af9V9ugNhlPyqWNw0TMmt0EG5ArWVEvVsFj/oix+hvSP5TpUncSN+7IibBon0EbLiJ8J5GIINQCJKXTJ6XJ4X+YqMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYtY3M4a; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYtY3M4a"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-401c43671ecso164828b6e.0
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752695259; x=1753300059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGRHMbakmgtVzUhbhesoGMHoeYFQSQCOILI1FjneuZk=;
        b=HYtY3M4aKy+r5Uty8KOvd4AWehw1waVZUaIs7o7b0xFxdfW0PvEuWGz0Z46eTkx4q0
         MG33AnEyRPAJ3skE9nHTPHBzKPZllZjxWsGaTgzTduFqQJwnFxc/hCZyXF57NJdzTrdm
         WLfrlQZ/HgvTioqEC6ADdcDXUWS6dBw08xpo/tpLpV+QZrRTFpnGa23dnj0ihheRaKem
         auVKpsadhsFMaZxeua+aALHzLCW+GqM9WbKUEH4Ng8avPZir1OT+7pmbZEiRYUBTG+Lk
         +nVlAPlmt7JSV3/lWHxIFPhxBp/lwU+/KxIy9vVOvNJkCmp2hxWqBr3neiYqx10ksNvT
         gkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752695259; x=1753300059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGRHMbakmgtVzUhbhesoGMHoeYFQSQCOILI1FjneuZk=;
        b=suEWHmYq4gPDmK72QhHDbmq/UxLoI0VApBMMHP2uHS2sXWY04zAEw4uOrcXZaf9zfg
         atGrHxfcmJ6in8e2mt7ofFdaPoWo7KsDhBk4V0VceeegsDSG4xzGNamtc04dWWmnVEsm
         Gu4utGs4WQZIQetz+ukD6LQ6TGNwPYpt+rzlRyzQjZuwN6/L1SR4iHkcAidVIA5JXASL
         mM9hi04db5CjzzmPStggoxpN7w+jLAav2uYmF1Q/cuJKfzu1Byy9s0jwjj+WlCbvBiNb
         13ejhvWxvrtmWBg3rcelGW903MaU+nJEh36mBZ2RvqzZxgzlYxpnUuJYtT/LEzbw2HB6
         eNSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzT+Iwz55s5G59NABb9FRGQfXVaBZ/gX72e7Xr6iXA/W6Nfh2aAIoJZqyr3rqrc4kLvSg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxAfFpSNHcdBRuZF8hX01+R6LkPbSL86d64oNAuJ/wnLnM5DKa
	CRLtK4Il8OqfwbQ6KH1o9CsBkhdHU8/TdJ71j26S842E7WSEMwaAEpQd
X-Gm-Gg: ASbGncviuej9TfFkpVtveqqx/N3aOdzC3kIZV4woJ43MTntRbjZUf+aKqbfbrYUNy97
	kk0wXLLzV4yfUL6nIQ38g+Zx3OZDQ0GZjqWXIyL1lM19lWSSlIxlV6YZ/vSchVXsq+y7Wok75cy
	QOw8jdfkG/1Xpl2JsYX+AGcgtlVJCcHOVZPZpd1JJP763heY90K5Rt2snsYVZAuUVlNPfKPueUf
	5Ef43Fct56r0Rihwo37rkgmAjLLdHgPMqdHB4MNVSyFMb8eziArDy8sGv8KstSuMTkQDQJthyWS
	3X55BYX/6I4hmGMWxUDO3bT0VA8iJUPHTXWorL4thMdFSKma/13pF0Xwhmkm431omYlxhL3rxFx
	l/X8NQ8aCQgl2Pbtbb3teLtuX7jvdTfD+X5yVAg==
X-Google-Smtp-Source: AGHT+IFtuXI2LHUt381msMlgUjQyWjsjC4freVrIjMdBLr8CPfK8bhqR6K4a0vFEIy+s/Zb2bC8y8Q==
X-Received: by 2002:a05:6808:4fd1:b0:408:fb4c:85ad with SMTP id 5614622812f47-41e2dcc2e05mr602994b6e.4.1752695259074;
        Wed, 16 Jul 2025 12:47:39 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4141bcd27b6sm2954810b6e.29.2025.07.16.12.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:47:37 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v8] remoteproc: imx_rproc: detect and attach to pre-booted remote cores
Date: Wed, 16 Jul 2025 16:46:38 -0300
Message-Id: <20250716194638.113115-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

When the Cortex-M remote core is started and already running before
Linux boots (typically by the Cortex-A bootloader using a command like
bootaux), the current driver is unable to attach to it. This is because
the driver only checks for remote cores running in different SCU
partitions. However in this case, the M-core is in the same partition as
Linux and is already powered up and running by the bootloader.

This patch adds a check using dev_pm_genpd_is_on() to verify whether the
M-core's power domains are already on. If all power domain devices are
on, the driver assumes the M-core is running and proceed to attach to
it.

To accomplish this, we need to avoid passing any attach_data or flags to
dev_pm_domain_attach_list(), allowing the platform device become a
consumer of the power domain provider without changing its current
state.

During probe, also enable and sync the device runtime PM to make sure
the power domains are correctly managed when the core is controlled by
the kernel.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
Hi Mathieu, Ulf,

This is the v8 of patch3 from the patch series:
https://lore.kernel.org/all/20250629172512.14857-1-hiagofranco@gmail.com/

As patches 1 and 2 are already applied on Ulf's next branch, as
requested I am sending now only the v8 of patch 3.

I made a small correction into the commit description, s/SCFW
partitions/SCU partitions/g and updated with the check for the return
value.

I hope this is ok.

Thanks!

Hiago.

v7 -> v8:
    - Added return error check for dev_pm_domain_attach_list().
    - Commit description: changed to use "SCU partitions" instead of
      "SCFW partitions". This is more accurate since these are hardware
      enforced partitions.
v6 -> v7:
 - Added Peng reviewed-by.
v5 -> v6:
 - Commit description improved, as suggested. Added Ulf Hansson reviewed
   by. Comment on imx-rproc.c improved.
v4 -> v5:
 - pm_runtime_get_sync() removed in favor of
   pm_runtime_resume_and_get(). Now it also checks the return value of
   this function.
 - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
   function.
v3 -> v4:
 - Changed to use the new dev_pm_genpd_is_on() function instead, as
   suggested by Ulf. This will now get the power status of the two
   remote cores power domains to decided if imx_rpoc needs to attach or
   not. In order to do that, pm_runtime_enable() and
   pm_runtime_get_sync() were introduced and pd_data was removed.
v2 -> v3:
 - Unchanged.
v1 -> v2:
 - Dropped unecessary include. Removed the imx_rproc_is_on function, as
   suggested.
---
---
 drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..a6eef0080ca9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -18,6 +18,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
@@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
 static int imx_rproc_attach_pd(struct imx_rproc *priv)
 {
 	struct device *dev = priv->dev;
-	int ret;
-	struct dev_pm_domain_attach_data pd_data = {
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
-	};
+	int ret, i;
+	bool detached = true;
 
 	/*
 	 * If there is only one power-domain entry, the platform driver framework
@@ -902,8 +901,25 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
-	return ret < 0 ? ret : 0;
+	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
+	if (ret < 0)
+		return ret;
+	/*
+	 * If all the power domain devices are already turned on, the remote
+	 * core is already powered up and running when the kernel booted (e.g.,
+	 * started by U-Boot's bootaux command). In this case attach to it.
+	 */
+	for (i = 0; i < ret; i++) {
+		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
+			detached = false;
+			break;
+		}
+	}
+
+	if (detached)
+		priv->rproc->state = RPROC_DETACHED;
+
+	return 0;
 }
 
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
@@ -1146,6 +1162,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (dcfg->method == IMX_RPROC_SCU_API) {
+		pm_runtime_enable(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret) {
+			dev_err(dev, "pm_runtime get failed: %d\n", ret);
+			goto err_put_clk;
+		}
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
@@ -1171,6 +1196,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
 
+	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
+		pm_runtime_disable(priv->dev);
+		pm_runtime_put(priv->dev);
+	}
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);
-- 
2.39.5

