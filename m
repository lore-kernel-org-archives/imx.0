Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D674071DE
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392316; cv=none; b=H0aQzQaSPUSVZQs0Xz6jyILJ0mA5Mhn9Gf5VEpBcujqSOQCvQPLpY+r9iavy5Q8efNXFLjf2SHnOe57KmEidH2OYhEndCKlg5MGRi8D8JvyrT+uaYcusFZUsXkLZ4TMKySPyRcPRbh0QlxowP+P4vKwr0WujO+rVlWb8dIbkI0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392316; c=relaxed/simple;
	bh=ieGOto/Lmqnuw6XZHi4NqzamoYlK1PHnKIFnRsx1XIA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NFaowHvlwIno8JbL8s+lNPuUr+zxPYrnXrWsxPeXwOqtI/ebIBNpOt0TAiSXJcosm4te0ped9WEnv66bDhRmB3/rPN0E93dYJb3evN6L2h2fSYHsMTqTEyJbBXu4xUcAHMx41zzsbGjVljOEnZz1hGEKaVJsxM1Qw1yQdj4r+hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVnp3VJH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVnp3VJH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso3262206a91.3
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392314; x=1789997114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6EI5rX+MYKMYU0UnF1Il4E9mul776cfp5306LOEsvs=;
        b=PVnp3VJHGQ5knHjWhahz2Sd+Bx9OXhrNUcXPPSwNK/NBGHKV8mp5cvRMiqYnksxLw+
         6T4SZY652D1Abz5vC8s0EVYAnHZMyAOuiiq5j6R6/fKqHvkUYpAtycsQkkAw6PrqTb9A
         k94YRF/3ODeoKECBvgzOhsQOk4+/C3wIh//TBYumNxuLBtGgN1gfh7LjADCEqBNfYsu6
         d5sAxtG2x8nzSWxdnMtIUcekCpGtG6LL57HQw6SkoRRk17dB/asocnhuOvN1Ivs4csTg
         lyDQGPc9VK0Kl9pC+f6a6no8ebt+fEQZJqDcLjoJsq73LwL0GoY0gdsNlzHanFTegtxy
         Z42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392314; x=1789997114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6EI5rX+MYKMYU0UnF1Il4E9mul776cfp5306LOEsvs=;
        b=T+f0SpMUcAuHoILf8P8aG0xwXwHB50eJlgRGcdnoZAFrgL1N8ptNLGtQIVeHRxIIrQ
         /2Pz8KxMTEVTtL3bjsYTl3NSiQaAGp8eX4kC9ycm+PDwi0fCHlzPhP49QgDa0mU4TcLQ
         P0MiwhJmkA5Wk+z6u1s2gcIZmLLwKGCOdd2W7dogGpoMEW9Aerc46uMqp0yyAHu6GCBK
         I6an2uGldEdtdMhgGNbZGPFq8V2W5eodVTkIqrNhojpSKOZLyxoTEN5dDFAAt36r3vep
         xU+k9Hmm4bxiDBOX5OtHmbamBXf0zzHWRMUZhI3u0vSCPMBWTchw+8lEFlpaufKf68HO
         DNXg==
X-Forwarded-Encrypted: i=1; AKwUvBxF1CSSJIiBujfTEXRzu4UT2Jp9kYVV60X+5rfNvNSKdE1C65ws2RCSscPKTWfuVAp+SVg=@lists.linux.dev
X-Gm-Message-State: AFuF++nXf3e+Ta2VdWf+0MmcjRt1h7EPKbRWsEGFJDyi1Kc6Nn7LcJMw
	9W3kZzowiirsIiGl3Ul6BpwIRZfPp1Ur7rf0WdNOVJPDrafsfZtl2Fsv
X-Gm-Gg: AYBFou2ZwMWrU4VM5fta/T+5IM+UfHzjboEj5eGphu1UQNh73eiuFlIpPSEkTemkC7X
	ZZPWcBcFZ9aF9docoVtZhdAfdlyh+EfqpA81nXlTbAnu8eznrJF3WIUd0p621MHq21enjrC8Lmz
	zo+wIDVDyvrgiUSnbVxOa2/XmMvP0X8iY3bJVTk3LH7swfqEZEaBx5mH85gbsw5vxUVfd/F8lIU
	Aump+gwwjLqItDfApug62JXC0LOxw7cDM5pSYfZjFWZVORxWo5uxxXwO0SLUW4FhZo5YSRJE5Ma
	s/OWbCCZsR90aJOjl/7639yVgtzQx8KVrImtH0Wd0kRwrvhXPimBfWTfZyG0LAiOukWsrWD0Hn6
	9vouaDLmt0bnpyCphu3k0b74OOZC77ETCzC4uvaUSxq9LARqLjx98fBRoUjce2b0iVCIjbsGIed
	6lB/9yN5jWzgZ6AhcN+HwfX9jZ5EAfmDZ7S1oJngZH9w6JVbmNapnXv33s3i5h82lZXPJ3n4Ax4
	Ijjm+qI5JZsUGPw
X-Received: by 2002:a17:90b:3b42:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39debfa6792mr5368605a91.9.1789392312963;
        Mon, 14 Sep 2026 06:25:12 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm20872894a91.11.2026.09.14.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:25:12 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-rtc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc_v2: fix clk enable-count underflow warning in remove()
Date: Mon, 14 Sep 2026 20:25:05 +0700
Message-Id: <20260914132505.2356970-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After probe, pdata->clk is left prepared but disabled -- every RTC
callback enables/disables it transiently around register access.
mxc_rtc_remove() calls clk_disable_unprepare(), which disables it
again and hits clk_core_disable()'s "already disabled" WARN().

Use plain clk_unprepare() instead, matching the probe-failure paths
which already do this correctly.

Fixes: 83c880f79e88 ("rtc: add mxc driver for i.MX53 SRTC")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index a07acbbcfaeb..93dcf18abde2 100644
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
2.25.1

