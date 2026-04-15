Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EC43939D0
	for <imx@lists.linux.dev>; Wed, 15 Apr 2026 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776258638; cv=none; b=Agyxb3uvGdRx8NNzT27GDpjUSUnHFQBm1rdx++g8NVmRyy4x6wcBku/Vm38Jc3oDNuk3JJPjwsRdmNsWASy7YzQDltni7ZpLLEyuOE4JQDoIgXuU5b7feQXbyE1mP2bEWa0Z+HvjKR2LmnVYC16wZKVweYHKBrp03ZOiTDHw2vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776258638; c=relaxed/simple;
	bh=ev3ap9xj2ci77Th4eddDfPYYKx/SundD/E1tF85e9Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SMpD0vO9FWrfQSV0BDSVMuB9Y5LweZsGXEPzVxEdxIDuu4afyEygVhpVF760R1iE4zvaZiUBBtIbSsFSyy6p5J4zFzJcnuZfFiqAr3PoXWEnKsqSbcQIuLJ8KC8nobxCl5NVZWOk14BdYwEgzWnavfrMEk9bck0aIWeSB7LE/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIuEt5Kt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIuEt5Kt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b458ca2296so24152395ad.0
        for <imx@lists.linux.dev>; Wed, 15 Apr 2026 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776258636; x=1776863436; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUJELJUz1O9IxhGCscm3K2eyC5/sipvwiOllk5WFaS8=;
        b=TIuEt5Kt404rpUSZvLWInJWyiVRgX/h/wKR7SDYN8bN07EwnXv2hdODfQidfTk8e+R
         Y3ovYMimwBdb0xlYvNTa95hckxEyjDAtadqOG70FjSVcDKl11ixpxTxV4DsFazZzAmBl
         dloMv/MELStX9YlHzGw4oxGfzEzSbZPG3KU1/0gcVr8wvB23YBDURnNa/mVcTF99dMdA
         tOV6kjhggTl1dWgxPkidCWI6N3lY/ISRL4l5mxzRIciS5gQE53U4WJmECaSJkjknK7TX
         WdlWUn0GW4w4i6+T7zZ9Ob75ZDBcRdVuFN2eoLxYX/p0BbYGRMHDDDZEphzucJG0MrOb
         fKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258636; x=1776863436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kUJELJUz1O9IxhGCscm3K2eyC5/sipvwiOllk5WFaS8=;
        b=fAGYd3dSyhhqJrbWhreyCcbG8xaG6lct7a6Kpf0sX+XhIr5gdGe2h5TQKJj0w3d06E
         Jqzmz2QSPHEg6AvZZEdiGqaEellcxga+KNE0l11It5a7FTDAORRuJnTRecNgqkXlMVih
         uWrNQ4K+TKF6YiISNpuIRzdFEPtlmCCIL9JuOidORz75mRv/z6PnXDOOK7jN7mtPiV6c
         nK3ZPBagWWbF+Y1yG5WvNwkkBJv+h7oXNWejjY3rVFJ1wkAiC+2VM39PTDmjUk7rw60B
         Dh2MPDT+27kZ+GES7oxC1tcRlhHR6z9AVv2dBBpp2T7Wz1hNYclAYAHDlas8GupuMi3A
         uJRA==
X-Forwarded-Encrypted: i=1; AFNElJ+jgfs4X97hWy/ry/CeaQa0oRuyWkPXzj/l9e2IZi/hh2a4/q2vmEdWUmjkMGUOLnIGvcU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxY8cKwpmwtRojIQW97bJSiXyuAp34rkCao5PtcyjJRygVUb6a7
	wWaJU4QWH4FE2ti4/PP7V88G23MG6A9igtoA8kDBSyaKj96UTAHRSdCU
X-Gm-Gg: AeBDieuZp9JeMLvJfh3D3lN1C5+YoLxQq6gtjbsxqpuEaFKEMGaLs/G74l/JvOaOaon
	uSRZ/r8Naftr0KoelYsrt/wmAiJpRjGPsdFeqQy/NrmXxJP4BXm9fWSgu008AWgMHhn0C6PDyyf
	zL61ioyVSjaUI5ka/hfpNY8Ni4V1XYk9+2u4G1PN7R9Vt2U6tPUUIHwKrEcGNff4edQyaDXFQal
	GoeXOnzVDvpVu1k+QYQ3Pqs4d2WjEVoPl9dM+4q0LPstmzdNRYMW7e3A6NNMxeIuBrnWcVhWlt1
	glyZ9B0Cb6RVFFveu8xu7G1FdJTnHuN7C+IfZi0fA550i4Ab2LRJNvEXE5tLltR4PakCT7PxWKP
	nYVIQrJpOqb0d1MC1jIeg1OWUrPYVCuS/RPr8omo8niHbL7YpFje5U1bFOSTplCn6ockzbO6hPH
	5ekxN2jxqhw9isE6jYBJwqNBlgi5IAomxqHHAJMuK1itnP9+RETDEq920SQ2aVJTKqE5mXK9g3p
	R4EHemOMXUzWmnNWHOl2AH7mowlbMo=
