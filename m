Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB533E37A
	for <imx@lists.linux.dev>; Sun,  4 Oct 2026 04:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791088653; cv=none; b=HoU0ykUy4hNfrTRR+Uh1V28bkLbwJhLwNB8jJIwFm0V1za3F3i+1uCQHZJErTmJR+fYz1wgQ/AlKG14ZhqwyZ7u0ncc5RKDLwug43r1v4/wLbcsQq3ZdXiEKL8daIjtMvyFel5ot7ZIitPKOlgbO8htyDddb3vpNP+XKVXL3M0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791088653; c=relaxed/simple;
	bh=y5MWv1hH6XNIhEimYcmLK1JF49F0Ht6bbn+rO0Eehvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FUtZELDI86uJnjTjcqJfDoOG1PxSsh6xtqX+wpJHnOkJqN4BG0bP3XCBZ3Unn98kYi/WJwLwyiSJQ2/uvPt9LQcZ8HCtiKcSLAXH8E8RYpccqsn7ce87fpocRdB45Ru+sYaIP19HHMYwtOiSJZ78qFu75eRNWA+4vuOvTbrP42A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdpuBWcL; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdpuBWcL"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53397325663so7593011cf.1
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 21:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791088651; x=1791693451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpE22LeFXokQmJjuzufi6upumdakctZxmE2Fi+Aqg9M=;
        b=RdpuBWcLWX3EcbLa9i1/pgn/NQwKepKzuRIkIdJx/kKcERqn7WxAY5GZb2h/ESMiLE
         Lwq1uOeJHio3ByY0Vx/1pS18RyIcV9kz7hyyxm0l7+SHx440DHYvsU7JoxhVkpCDYYUr
         8qmGow7KI07SVnLgJJ4brw9CUgac6/R/MqmNyNOUd3QavbGpquiMKsZH1whq12azSOnY
         ZpMqXA8FmQGkmrqBz/6109ctx0epak5Yw/7OaINnwEwz933tXUoY00Z8d77AUrPpZZQr
         4TopDToJsExY9qibrR9UztoNoQddNqPhTcV2Z9Ny01qGC7IAPaw/4PLgcAR686Ke55Yq
         AOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791088651; x=1791693451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpE22LeFXokQmJjuzufi6upumdakctZxmE2Fi+Aqg9M=;
        b=Mom6D151Rmnu0lpS0DpW0KF32kH8ngKlCvX6LKzIgv5buAUvtMmwElA0cz8bLT3bJz
         079W2ZKAYy9fV5Jy5ZcMyT+yRbfMqNPM8t0du46GwSnn1oCwBY395X/X0DbaDCCeJy8W
         tHrD+I2qqSeRG2h1DnF35/8GLvCrnPqPL5p/NvFqv37i9s7JDv+ZALRWf33VJrJ5BzMR
         6ucTshZGK8Ll/hOTHS87WI+KqCoP5Pie4jD5InG5ZI4fS3MXHhAltbu8/zbfBZpFKW8e
         TAvfVK4lFlcfFz017kt5le5ghyxZiE5XlJdZrbIxZaIfWejT+jVnDDtVp/olZ7GaXm0b
         4cDQ==
X-Forwarded-Encrypted: i=1; AKwUvBydPJyWoldWlNaVG4b01h72w0OdRVePgZkhXPlbxyBO1mdKZZIJEyWa3RC9sWvHrhUClCE=@lists.linux.dev
X-Gm-Message-State: AFuF++kAx/fYLM036re3xprLt5Xz3OBp80RHYwQS43yEd/uKU8Z457sR
	lw2cmPcFm5K/gxyMMw/g8UtID29sJoMq7eyBgBTWyjnhk2od7E3Tkkk=
