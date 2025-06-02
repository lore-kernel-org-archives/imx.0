Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA56221727
	for <imx@lists.linux.dev>; Mon,  2 Jun 2025 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870404; cv=none; b=R9tJwGdQ+jpjbH0EuG2F/fUdEiu9dIwyfntt6HDLVF6bmmit6n17k3mrUlgW4FIpBbV/OSwonkuTwKDmiG/o7ti0j4IVxsS+0mM+KDieZmKOoQgq5OxJa544eItZyQnjbnJjhCZqVcG0yHvp/zST0UoypRsyNmTjpWupNPvxr2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870404; c=relaxed/simple;
	bh=kWoyBBVAR9Ha1I3eVXr883D+sm5esK1y5bluwlJLzPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f7Tvr/VPZMVh8jY/ZkWQ8dJBRv4H1TAEQ6MT2U8I8SZFFCbNmeOyzn4sx+NRT/1DdVINMm1uASJwaeNmqM8QFnZN/xDJ9jWxsLA5xXEthyvtndZHGy40dE8yY9dRRgsK1IpimyqMfSU8uQmsmFYJFV3K08EcPMRfH1M8QWt8CVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkbTsQCA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkbTsQCA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2320d06b728so37032925ad.1
        for <imx@lists.linux.dev>; Mon, 02 Jun 2025 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748870402; x=1749475202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhKP5iYORRYNLEnbf33EP9epGoMRKymXdxcO+qLp2CY=;
        b=ZkbTsQCAdOgFN6oLqPTD/5QvFzf+kLJaA4PjZRqJL7bsG/uckb8t2gMBq5vUVeeFJz
         mKSTVYAwmmxoGK8zqBgpRj86A3Lwm3rC8KHk7q2I7Ck4JbXq2wseIB3kRo0n1pzai+bF
         +HathFvffn3fucZ/EmWJgzCA70m8WgnOmd0/8ifDCm2N2tzn00HhrECMxDj8/u+Ud73E
         ZjuUb9tWE5UckqGaJ5Ml/0OpAITpG04owcSyg6POhGtNC+jqaBpe9JTyf0teQifoXSIt
         9HEOTpbDxbiF2AsLqflPyFdvAbjXD7+vVVb27CwicQ0AHurTp/FydcyACskkbTEJbsZr
         JNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748870402; x=1749475202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhKP5iYORRYNLEnbf33EP9epGoMRKymXdxcO+qLp2CY=;
        b=Q+l4kn+J3XFfANBUAuGEJcS1BXk4krBcWrM139yrJEKy6cUYhEphi9J5g6IYQTZUbM
         7dxI8aT4bm7PnOOe8omiJPMvngBhGdbi1d4nMpIPB9Wip+RROWqcFfVPUTWMxCIqgH+8
         US4SVjkPtNF9a4OcJoL7mdoxQtnJWBtl47A0sY10kOpyCMRgV95AVkKFtLT2mtZYRdGN
         QaoFqOCKO8TmxMZX8akOhaVQAQAOoiTQse4ZZnGCGHxoxMm2PXlKhsfYDAY6tM0E8XsL
         ADLj6zaK5W3QZC9AiekZyCijYbOUog30nKb+S10rHc8pMTkYZPYpCl3h9P15YH5rBAZW
         FmzA==
X-Forwarded-Encrypted: i=1; AJvYcCVgrB4MImVA2l8c3BLdVd3ZeTFBSio1qMtsh0c3jVOTZIJ5tyLSG+LTjMXnAwa+4qs7vTA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7oyHnLZEyWRREj8H8XvrLGDJ5qUaLEUYDswHYzvAtaJnbEN/s
	wq7REj9Z7QrBy7SDf8TOVcsm8YYDhVipnS0NYoAtw1c+c+JT9Z9JftkC
X-Gm-Gg: ASbGncsSnCEtVeZac1i/ADC763B03MooMtKmF0KA5vHZoRe+AhU/oqK8Z8NTPfwlkvW
	G7xo3MaEixH+WiA4Jt8vUowgavuwse9qLUnrIcliF7Jwn5dmDz9eTXDt1ah1Psi2ANkeF7IVEDU
	aCp3sDkhviJfPOf9kNi+g6mDqSGqTGaK9VBv4Nd2qdETf+CMCjveSH0Ge3HZZ0sTbsXn7tPbMH+
	i00bTj5gfmSYZH2fkH5Ts+DqrIHqaXxhTsYV45j/XdiJriw9Xcu9qdE/lQkQAUvF+RZRuDfGN3X
	6N69KTgNlZnslB/Zv+mIFc+mByT7ij9xgrs52neeeGBqwJXPo86pleVfTHv18KFat6bM7XzEkQ=
	=
X-Google-Smtp-Source: AGHT+IGpk0MW40KUnLGhZi6aTcs7hziCgisIwOKdVotPNVMy0bYaTAXay/v52EDp38MmY2gyBOvaiQ==
X-Received: by 2002:a17:90b:5344:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-31241e9846dmr20882041a91.33.1748870402169;
        Mon, 02 Jun 2025 06:20:02 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67bcsm6130983a91.8.2025.06.02.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:20:00 -0700 (PDT)
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
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to pre-booted remote cores
Date: Mon,  2 Jun 2025 10:19:05 -0300
Message-Id: <20250602131906.25751-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

When the remote core is started before Linux boots (e.g., by the
bootloader), the driver currently is not able to attach because it only
checks for cores running in different partitions. If the core was kicked
by the bootloader, it is in the same partition as Linux and it is
already up and running.

This adds power mode verification through dev_pm_genpd_is_on(), enabling
the driver to detect when the remote core is already running and
properly attach to it if all the power domain devices are on.

To accomplish this, we need to avoid passing any attach_data or flags to
dev_pm_domain_attach_list(), letting the platform device become a
consumer of the power domain provider. With that the current power state
of the genpds will not change, allowing the detection of the remote core
power state.

We enable and sync the device runtime PM during probe to make sure the
power domains are correctly managed when the core is controlled by the
kernel.

Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
v4: Changed to use the new dev_pm_genpd_is_on() function instead, as
suggested by Ulf. This will now get the power status of the two remote
cores power domains to decided if imx_rpoc needs to attach or not. In
order to do that, pm_runtime_enable() and pm_runtime_get_sync() were
introduced and pd_data was removed.
v3: Unchanged.
v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
suggested.
v1: https://lore.kernel.org/lkml/20250505154849.64889-4-hiagofranco@gmail.com/
---
 drivers/remoteproc/imx_rproc.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 627e57a88db2..6f9680142704 100644
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
+	 * core is already up when the kernel booted (e.g. kicked by the
+	 * bootloader). In this case attach to it.
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
 
@@ -1146,6 +1160,11 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (dcfg->method == IMX_RPROC_SCU_API) {
+		pm_runtime_enable(dev);
+		pm_runtime_get_sync(dev);
+	}
+
 	ret = rproc_add(rproc);
 	if (ret) {
 		dev_err(dev, "rproc_add failed\n");
-- 
2.39.5

