Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B789030DEDD
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768333676; cv=none; b=UoCItkmxQcAykJvoSkJv7E4GD/5ic+xisSzRHjtXzYEdl1AscmBkxKiwgj+S2BJDk7sGznN+xUBWe2TdeRVZmWxLJ8Ou1AjIbN9UdFVNkWIxivlf2WliPtXEZt9ZZkudZo9AG/DSsIiYp+KAzXFwic7EF3uzgmww4NDI1bnO+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768333676; c=relaxed/simple;
	bh=m7H4fYTAN2wd1dmuh2ZoMuMP5dHupazPoMOEB3geRO8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=YA4PxjNs1e3S0/rvxMB9Bt/t9YScP0+BWELG04lNUe7MTM0KLrExUYOFcKLtkMFOeCgkfb1KiEm85118gVy9aX4W1V2Eh7cCpU25Dc8fJTrItn4ErW1U4p3iNk8O95YzPlakCbNSfa0BhekVxQHuwyGnEusbVNlg0pjD4WypFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGPw4+aw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGPw4+aw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768333673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h/J0VdyKSP8djFklxCotVlWBB1IldyLH81OZ7k+LqYY=;
	b=HGPw4+awczPyku1zFqCBCoXZKkCHYphAGI9owrabzWNXagtzNOoXO2WyZbGsfSg487pSkS
	zVJvqwTJVuqckngpaOoEJDrwGjW6GhtQGua5MS7i/plmi5JDcUZVvRAPxgEB88jVcXzetS
	8NkoWCN0rnQssxHuYdPRYk0GKVBgoY8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-34SYR_guPlOMz5Gb5Uxjjw-1; Tue, 13 Jan 2026 14:47:52 -0500
X-MC-Unique: 34SYR_guPlOMz5Gb5Uxjjw-1
X-Mimecast-MFC-AGG-ID: 34SYR_guPlOMz5Gb5Uxjjw_1768333672
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f89b415so31045585a.0
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 11:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768333672; x=1768938472;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/J0VdyKSP8djFklxCotVlWBB1IldyLH81OZ7k+LqYY=;
        b=Wi/dDvY4jmYajRmVt2K1e+mqzwp8BK9+EI0p5YUDslrVH8ztG+BZ2sYfTOaWhC2dP9
         /Jz7nmX6ou9Mk8NWi5HNrnpiiSIr4zHNbMgez4C2+Chsjtg7zuimK4pTIKNnYWKjb/Mp
         NpfDfgXoWH8SRh4+9XLSAN2vIXZxYExuxMQQWQNDLpYToyXUJH39Mmx0m8P+HWLlngz8
         PfaGX3FD++nWpSzBiJBNo+HWnbs0RE9AHJOlRJi7Q4BIR691MFlV5Qdckq4vSHA8SFMP
         sHsUXKGSBL8gTjHy18L3jEUBj/OA0/yBd5LAiaHsfxO1RNFuR62SgjzUiphtRJ+nCVUd
         T5ZA==
X-Gm-Message-State: AOJu0Yw0gY1S1apVHGYJeK8zqI5OTHXv9ywmZzhIazdTbhvVV81Dw7qA
	yjhjTAt08J9GYb8gGKSg5gVDPQd1wqOjGKVFs82qoxwVLY9smONhJ8BUTHy350MAX428G2INRdM
	mvJc+/JZIzD+vE6mZJCDzHKnRHlsSSgvo+vcDyKWWRPkda7s3JvjPPSAhb8sCbttlYb94UNpOzU
	yxr28UIdI81r6kbpecfSSBgXqBj1Ea3w6u6t+a
X-Gm-Gg: AY/fxX4YrKFmKgyTgnuAaRfQfUNpAJDjB3K2FzsNbLiUR4Yq/W6GpbxNvxt8YICa5R6
	YT5qfACQIO/CWMQEzAYXNSUjeVBxz2kBW4+4ezYYGP46uzUfM/3uKTEnIzuS+szxmmjf7/ReE5l
	PhDHTGnTEzBxMSRuX5G3vOtBdJpUc3HhFZ+M/ABFtGiWMKWoD7csuSpiVDgJ8WtPBwyaTUVNvgR
	6jy2kFpv7CAcJP0Y1mflnLhzaWYmmptC9Izm5zVouwqaLQ2bCyzgb9SZI3hP4us9z6hwCqkEZE5
	L4gZ+jw9IMHkcUM9dqhg8d8IwCOVbbWk8cTPfi61EUdulld7TwYs8KHot1USoWi6sdCZtcnjUL/
	Xs2mGP+VseU56xA9qKMoTLjt8aeOrECOKcczfD9Bx7g==
