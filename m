Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53E34107F
	for <imx@lists.linux.dev>; Sun,  2 Aug 2026 22:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709391; cv=none; b=iRO6Fp8m6Ez4FfZ2tmwcqY2+yh6h6U13IRNGnVuuwlPKiEyJDZTXTiHl4xRWWyn4IZR3wpiNkvQyrM/FpCfebe6T4I3sddwlfm27zM1ZlgKLfyILRnMjqbY+Elcnb3WcoMADSOBGGEy5z0fNh9XKdzFeVSxG5xb54UZGw5Ste90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709391; c=relaxed/simple;
	bh=k/PWOQgo1p4Yp1h5/yZGB51G2UQvJK1mFc6oQmkpaxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWzKOtwFcUEGE7/hWCPyswz3gFbfo1mBgQGI+5Mw9pLYiAhwj2AVCH9PDh5tiQ7aYPoi3/Dr5ZG/aJigK2ItqQ7LxQi6Zs3dtUx+xLNwI1WIUb30xHTfOn/FuRQN1Vnr69AackJ0IRGJ6RvWFwt065Bn/hOdV5qCmqg29zbjiik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZhUr1FS; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZhUr1FS"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c0ecfaee7so16198151cf.0
        for <imx@lists.linux.dev>; Sun, 02 Aug 2026 15:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785709389; x=1786314189; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K+YpikDeGg3PaK1+XecbhoXs6xNS16wdVuw+OggeHyc=;
        b=pZhUr1FScIfd9cJ2C+e0g+CKttdik1bjEvPReLJ4VblVTM3zM8/Mi0CQHgVVm583C+
         1lJ6jPjn03+i/fL2kX+X12LNI6PnZSAiCnhxYdh3zrLyFofH1/qVMPZoL9VQhpnK6q49
         wp1TRx6Tx0FiUBsK11u1e+QQNmXVOq+Hz/M/K//fxjBoYYDD9at6Ch9psIT9Lnf85OSH
         bZmoFeAPtLsjC2rbrM47f9Og3C5y+2Du72PVnvUak18X7X1VmgMAmaoX1239vrklCdXi
         8k5o6UezT9z8sLg57vnMo9Q8eLInGf7VOE5OfrSb1DhDV48TDH7rBnxlXrLs69QO2JxA
         EGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709389; x=1786314189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+YpikDeGg3PaK1+XecbhoXs6xNS16wdVuw+OggeHyc=;
        b=B8H/+x4u4fs6dwOaVTfNAPbQF+VGQG5QxOUVsIs9TlRvFmLMmRaotEc3L7BAYY69da
         IbAm/NvlLC36WnYsWf/kTa0bxX+9vrFLR0oumB8b+czixZsLCuMmoq4H7XTzdIzVmHui
         cAunRLbIC99G2w8Uwm2l4wwei0Fn5jzW368+ZjjCQS7n0JNiYnBcp15mxLFP0OQGpVw1
         2vUF6H5V8RZKD3mD9YgzA2uJporM2cgLnBkJAldPBLhkfW8TKF5Jm3iTBImlwzpQ9oIM
         vVBrJbHN9MhGEfdWG3VkjXROqcgqjQ9jEzDKE6z01T4yAAf+mqongjsfkJFnTSRQPogB
         r2Rw==
X-Forwarded-Encrypted: i=1; AHgh+RrZgoEZ3aYOcGN5+uBcZp8GsCwCaEgo1P1yJtdSVr5a7lq8vAMOQ0b6CnFGi9krw4gZiWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKuh1ms3uZQIoStp1XwHGgzkEQtVTF90OFyGl61P3VeAgutuX4
	SwC0OGDsg1XlJ0pB2Mhn5LodecTHU9dqTLRU5pkuqGyb3N0TDdZxLDK9
X-Gm-Gg: AR+sD11cqcq1q/h12b2P04Ohti9rC3lDOER5/hvWjNXqI7SONJsYDDB0DYxKpV/29TU
	PmvlwlasrGouBQJEFRTslu1aDDSpvTytjAmIVLdkT+GT+Y2Mhrf9BWoMlZi7I+Qrhn/gebcg5A7
	ZUcouulAOZncDHan0ra/HnJREaE2oDtOx0xvd0ulXdBP+J5xvpoGWp58MjKukG9/qCzrEwb6OHi
	VJtcnePkLMn5XHbdwTMh8tmJVRwVkO67T0tFtqqgl3nqtpi3TeH8wFSbupgMoLaSCEIUsiTq5pd
	NIJdqKqlFDBhzunkwvZ6DrLjMhoAornNTkOJlQzngTfXkcCVOUQB3AdF7JUxjYQ3UzDMjgpm+t0
	JbTmktYVuq7oa02J88WyzTPJNQtNDuVWPVzQECc2pbgbo7713EGcXe8E3NTeRuaQFl0t4NenkxB
	cxfgUyHWn73AYvQRwXRzuffaK/k4klKDJHTDTycHkJPWOnBwdvujdWpe1NhCEymsZDbnsSNqPNJ
	F0AN3TANdgLSfDBnTnLXVBD1SriwX5i8dbko/xwJx5paxVhJHcYahBJxmxKWyE=
X-Received: by 2002:a05:622a:2612:b0:517:642c:8196 with SMTP id d75a77b69052e-52b566db0admr173984281cf.12.1785709389063;
        Sun, 02 Aug 2026 15:23:09 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a250csm61249026d6.13.2026.08.02.15.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:23:08 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: olivia@selenic.com,
	herbert@gondor.apana.org.au,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-crypto@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dakr@kernel.org,
	o-takashi@sakamocchi.jp,
	bhelgaas@google.com,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] hwrng: imx-rngc: Disable clock on registration failure
Date: Sun,  2 Aug 2026 18:22:59 -0400
Message-ID: <20260802222259.577200-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RNGC clock is enabled manually before runtime PM is configured. If
devm_hwrng_register() fails, probe returns without disabling the clock.
The devm_pm_runtime_enable() cleanup only disables runtime PM and does not
call imx_rngc_suspend().

Disable the clock before returning from this failure path.

Fixes: 7a96a64e8689 ("hwrng: imx-rngc - add runtime pm")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/char/hw_random/imx-rngc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/imx-rngc.c
index 28c56c2d1bf6..a2db26d7f790 100644
--- a/drivers/char/hw_random/imx-rngc.c
+++ b/drivers/char/hw_random/imx-rngc.c
@@ -313,8 +313,10 @@ static int __init imx_rngc_probe(struct platform_device *pdev)
 	devm_pm_runtime_enable(&pdev->dev);
 
 	ret = devm_hwrng_register(&pdev->dev, &rngc->rng);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(rngc->clk);
 		return dev_err_probe(&pdev->dev, ret, "hwrng registration failed\n");
+	}
 
 	dev_info(&pdev->dev,
 		"Freescale RNG%c registered (HW revision %d.%02d)\n",
-- 
2.43.0

