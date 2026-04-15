Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7423939D0
	for <imx@lists.linux.dev>; Wed, 15 Apr 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776258641; cv=none; b=n+vq2+HbhK9HgbrcbBqBn+wIL+Zk1gawKBl8nR8sq0mMF0S6mNuspxwte27i/43CMz6Js7k94mcP//CjtqsuMi4dBnm6njbqdpAakTg6T6lb8ptM4C4a1VlWeGabkkQNwV5lBHX9NEmYPxqpI0VstioSf/4WHDza8R8ZzWY5zFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776258641; c=relaxed/simple;
	bh=7PW1lPMswvgJuRQIYg5xAY53B74djXr4QMhYyX34Qa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bW/K0w54mTGXpY3WDy0MG3l4+q0sL+y6nu9wSLV2IYr5psTpMFZ5+h6GMOui1C/9BCCmUPPhKQXThaVlbuARrKavHrLaZEsN97/ig5/2jxEmwW/j7jtzf9KcpTCEUVMyupBvxJ62lT/mvK0n7D2vj++PDf9Ln9TydMyqivq1vIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWp+syHP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWp+syHP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab232cc803so34093135ad.3
        for <imx@lists.linux.dev>; Wed, 15 Apr 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776258640; x=1776863440; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgiajh9ZFC2IgUfICjc3cGv7OXm2lzFWtpGDZIIxGOc=;
        b=KWp+syHPeMJrNaNHPzYHlL6MonFTKfl4/bCw3i/V5QAUtUqGrd3AdDWlkXf6xZoa69
         jZ2/oW13QRo3bcE5C95blqf6lQeqwKN2cmeF4sqHunTEOGEuWQFBoAz5so9SVUVZUWNY
         7uUmIYmb2JfDjloyobNDyEFuqyXzCd+HQT6bpHBSN0ndm2jgA8V5Mc8sUG3vLMn4k4xr
         f6Xf7ztVLnoFmGaGC/7uX590mRYUi0eA0WmYXKCXulTCAbOGM7g359KCoNTgH9WUaPRv
         UFU5mCwBgRy1tJd7AAcc8h7pIZuy09Gno1jIBsVd0bFN0UXQ75rZvciWp5VOskrFejsh
         0Ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258640; x=1776863440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cgiajh9ZFC2IgUfICjc3cGv7OXm2lzFWtpGDZIIxGOc=;
        b=j86KiEcMUULJ1A/gvNcuQGelWmJ8nAiNc3sipFqdhShkwctfCkIL8h4MdGFuQQ/J2w
         b7gxZBS6MBJtBDqbSUlDiDXoImYpD0qr3cHDcLbptEmyf2d6YT417aYWHntIe9srhnh3
         Uq7SmOKrlAS9/3Ppa4e3NfCzWGaY/Kr22S1p2StJm0BNsaAuoBrB3xlvY/DsXOTKGQqZ
         +wDA91RnB/3wjkF/N8qCm8O13rRBWPydmDTCDVfr93YeKkw6OfdET3Gb24HhYSvjiCFW
         mzVsSRcKFVdoG5XcvH83uYpKubhs/NdpnSayHYOL4kJc1CNwExMt1pu59lA3gfvR1qwf
         vi1w==
X-Forwarded-Encrypted: i=1; AFNElJ+skvsMZ1Disx1zejowda+yw5Uz6bZgmqEAUUZJLn2eRSKBS1z7x9kPco2fAcZVeh1N2ug=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJUEpfw6F7zOQwEbxVz9BFpjr0E8TNewgq/cvreWSC4lKu5wiA
	MsqzDTPVmccO2SmB2lRvx49AxjXZeSeJLfaBDZzIJ3GU95Iz8PnIowq9
X-Gm-Gg: AeBDieu/zQEUrsoqGT3VBFWb4KYe9Kc4q4aTEUYq+kNmdBk6JlC39QKIRa33EHt/5AR
	LXae3oLvwWUZFiTOhlbzl8WDnYMKfb1zZaNR3U5J072sgfWVmEWHthWrAAjgNHdlEiIHo6tahtM
	LhIpzAOqFBLQmNZCEhwRpPywKSt7MjS9Z6CjBBoGEZSaCWmZYbwfAA1sEpapT159dERdUxcDx8Q
	e23SHU3AFeTRbuQqutPMSBAJnNb+pjG9zpzxQzvIdPEa0UfGqFYhajz8T+RR7l0tPGSXlE2ASgI
	WUjgpPudBVa9ty4HxXyMk1gMaXFDZoK6BcXGyUF0oS72dm73smYjiTgUqnx15Bsbkp21ehs3DCY
	MTojEA5Pn8kcUfk/f1KInAiwQFb3FM0c1Q6WOI+6L45wgm++utWGB1yTINZfHkzsBbp2HgwgRY5
	u1yKWMbLEnBsM5M+DyBEIfAloVaaKuLouATbSM1cSzxf4WOnHEAUKNu2DTmF9ycXrjjQUHIcZOa
	E7C4goZW6QzjG9F8mlx4ZcNO8ot0xg=
X-Received: by 2002:a17:903:1ab0:b0:2b2:67ca:5fff with SMTP id d9443c01a7336-2b2d5a5d952mr210669185ad.28.1776258639793;
        Wed, 15 Apr 2026 06:10:39 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478292053sm28062555ad.56.2026.04.15.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:10:39 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 15 Apr 2026 21:10:28 +0800
Subject: [PATCH v2 2/2] thermal/drivers/imxl:Fix runtime PM handling on
 early returns
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-imx-v2-2-aeacff9e72b2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776258629; l=1767;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=7PW1lPMswvgJuRQIYg5xAY53B74djXr4QMhYyX34Qa8=;
 b=zc9s8r8gJYEF99ja/bK8BCYwUX6qO8U83NdS+xZl54YsmqyvJBsRpZbIBaWc4Errs/PcTw9c/
 ylmRwbKMQeDBA6dJu4y5ZbMbRXZFFsIsADvFvXB22DRbNSttxxOPGeW
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Use PM_RUNTIME_ACQUIRE() in imx_get_temp() and imx_set_trip_temp() so
runtime PM references are released correctly even when the functions
return early on errors.

Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/thermal/imx_thermal.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 3729c3eac748..057dbab70266 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -274,8 +274,9 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 	u32 val;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(data->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE(data->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
 		return ret;
 
 	regmap_read(map, soc_data->temp_data, &val);
@@ -316,8 +317,6 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 		enable_irq(data->irq);
 	}
 
-	pm_runtime_put(data->dev);
-
 	return 0;
 }
 
@@ -351,8 +350,9 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
 	struct imx_thermal_data *data = thermal_zone_device_priv(tz);
 	int ret;
 
-	ret = pm_runtime_resume_and_get(data->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE(data->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
 		return ret;
 
 	/* do not allow passive to be set higher than critical */
@@ -362,8 +362,6 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
 	imx_set_alarm_temp(data, temp);
 	trips[IMX_TRIP_PASSIVE].temperature = temp;
 
-	pm_runtime_put(data->dev);
-
 	return 0;
 }
 

-- 
2.43.0

