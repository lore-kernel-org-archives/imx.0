Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982258BEE
	for <imx@lists.linux.dev>; Tue,  6 Aug 2024 02:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722910607; cv=none; b=rIshfcHa6v3mDFww3VZO858+gMp2+6GYOx2WhTZwjTEE7d4EgIyRr7PYALDe4j18t0PRzEasqTgSHo1vrMaKSA0+T5x2X78stTgqbAytp9FJiARFIWpQyKxTr6aW4MOM6z4SRHhu01mvZAlcW0MXFQuiX7HnIPVJfr4VIwPPKtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722910607; c=relaxed/simple;
	bh=ebSWJSj/buxW44/rQoQph4W+aePCGg6KpmYyKZK1snY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qR5CMqjd+kA3skC3drdhC1mH8ZRI5VALyKXqrN9iaVtkaspQDcAidubL6o+0JUtCOiV57ZcDna+9aq8ALjQl9AlecrochmeIf7yzC8O/OxR1DVh+XogY/ow0iY4v0I+anVfII58KIclkZywJFAvHy36JCT42uT677aYj/8Wa+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzZPsGRU; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzZPsGRU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb80633dcfso97415a91.0
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 19:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722910605; x=1723515405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7mvtGZEsuHPzWX3pW4fYKh4Cjh9maArqhFHH/gvuGQ=;
        b=EzZPsGRUDj9nEEhvqVdJ7zRSnV9clWNfm+MJw0q31lkRDDDdU7iNWmgSUeb/nKZKyE
         Hi5cxDprEWmixQPtxosX6bEXEF9eq0S3/cFttb1bWSfFAh6eXnUjpat5tZju8rvjhi6z
         acQBkm7vMyoF1d+gYDJwuEf8Aoe3ife9El4UcmxmZrcHRdQCSFL01+OeuDw3PDgrsFek
         49EUapmXBr2jhaxFsyICe1qJrElAHAYipVrAoPHfkkOdC5B18KiKR35bfzNHXDU/Up6l
         25T3glupcA0+tVP+B9iggVkVlQQkuwXfJ/2MMGSVScIhKgZ6kdnWIH3OgG0U6/3nKNAo
         TzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722910605; x=1723515405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7mvtGZEsuHPzWX3pW4fYKh4Cjh9maArqhFHH/gvuGQ=;
        b=ou1cYb97c7W6Allhi+52bnevsd5JQ7wu5cKAgMCgkAB82w1YW9qr9yWYhE2HzrOvmr
         3FCvNfEqYPNgOmMq1pyx7ougzq2E2rwZOuX9jdkKXU9f8FYG9UmjRpn+7TYFxWs5dFy7
         WFYEFk3PXisWUH8DVH755InFgFk9seAbnEicmxvlL5nNY/fqOr+eO3bv1Nf19GCKFwAl
         g9TRJi8y5WUQgGYN3o/SSiNnWcdT2WH9ckIhXcSm0OUNcgK0ifTriA3k1/Z5sQNj/E6k
         Lvxtvnc4txpzjIpDcHySbg0a5gYrccgEp0DDD3oDDQSzEEKtlj0qDH0BlOEOD3odnrRS
         dtSA==
X-Forwarded-Encrypted: i=1; AJvYcCVQzVghsW7eZSn8DXot8sua6/uyC2VDOS6EQAOOlS0zXN+yHyFkmhR3jqjmhH4BQ7lZn4M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWJ01276m4KvzRFNYfN69L0Pcqf1FNs1l/ySPJNXXVMFKBFKbp
	GdNcbrAaI/jPVXFoGhqht3ahLHjquFfSxXupMfLSbCPSohO617lj
X-Google-Smtp-Source: AGHT+IFGIIZ+nhDuGefYZ1y1WVR21yakH6dk3osLDORN1mCGnbZ1+JngnuuwyDq0uaosvESzYiK9fg==
X-Received: by 2002:a17:902:d505:b0:1f7:3ed:e7b2 with SMTP id d9443c01a7336-1ff570f16cfmr91474625ad.0.1722910604865;
        Mon, 05 Aug 2024 19:16:44 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3668:14ca:30e:638f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929ac42sm76095385ad.267.2024.08.05.19.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 19:16:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: kuba@kernel.org
Cc: wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH net-next] net: fec: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
Date: Mon,  5 Aug 2024 23:16:28 -0300
Message-Id: <20240806021628.2524089-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.

The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index a923cb95cdc6..8c3bf0faba63 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -4606,7 +4606,7 @@ fec_drv_remove(struct platform_device *pdev)
 	free_netdev(ndev);
 }
 
-static int __maybe_unused fec_suspend(struct device *dev)
+static int fec_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
@@ -4659,7 +4659,7 @@ static int __maybe_unused fec_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused fec_resume(struct device *dev)
+static int fec_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
@@ -4714,7 +4714,7 @@ static int __maybe_unused fec_resume(struct device *dev)
 	return ret;
 }
 
-static int __maybe_unused fec_runtime_suspend(struct device *dev)
+static int fec_runtime_suspend(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
@@ -4725,7 +4725,7 @@ static int __maybe_unused fec_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused fec_runtime_resume(struct device *dev)
+static int fec_runtime_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
@@ -4746,14 +4746,14 @@ static int __maybe_unused fec_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fec_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(fec_suspend, fec_resume)
-	SET_RUNTIME_PM_OPS(fec_runtime_suspend, fec_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(fec_suspend, fec_resume)
+	RUNTIME_PM_OPS(fec_runtime_suspend, fec_runtime_resume, NULL)
 };
 
 static struct platform_driver fec_driver = {
 	.driver	= {
 		.name	= DRIVER_NAME,
-		.pm	= &fec_pm_ops,
+		.pm	= pm_ptr(&fec_pm_ops),
 		.of_match_table = fec_dt_ids,
 		.suppress_bind_attrs = true,
 	},
-- 
2.34.1

