Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098263DFC7F
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 22:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044660; cv=none; b=NddVSj0APVNYjfVbdCdJfmFnS5cGGGWtaiMJWQAxWOKqzDUqNjAfQzOLSjZlcV2rhvVfYYbUtmNFAlA9v9E5jXjviCysoOhdJTZRd4I2QlaTkz8qAkVmwTWAe2vOqQmjgb+/8KonouiVNtKWHMzS/spCFaocg0qwqV2U7yWJv4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044660; c=relaxed/simple;
	bh=jfKLiudhSeJ7Ij3548KPuavVXJyFeUm4cbLCLp5+oPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gunS0zZRLVH+8svryA6nb74xaBAforjt/Hgwba4iik5xyOxw7rrZ/jJwAB0Zrom14IvebUfqlChBiizrgo+PGUxXsM1oN7ZP16WansGsI/gr4FdblHxNkyc9Li8FtFUYiOv2b2Nx3+/A/MPKbbqhmj1GpYkrAd6n/DOptwK2+fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qLKnPC0s; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLKnPC0s"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf1cda2b17so45311285ad.1
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 15:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044657; x=1781649457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=;
        b=qLKnPC0s+I3rAlRcwZRO5GjDinvxmdS3x4OoHfjCPN2XK0W1DJs8+9gnUZVkvcjqO1
         pwEDCPMmureKhv7PhgYcf8I4T1jH7CtqbP3qiGCSXOKsHTbV4QbnoKFMIb0DG1ITcbEh
         UK9GOdpNhdfIRca6ajQ1IceuSAXnuPHwPVevzPwPKbm29Yqef45G5QZeFJoGfcTaAJVD
         Lb7BQYPGKFkGFpkySVUL9yCRK6QgdM+dbSPFgrVV5MZZH2mSE3RB9Ab6TyvkOL4K8gyz
         fDWnPd8uFcPW+bWVwBCuBrxnokIVQZrytNxdZt/rRzuYe3r/QUj4vRPxYhactlfICPj/
         4wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044657; x=1781649457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=;
        b=axBFshtFQjCnV2pLjvwzBSLsnEWqHSFlR2+m2gviEPRZyvRynqMUZGbp9aIJHjR2u4
         SVTAS0Wc5TxYbZ4bYssq6zjK9W2rqritbyaEp0LPZi9Hfdnt6aWdIJ8gayFW9doMPCkV
         hZFrBOakq30SmxWcyPnwsogmAW6wsYbju9/xnDJmyEzlMLyLSoU/wbuzZMYutUKUcSaP
         sSvDhfIZRgsVDmP0zwLUuATZfY/hCmgKK8EBeYjTh7NYwrUG4z0q6b0vse2FPy2SCUR+
         O6AZZ+TDjwpMaL0edcrGoKUy5GBwT6yXz0qYcy2wprQbsGHBH8W6pKATaFxpIwLxpkB2
         dddw==
X-Forwarded-Encrypted: i=1; AFNElJ+v7peO3Mlyi5SToSz8ZC4x1WQte1Ldf1BZntGnWPXIHP4cMuaNR18sW1Z7e18QVR3c+/A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Fm/UTn4E8G4XjI4ogBQCGmvRkF37pQ1DD+2DFqEftGAympc1
	uziiS3R8mdlE0eMnCYCSEoPJEDoPbmGk0jzR3n2qOY9QtgW6Gp1qRHCg
X-Gm-Gg: Acq92OGRDiNF87zt1nnO0pby7XkgRznSt3hGzxfxcU4T98e+IAzZD1dz1rHGbRCfNEM
	wJuATd/RNSUuVTxlKHyMVsh6sNlugHAulYf6xZOUFS1IFL5MAdk+FXUWKqajtpFWRTbclqkT7A0
	BWaTw4Ebx9MjJjMzn5ZNuZFPZoDQTgjYKPQFQBbzxa6Ut350ms75r9Np9gE88kBcEOptJTv0Ik8
	bmwm2jAowCTqXRZ9qVt2OL+x20A+O96GfWlE9uN5kSEQql2KgfKqZtiIgMS1qoD+C83uheEbTcz
	/9gfVodeekVqJoKLOE/E5UnINgdsVHU41fTfEFtNHNJ7b+H8vf6w5q7Y9ZLBAn7a8TJBN16NX1X
	MkY67ST//rywgtjfREEIhIJhEGzlQuQRrwZBGow3IgSAhFzdXLcC3evIGOQClWZUUdsETKXinau
	dPMV/0jiP4UoSKfLNA8AV5azszl0RPub/OYPwAOtRQUcoV0mTl+I8g+vFkycIueoUrDuj7K5P5H
	p+xexbEWC4a/J7uMEB92UJDVjL8m0wU0BV8SFa+qKVhDQ==
