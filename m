Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591249;
	b=oD+lTuihS5wq/tdSUIKhXpvyTKrBziCDvmSD64OGcOZ/yBTMn4VfBAFRAb2RweMndV2I
	 lXaEPNk5ZdX2jrbkml4J/V1UAUxiT7oC2R7U32vrNOOv4Qqe4TSH3++IJnImqiPPtxQpL
	 Ao76+tXpT1OaY1uEgWOky5fzIOeOq4UFfxuf71TbgxNVnc4rpdKVcUy3JAesblgFHJkOd
	 97vEoPGcfd732Kar3GbRcC+EFIJglXn/s+8bOXBiX7Qyfo4zXIqCFiV4VHtwAksHD8FDi
	 vgOpqHJ/FIRx+LZGaCdt14dmUz2ObKm0V2o2yfngXaM3pBtNhVTkMfsxByxpET21OLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=;
	b=3u8Um3xo1hFMDSbwmEPN9tUEE+ZF2uLnHZMBffGAZV+5pyJkOsemv6mTbGlSxMvlz5hf
	 mUPX6Ob8pCTXkscnfkNlFaRDhipMO+x7s12zoglhSUbCkdsuc4VFEUs8RvRXtiDimN9se
	 9iV5l6SLrks0iypVIqmoIOZ7lBs8wc2SY77pqRE8jdw/WAND8YyuXb86df9itSqMP+FM5
	 HIRVfLHDO4kEN9pCrcCALqGDdAfSSG4xhpRqLId7yAL3mZ6HOcaxolJtujdt8+GAFA6L9
	 R08YnQOgHl0x6sO2Yw8eHLKJ9L7uO5i/I8ytwmilKgufjbK9b5hVCQhC0QZP35lOMxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLZqHh4g;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE27606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 07:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE27606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLZqHh4g
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so5044802eec.0
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 23:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795591248; x=1796196048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=;
        b=PLZqHh4gjv8x2sBvM8ng2eItQO4JDt6svC/BXfSQWBzYrgpri3Hf/xJIIMzXtGu4ec
         I4voZdkMZQYlMqU3s/54y/Anhk1umP6MSahwZB4CZp3CLQ2TR2B6IZXcSdN556F/a2K1
         SyPpE3R5Fq7H8aWwGx17fVCUbSPPkD5doyT2jiFfyTO0a6lfH+kYlsLbdcAwPJ/WTjkb
         7uUheoPWc2hOMTGKz918MTs8RCqoFFWQ8pz5ZLf7sISjC8YIVjJXZeea3mI4s9fTEeo3
         xd6F+rk0GfjR+3VGmuu03BcPoXhY658ogF80Kz4OmG8o+eOg/RGrRD51dA/mIQ1UI4SZ
         JNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591248; x=1796196048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSZOWxfqWDFwRdZgOArsmxSLz/YxCgw0M+/5x+1CQb0=;
        b=fYmebkdh9mM0VVytIvjfw3HDn/6pr6H55NIqqbYH6nI9bbCV8Bus7SjmN7MetBLVA4
         1flDxVj/GVgnQKmnE0MRTjb3UHXyRU54N9GrVngeBqCKswtJRsHZynDobOgQq6DBeV3o
         g8NYChd7MBbRTGGmyfVLrcgHBd4ohgVE7c5RBw/yRFJT8GT9Az0SmqRLnGCim8hb+y3c
         TwA2eOMSUYLPfaAiFjpROuaooJfweIVFLlK+EJkVTZUl1Hh1SOzvTS5a4NCPwR/e+TCO
         igF3kNb8YORpOMl7jtNreIdtvHxGpBix4vZTHhnq+nUCcMa8fnENxiFY2cmnxENCtJLJ
         u9Nw==
X-Forwarded-Encrypted: i=1; AL+hErEg/CFNwyXXZ3sO1+3vZNRbX/PtDNI0VdGCHPQO9xUPj/3GDsvK4mI7nGdVzdKTg+alj88=@lists.linux.dev
X-Gm-Message-State: APuU4Z+/W05o9udNePu00ShBsAJjHmNtAl5Lsb12Z5C1iREpTifvSn0P
	WGKy9pGEdtI90l17hBwevCkEpCM2pWKQPhDNhrhpWod4NPJLS4gL4nCC
X-Gm-Gg: AZFdTZds19u3NtFMwcBfCuIfFwvjR1ZeAf0ZQpvTxdcWB3YsV2fz2GcQmdnDAnfT7Ob
	c/GuBrCsxXdXWCQE33+rfqiMGHAhwuB/2UtbzCRqfKHKYFKysW55LgbRS6mOxibbaETzHhWNLAD
	/IFUPhwxHm2KVbfLgDN+qARbSPqJ+PWWc11nwSR0NPsYczvcHzbl+JDFZo4nvRElfojiQ50mgj8
	D5RPya+g05+mTxrZw/52EV+hROsQWMYpqVnNEa/VlmQjnXrBBuNeq4J5SRddBkmd2eWEWKzbOcE
	SinQr+sW1X+NlEKGGg0EKAWTAEmY1ZTSbrX7X4/dSBMqbHWwDiodKm50CxoacYww7G4AB9gxWkZ
	HSieJdwV/oH/YqAbIbt+6fjgZbAmtMwG8vlL68tzFKesqaWN7Kteobq1V3xpGFOAB5Aoa+T6fOK
	G+LeOifFop50mp9+jTwRTmJupbaP/JWRnYRn7ZIu50+taBqwvpsaHoXzd0GnY8lv51O1/N/3M+T
	6pq3VfOcNyAQBm9SZUIzAzAuz7qgMsI3lK0izXujso+fjjhCYelKPlIWKuKbotZPtnzSgzHnlM5
	bywqlNhfQGhoaB0HRqcLYGVOkqnHfaxwteLQ/L5Bop/yy73ewNUuAoh6ubopMCWx
X-Received: by 2002:a05:693c:8951:10b0:386:b4a1:d92a with SMTP id 5a478bee46e88-386b4a1daa3mr7689219eec.1.1795591247853;
        Tue, 24 Nov 2026 23:20:47 -0800 (PST)
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm42767121eec.25.2026.11.24.23.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:20:47 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
X-Google-Original-From: Prasanth R <prasanth.r@lineo.co.jp>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	CL Wang <cl634@andestech.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	Prasanth R <ragaprasanth@gmail.com>,
	Prasanth R <prasanth.r@lineo.co.jp>
Subject: [PATCH 03/12] rtc: mxc_v2: fix unbalanced clock disable on remove
Date: Wed, 25 Nov 2026 16:20:17 +0900
Message-Id: <20261125072026.2997493-4-prasanth.r@lineo.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
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

From: Prasanth R <ragaprasanth@gmail.com>

Probe leaves the clock prepared but disabled, and the RTC callbacks
enable it only around register accesses. mxc_rtc_remove() still calls
clk_disable_unprepare(), so the clock is disabled once more than it was
enabled and the clock core warns "already disabled".

Only unprepare the clock in remove, as the probe error paths after
clk_disable() already do.

Compile-tested only.

I used an AI assistant (Claude) to find this and write the change.

Fixes: 83c880f79e88 ("rtc: add mxc driver for i.MX53 SRTC")
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index 965170bb8..35a18b75c 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -365,7 +365,7 @@ static void mxc_rtc_remove(struct platform_device *pdev)
 {
 	struct mxc_rtc_data *pdata = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(pdata->clk);
+	clk_unprepare(pdata->clk);
 }
 
 static const struct of_device_id mxc_ids[] = {
-- 
2.43.0

