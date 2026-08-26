Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F23C10B9
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740527; cv=none; b=hSHSoOZ4tjpbleHDrsrWufoZJEJ7aCqYHS7672Ts4KqCftXSCGyN2ssKY3moRHejsjVtZzZdND3bTBsEnbLUW3EycDq15IFYQ8rK1P6pb7OVALPN5ar/8cwr+GlaigkUHXmd58dmuk/iScMkT+zoQdE3BkLuckFIIKcV3CTIfoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740527; c=relaxed/simple;
	bh=y/qxAQMIW2CMYc/bzkgwh68GybbVe61ppJSHYTFLsDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A6zrm5Qvt0T7wRdTemwRcfUy8DMAQ1hsFop5z6FQlwp2farchtrz6Xlot9Q0OSwtTUy9+VrCS2T5D0AHrzWOhcmNKGuppDqPRgE/A0NyJwPNMFUZSZs5DzhR6bEGP4W5K3COguAD0ffQeC3J8ibFPv0OvsvMnpdBT6yng/dOMig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOdqXKY1; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOdqXKY1"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1040121a91.0
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 03:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787740526; x=1788345326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5X3ww+aTNIQSQQs0nmBvcYcUDlxPlN9HB4Ktt9oSZxg=;
        b=XOdqXKY15CawYV+sx6WUNdk0ckUIgZ+3m1ezyrTl2TO/0ldrvX4Md7g099QLBdm/mO
         oK2Pf+djejrhvRf/cgSfg1gD12AlScjmv56oZjnyyDMtpV+dNSk0LN+C4g6YIwMuR6ZO
         Sbb9KWh4p1js75GaKXlU7+3xZBluOsDA+Q5nsFxr7nZsRTOhWbdrp/jyOdXH9K+BxwTL
         MIgJPng+6HhKg/r9QEkfiCRZUVHSBs4mqUoPs4yu0rB9Yu4Om8S2NPTAOiYSmXCPEBow
         X9izlkoQKdOS2kNIj/vMD8zOJ+35re0nQxK+NOdFfX0FkrEEKlUwSz6xEDO7X0aNiAft
         vxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740526; x=1788345326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5X3ww+aTNIQSQQs0nmBvcYcUDlxPlN9HB4Ktt9oSZxg=;
        b=IC3zP31tykemSgUZ2IMkm0ciYcpmXXoGZoMo0TTDPFd1eLCfGcmV7p54paFXtK+N0A
         98diI/alr7JZWUV6OZdx6iBB2U80mhFZLk9KV3Wo1jE+d3R0a5LYp1MfychdpRr9MaEp
         HIQxyO/CSD8e5a7zJYoc8cK1ad4nKYIjmc0B7YMOluIBfXrtKSMyssE8mRTlIHOcYnbt
         kb++5wJc9eeUmXMcmSCwO2URPuUa1kieKtNwZewZ6Q1GXGoFw/O3Ss5FKaos5bi6dk+8
         dKFAFTVwEhtIR4nfSFh2MIg6C6QH943I+U1sD1wThIpM6+dG2s1yceRMpaoTjWjtodIb
         sVxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBH9nMnlmRph8rdy3d6WQVQdKXob6la9nVykdoiRlhIjNjSNCfPzqFJbzyE7CpKR211F4=@lists.linux.dev
X-Gm-Message-State: AFuF++n1AdxLh8GIDpQMaA/vYwGfdU6XIPVVfS1dcG2CEjbfX+xIF68Q
	LZv82K04VBCLeWvrPtYqk3mw4CeBZwxyLq0KJf/oN+vj0NP784eDJ3kf
X-Gm-Gg: AR+sD12GA4lbFE1AIyPVdqJ3AKIpSZe8IyXSiRT22QarbY6HEZvK9QIYXNe0aFk9L3j
	77WOR6B43q0CcXIvpht+43vYcJAZ4tp0qVTGjsvOWCIAWNRXL89v98ktkrVzDM9vKWuh3WU9OQN
	56a1yEps1nvy9wZ6y+Egputd1IzhrlLyd7Oixoxtri+X0rghJBM6R4MscwbbwtHG4W/zKct/WMm
	9MoFTAVtcjwQDyY74VFnXSThrNXWXUvcrMlp6FUeYV3E0M6RGP8KUK8/n4Cga9OrWXdk7d0JPQr
	SatjGHvTGfl+ThOQgMq07Y/vfxme0+SpVHqjoVVtCAUrkY/JY1Jpy+ijK6hurSU9oS66G8rpBNg
	+yxUJ/7ZU504+fxTCy+D354h+ZUvyTPpTokd34l5jE7ebrMPRXnIGCjxiqGJlX44k6ua8ljTkkw
	sP3djliSEpXzLlEf32+/iSlROZx+vKX9bvg3uBWE0unbbL8hfnDwR/1rzditD6mOjEv3Qun51AZ
	5bOomy4DyrkVsID4dDLubp4PTifU8R7pHAnwyxYWgft/IprC0hTw902ib5WQCYWd8kjmjCO7xzH
	vR+vTg==
X-Received: by 2002:a17:90b:1649:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-3966d3fe36bmr12075307a91.2.1787740525585;
        Wed, 26 Aug 2026 03:35:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3967591f49csm676654a91.3.2026.08.26.03.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:35:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH net v2] net: fec: only stop PTP if it was initialized
Date: Wed, 26 Aug 2026 17:34:28 +0700
Message-ID: <20260826103428.32807-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

fec_ptp_init() is only called when fep->bufdesc_ex is available.
However, fec_probe() unconditionally calls fec_ptp_stop() on the
failed_init path, and fec_drv_remove() unconditionally calls
fec_ptp_stop() during device removal.

Check fep->bufdesc_ex before calling fec_ptp_stop() in both paths
to avoid stopping PTP when it was not initialized.

Fixes: 32cba57ba74b ("net: fec: introduce fec_ptp_stop and use in probe fail path")
Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Handle fec_drv_remove() as suggested in Sashiko's review.
 - Update the commit message.
 - Add the Reviewed-by tag.

 drivers/net/ethernet/freescale/fec_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index ced4dbf8cd90..794ec427b0ee 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5457,7 +5457,8 @@ fec_probe(struct platform_device *pdev)
 failed_irq:
 	fec_enet_deinit(ndev);
 failed_init:
-	fec_ptp_stop(pdev);
+	if (fep->bufdesc_ex)
+		fec_ptp_stop(pdev);
 failed_reset:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
@@ -5499,7 +5500,8 @@ fec_drv_remove(struct platform_device *pdev)
 			ERR_PTR(ret));
 
 	cancel_work_sync(&fep->tx_timeout_work);
-	fec_ptp_stop(pdev);
+	if (fep->bufdesc_ex)
+		fec_ptp_stop(pdev);
 	unregister_netdev(ndev);
 	fec_enet_mii_remove(fep);
 	if (fep->reg_phy)
-- 
2.43.0