X-Gm-Gg: AYBFou1dAnTRZL1M+MRV/GS31z+FNZRiYSTjw4LAXt4wwTgJDX1m40tV4cKlT51wyQ8
	VOxRR25CBU0Pq2mwcJVVe0FSD3dzgaexaQChLZ8Ny7kEJNNa8fifW99zYbDbiFwwGLoG/qa9uu0
	S56cKOqOCA+xKNlTB2NT1YrPZQXckaPXbOhrpfpZFludgVtWrhzQfWr41Gu/boypQ+ZD7yjBp+2
	9yiMTZh4Shfq6rk6Z3s8BGQ18p1wHwHYpXxAOsY13rh/EXAsO1ADowOF5yDxBv2LA9CWsT30QGy
	tIaxn5NU3i8rkQL9FfTIgI97vIwY/IGEht3giPs252kLYp1Z3nhH+1aGF2oVLdwgJoLyznqKFDy
	Bj4CnOUPx/PszAEJy/cZBpbtirs5NcvV9sJ/DYMlbjZiX5uahKzBcvDN77aoYT8id6WG3A5Ytdz
	bouIyhNyMN8tQgxSyHcDKI2gWCZtOtSZqVo6jaPOPEX7wGLaWkqebzCk1Jc6yAb6qhZPDeDmaXj
	SVw8ftkE6Js55+Bsj+6DP0uKdmHOHuMa98vsJThGe700H/Wh0/ix844a2IqL4ixL9lqkIz0blt+
	vghUd1l4/8HDnNmF9SYDbcWQN5yToNJnsYfe7Fc=
X-Received: by 2002:a05:622a:411:b0:533:8c7e:c6ec with SMTP id d75a77b69052e-53511e814afmr69716011cf.36.1791088651268;
        Sat, 03 Oct 2026 21:37:31 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d32e19sm64829641cf.27.2026.10.03.21.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 21:37:29 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Samuel Kayode <samkay014@gmail.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	imx@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] power: supply: pf1550: drain IRQ work before unregistering supplies
Date: Sun,  4 Oct 2026 00:37:28 -0400
Message-ID: <20261004043728.1140015-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VBUS work calls power_supply_changed(), but its managed
cancellation is registered before the supplies. Cleanup can therefore
unregister a supply while IRQ-triggered work is still pending.

Commit 838767f50747 ("power: supply: pf1550: Fix use-after-free in
power_supply_changed()") moved IRQ requests after supply registration,
but left work cancellation before the supplies. That change protects
the direct IRQ callbacks, while this fix drains the work they queue.

Register the three work items after both supplies and before the IRQs.
Cleanup then frees the IRQ producers, drains the work, and unregisters
the supplies.

The teardown ordering issue was found by static analysis.

Fixes: 4b6b6433a97d ("power: supply: pf1550: add battery charger support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/power/supply/pf1550-charger.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/power/supply/pf1550-charger.c b/drivers/power/supply/pf1550-charger.c
index 2ead1df60e65..e3d4e9817f91 100644
--- a/drivers/power/supply/pf1550-charger.c
+++ b/drivers/power/supply/pf1550-charger.c
@@ -566,6 +566,22 @@ static int pf1550_charger_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chg);
 
+	psy_cfg.drv_data = chg;
+
+	chg->charger = devm_power_supply_register(&pdev->dev,
+						  &pf1550_charger_desc,
+						  &psy_cfg);
+	if (IS_ERR(chg->charger))
+		return dev_err_probe(&pdev->dev, PTR_ERR(chg->charger),
+				     "failed: power supply register\n");
+
+	chg->battery = devm_power_supply_register(&pdev->dev,
+						  &pf1550_battery_desc,
+						  &psy_cfg);
+	if (IS_ERR(chg->battery))
+		return dev_err_probe(&pdev->dev, PTR_ERR(chg->battery),
+				     "failed: power supply register\n");
+
 	ret = devm_delayed_work_autocancel(chg->dev, &chg->vbus_sense_work,
 					   pf1550_chg_vbus_work);
 	if (ret)
@@ -584,22 +600,6 @@ static int pf1550_charger_probe(struct platform_device *pdev)
 		return dev_err_probe(chg->dev, ret,
 				     "failed to add battery sense work\n");
 
-	psy_cfg.drv_data = chg;
-
-	chg->charger = devm_power_supply_register(&pdev->dev,
-						  &pf1550_charger_desc,
-						  &psy_cfg);
-	if (IS_ERR(chg->charger))
-		return dev_err_probe(&pdev->dev, PTR_ERR(chg->charger),
-				     "failed: power supply register\n");
-
-	chg->battery = devm_power_supply_register(&pdev->dev,
-						  &pf1550_battery_desc,
-						  &psy_cfg);
-	if (IS_ERR(chg->battery))
-		return dev_err_probe(&pdev->dev, PTR_ERR(chg->battery),
-				     "failed: power supply register\n");
-
 	for (i = 0; i < PF1550_CHARGER_IRQ_NR; i++) {
 		irq = platform_get_irq(pdev, i);
 		if (irq < 0)
