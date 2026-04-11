Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502072E54D1
	for <imx@lists.linux.dev>; Sat, 11 Apr 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775934210; cv=none; b=oLK3Zh9boYiJQ6Hx+jjwQf/bW/b74RDshjX5qPTOHsYsqEJIdPkpCV5fNORbODsTSkNrN0EbrzQ/H1BwMFV7h2R+Gp89l1OHhIsfKnTsJm3dA0NtrG2wFXvTmdCTSCL83vHhrS8/zQ2Zu139BYwfEqh0V1f9V3WPEzQzYDgTyfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775934210; c=relaxed/simple;
	bh=HdJtNYVZoBcseIrEtuqZHe4dtTSU6Ka5kLHKaWeLYmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anpIZULj9lHADBScxeWJQckNwNJUANlFMID5jvyFJzoxoiiakweUDdv8n013Kxjjyp5TtLTe83lM05VAevGo9FigIwO1EBsFt+7Qz/GmRogNIdC8aCcEYa648Ge9SBSHCX9Dz9q+Lp5kMU5o0zm3YV9Wy0WdNThr4BdYBW/HfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agyh1x98; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Agyh1x98"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8296dabef74so3321042b3a.1
        for <imx@lists.linux.dev>; Sat, 11 Apr 2026 12:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775934208; x=1776539008; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZCcfd2j80fnOyI9eoqdL6EvakDEWReMcJQ9OZ/rF64=;
        b=Agyh1x98/tKuSpLTbson/ZozxAEZNua2dti5qwh+vQ4OS84KmazyhqHHthZjUrg8eu
         xdDa/h1IQ1vuu9K90Td8s85Z8eNN93IW4KvheLuZ4CMYUDWEkeVPYyLb1HX89Owll7zD
         HJHHeFqFnTmFmHPX9BZAV5Q+kE8atgiBtAG0C4fI0enFi3uE+I8IT6JclO/5sRj0SGhO
         27YqYFxkJa8FEpDONX7n0ys89SrNMM8kpnmYAUBvzjmFJlR9YIWKguuQkpddBsONpCaE
         pnPLJqIB8/I+09Avdqzl8C3RhNWQHNHRorPZ3xyNRXVVsAovZKw3k6C2yy8A0sBL0z/U
         Rrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775934208; x=1776539008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZCcfd2j80fnOyI9eoqdL6EvakDEWReMcJQ9OZ/rF64=;
        b=gBqJGwTkTwKvyOX7bAH57N3m7CrYiELk8BVZVhKPR2TEhkJvvzxjCsXPbT+UANhap0
         kc8l1JYHPkrCVuys+XaZKc2uxZ6Sd/vUj5aRQQZEtB+crghDnNENiEUN5c+Ny0rXqdFp
         vlEDq+gEXC8qE0nMAxUsOS8vLWqeKIL5yceN1NsNfi5hpnrvKCDmbElExXr7zBbsjOvJ
         ekoh8DW9QwnzjJdWjj078IG8dUDZBgPXPVTWviq0Kia9YdaCkwUVl6GtNOKYh6huSdne
         jF6cvkNuw3Rzvdqq5lYzQ/wYIWw0/dJG5vU5Bz1QnaU33B+EYbcr5EpP624LBFl53XYO
         Iy9g==
X-Forwarded-Encrypted: i=1; AJvYcCXG2X7jXeWcbozZWUGOW1Oa3u8I0KsyoKSrKjAkwzSbvhCpXfcJ5+W+EhpotkYgNCDKyoE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIApBDKidWWOoTvQ6fZIgsGV3EVLOhG3eVOHwyChvz2f0QmVaN
	SzSsuwnIZTrNTnz0UDXM25sd+7KIDX38DerOzRQJBqXdLrNgepNUPiRa2PH7qr+kl6o=
X-Gm-Gg: AeBDietlEWa7ThfxQIbT1ufJG+HoP7R9GHaRkMnfNqkxFqv9zEhZn8/k+NsL+yz1Ba0
	uQRwWRrym1dpIr/HWb3nD13MKXumjS+7VTWRQpRcyF3hnRiWC3LQF1e4q/4OqaSxRgPga36NCmY
	47wQ8xys29xkB/d27VFm12uXJneZg0IMj0UrGPEA6duE2LwSZ7W5XMEViYHj84xqM/cAU1Wvd6J
	jBT/j0aBLVZYCBU1xqI2yUP/qSFu4+4PZEYr8ArcfVZyg0nNMJZegOCAxFVkYTpC0yw1kd4GdtQ
	bHqxMy19MlU3ENpvSsHH3MRqdkXE9QJQ5MhJaJgqawjf3EvuPIEhJT1FVzvYZym1CZtt6f9A/IE
	vaX3MbIuSugVI+RaRWIrDQMo0irc/oYxdFxxoizb4kJpuD1xAduPKFeL9QP6x37lqj7H4SjpfKE
	4uODUiqLnBLG2Bva4HjcFZlGuGqWgbDLtpKGkk+7eZNSemSOO0yS1S0SDnUi0DlWijnWZYnKUlW
	Wo5gWjQaTE3VhLvhxNO
X-Received: by 2002:a05:6a00:aa85:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-82f0c2108e5mr7582747b3a.13.1775934208443;
        Sat, 11 Apr 2026 12:03:28 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c338dafsm7058962b3a.17.2026.04.11.12.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:03:28 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 12 Apr 2026 03:03:03 +0800
Subject: [PATCH 1/2] thermal/drivers/imx: Fix thermal zone leak on probe
 error path
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-imx-v1-1-cc3b45d63811@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775934187; l=1641;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=HdJtNYVZoBcseIrEtuqZHe4dtTSU6Ka5kLHKaWeLYmo=;
 b=neNOP4zpKWvHPkLkH0wdVnaTfqhzSv/BpzFq9DKrR/JAJc10E6mAsmmekeCLKiDqbQNajMH0i
 B6BD4UMtexGDr1MJj8lbme6hvP/nA6/CmECAFZ/qJQoFx/UM6NYNdPC
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

If pm_runtime_resume_and_get() fails after the thermal zone has been
registered, the probe error path cleans up runtime PM but skips
thermal_zone_device_unregister(), leaking the thermal zone device.

Move thermal_zone_device_unregister() into disable_runtime_pm so all
failures after thermal zone registration unwind the probe path
correctly.

Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/thermal/imx_thermal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 38c993d1bcb3..68f9ce41a670 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -727,25 +727,24 @@ static int imx_thermal_probe(struct platform_device *pdev)
 	data->irq_enabled = true;
 	ret = thermal_zone_device_enable(data->tz);
 	if (ret)
-		goto thermal_zone_unregister;
+		goto disable_runtime_pm;
 
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
+	thermal_zone_device_unregister(data->tz);
 clk_disable:
 	clk_disable_unprepare(data->thermal_clk);
 legacy_cleanup:

-- 
2.43.0

