Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38535337BA6
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149158; cv=none; b=DN78c7+MBKdEi2Ru8HZwYTwxrFjMyqs2keG/e8AMOZZXIBBM5rbIDfBgM7mkOnHCtq6KrRMDnunftDRSkMFdbfG4GW7zXY7VeiUyN2WUj73wAXrNWiR4oOZDkZZOuZlYkvPkzefOd8A93ra4Kc+BluzDsfr6VVKufyE5VBRNxBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149158; c=relaxed/simple;
	bh=jfKLiudhSeJ7Ij3548KPuavVXJyFeUm4cbLCLp5+oPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtxpdrfKYagHQije/+f5hv5oJibtJblhCRDHLq6SKqCJrIHePYQ38wIvIR3Wxn8XTFHiGu5EnoCFMqWxN5kAj0sP6xWwQWeY2IXlERtSUNxlnQQfZGzMwDDTJZq7KLfY30yuO9aW2wnnMfUKz/64508vfFPBd2mPduha2d20oCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WK4ErlaZ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WK4ErlaZ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so5138189a12.1
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 20:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149156; x=1781753956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=;
        b=WK4ErlaZOdc1xSsHwiKwGCuqYs07AAvH0H08JvQEjICHZy6Jl+q2zbU4OjtJwL9m+B
         jmAikVzOzqfHHYoLICy8kDZJ4IiMxyWVlFZzesDoXOZScDG6b2TlufQ/ebGndWyx60xs
         djN6Hq1HbbeXUMOvfE3Ihjam9sy4JGR5mKH1tAvYVuiHlupMHFrLFB3k8sryGBQq3c/f
         PKqXx/y45gbMAEoyzms7EeXx640CF5d8KrQkxPGTYUpixZP/DWPHnENNIvJQH+Y7xdi1
         7sK8MFgMGMWkxU0gSLWpjjntPNQx5KScyUMl9TQwa6XUO4Kz6yDjFV9bTjqQ6WBqnnH+
         Ks+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149156; x=1781753956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m7DIsV2yYkeuv0vuZTHMuiTm55rfBmU9E0/9cM1N8Eo=;
        b=SaCup/sNkFoxYYDMv+f28/gZtRjMZKfZ7zDKce7uw3zjwi4ZsfWRFzhloRqHKgY9o6
         DUMfYKk2bKIBxQYLoYqeXuEk4x4rMd9Mi6QiHf77MwPMtLaZ2ntX1cERWNzhJ3qSBIiA
         rYlXbEpPcDa++sF/46YR1+aV4GyLJCj74If/wKif55Bb6nRQownvd50iuF0Knjo6g21x
         Ac0KN7WVwKAc2aOJ01H9cD2VQ54PBN4pPoZQfcnyKOVlGFIXtmmLMAx+yJAOwiCExKbZ
         317YiRYr2/Cg+EE5A9iPD1xtCO0C/ZrX95ycpmNk0Yap+AOQlZaIG0L9TubmfFBc4Opn
         6ODw==
X-Forwarded-Encrypted: i=1; AFNElJ/XlpqXkbsqRHBavnS9fKuei0qxcOepxml28WtRiU6MQEx6B1gOn2dIVoNIubRgajCSOEU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzddozGUWCu+SbXQrg5Cp3KK8PopEW+NpNPCd9TdHK4Yktz6Rxv
	PuuYp8IL0PcaUuzgVCzFWkpVuvQQV6a/NS4oJq25+TeWQ6Y6i29MWGyLNPE/kA==
X-Gm-Gg: Acq92OGjYcAUrwIylRVRF6KDAbGSnn+jJqakgEJVykgoiPq0Em/TwYniuVF4pFpXmoX
	SFTGrIsNBxo/gUd64Ch+8k4arPytvHsvoA1htnBdmsigaRa7K2ka0cwgFe+C/ZJaXbQnoDQKeji
	BdNnjn2aDnhuxOLRX/gOG/RP6/imiRK0a75BCGoe9Mv8KqawkuoN7VZdWl85lvIGBxsuGuUuGsn
	VgUv5Z+GSA86RHw2m6V5hK9wfRMHExqQ0knTBwiiGvayeC475/VlFFh7l3IwcAThb7a2Qcdk3gm
	xhlMq3DRXu+qGyL9CE+hT5ljnho8MByVtzCWSwpFNvf954qNTC3UOjVaShSEYLeDyK1YPpzMB0T
	DAYrTNTxbqVhH2g4XicZm8D9pZgBqj7HpDipFaLsCnP4WEz7ZadRLeQyi0/JnmORnA2G2hsfd0G
	XnUUKck7wFG3mNobiw+upDD2x0BS0K06jloGcB4byJDPEPbkTatiwTsnljl1B3dwXsTMz9569Z2
	eJEH441+jkrvUjDZ/NdTwjF7R8sE99EDnCzFsvh+DCLow==
X-Received: by 2002:a05:6a00:1d90:b0:841:58b0:82bb with SMTP id d2e1a72fcca58-843367c711bmr978126b3a.9.1781149156549;
        Wed, 10 Jun 2026 20:39:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:16 -0700 (PDT)
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
Subject: [PATCHv3 2/6] serial: mxs-auart: rework clock handling in mxs_get_clks and probe
Date: Wed, 10 Jun 2026 20:38:52 -0700
Message-ID: <20260611033856.6476-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
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

