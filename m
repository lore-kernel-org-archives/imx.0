Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971DF418A37
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376853; cv=none; b=ohn/GMIuDlcX/fdcFweTZQ9G2D8u770hfkm3kzzGUoMT9aHnVgQrlZUWab7XSLav28ggHrzttJH1VrHvvYHSpZ2xRUBtL4TbwmkVmkSzbXOBFmAB07uzlfSDMtpWbZ9euRMDSsGEFSi8YtOqHhlGHw9gTKPpvNimUXDFo2J7qhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376853; c=relaxed/simple;
	bh=FN6z/whQjCJR5PJ9elVbNUyC4Aww99HqmqaHahztQls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmKGHw7sQzEOmcgYPzLxMEPy9u+A2KjtsnWYsUu67H++X/1wQNRizmbk5piYr1aK4o2ME+ue7xLbUGxEy4UVk4cBrRk8qnMCY4DXBbIhnNgrZfvyrxOQfxKeG3WybU4gtLoYK9761CyQEnCJxnkiYmD1fuQnDBT6yph/RvQIFFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgX4jxcm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgX4jxcm"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-86309e1a213so1240975b3a.0
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376851; x=1789981651; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvFBiMkRGjwoloZbq9nwDlVvLI1OyRNq467fT53sktU=;
        b=JgX4jxcmkD58DA7taTajsEswRNX8UcN5U0FiIvlUCSGfuFGDxaVnf5Sn46blbavPh7
         Xa+wb3XQLrB6h3gJwkq6dwzHg73VsuNxHR7fUbiYERX8fNh1Bmmrppv3X+gN0hFgK91R
         ycGcAGDoimXja9TqTc9ioICIshBQkop0KuYWQR4RLpIH8F8xToiohE+/sgAErZACu5Se
         1h6krQiLppOoVrOPpyVOP3+xW2wtUrrkybtKacpAyvyhnV4/xQ7Lr/G4M9M7P1A1yjzl
         0vBKuPRWaQJmzltVJ++q8dI2+FZ3alI1cL0+kUzbmbrIp5DLjj9nRyh7+g7lyzenfqX2
         V0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376851; x=1789981651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvFBiMkRGjwoloZbq9nwDlVvLI1OyRNq467fT53sktU=;
        b=bZjzVF2ei/atjJveztDSJtl7XbfL8vFx4Apjw8NZqohP57859akB8AKz7AOl6X8tcQ
         jIVlgI+3C8fc3V0QqJW54H3R1WjsskSgGu4NPRvTooo6307qDLx3BxWsetdvaBANv8Fz
         o/2n3OPs3jUG8K35IVEIRrcfWsVervySyLWkaVFrrE+jTgMz+U951pSVOjS1YJz7o4NT
         fEkB/GoRA0JnWrzUTs6X7rykanQW2SwHFPn1lxamhpwiQwovvsfx3dvQG1mrfd4GgYI7
         BR8HhUDcOv4t2uNlaBFOEeQygN5+EG96mBp6+cKKs+XCpeOcIMlOBkWWB+Bks5XfqcAu
         skxg==
X-Forwarded-Encrypted: i=1; AKwUvBwn7yTy2tEMgw7mSMbv9zofOMMgyRp7GbLvbvz32QuFMy1Qi5AwIgHv7n+oD1bNUfKYDMY=@lists.linux.dev
X-Gm-Message-State: AFuF++k0zCrnDrU/tQtwyL91IwRyE9e7gcBwZAVIfL1xggLarMNJ1/SD
	x3sS7H6NuVvD5qpDn+85JM6yIjeO2sh7DilR/C7iT3WOMx0Ta0J7meJD
X-Gm-Gg: AYBFou3nEyupC+vbA/YTYLlxnDxoTTsrzt60SI8KcI4Wn8JN7Yc4WeLOtxDXBtZUkhx
	nqfhD54/WmDT5aHjN94NeleF/qjtiLxreZsSoTBjRzUXuY0+o0egQ9QaynSAHTAsY9xaMWfSdcW
	Kh1YOqJ5c/7QpnC9fzhQLoBzDp1ltjB4SxXNx8pl8TdypCZy+oyvjjxqx1TdF/RjLeSuqSuf4b7
	5Kzr8usvA3yGb395UIZth4mT9gCK7NJL77FBIDNX8LHDkPYWHDBLC9+dKqML5pz7zuVoP+CN1WE
	AIsZMoh56bXmIsoT29JDo45mgrluLy/rm97eN1FW5zWSrE18HZ1Ufb4UZLBWdio0PXJ70Aflxke
	qBypovqsrBIk3OHgn12JnmwgaE+GHcNavU7vtMi1Dt8Ju1gzZlkQRFqVp+VA4+BH9e0r7VO67Pf
	ZrtgjMXh2z1mcOEavh6cTBzj2O/9F8r9dr4Afe6va9nzQwLtRspbNXQ2Q=
X-Received: by 2002:a05:6a00:8d8e:b0:84e:909:ac03 with SMTP id d2e1a72fcca58-86f83b3b22fmr3682395b3a.10.1789376850775;
        Mon, 14 Sep 2026 02:07:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm4365005b3a.31.2026.09.14.02.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:07:30 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Fugang Duan <fugang.duan@nxp.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: release clocks on remove
Date: Mon, 14 Sep 2026 17:07:18 +0800
Message-ID: <20260914090718.1666333-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpi2c_imx_probe() prepares and enables the controller clocks before
enabling runtime PM. After probe succeeds, clock management is handed
over to the runtime PM callbacks.

However, lpi2c_imx_remove() only disables runtime PM and autosuspend.
It does not ensure that the device is active before teardown or drop
the clock references acquired during probe.

For platforms which do not require clock prepare/unprepare in the
runtime PM callbacks, runtime suspend only disables the clocks, leaving
the prepare references held for the lifetime of the driver. Since the
remove path never unprepares them, these references are leaked when the
driver is unbound.

For platforms which prepare and unprepare clocks during runtime PM, an
unbind while the device is still runtime active can similarly leave
the clock prepare and enable references outstanding.

Resume the device before disabling runtime PM so that the clocks are in
a known enabled and prepared state. Then drop the temporary runtime PM
reference and disable and unprepare the clocks during final teardown.
Mark the device suspended after the hardware resources have been
released.

This issue was found by manual code inspection.

Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index e1a4338bc51e..481950004b2a 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1604,8 +1604,13 @@ static void lpi2c_imx_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&lpi2c_imx->adapter);
 
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
-- 
2.43.0

