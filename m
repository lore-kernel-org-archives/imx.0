Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D28650E58C
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746878; cv=none; b=BPCrV+Q9tRSb3K5+6Ipwo4Vv6oUFWBGT3NT/6uqJsl1oPn/p0egyfPvAavxtZcGyg4ERwh6TGZlxwdE1Xi8GItLA4bOmq6aLjf5UroztFDVZbvLp+hfvy5/HWtAnoyVfVxADijVVe0rBVweeCzi3jg+QrClbcJdXnJerEWRHtRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746878; c=relaxed/simple;
	bh=vnibq2jyCCC3IOg4Uxm2dHT0eG7ETbRhFgTe5l/Ddz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MhsSlQdkmnIqGWCOn7G8f3JrrJBTVB1MsAnYO8PMHBFjOAHbcIBdyAHDsRWN9YQ8jETC8uLpIb9BNG21uzDFTdF94oXIUBDJ+ganU4O0kVJo2KwUK/S743kP1wfU+KQsD8KFoxvcRxpm3VqAvF/30CDBEsW5gQiT/LUEpI0cPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNY2knEj; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNY2knEj"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-868cfc5c244so573285b3a.3
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789746877; x=1790351677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkZT5+6MT1neXTSrRW8cuNq+wdvBlgmd5gXT5DoC4rY=;
        b=GNY2knEjNWLEnBy0HccxITNjpdyGpmutV+amkEt6fksrSarmSaLeA348ns89NBVqP6
         Kut/29Vc614MD+7mXOeoTg7DCqDCpTthDvKC+RKP4F7pIFHkI2kYYoJvs6plTesbTgVo
         f518R09wXviEdclcGUPfW64MBORFo/9FAhYoTYKg2YXAO1axrxBL5poF36JvGTC5vp6h
         r0TOQLgPEA5Odi1+deub/NfRuibAajRHywI/ljJksunayRRbEgcxCX0wA1jQ55tvLk8g
         1oH3MGNWkoANDeCkSywyOPCMozuRFaey9r2u/5VsX2pMSVmGeHmhhCJ7hisfdlBhczSw
         ET5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789746877; x=1790351677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkZT5+6MT1neXTSrRW8cuNq+wdvBlgmd5gXT5DoC4rY=;
        b=dE2bqgLaDzz8JXkUhCAU7DoiYa5a5RjdxKLu+ZnIILxvYi/VdW/xMrbMxLxVwmq8/K
         dkVzvvCEEX9WsgPKjifCG7XZe/CUiCCTjujTYYTR5vdkJPW8R6HmPAvsC6Liq9PahK7K
         Lzy9QfbpAgKcFRzEEy0YGkxDP2laEagtO5dTXruqG/2g1XJAlO+yWdTSSqiR4v5kkrk3
         tShb3F3o3ZHImi4rLvv4qCYjSjZBfuiLLBlknwag/uXtDMQUMtAkpFp39sceWdgOgepL
         FjAsAsfEVhKf5O5/yXYv5M45A7cg8fWOiKH8qg3Zi/Uvd4hukQDaMaEdtPtObrsG+ynU
         QH0g==
X-Forwarded-Encrypted: i=1; AKwUvByQrvzqbsPEzHFL6YHHYBkPHCxLoR3EZw1O1Jxfs3LJoGKbDcsEVSwE4e9ErVQ4ILmnIjY=@lists.linux.dev
X-Gm-Message-State: AFuF++mj/8gbqfoONgNL+jk2ho+gZEWyiB2GpdjB4R431sSnaGGDWf+3
	n2qJXafQ4qHBjUuJuPQB5gcezq971++zH/y+7Ltt9dlQPRWJrtICC2EK
X-Gm-Gg: AYBFou397MWCPOjcax6a9gJXI9kwo+DejjKb8ddDVPixzZotdYk1C+BtGenATecEOVK
	sukthQYeLh46lvZrS+2/yw7Db46h2O60/nPoLFw0NiExageXNVnvxiYVivYTPz3PjOFdU3HYH2L
	Nn98OHYAYJre4VQQ5qVU3YycbLaHiyTfOVAHdGmSOasts/Ymz9iuy/jyPqR33PsPHoCH7agirvz
	a2M9nxKJkdk0CX+CS3ezMOL5/BiT+7VU0OcnUQQvTGWxCk8cT1Xo0qL1FmExbKK07iZ06FFGMHd
	y+xpB+XjEMgKt8vXYxSXXgvsZbOVetSc+TjqVgf+saBVakB5qyMA4W54tGHYFNZAWFXKPeQ3Tye
	wumZDmf4HxDt4glKPgzR1OMzlbjIpUBpZoM2OX/CxTx63NT95uKJZTlLx4Evv7YD4lFXHUUVX6B
	AvppV4QnDh7X7uuRPsO3N8D8ablUCVn/HucNoIFM8jg8e8l4m+mlUJ7nue3WZh+y+6y+rbpPUfz
	Q7ItpNupHSSXC4o
X-Received: by 2002:a05:6a00:90a9:b0:874:705d:f64a with SMTP id d2e1a72fcca58-874decf71f5mr5476461b3a.44.1789746876763;
        Fri, 18 Sep 2026 08:54:36 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd8dfa1csm1091058b3a.46.2026.09.18.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:54:36 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-rtc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc_v2: fix wake IRQ leak on probe failure and remove()
Date: Fri, 18 Sep 2026 22:54:29 +0700
Message-Id: <20260918155429.2549137-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_pm_set_wake_irq() in probe has no matching dev_pm_clear_wake_irq()
anywhere -- not on later probe-failure paths, not in remove(). Switch
to devm_pm_set_wake_irq(), which registers the clear automatically on
every exit path.

Fixes: fbc5ee9a6955 ("rtc: mxc_v2: use dev_pm_set_wake_irq() to simplify code")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914134826.EC26D1F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index a07acbbcfaeb..7080aaf9ffa0 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -302,7 +302,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 		return pdata->irq;
 
 	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+	ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.25.1

