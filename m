Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA13E63BE
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456315; cv=none; b=kG+1iqOWVgmWQXxauqylxKEWTZVcgaTKTxUzn5zXzFOmVDXMCgEPKVloj1Ij89rF+MPWho30RlAe5ixs4qKWrx0f29gCcykH+ox86r5NoKsNwu5ao5cuWZW5c2M+phcRcUdSvfQk1nhSBSlLNtPSxQ5DmGwz0FhTvsE495/NIo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456315; c=relaxed/simple;
	bh=u5GCTN95aHRCMBoDJHkFf/S+06sOFg7W9gSYZb6FdkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWY2EafSnJJi1trl7ak4jTe+emDnfAwOvMGhC3+Y838B4vBdI23exYkhCfXLcYZlPAybSxVaUj8CfHLZc2A8hVe/YnfVgI0oMT4z81bRRJ/092fqBCBSQ+ui/hdxNRXahcDLp4H7/eGZwI0NOP6aZmgx0hIaJgE2kNGclpU0IkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knnZUOli; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knnZUOli"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf22d29dabso37477095ad.2
        for <imx@lists.linux.dev>; Tue, 02 Jun 2026 20:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780456314; x=1781061114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DgpTLB1hzkqNPPrde/I8zx966U5X1f7Z9OQaGxgrfCc=;
        b=knnZUOlitwUu9MClNxzI8YKPXdAC1/K5qU/ww+IQmNVF3bPUy60BpQ/KHzwOx8wvWk
         SIcD9D2i9/gbnmKwWsyjJzArYozyM0ZU7KQchbUwvXfbGrfMosBDl+nO8SH6nt0U/QXl
         AP1F9d/IEqOCON9laGC08EIIAaeZkOTP1m7uWGcafAFu9R2lynx1z6qql3f7BVl7x+/O
         ZVVOoF5woX56Ugdxd084x7FudiXE4Dgh03Tp5PoMt9HwCrVg0o8drR+lYnwRLJU/911c
         6FHE0YRT5r8PMViITyQJu2jTv+I4HJFhgz2uWTiy+OjCV3vpX6kIsKDPzCq/+d54AN1p
         XgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780456314; x=1781061114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgpTLB1hzkqNPPrde/I8zx966U5X1f7Z9OQaGxgrfCc=;
        b=qmnzHAMYcVcGNW9+pcXrzv+q4nvfNZdYnDLNWsyi0OApVgK3055L8mOnZCYRlfpQGx
         +jX+gmJ5ko0ws7ZE3p1tLUCmXybCBLwsuhvwfjzHa5ehAQHfPXmPl5Clsns2dHoL4tqG
         dZCkeL2SFI0I48uTNboIFbbIVPoH32To39C1sJrZWqFZT3BO3GqAi9ittjpNvpkAJvkm
         9KGo/AE8p8PWu7za8t/pnSq6hZ5sD9ieokrEvWfQx3E631cYQMW6ADdmDr1G8Y30wFte
         HfJlMUAdwSYg5UFvf3xj+p3Lf42X05Ci11++I9v/amC2mU6kSKgeqo7KCjr2gfv8neCw
         4KkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9b37i5hNSDtgCryvpsdtH9Pq/xf0DZZ+lbwatqPfoUA2W6IOU8NV/a8QS69nSfS/Z0wew=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4fCGtCREOCnVSPuknS8s7RAgvSpwrznBd6IjmDZH9Jub0BIoM
	5l0mAbsfN3xagZvXkPElnmM7yLEs2VIfuBEALKC8aPMHsvLsMl84u6c2
X-Gm-Gg: Acq92OF6fDu0BJ3kL59BYj/YS76rIz+ctKePdiUuy9ScQt619UkocPJ1zIzBVa9VDyk
	Z+A2AVpPOLzXUpYTUuitUG4JA+sn8OsoBByEFXGBxAQuMlRe8qlc0W0d77lSSchfzZyAxmERw0h
	00zPXPFF0ZbpzX6Yjoy4tk8m1/yQWQfLd6vVmPD0Pk5hJBPODsfJv53Yn3CjRwerdjuKnJYIZf0
	GQTGCYKcNuf+ZUK+7mfk67W7X/JVMELN+LxqO3XUrbFfg0jVqSplMW55nF8NtxlVQgsKKLraw16
	ina7AqMh1chN+phEe4Hoxv8dJzAlkBLD3KtdxNEAt+DDylp8F9KXRqvkAz2lQ9N1BMsKmjLrucZ
	XLzrTmvdQUn/EfkA40hOB8SfjXTUPKFjYAa3VskklBZ19ZZQ9ADsilGsPRBUPMrWOeSgzyGObjx
	SSDSYtFPQHXwdvhDKAnzPO2iY/Nph486rGL6K5POl+tFdNeslxMV5NHRWbY5fJYdgdAdzbOqJwv
	zkD+dNAJ7J36t6KHYlYTs7edbm3Qgpj8ylg6jOWLfxeXA==
X-Received: by 2002:a17:902:f545:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c1644d5834mr13983125ad.35.1780456313668;
        Tue, 02 Jun 2026 20:11:53 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm7211795ad.29.2026.06.02.20.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 20:11:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] i2c: mxs: add missing kernel-doc for struct mxs_i2c_dev members
Date: Tue,  2 Jun 2026 20:11:35 -0700
Message-ID: <20260603031135.289302-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add kernel-doc documentation for the struct members that were previously
undocumented. This fixes warnings when building with W=1 and ensures
the struct is fully documented per kernel-doc conventions.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fixed Signed-off-by.
 drivers/i2c/busses/i2c-mxs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35..4e07babea9c3 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -108,6 +108,14 @@ enum mxs_i2c_devtype {
  * @cmd_complete: completion object for transaction wait
  * @cmd_err: error code for last transaction
  * @adapter: i2c subsystem adapter node
+ * @timing0: I2C TIMING0 register value
+ * @timing1: I2C TIMING1 register value
+ * @timing2: I2C TIMING2 register value
+ * @dmach: DMA channel
+ * @pio_data: PIO data for DMA
+ * @addr_data: address data for DMA
+ * @sg_io: scatterlist for I/O
+ * @dma_read: flag indicating DMA read
  */
 struct mxs_i2c_dev {
 	struct device *dev;
--
2.54.0