X-Received: by 2002:a17:903:bc5:b0:2b2:53f5:463c with SMTP id d9443c01a7336-2b2d5937375mr153330845ad.4.1776258636118;
        Wed, 15 Apr 2026 06:10:36 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478292053sm28062555ad.56.2026.04.15.06.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:10:35 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 15 Apr 2026 21:10:27 +0800
Subject: [PATCH v2 1/2] thermal/drivers/imx: Fix thermal zone leak on probe
 error path
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-imx-v2-1-aeacff9e72b2@gmail.com>
References: <20260415-imx-v2-0-aeacff9e72b2@gmail.com>
In-Reply-To: <20260415-imx-v2-0-aeacff9e72b2@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776258629; l=3218;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=ev3ap9xj2ci77Th4eddDfPYYKx/SundD/E1tF85e9Oo=;
 b=+vxBo9PAJKnT8BuHhNDuig2ER/6eWGBvDO1I7LbnUtizgMe1i5F9cQOBcODm9AJnTg1aAWUwq
 1H8DhhjRN6hCirqBg5cpRelvYwP9LNh1nY3fBnXUMla33YhJyXSfRaB
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

If pm_runtime_resume_and_get() fails after the thermal zone has been
registered, the probe error path cleans up runtime PM but skips
thermal_zone_device_unregister(), leaking the thermal zone device.

Switch to use devm_thermal_of_zone_register() to fix the problem.

Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/thermal/imx_thermal.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 38c993d1bcb3..3729c3eac748 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -216,6 +216,20 @@ struct imx_thermal_data {
 	const char *temp_grade;
 };
 
+static int imx_thermal_sync_zone_trip(struct thermal_trip *trip, void *arg)
+{
+	struct imx_thermal_data *data = arg;
+	int temp;
+
+	if (trip->type != THERMAL_TRIP_PASSIVE && trip->type != THERMAL_TRIP_CRITICAL)
+		return 0;
+
+	temp = trips[trip->type].temperature;
+	thermal_zone_set_trip_temp(data->tz, trip, temp);
+
+	return 0;
+}
+
 static void imx_set_panic_temp(struct imx_thermal_data *data,
 			       int panic_temp)
 {
@@ -679,13 +693,8 @@ static int imx_thermal_probe(struct platform_device *pdev)
 		goto legacy_cleanup;
 	}
 
-	data->tz = thermal_zone_device_register_with_trips("imx_thermal_zone",
-							   trips,
-							   ARRAY_SIZE(trips),
-							   data,
-							   &imx_tz_ops, NULL,
-							   IMX_PASSIVE_DELAY,
-							   IMX_POLLING_DELAY);
+	data->irq_enabled = true;
+	data->tz = devm_thermal_of_zone_register(dev, 0, data, &imx_tz_ops);
 	if (IS_ERR(data->tz)) {
 		ret = PTR_ERR(data->tz);
 		dev_err(dev, "failed to register thermal zone device %d\n",
@@ -693,6 +702,8 @@ static int imx_thermal_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
+	thermal_zone_for_each_trip(data->tz, imx_thermal_sync_zone_trip, data);
+
 	dev_info(dev, "%s CPU temperature grade - max:%dC"
 		 " critical:%dC passive:%dC\n", data->temp_grade,
 		 data->temp_max / 1000, trips[IMX_TRIP_CRITICAL].temperature / 1000,
@@ -724,25 +735,18 @@ static int imx_thermal_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto disable_runtime_pm;
 
-	data->irq_enabled = true;
-	ret = thermal_zone_device_enable(data->tz);
-	if (ret)
-		goto thermal_zone_unregister;
-
 	ret = devm_request_threaded_irq(dev, data->irq,
 			imx_thermal_alarm_irq, imx_thermal_alarm_irq_thread,
 			0, "imx_thermal", data);
 	if (ret < 0) {
 		dev_err(dev, "failed to request alarm irq: %d\n", ret);
-		goto thermal_zone_unregister;
+		goto disable_runtime_pm;
 	}
 
 	pm_runtime_put(data->dev);
 
 	return 0;
 
-thermal_zone_unregister:
-	thermal_zone_device_unregister(data->tz);
 disable_runtime_pm:
 	pm_runtime_put_noidle(data->dev);
 	pm_runtime_disable(data->dev);
@@ -761,7 +765,6 @@ static void imx_thermal_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(data->dev);
 	pm_runtime_disable(data->dev);
 
-	thermal_zone_device_unregister(data->tz);
 	imx_thermal_unregister_legacy_cooling(data);
 }
 

-- 
2.43.0

