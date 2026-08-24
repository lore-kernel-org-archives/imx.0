Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B09403E8E
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566133; cv=none; b=eHlE5vZHK/J5mukSVDCy/CZzhKwzGh5Utqzfp5iU1Oxrk1JOEiTeBOyfozjOlAbn+012ysFqtp5nDLOeEKbTzTPTitdZ8SKwWYoAYog3ILKENz3OsK4a61JGkmUEgy9uF/nTNhr9q6j8D8fF1L1sSI0wuzB4vGjt/auQDGXY1EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566133; c=relaxed/simple;
	bh=/JYatdn31meLcQd/D3tIjVAyB0LfgwUcuSDHoSPSPWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGpi0JWoMiDGft0wKMD0Mz4sSkBzw4E7ynUNZtGgU55yCRRxUI34Hd7E+3Y47roBCS3LgvW/qNI1DzRsw3yHDD0s/PX8Nqj0ZBWm8VP2uJIdH9r4Idn8E1NtM9sQhmYBI6Cg9IFKzXiIi9H4JO1DTCaezOFirUJQ137bEKyHreA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=illdzPCR; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="illdzPCR"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2397796b3a.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 03:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787566130; x=1788170930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=umgcoSfn5DzL6NaHAeud4eWB5u+3aTh8Dut0celLp8o=;
        b=illdzPCR6izHOZAKiHQlmp5fnoLZCiusbcFvfO9xA85D/w8YhWE9cNgol5fh5SgfQ7
         nYCZZ7+XlK1xvmcq9qpt9qHH0J6UinqxgH/EMMq4TYDLN6j7f4yJuJyksUc98TDuO3hY
         cKjl/6oFMxhZzp85nADOQVp+IN74bNHuYKj+mVBOBQC/pDdmisCrfufAGrWvy0pAzmV2
         yyuGLcvqBjTEuz4wtl9djDKPGPFIHUlsfRiSG19bU8Y69jG8Utl24dZdwb3kZyURVYMy
         upyXuPxQXJ2JuFvRmcZhgwU+w1rT7yJCjkEbmhJyMw+jaFm2+c84P/MH2d9nyY0KO2nb
         FheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787566130; x=1788170930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umgcoSfn5DzL6NaHAeud4eWB5u+3aTh8Dut0celLp8o=;
        b=sOS3WhudxUIygrncejkpxh3B0MXTWwmVQSWwb+pLzEA3AklAq6n6De7ggalJapXjpx
         VVOb3OElwjbzznKbkjJWhqbzOi+549PNxVjo71IfODLZ3j20/VBJruQLQT169Ess3UtJ
         Rk54fNoHwlGhcw8ZixiKqf1qqcSaOB1pi9xsgrCJGBeQgWBMKMpSYyBpd7EFuXXqxEJ3
         NCkM41jvlIih1mFHSum3jSS3aT9kgBtoMoYsooQlFuknf+iNDMiDoiJP0yaaH9jokPCZ
         zIVmElxCNpuGXuMlwLGZjn1JRcwgpDQmnkioZoAb3cZ3KKJ8YtKBStkYDcei28uOFG7w
         m1Sw==
X-Forwarded-Encrypted: i=1; AHgh+RrSAEMx4dsXT56Vp+uFhAZGoDBsflDbo18a/qeqSwMPu18tEh7iPBBRS9n0hRq+VaQLLa8=@lists.linux.dev
X-Gm-Message-State: AFuF++mkqqaYO3GA9xQJJcrXWs/ysz0+g2SmAs65oLWxPDhpId+4oXFd
	+jQwuBiMdtryHInvdG37R8zGb/b5dUZmK3TOavfXlQwQ7mAZDivQjD+K
X-Gm-Gg: AR+sD122aRVcTSWgdsEMSWzHk+hCBK4mMTHGtkxp+pQL5pxieRyY2YuXOk0vYTs7yV+
	FvnqqZ6Sv3DsdUP2qF6dKJFZ6LGLSTq10kskkoKpRcC2MeLrIs8mwcvcDZNgsNzqEv8hAdltX5c
	Ju0KkhOu3ojOfYQjHGDa6q8lgLwhU+NHyPQx3pZUQ3xYUzxBsY5SOBoAQ/pWtBao1UUp1zprbYR
	ME425vx9DHHTp4sI3UhtTxVV//VYUamdbgl4GgW8vy4nlIEzXRaAtwxiRYPy9P1GZCuv6Bw+w38
	Rstm5mHnpMdOnEksfmAQ+iQs8UKriG5kz5R2GT2iZdU8r9dT94yyGozmbTl+A+PQ4pAU8GAkCie
	F7yY5ajEfZcBExIk026urbZaUor+yrL0wYqM6/pxm4szzCtsOHyoVtSQj6wJEzJFBgt1mwPIojj
	xt9B1ok+TJ9mkIKV4LKHeyslFSXMTDFN3RKTHEdqGjJd/Tod0x93QtLNseR/4mFnlMMdQxdXJ1n
	0YeunyVbmDtJtevVTlEIiIjDFSe15aJKa2gaQ/fHxWabt6AXyLrpDrQETxeP+Po8uczsIj/g76Z
	1pTH
X-Received: by 2002:a05:6a21:a96:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3cd3009cf0fmr18811755637.9.1787566129563;
        Mon, 24 Aug 2026 03:08:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199dafa1fsm888828a12.3.2026.08.24.03.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:08:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net] net: fec: only stop PTP if it was initialized
Date: Mon, 24 Aug 2026 17:08:34 +0700
Message-ID: <20260824100834.31655-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

fec_ptp_init() is only called when fep->bufdesc_ex is available.
However, fec_probe() unconditionally calls fec_ptp_stop() on the
failed_init path.

Check fep->bufdesc_ex before calling fec_ptp_stop() to avoid stopping
PTP when it was not initialized.

Fixes: 32cba57ba74b ("net: fec: introduce fec_ptp_stop and use in probe fail path")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index ced4dbf8cd90..7a87f40d12d9 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5457,7 +5457,8 @@ fec_probe(struct platform_device *pdev)
 failed_irq:
 	fec_enet_deinit(ndev);
 failed_init:
-	fec_ptp_stop(pdev);
+	if (fep->bufdesc_ex)
+		fec_ptp_stop(pdev);
 failed_reset:
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.43.0

