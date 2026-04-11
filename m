Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600762E0B58
	for <imx@lists.linux.dev>; Sat, 11 Apr 2026 19:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775934220; cv=none; b=SKIbSvO18ftzUtWRx8UygY+suCQrHhqGJI1ZzH19J7JzTJ41/Pd6cvmnCsPH+TUIFryfgTJ9Gh2gWdYWQOHvmGYkg7R3K6wPgkCmlFwnhzYFOjALYuZNVWejEc3OVfgcMVyx0yfmMPHuEgnAQ8K3/We1rraL7bo0I7UJv6Byt58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775934220; c=relaxed/simple;
	bh=6RaDDsGnWQW8DuDWURtJZzjEsjLR60hKYlROb26NIUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GO4zTcV2x55OCFseadN3OumCMyN6AGX8c90c1+r0TusxVfYjrYXjyEox6C2+0BU98SmBYi7QX5LqLiW0a95x37tBnE/Uogfj0/apx4XhCCDhARplIgbzqudtFzUGPFiZoB79emFE4JiPJv2WrJxkZebKJ9Wvdoik0EodqvNIur4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhxsD6BP; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhxsD6BP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82a893d289bso1450217b3a.0
        for <imx@lists.linux.dev>; Sat, 11 Apr 2026 12:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775934219; x=1776539019; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGIk18dSjHKSjMBfr2zRSzrPhhMb1Wy+tDs49j3GVxc=;
        b=OhxsD6BP/PLUbiPKH3GSEEPYtE45mt2SyReF8UFVoVwCf8fjNDq+pfPozN+Qry28tZ
         D6YezErtkVlvL7Yl15q4MAD4CiuBRC7O7PuNErt9ohBzwzjLtfFwXyWhoSEWQsefY7BK
         AxdzKBCursdstVvFL+0jHWRB3Th/tN4oYq3Y9y4lXFgCiibX5nq+ARzF/21tXdooUb1H
         mLf3KM8FFRzb836j4lEC3ZRYUwsZgbLSI8BR0vTqOYfLRa+bFmjVVyorddmrBGj69QGY
         kckfic7Pg33nM9AefR70DOpX0qUNE5W+RqzIMtV8QHHnxul1zfzatUCyh+bPfNLQjJ+i
         HCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775934219; x=1776539019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGIk18dSjHKSjMBfr2zRSzrPhhMb1Wy+tDs49j3GVxc=;
        b=QxVS7llVNON5MUYA5lEAGizFqfDJ3vlXBOU8kuM017yjoQjZJc8erKSsR1KNsqZpby
         67DkZL7GcODJ18LI5Ezr+9MzCWB8gT79Mmx2GeDm7awcPPIFNUq5j9QrRRL4pbqtkgUC
         EnM4KFHKoR4QVmuQTWuqGJMngVDXxr/eR2pZFY7pu6O57Zh7nIg1npfYOyQcyJr9awoT
         ROZcCN9WKpBypeawAjxC9thayQ3y6kv0I9uj7QP/yhr7x0Wy3huImGbnVqoE5kDK/FNO
         GWGuOopqH8zoKfrpx8tncbQyP2Ol2pw19ucDHs6KmAGc6LUqJNr0eXQQ2fTyBA5CqfG5
         bAEg==
X-Forwarded-Encrypted: i=1; AJvYcCWvN1gzp0vl0QHDD8U9XaA5GH7y6JtJ+E1HK8+1AVbNa7ILACheI45RbOetRqloh13XT94=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmlGozFnX6FqRogmPFlngJkydUjXSd2A9+qkZyR1A/zfgqCCiz
	R7lk+FRynaQFwOup2gyZ8/hCw0Sq071P5Kh0QeCe88DPLszG/G1cjesZg/Qhm5yEP4k=
X-Gm-Gg: AeBDieuU46KC9IXlQIcSobPoddBB+XUBZmrwWFwCJGxGTUcK5AI83gfTLUQ6V/0pQFq
	CAhLeF/+T9sRPUou1wcHBlZSupl9YHxlCrD0JGBj02JflkSYYpRCQTgt4snDxNFtvbiQx09XuKm
	ImAfnONfFNQdkkP2fRA25TlGxaIbY9QyPCWGhpyfDc5eXtMieDrBpADa8eMiBV7IuYCfq7hT2ST
	pd5Nhybekiaij7IA5MCV/NxJXIcYLJRfMHvmC4Q+LGGzgy6O/fWZ4ki2P7hnuwqnAy70ZXq+jAZ
	igVUZx9PLhTcJbqnDtVaebzKg4x4g5EjDX+qbUG38AM9S582j2/sJruXBgSJaKctnhyqj+ynI/Y
	laRKdz6lm54t8cT9ixzXNQwXJAzg3lHGC047uvM6ktzi4fhMHwiRJC/EiMv45phcUeIRLSDiO0O
	4tKT+Dds8QK0y/vW4ntRacnN5NAuyuLu1xgbbb3qC6CGQ4afOMFt7XW1ZWUT3yzgmeq5tN1grem
	8mm2sRZ+VGqfStDjtoo
X-Received: by 2002:a05:6a00:4507:b0:82f:120:fd6f with SMTP id d2e1a72fcca58-82f0c0faafemr7383565b3a.0.1775934218598;
        Sat, 11 Apr 2026 12:03:38 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c338dafsm7058962b3a.17.2026.04.11.12.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:03:38 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 12 Apr 2026 03:03:04 +0800
Subject: [PATCH 2/2] thermal/drivers/imxl:Fix runtime PM handling on early
 returns
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-imx-v1-2-cc3b45d63811@gmail.com>
References: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
In-Reply-To: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775934187; l=1725;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=6RaDDsGnWQW8DuDWURtJZzjEsjLR60hKYlROb26NIUM=;
 b=4BLCl7id57T/9qyuxB+Ons1cJ9eYH6GtrniSvJYEyQhYBOSdzQdtJxj+AGj/GX768L8KTU3Jk
 6v7hShaEIfWAOZx3KDCW/X/UvqA2JHhNFWhD2XBRFeFw7gejFAC9ZC/
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Use PM_RUNTIME_ACQUIRE() in imx_get_temp() and imx_set_trip_temp() so
runtime PM references are released correctly even when the functions
return early on errors.

Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/thermal/imx_thermal.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 68f9ce41a670..9d9ae7871068 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -260,8 +260,9 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 	u32 val;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(data->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE(data->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
 		return ret;
 
 	regmap_read(map, soc_data->temp_data, &val);
@@ -302,8 +303,6 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 		enable_irq(data->irq);
 	}
 
-	pm_runtime_put(data->dev);
-
 	return 0;
 }
 
@@ -337,8 +336,9 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
 	struct imx_thermal_data *data = thermal_zone_device_priv(tz);
 	int ret;
 
-	ret = pm_runtime_resume_and_get(data->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE(data->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
 		return ret;
 
 	/* do not allow passive to be set higher than critical */
@@ -348,8 +348,6 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
 	imx_set_alarm_temp(data, temp);
 	trips[IMX_TRIP_PASSIVE].temperature = temp;
 
-	pm_runtime_put(data->dev);
-
 	return 0;
 }
 

-- 
2.43.0

