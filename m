Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41772502D73
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 15:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747012; cv=none; b=Si9PHNnTDSKDZXMs21zyEcPI/IfkuRY+SwnQ8uyuQhqFvrC2pb2srKnoTQ9vnBCUUXAy67jyXY/ngNRMN22un7w6DHyEIitBN7lGIkXFytpRXnFLp6J4YlZuWqJSQsaUnFi3OEUMrcMzbYzuVDeWEPWvBxesk/CBCp+1KG6ml5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747012; c=relaxed/simple;
	bh=+fInZteJbxGusjrw1W0RE5Ukceo4TOjF0P5/Ej7DSUw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hfSAE/AmDh0GhfGGh6AZwPQ6ReEr9XPdF8XgddN98hCKidLrRVjfpi+n3YDJz2LjQP7ZWFJdM84b60ex1drgRD6JkLF1Ew0B2lhqTexd38MEg8o6sJpiolJl51w6DMdKtbO3tsa6MBfGqytylcbtt2wz4Wug6Kn+jopnL9OpW7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPWa+j+y; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPWa+j+y"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f01363so8076915ad.2
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789747010; x=1790351810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KcbJsmqKUVlgmMgW8drjDCDfJeq+Ke5tmTlLzlkgAFE=;
        b=UPWa+j+ybpq7rXeudbv6dTJFz+OsjnHOSsdF0/9Q05BfgIKitaGZJLfNMCRUlyNdna
         JAsNcLapPZJeiHj5rQpSDiKXNiK43BAl0CuwzCvZUHjY41Wjj90DZzfURDaa47rPHLnc
         824W8OtKlqe5MJ6h0X3zNL9QzLa8RoSqqwD7TBmlBVTIaxXKI9Wrrk1xZXQlODDrwuei
         dYNvDdguv4ALuvEv8M4E7oqrW2omtQuRJ5CbfK7eoWz1/cP+NiRqo3FMplix1fVlLgvT
         gmiSXTK3aKSJzDraQfSFN91k8gAGRN6F4D57r9+WC8yD7dogu26YU7DI1d+o8tuaTjPb
         b/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747010; x=1790351810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcbJsmqKUVlgmMgW8drjDCDfJeq+Ke5tmTlLzlkgAFE=;
        b=Z4WdqGoKwSqCsiA3eM+vYcIQ7SAIPEAgkSeCanw2S/xbk74Dxgg9cvy1zRTlr4iq6U
         QD9tew+ABWZa2UoZ1waEYcU7X2rdhrPUAy4F6mTr2QdhBfdlAVOLuVY3/B9GDQp/wZ87
         Z9O7L3aR3yD7KBVm38asDWO03DHSTOC/BEYjrr1HsTDEJNiI+m9F0v13NHteQub2c7KP
         rZfUj5bSpvP/nkxpzPeZ2+jeQHwZC252HrMMibIibY1ElvjLWKDFjtqIe5v/fzC5XEOL
         yj1fBAsdGlSy1NCu2nNUyzJwpNFOyLHxC2LEwb7fLlsa378wFkCNL8uhcOi+775D/69v
         1Aiw==
X-Forwarded-Encrypted: i=1; AKwUvBxBTlXPHKF4laFdbF7edPSeqkh/BcygpNI+klfxVhUlj00i8cs8boktO0TSucwt+5/lIBY=@lists.linux.dev
X-Gm-Message-State: AFuF++l2/+uMZVPYvdvwC5iVZjzIOYc0UKwwsElTYCJB8nyceRVOMACW
	UBkdUzjDl3newmtBMFOkCPf5unMst6lkpW8uLhW0GEpxFyKXAWdx0Zng
X-Gm-Gg: AYBFou326k0UP6iJodOSuZFNGrHuYXQ+lMAG1D+Z+P2fcm9MOe1P22bWqr4veWBXOcK
	aCfPU1xzw6IG2W6fXAUOHKObZW9xfXAH3GKPCkofUK7HcX28RIMHh9lFZsvy38rTpRFrfaoKLqh
	Iw9iE5pYV9PaYwTssgwZlQ1NG4lbKkQV4RXi3lxNq86JqGS0w+IssAj8b5yQbSRDLvrT8GcUSaR
	+ATzOqbzYbbdYOooxFNwQVdATWM7G2m4CXSqtoVZ6r5q5G/97F+H0hOIhof0M2WX9QPXofdf/Ue
	i0FbaEYEfE+PRCz6C6k5Oam50YIVQU4jJJnk/wegMvFM6uwiAByp+uBZN4XrmpD5xkrnHAwKVCA
	sWpq1qTLzcC+9VeQ+kL6ls9hcTcr9yfohFJ22EbHbI2uxOn7AzaqbbcBROtc/ql4qSIquCeFTrX
	A16tFparPbtu4IhKQyEze+FLHkmPzsTbjHLIX0cqEi6hyAZW9sBCXBRVVXjLJ2wHVDsPEDjD9bP
	h5NhBVopCOrWg7j/Q==
X-Received: by 2002:a17:903:1844:b0:2dd:c100:942f with SMTP id d9443c01a7336-2ddc1009bf7mr1190205ad.45.1789747010314;
        Fri, 18 Sep 2026 08:56:50 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525be8sm10938445ad.24.2026.09.18.08.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:56:49 -0700 (PDT)
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
Subject: [PATCH] rtc: mxc_v2: fix clock-unprepare race with the still-live alarm IRQ
Date: Fri, 18 Sep 2026 22:56:42 +0700
Message-Id: <20260918155642.2557978-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove() unprepares the clock, but the alarm IRQ is devm-managed and
only actually freed after remove() returns -- so it's still live while
the clock is unprepared. If it fires in that window,
mxc_rtc_interrupt() calls clk_enable() on an unprepared clock.

Free the IRQ explicitly in remove(), before touching the clock, so it
can't fire during or after the unprepare.

Fixes: 55d5a86618d3 ("rtc: mxc_v2: Add missing clk_disable_unprepare()")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914134826.EC26D1F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-mxc_v2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index a07acbbcfaeb..3c174f6004c5 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -365,6 +365,7 @@ static void mxc_rtc_remove(struct platform_device *pdev)
 {
 	struct mxc_rtc_data *pdata = platform_get_drvdata(pdev);
 
+	devm_free_irq(&pdev->dev, pdata->irq, &pdev->dev);
 	clk_disable_unprepare(pdata->clk);
 }
 
-- 
2.25.1

