Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E69228D8EA
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 23:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751932005; cv=none; b=U3DmA1dqIUaxxMZ0X2T0tZM5fKYxRxccFgCmhXKiRyT2ureADGANLOo6W/dTbjWCI/1yjEBuAgAaLz0gNE0YmMXd3O54qxOeSSpLLia3H2IvwZrLnMq/PtCNkcIY7MxItS9wtZf7g1HeWo1lFYdkr4xr6JytBCbz4/WAutCzRoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751932005; c=relaxed/simple;
	bh=KJpdRf6NMnf6Rt2dZ0cJp/N9YNrV0YJHu/s2iy7Kdmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FWU8rrhSkWNVGw4XadMdRQrg3aQ1vURohikmtE3Xy6tOrSdsdFWMNJ+V1M7ivlDum/G5l+sETn7+se+GQN0YAxqTCMa1AEgtTEpvsT/Dbah9vRT+SOycbznKxVSwO1vVO07lBYM+pb0TrEBcl67tOmQUslVIsze17eSweCovDws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uvt/Bnth; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uvt/Bnth"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so644208566b.2
        for <imx@lists.linux.dev>; Mon, 07 Jul 2025 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751932002; x=1752536802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR7QgFUkw7RoWN72KVKLvsWt9CALHQJ4apvzKDpFkZI=;
        b=Uvt/BnthoepF1GrHobfWqkK/mEaKIwNKgat7ss2TzXjd8pRIRmrNLoY+y8jYpOY+Zj
         3ctRI8K9w0htMivePzGE6SwNyK8MoV56Izo4feZyQm6x0gDYS8xAs3t/gnE+93uEvh9P
         MO5IpbiW+0sOIkNCor89KY0/Fa0qM4zwT1eVOML3CUllB7K9/QzbLVO8DsKczpwYFOvX
         /hDK3ILdZw2TLlNQKa+xlUfpZfYF5wLh9zIV8dnI4R6AknawNc/bb0CY9tHDMI8rbRft
         r65V2/hciOpxIMWyaVU3Qryf/ROT/hu7Fh7ueryPQiJ9wxhbtO46qxipA4C0rKK1vFo6
         hdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751932002; x=1752536802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR7QgFUkw7RoWN72KVKLvsWt9CALHQJ4apvzKDpFkZI=;
        b=XgZNl5k8knEDNZZsoyDaz1oXtrRueB/gFtN/yBTMLRw520nKAz909hqGCxnY2FVQd8
         w1SJAWSSnkGMHlQJt2edpah4T8Q7RrFSbZM9P+/JoymdtMottYl4iJGY1Oo/yStYKGXK
         WrTE4usb26uSdElBRrM5BcCOysAVidINR9FaWVlrfe2soBnoVYCB7MzjBDepz5A4jKOK
         bySs4bOoAmJpohjD9AQ7kkgYJFrHaU+usM3oik7xeSEj2WJ1R9hqM2ZjlgJ+UdBQXMzu
         7lJERS8wnD2HP064iySKkyjMfViMRxK41h3LJ9rcdXUBoeePt4sqCWae7/eh1dN2L3mu
         gNbw==
X-Forwarded-Encrypted: i=1; AJvYcCVmxrwiRRLXiHz+AOt1WV2Mm5Es+DaANcKdKZcLn5t5N7DNSGPK7Tyk3NthVucyCRKOJWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjaPimJZPnMfZnnkMiZ0dpzgdpQmphT5NRjiEQHH8CDg+1tqyS
	B0CgzZXA8VYYtf5WxJllGycwAR8Pt9w123UG1pvvV8AJiv5TdyRcBnao9q4zXg==
X-Gm-Gg: ASbGnctlW9Dw3ak10ACXc+NKJDqOwobNmIv+Vkhfi7Yg8jLxdFWdyQccRf1+hG+lpQB
	/e41TAsnAELYQ+bNd2Qze5Z/GXEInPNR3cfWPG0MECg7wvCEeU70Z8JXlA/Y6j6iAvQeqHLd5MS
	Tt7oWOXSS5CiX8WWxE8Xe+Q5j4wHi2x80OlG3wE5qxLyLzWXrV9eySSFWoqOoJWKgniRo6uWuf9
	HS2UBylOAzc5XDhZhyYkH4EYrDPtM2/jYvxiLr4rYO/AXKZMYoReoNH4CxixzlP3M59kZmMAtus
	i7K4kzgqJWb4X4+Os1dX/boQ2TVfsCbqwj+40K4+N4sJsWTT3a8xCwCU2UAK3QU8KZfP+uyyu5y
	cqMveWvy8jIs5QrC5nQs9SXU=
X-Google-Smtp-Source: AGHT+IFbP5MkFe5LRHOPeI/e7qFg5vW/o+B53HDzNs80P8WQiqFztlyxMrGhQsVTbOFiRGtjwCCOMQ==
X-Received: by 2002:a17:907:608e:b0:ae3:bd9e:589f with SMTP id a640c23a62f3a-ae3fe7b4b5dmr1450488566b.38.1751932002093;
        Mon, 07 Jul 2025 16:46:42 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm781539266b.7.2025.07.07.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:46:41 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/2] bus: imx-aipstz: allow creating pdevs for child buses
Date: Mon,  7 Jul 2025 19:46:27 -0400
Message-Id: <20250707234628.164151-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

devm_of_platform_populate() passes a NULL as the bus OF match table
to the underlying of_platform_populate(), meaning child bus devices
of the AIPSTZ bridge will not have its children devices created. Since
some SoCs (e.g. i.MX8MP) use this particular setup (e.g. SPBA bus, which
is a child of AIPSTZ5 and has multiple child nodes), the driver needs to
support it.

Therefore, replace devm_of_platform_populate() with of_platform_populate()
and pass a reference to the bus OF match table to it. For now, the only
possible child buses are simple buses.

Since the usage of devres is dropped, the complementary operation of
of_platform_populate() needs to be called during the driver's removal.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Fixes: 796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/lkml/5029548.31r3eYUQgx@steina-w/#t
---
 drivers/bus/imx-aipstz.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
index 6610251f41c7..5fdf377f5d06 100644
--- a/drivers/bus/imx-aipstz.c
+++ b/drivers/bus/imx-aipstz.c
@@ -26,6 +26,11 @@ static void imx_aipstz_apply_default(struct imx_aipstz_data *data)
 	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
 }
 
+static const struct of_device_id imx_aipstz_match_table[] = {
+	{ .compatible = "simple-bus", },
+	{ }
+};
+
 static int imx_aipstz_probe(struct platform_device *pdev)
 {
 	struct imx_aipstz_data *data;
@@ -49,7 +54,13 @@ static int imx_aipstz_probe(struct platform_device *pdev)
 	pm_runtime_set_active(&pdev->dev);
 	devm_pm_runtime_enable(&pdev->dev);
 
-	return devm_of_platform_populate(&pdev->dev);
+	return of_platform_populate(pdev->dev.of_node, imx_aipstz_match_table,
+				    NULL, &pdev->dev);
+}
+
+static void imx_aipstz_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
 }
 
 static int imx_aipstz_runtime_resume(struct device *dev)
@@ -83,6 +94,7 @@ MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
 
 static struct platform_driver imx_aipstz_of_driver = {
 	.probe = imx_aipstz_probe,
+	.remove = imx_aipstz_remove,
 	.driver = {
 		.name = "imx-aipstz",
 		.of_match_table = imx_aipstz_of_ids,
-- 
2.34.1

