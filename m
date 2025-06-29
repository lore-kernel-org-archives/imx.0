Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23F238C20
	for <imx@lists.linux.dev>; Sun, 29 Jun 2025 17:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217951; cv=none; b=eon+HH2a+8Ejt+sKr7JsYs6Q317m3jMHeY67o7Mpuh0k4HYS0gqj0WXneYJdG34CvPHsQXTWM7IbQl6qt1s89dGt9X0NygWQmY4HjVI6hG/su5upcweeU1GDOCOImuDLC6Au5Y8WlZ+CAH304l9nDrUkZIVfR0V6gnP++p2bBwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217951; c=relaxed/simple;
	bh=dX5CgCff38oCxVYrv1myAPN8VV6/co07Gu9nbEQT2ec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfYxJdcz5jraFbjMx/kDjUHEHK1XRxN/e1O7WS2QtD28aPPSm4kOirVTRkWXI1DB0BKidPQmvySMsOloBOuFRzG0sl8Xy86mWrc0RuDv1Y4aqCwe2wpbJH0ZKhBYIPR2AhJdI8DG3FvmM1Om3a4cxpxoRUbd/wbpyCBN2gc9BII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kemUFWym; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kemUFWym"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a4323fe8caso8192341cf.2
        for <imx@lists.linux.dev>; Sun, 29 Jun 2025 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751217948; x=1751822748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC9iUQpNk2KWt1DZhVabqrPCsFfxqA98Z3a6X4JvyBM=;
        b=kemUFWym6Sy6JHp7vyb8ojSJFh2xGBBdcb+vln71V+1SCIvg/DtkANeUjx7D5MkujK
         +WsHIawBNPQUKbgyW0rTipyiLU7DTYAkCnfbHtAElZuRZ5O2YIc0bAEWuMScwpj9+hoz
         VaEtpJO1d87wjqZ431UT0hJGDwrjxh8uGskklylBwfA65GSEiZ34TMQkI2Xs1oq/n19s
         1BfYjhJJl9COOwismVFe3vMVaADogX2kRejC5OHDi7U65O/DAET3mGYZEa2j7NSct4+u
         NTfKVJ5zc00Z6k+TIFwr0SluRO8NVGDaKvwVtbwjg2javJyBVRE0Kx9VC762M5HB0eWT
         dDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217948; x=1751822748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CC9iUQpNk2KWt1DZhVabqrPCsFfxqA98Z3a6X4JvyBM=;
        b=XAAXfBnTkt+MZk4t35ssEizxLriLK1GdtXu2mENIWLQ1Sfto4xLkijo8PhhHgpCYwI
         ZWHRBhPEfzw3gvT2OySeZuTCXB81HsF2kInB1juZwS002Khb4uhVDtGTwRfjdIh4rR3G
         aIcHoNkvZAFsw1hUvB9mIGEhXxf4caKBja6IPVinCha/q3GnWItA1a+Mb2bzSuo79ykp
         qZFGIQt2JsDTuYilMnsX7HxYszyzDT3S8IBJXZCYx5omyLm0XMN3Me31ILdf4zHInjRr
         RNTLqamMr3aLTiZfjDDObedNY/jKheErbOpONiDibQRtEv0SXuqjgabOAEj7DzlQB93e
         5ndA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYlp/vSt++QO7oqVfZAZymrUsyanpXmpqNxs3xp4E1aUufYEP02mB8SVtDovxqbKTQqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxagpzaYgpEu/vlNH5vSFDkY80KbObyN7xcvc78UG1wmvjiF3X+
	a5shEfgToayK54pVtXJV5uJPmYsqMqhp4etHrK8JqQEAWqViXQiuLuGH
X-Gm-Gg: ASbGncsIhFugg6qRYghEwvlmI3NI/GjpkntLvUQdebfApg8O10ZrlwOvscDSlLTTyJn
	94Uoj5aZx5oGhguXMDxXi+yGFUaDIKFR7M+DUBSWTwh46m8904EzbmEFj2V/GPstdVr4409oIiz
	bjXYgwFYvrfX0ADz8RPhetXbzYaEVjXofpH9k+gvqjLcHFhwjVdZ+4A3mT7+7Ewk7xY/6Sh5yUN
	d5N//GsXpOWaz0/NtRLppy3IZ1fu3fLacy5UI+lP4l96tELG37BEwNIrtIIdeHqGmyEsIWgQn3J
	ylNrqoL51U7r7ZPsqKfIsgkqDBuPQ7olgxmr83chB0/TEbrCDFpoeufCz8jQOHpzUSatgmeDpWF
	M080=
X-Google-Smtp-Source: AGHT+IHL+yIWTipjXDrBIV1HOTDHYJtyQk3xOUCkDv6eXNSuiH8iXZMcrL3wqtORw+/eQhaCGyQTew==
X-Received: by 2002:a05:622a:5b03:b0:4a7:6e64:a52b with SMTP id d75a77b69052e-4a804b3926dmr128171311cf.35.1751217948303;
        Sun, 29 Jun 2025 10:25:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm45549761cf.60.2025.06.29.10.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 10:25:47 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to pre-booted remote cores
Date: Sun, 29 Jun 2025 14:25:12 -0300
Message-Id: <20250629172512.14857-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250629172512.14857-1-hiagofranco@gmail.com>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
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
the driver only checks for remote cores running in different SCFW
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
 drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..24597b60c5b0 100644
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
@@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
 	if (dev->pm_domain)
 		return 0;
 
-	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
+	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
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
 	return ret < 0 ? ret : 0;
 }
 
@@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
@@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
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

