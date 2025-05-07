Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B34F28C5D9
	for <imx@lists.linux.dev>; Wed,  7 May 2025 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633720; cv=none; b=VjC1Qq27z5WYS8g7n7udcNlU7xFXx1U/qKI2eG0QW2ix9e3WR7iYaOIf6Tsyv8+1M3XAxqwlYQiLshZoGSQ84Z0M+EVWhsFe50Mr22WXRmVDCdShilGiwHmSCXlKbtKoKOjQ33nbosMR1orOg8kp8j84Bqzl/tf+dv7bkU243hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633720; c=relaxed/simple;
	bh=n5VWoI8hwll6ATNrzxyGa1fhudrQz/wOOiEF2X2LP+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=apvIlPVgGkEzp/O1cRSL7slh5iRdW22eN9UPJzmWbYIj8ne1/nCJOvo3vC3KC73/WvId2xc7WUuT4oHzymO4AgWjdI83PFoGzX1cANMSWLSNDwhRPgs7uPYn8aJEhbXXQ3jQP4JGTs5ZNTa2tLEtzxFcP2AaRQnrYVrbb/TU5lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCEZ4/tD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCEZ4/tD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30a8fd40723so83481a91.2
        for <imx@lists.linux.dev>; Wed, 07 May 2025 09:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633717; x=1747238517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvziy4eou3QaoE99EKXIFfvgtdzshqQ6+XPSOJVwJnI=;
        b=WCEZ4/tD+jA8jgftdS+lQrVtCRO9e2JB5ZLdKjoCZ2uugh1DTjWLvMbagPrftUXQL8
         OjG0mfK+T0tQFUzDlWHgP6Wq5lTh9HSzScGZLI/LDjW+TFrUipwDYthi+IGc9T59/NER
         Tm+qVH01JfM3RmIrZCiO5OIF5q0fzTROsc0qf1N0Q7wwEV+1ga5urFTn6uRCKSbxmNRB
         sk/X3NR9G6Iaf2Uyk7KeeJu0EcZLW1lGg5AaozXhQaxMdHNkckaixQT7HoTEcq7mtGzg
         C2Z8P7F0VRpVRS1EdzY80/gWQ2cwwgt0/PW3yO5xz0LTacim5skMA/6RywWrRHUM9Ydg
         7+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633718; x=1747238518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvziy4eou3QaoE99EKXIFfvgtdzshqQ6+XPSOJVwJnI=;
        b=m7Hzn222qKiFemaXfSQkxYg1aRAuUqRuvp3bRR/6pe2GxmHn5udcvfpWR46gQnpiPx
         RDQA1RC52BAypCXFSgTrecMbn+Vp85AH2aVrHYQ5WUueWhosEbCh4HwJjnRku5nmKmgz
         IjpoPrtP2nunLgFt+ikc/G8iOnjTq/tz1bvxZsYCUPEnMDQZg5XJlBB+y0cKbtTJQa6z
         maYWkdZQ4lT6daBnM0h5EyZcA0IpJ9IxVLUdFuqPWM9t8PR+kX9TQ+Vo8Ks4e7eXHp+9
         BvK6WKm3+PpsqEmDCKKAMJM5VfqubVGe8CEESgnSCD5CZ+262SO2poWKe96ovbP/xnc0
         n73A==
X-Forwarded-Encrypted: i=1; AJvYcCWqiWL+DBLgqOEFQsuGkW7XIwy8WwVLcqWbGb/dYcMVvv+h2ZBDrljEwsDCBiMHixbx+bY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6fDl5R0QEayEpuhOfJQaHYumvGF7sUsikqIs/gv29vxcGbwNO
	oW5FdbtCohWQvhZQq3uqTL5U895AQdnjnRWv98ITG2srAgXhqgDVjfPOzuIWxEw=
X-Gm-Gg: ASbGnctvsAqbZldwykxrj/+B/uGJ/CXIuQX6OTQacDFzuy+hOc76RElbUhS4vixAPDx
	rL/KMH0TzpYeX5m+KzBptYiuSjr5St/eRQ1VHzEpt/2So8ME02VjhWrDRK3/VDEyNs5a0SEcaQM
	Fsp4ey7VHFoY/rtuW2HGO7DIYsazK0mAcnXwa7f5Tyt54BH55p9yKGfMXRDzWVb/RtSfAQF3Ztv
	KYXhs3JJQLLwdzikziELoYaF+PrhqMyMod1beWrYZTTBKsk7Hx3RUnnKMGawYqZGGHg57CquSw1
	fg8iM4d+td5hEsC7weYOpoaBX0n4S9NPwEbkzWJb3xXUayGj2OtoewaC6sWEhZI=
X-Google-Smtp-Source: AGHT+IEVQn8W2DCaOLJ8nt6une9BpBR+Zi5adCUsrGW+yDHxUa7uKGXONWqkOwz+Hr7bQ3bU6dYRUA==
X-Received: by 2002:a17:90b:2241:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-30aac2483e9mr5393663a91.31.1746633717323;
        Wed, 07 May 2025 09:01:57 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f82b86sm327242a91.44.2025.05.07.09.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:01:56 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 2/3] remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU
Date: Wed,  7 May 2025 13:00:55 -0300
Message-Id: <20250507160056.11876-3-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250507160056.11876-1-hiagofranco@gmail.com>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
by the bootloader, M-core and Linux are in same SCFW (System Controller
Firmware) partition, so linux has permission to control M-core.

But when M-core is started, the SCFW will automatically enable the clock
and configure the rate, and any users that want to enable the clock will
get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
fails because clk_prepare_enable also fails. With that, the M-core power
domain is powered off when it is still running, causing a SCU (System
Controller Unit) fault reset, and the system restarts.

To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
because SCFW will automatically enable and configure the clock.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Suggested-by: Peng Fan <peng.fan@nxp.com>
---
v2: commit description updated, as suggested. Fixed Peng Fan email.
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..627e57a88db2 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/* Remote core is not under control of Linux or it is managed by SCU API */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
-- 
2.39.5