X-Received: by 2002:a05:620a:7088:b0:8c3:7016:1d8c with SMTP id af79cd13be357-8c52fbdde52mr54925485a.88.1768333671735;
        Tue, 13 Jan 2026 11:47:51 -0800 (PST)
X-Received: by 2002:a05:620a:7088:b0:8c3:7016:1d8c with SMTP id af79cd13be357-8c52fbdde52mr54921585a.88.1768333671231;
        Tue, 13 Jan 2026 11:47:51 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4400:eb20:99f3:ffd5:11da:6745])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e4262sm159356436d6.20.2026.01.13.11.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 11:47:50 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Date: Tue, 13 Jan 2026 11:46:50 -0800
Subject: [PATCH] dmaengine: fsl-edma: don't explicitly disable clocks in
 .remove()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260113-fsl-edma-clock-removal-v1-1-2025b49e7bcc@redhat.com>
X-B4-Tracking: v=1; b=H4sIACmhZmkC/x3MQQqEMBAF0atIr20wQUW8irgI7Y82RiMJyIB49
 wku36LqoYykyDRWDyXcmjWeBaauSDZ3rmBdisk2tm+MsexzYCyHYwlRdk444u0Ct+iGwUK8E1C
 JrwSvv288ze/7B1XCBg1oAAAA
X-Change-ID: 20260112-fsl-edma-clock-removal-4e5882ecface
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Alison Wang <b18965@freescale.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jingchang Lu <b35083@freescale.com>
Cc: imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768333669; l=2024;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=m7H4fYTAN2wd1dmuh2ZoMuMP5dHupazPoMOEB3geRO8=;
 b=RTdr4dUq+xENYTPbNTXSYKGcwPQ5UmP3ZVIZbo6p8PArbQkhSnZe+H6uVpra2B+HKhbYHt2dy
 I+vvV99uQZJDUMBR0Gcy9NobxdDF8Dy+ng6btr6YNj4TQMSGLLvIHhc
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 08TL6jHZ8eo5nm0eebOqLES28LbiqUw-vUTsLWs79Bw_1768333672
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The clocks in fsl_edma_engine::muxclk are allocated and enabled with
devm_clk_get_enabled(), which automatically cleans these resources up,
but these clocks are also manually disabled in fsl_edma_remove(). This
causes warnings on driver removal for each clock:

        edma_module already disabled
        WARNING: CPU: 0 PID: 418 at drivers/clk/clk.c:1200 clk_core_disable+0x198/0x1c8
        [...]
        Call trace:
         clk_core_disable+0x198/0x1c8 (P)
         clk_disable+0x34/0x58
         fsl_edma_remove+0x74/0xe8 [fsl_edma]
         [...]
        ---[ end trace 0000000000000000 ]---
        edma_module already unprepared
        WARNING: CPU: 0 PID: 418 at drivers/clk/clk.c:1059 clk_core_unprepare+0x1f8/0x220
        [...]
        Call trace:
         clk_core_unprepare+0x1f8/0x220 (P)
         clk_unprepare+0x34/0x58
         fsl_edma_remove+0x7c/0xe8 [fsl_edma]
         [...]
        ---[ end trace 0000000000000000 ]---

Fix these warnings by removing the unnecessary fsl_disable_clocks() call
in fsl_edma_remove().

Fixes: a9903de3aa16 ("dmaengine: fsl-edma: refactor using devm_clk_get_enabled")
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/dma/fsl-edma-main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 97583c7d51a2e8e7a50c7eb4f5ff0582ac95798d..093185768ad8ef09270ae02c99d0ee2accc183bd 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -915,7 +915,6 @@ static void fsl_edma_remove(struct platform_device *pdev)
 	of_dma_controller_free(np);
 	dma_async_device_unregister(&fsl_edma->dma_dev);
 	fsl_edma_cleanup_vchan(&fsl_edma->dma_dev);
-	fsl_disable_clocks(fsl_edma, fsl_edma->drvdata->dmamuxs);
 }
 
 static int fsl_edma_suspend_late(struct device *dev)

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260112-fsl-edma-clock-removal-4e5882ecface

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>