X-Received: by 2002:a17:903:990:b0:2bf:1845:baf5 with SMTP id d9443c01a7336-2c1ec918402mr185643335ad.12.1781044657308;
        Tue, 09 Jun 2026 15:37:37 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv2 2/4] serial: mxs-auart: rework clock handling in mxs_get_clks and probe
Date: Tue,  9 Jun 2026 15:37:15 -0700
Message-ID: <20260609223717.41670-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609223717.41670-1-rosenp@gmail.com>
References: <20260609223717.41670-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_clk_get_enabled for the AHB clock so its enable/disable
lifetime is managed by the driver model. Move the mod clock
(clk) prepare_enable out of mxs_get_clks and into probe so that
clk_set_rate is called while the clock is still disabled, avoiding
CLK_SET_RATE_GATE failures. Clean up the error labels accordingly.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 47 ++++++++++++----------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index de97c0f74e7d..aa59a48bfad7 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1470,34 +1470,22 @@ static int mxs_get_clks(struct mxs_auart_port *s,
 		return PTR_ERR(s->clk);
 	}
 
-	s->clk_ahb = devm_clk_get(s->dev, "ahb");
+	s->clk_ahb = devm_clk_get_enabled(s->dev, "ahb");
 	if (IS_ERR(s->clk_ahb)) {
 		dev_err(s->dev, "Failed to get \"ahb\" clk\n");
 		return PTR_ERR(s->clk_ahb);
 	}
 
-	err = clk_prepare_enable(s->clk_ahb);
-	if (err) {
-		dev_err(s->dev, "Failed to enable ahb_clk!\n");
-		return err;
-	}
-
+	/*
+	 * Set mod clock rate while it is still disabled so
+	 * CLK_SET_RATE_GATE does not cause clk_set_rate to fail.
+	 * The mod clock will be enabled in mxs_auart_startup()
+	 * and in probe after mxs_get_clks returns.
+	 */
 	err = clk_set_rate(s->clk, clk_get_rate(s->clk_ahb));
-	if (err) {
+	if (err)
 		dev_err(s->dev, "Failed to set rate!\n");
-		goto disable_clk_ahb;
-	}
 
-	err = clk_prepare_enable(s->clk);
-	if (err) {
-		dev_err(s->dev, "Failed to enable clk!\n");
-		goto disable_clk_ahb;
-	}
-
-	return 0;
-
-disable_clk_ahb:
-	clk_disable_unprepare(s->clk_ahb);
 	return err;
 }
 
@@ -1604,17 +1592,21 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(s->clk);
+	if (ret)
+		return ret;
+
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
 		ret = -ENXIO;
-		goto out_disable_clks;
+		goto out_disable_clk;
 	}
 
 	s->port.mapbase = r->start;
 	s->port.membase = ioremap(r->start, resource_size(r));
 	if (!s->port.membase) {
 		ret = -ENOMEM;
-		goto out_disable_clks;
+		goto out_disable_clk;
 	}
 	s->port.ops = &mxs_auart_ops;
 	s->port.iotype = UPIO_MEM;
@@ -1681,11 +1673,8 @@ static int mxs_auart_probe(struct platform_device *pdev)
 out_iounmap:
 	iounmap(s->port.membase);
 
-out_disable_clks:
-	if (is_asm9260_auart(s)) {
-		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
+out_disable_clk:
+	clk_disable_unprepare(s->clk);
 	return ret;
 }
 
@@ -1697,10 +1686,8 @@ static void mxs_auart_remove(struct platform_device *pdev)
 	auart_port[pdev->id] = NULL;
 	mxs_auart_free_gpio_irq(s);
 	iounmap(s->port.membase);
-	if (is_asm9260_auart(s)) {
+	if (is_asm9260_auart(s))
 		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0

