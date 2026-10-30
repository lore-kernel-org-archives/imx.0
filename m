Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377287;
	b=Vqo0PxPC2DTdDajJmGLVAaRjBlvE7UPWxhP+QnL5Kwv7gc/Hih7WhZ7Bo3HJVST1RiDj
	 QrsI676mkiCCkyLq3OxxgxKNlrKFHBSCdC4z+IulqNTgn3K/aMaEn/r/O9eZVlMkCEIYK
	 gyOeBdyTTFGV/vFyLKhPnG7Pkl2GERy9Kt/fJ+e0iTVpW/pqj0Gvud8y25OYIpMYHIjlD
	 lJSAmNSAlZISjK3YtwkK5DPl+998xIF68MUdCqjetjKqapuQN/iv4Bgs6EhDteKAkN9RI
	 o9jYpFqSwS+ew01LLaX98su2uXI9LfnlJOn+aO+KnfqQB4cDD17UP7nSo6Xaefi8DsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
	b=JUa75MnNFmFwKqt+RCpwtWRqdBG5sXY5sICnqrDAWgHfCh6gSOBgnFXZelfIcs0Ordcp
	 5VhX8cl9DE5/MB7tKPKmAlaPE8ibEmyBW696oc1D1GhPuBmsHkbEJgFptHFkD5h43j5Oq
	 E8N6WG5ZSbY2S8XCxUh5nh49qT62sWaGtzn3PIYYgd8RzRUfYfwC4UvEx5sw3eBQJlcz4
	 83/gG7/vxpi1/6lTYFZS0GINSyMQSlTiaHcwxNKZz8Fsigs+d6rYzL/QYmUX4lP1Vyb1q
	 C4SnNgBMQQQukEFuaTADs/zdagOq77D/RsyHrzQmHtZPyMODN9QTUHsFGhAjSVNECkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHC06s97;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD839606A31A
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 16:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD839606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHC06s97
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6df5e315bd1so725019eaf.2
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377286; x=1793982086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=PHC06s97JvW7uqvzelGz0DitBOtNuIgnF9P0kmb9F2yh84RLcPt/vtvj2yZnbhpfxo
         hEqOJoGTOZce0EpawrQtzL6dyiHjHys71CkPPKGHrgJLLGpb6VED94G7TLAh4xIHypnI
         RCdBqUvbPJ0iIk5jMcQnrHtmTor3G/opMwwfzesnxu0rS60hOa+4tl2O+lx20MHPvJZ2
         Q4Y1+WwdkAmwxSUSl21bj2/0N5lMqxVL/LfY/tvDMJ7D4UKboPI0g9kRdhOyVbMtSZKM
         A6V1mK+2DAQe/gDNy47ocQKY2iT9U07DMCrYx5rezTF2HFxSvdajGouwLdCmXA2xYSTk
         MDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377286; x=1793982086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW+txSD0sfyruz1SXJMLcdacKGqqaqe7nAfUTotQ3Nc=;
        b=RIyueiUH3uTxZtZZUytHORNE/W+rYhFsVEBskD9/KQ7U6EahwjwwIhAc+qq4ZEAceU
         4LXQAFc0/3JSvUhwdY3BUWoyU1NzH+0W8dzGH94sSbcXzfUBVhnPa/XAGGh5HW98obQD
         AlbPpnlQ4JqiblzqF5Ulh4hvAFJFcT8OpNcetmRcN5ieRtUY8f5Zx5pi6HA833CFrGX5
         ZawMBlsXKaXNjTqITJNQMiuA3u9KFNIQltvuiQFhAn24iQ+RpFuOv+blqPkw+DyVNCqn
         cScDVbbmCJxi9m4HxSr1auc6sB+E3+BVTcO010Qi5MgnvfT+gUnhuFoMyTJ8Ymi1JE8U
         i7Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxv2Xge/8WlgWQ0N3ChcODJCrrxCxlzB1Ee7Pe4a5GCVukakeytuPCLZhyhQYRgk8wqTCA=@lists.linux.dev
