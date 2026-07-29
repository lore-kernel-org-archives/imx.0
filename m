Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C652842AF80
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 22:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363274; cv=none; b=awIpVSyZbN4nHoT5znmPmQBzQuHvaeKcxC/9jLv6L5DvmOSRZwTDV0QhIrxH3wXOrlt/qRYyVP1XG6pZz4OatUB1Mc3scr8LjVFnlA95dCwZ79VPFzNE6JyJKuwErF69wNrLQON2UQjfCGaI93zk7vn/Okp9JqxeIimJxJG1Z7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363274; c=relaxed/simple;
	bh=tFlH95MChwTnDp6rMME2y4i5ULh+qHvaBd1XlI957o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R958y/+n2iNsA3Q8hECF0dBS2RBuS5V2rRhrzCtzJ7uZ3fGXZydHlI+tJmXLjp8Xegbt8cI4CTrADlP69JVfknvt/xiQYg1miRrPPNF5T4JYTjGCbpDtc0W+ahfuVx9M61vGVHGjwvub/uQXt80Rr5ZBle3pCuBuzkjVVmldiV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qm1iIuDA; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qm1iIuDA"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfa4c51c2aso524911e0c.0
        for <imx@lists.linux.dev>; Wed, 29 Jul 2026 15:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785363271; x=1785968071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8T1b0patbsofaK9CnxW2rL9dJ5bYZkc3ipS6ER6koZk=;
        b=Qm1iIuDAHpQBYIu8A+Uc/RslsctUZGdhv+5kiDsFjeh8Mp29J2bBJM/PAxv2yOIlzD
         Dx8G+dgOwekuOKUdOt7GGnfEC+pw6iUWhY+VFbyEQSUJTjrlnMWG3J4VT41JEzXvEpV1
         JFkeFdOzLnzUsLsoAy8e7LnwBPFxzt+GeV9riTkYaUu7iIsm+IPM5G+t3uKvUEPWKZjx
         OkPJRYBlGR7EFXH9/enjvS/iNoq/dhyCOLinVAdGjeWx/b+x3R/Ul1GH1cYPU8/Af1g7
         zNrsmWaIlN5yFrWpwCeAVYE2XV5se82ia2lqCsPZeiNn9DouAy1EytvuPSoPpMWhbGzj
         Pp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785363271; x=1785968071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8T1b0patbsofaK9CnxW2rL9dJ5bYZkc3ipS6ER6koZk=;
        b=eCerU+ey8/oHeE6Um2JPUzYB/xsOPdLwKcBCwAOmhF6Q0wQpCJUVT0l0r0jXl4yFCL
         336Q8ItXc3v0cyPizJNcoDY5mdkSzQO2Bl9qpdpzgix1kmHp8021Co0tVrfuAco+W7EE
         LsCOnC9MN8wRlYoXoJoshJMUSyJxyT5UgV4lvLuf9lFAEkbX61bmcsv0/XYANaTIb5qq
         Tajo79fnD9wUkDLQktILOFVp6e9dN4nGTW7ssZl3wi6NtMGPONlWZBkjTRpljLPF/SZm
         5+1qnGoqL3iJHF3WCM2RvCKRMqRiXylh+RFIaIJdNyhP9kQkdu8Ei4VmvdeEX+MqvGk/
         /1uw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Um0jXljghWxygCuEZpSzD5gmGzu0VjYByhYR6G3xCU/OCPJXmkZvl+arjRCzLLb/VnI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3W1PTZvqjHEBnuWH5nrW0k6w/vEHm/bkiyQ63B0T5SVtsWqDT
	i/Eip5KjfN70sKAKcaYdcykeNqCXiQPQ2hcmpWW7E+06dLmlVhnn++ar
X-Gm-Gg: AR+sD11rHMGxULOsgv+aJWBlIriE68Ea5bxtJaV0iqYOPVLFmcYTuzbsmhE5jgm6Xs6
	Z3cLvR+Vxn0hw1EWo1UPW6T76MaEvLlQBqv8f5aBytJxGkBL9Nr0D+SmrdTCD3FrcMv4Qz+i2cj
	GcPYMEXsPdb6Anq2h/Yz6twXk1ZfQJjflAR+kMuJQHejzLMUhBBhW9AW6S3TuB043jvHkjhiKRL
	JsTpi1/IUyy4H2x3HaOHY9754lIwUQy6f+5XRnPq49+j4u78qSWsqrhSxN/JBrSKQ2TmOgSCJWh
	hpqf1bQLYGrdIjX3oOkp3L+XZDcmx9WqeKt4yYwrYF/fB9PBxFcKDqbOOP+5R9FkLn5aDkaf9D1
	DOzSqQSIF3X5rF6sImBq2znTx7iM5CoveUTfQAeV1JrpeNLsnQTsh5lBNhwIOWrHzWjpp9FlUVL
	6q9ehEPJZQqTzMD0M/J8ks9UAsoAp5V25VuyMjjIviWLhAiUztxUHhoZ9hjWA0oJ+wqDgeNPmh2
	sjM+jS+b6iSysUgXHRPfyVA1r9EtBnI3Cgoig==
X-Received: by 2002:a05:6122:8b04:b0:5c1:2150:9de7 with SMTP id 71dfb90a1353d-5c36624b938mr307e0c.12.1785363271392;
        Wed, 29 Jul 2026 15:14:31 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:a913:91a7:b883:6046])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c34eefcf80sm3269180e0c.1.2026.07.29.15.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 15:14:30 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	Frank.Li@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] irqchip: imx-irqsteer: Convert to devm_pm_runtime_enable()
Date: Wed, 29 Jul 2026 19:14:16 -0300
Message-ID: <20260729221416.499781-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove()
does not disable it.

Consequently, runtime PM remains enabled after unbinding the device,
and rebinding it triggers:

Unbalanced pm_runtime_enable!

Use devm_pm_runtime_enable() to automatically disable runtime PM when
the device is removed.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use devm_pm_runtime_enable() (Frank)

 drivers/irqchip/irq-imx-irqsteer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..ba1203d3edd4 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -263,7 +263,9 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, data);
 
 	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		goto out;
 
 	return 0;
 out:
-- 
2.43.0