X-Gm-Message-State: AFq9FYJiDrHTYXlCidwV68VdVEYcwRN3JbdnfzMWcSp58dMPI7CA2I9k
	uPKWbvDSTv7lunmP1mijYtVO6I8MmgougLIBOBkpu06hMvYVgIfSv4GL
X-Gm-Gg: AYBFou1IxFisNFkU+LfxXB0yTtMYE4ggCZ/H4oyXRsRQP9SMWDeRFoFBz5pAQOWFZAw
	nYCOiFL+DU9hVVlkKPkYrpoWUgyc9oS4a37fH5Z9/lWVJpEMUN8EMJcHSUP1kLc2zpl+0VPpu0S
	sa9EUZeMAzVTXMCLghKJeFKrRunt0HusaUUAKHITCsl/38CQKNz4L6/x5uiWPrsDkiW1hXpkfna
	SMyoYLE3snfa7ipI9ot4XDcGDbp2OaECoSRaGDwP7BkzdIUa4UphZYKQU8E5sWSgt/slNrwf2Bw
	Vgsy/4M2HADO5IhspvQW+AFqN8equ2Q5j9i4LUHUfEKpfBb4yC3PG5AcmmTYXN/6VWV7wmRey99
	oC/GMLiKyRKGRsjbS4mia6SzFTf5PnasV+/23hfQvV8rRUZ6Rl47v0qADO/jwjDV86SQW+FT/AP
	a/WDrB9jSMS2nwyjbqHlXLyo2ZIFtZkNesupIeKqdOaUQ3s9Jq88SMveiuepPDsR7nYajOgdlW8
	p6HSCgavidGY/CfmCopdKhU6qU3TVuLdIeUWoKJRdxspNFeQ0uaBTcXTXt2qiriBX7nhGawtWXc
	j54oBrIika1CTHNqSrVyT8F2Sql/F7YeznLkABM5jvvPdAKosHoSQ14Ois8u4+L6Qm1s645FiJ9
	DpxWI3jA5G/s9M48L66LYZT/rJoy/ik1b5bqBKBap39agrZuirfkUjcdkgDT7oGlBJDczjnkJJV
	z9GcyjunJDmMHPBajsr4N7JhgJUhSbh06iEDh9
X-Received: by 2002:a05:6820:162a:b0:709:fa95:9929 with SMTP id 006d021491bc7-714f2552f3fmr1853395eaf.62.1793377285762;
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:25 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 6/6] mtd: rawnand: sh_flctl: use dmaengine_terminate_sync() on DMA timeout
Date: Fri, 30 Oct 2026 16:20:41 +0000
Message-Id: <20261030162041.2998170-7-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When DMA completion times out in flctl_dma_fifo0_transfer(), the driver
calls dmaengine_terminate_all() before unmapping the buffer. Since this
does not guarantee that the transfer has stopped, the DMA engine may
continue accessing memory after its mapping has been released.

Replace dmaengine_terminate_all() with dmaengine_terminate_sync() to
ensure that DMA has stopped before unmapping the buffer, which is safe
because the function already sleeps while waiting for completion.

Fixes: 83738d87e3a0 ("mtd: sh_flctl: Add DMA capabilty")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/sh_flctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sh_flctl.c b/drivers/mtd/nand/raw/sh_flctl.c
index 97f733e48..8bf9ae7ce 100644
--- a/drivers/mtd/nand/raw/sh_flctl.c
+++ b/drivers/mtd/nand/raw/sh_flctl.c
@@ -430,7 +430,7 @@ static int flctl_dma_fifo0_transfer(struct sh_flctl *flctl, unsigned long *buf,
 				msecs_to_jiffies(3000));
 
 	if (time_left == 0) {
-		dmaengine_terminate_all(chan);
+		dmaengine_terminate_sync(chan);
 		dev_err(&flctl->pdev->dev, "wait_for_completion_timeout\n");
 		ret = -ETIMEDOUT;
 	}
-- 
2.34.1

