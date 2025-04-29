Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEE829DB69
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917711; cv=none; b=SAItmBFs41x1jpVKso65+bpGPvecqI+HGYSHsx8WAR9p7PHcbOVagy72qRf+vSFDG4uF3uJVtX16kbK3nz32ysvJIOLn2zmWzpp+4MKgf8ntO8WQkiCyNT8s3C1ta3SVHIoC5qjg0BHTMEcd6ZUzd0SSTcShz11/UfcYKJkGGBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917711; c=relaxed/simple;
	bh=7tKkj3J8Tt+kCDm7+jBhWB+A/hvph8GxctRTX3yGEII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lA91r8headcg24nVpoAbIEWXdnZbQB21rMCdf0l3rozU6xUOiwub0D4Kk5SYGTjAJ+f/cxHg825/x2amaUE1U571FYDY52nq386rd3UzzKwBLeKTeesaAlUxmOV4ibx5fNEwMOdDvLn5xaVL3XQpiDr4DfP57FQd/WgmF9haPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiRLLVUy; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiRLLVUy"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso8508749a12.0
        for <imx@lists.linux.dev>; Tue, 29 Apr 2025 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745917708; x=1746522508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUz53Saw6cMVXBIDBX+3gyUruKRB/Beug22u3wURK4s=;
        b=IiRLLVUy7pdL4RaZOGw4bIuQ+3bjxUk6ATIiWZFuZTbeDolv55znz8q4/aE8OEwYqi
         n+Vu999YnBzjCO2ieQA32CfR8WYL7RO9/rY2Ejydh9EMwOltlRSwJN/ygPWZ77QJFBSd
         zMJ2lYwppz5NjSk1PbhFwspp4s9QnTEHVqDHlAX5SFCzMeMZiGb6KBlJpZe37aOgVpSK
         yvbj0pIww8SLUGvrH+C4ojQ9h6NUi1Eb7rJfFk4iVcppJ7iBz1kan+qyVTgKVkbacWrk
         qxK9ES+ZcLU4rrzIgHfWaQkFLDrdk92s+I50uJgTCAninkBH5anrM7E69/SYyA5g7G4T
         jYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917708; x=1746522508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUz53Saw6cMVXBIDBX+3gyUruKRB/Beug22u3wURK4s=;
        b=eUxpSGXEMTpsB7+DWb43SQUgRsSOWJ5Ta8WyNw5BzxQYBLnOhpFk6iLjHLCJYSm8w8
         3uu/SNAsGGj/IWFFQMG7jNWbjmgtIK+PatilUfM8vhJZRnzqqrhrFGuoxRoVY7rPzK+o
         C47oMOPvuvndJuzzBdJ5P3b/V84ieMUHQQ9Yh+Zbk1BftlbkeIVyQLDJo8NjGgP2ga/a
         Y5vDrAOgDTFkdtfqTzKBRmg1lx3En8CoN1j+DALoFEZoUThSHPvlc3+NlSLfh6Mps7Rb
         6K3Eo7DT1+bAoPIV/bnWhDrlkYWw4uuU2O1A+9I3zavwZa6MOcF29lofBuOJ+a3+oVjT
         N+8A==
X-Gm-Message-State: AOJu0YxtrTZi1StpxDYY+sA7C/tlgmVwN4Pe7kWgtKdc29avNFfeISd8
	pxgtn2iLBwgLDzWmqdk3rSjsKVHyIaDpw0H7ZxU06fqkks7S2umt
X-Gm-Gg: ASbGncuwppknrCPm8KVj3/jvKENXn9QlguH53MTg509UHSKF4mU0OU0C77/rgcNeI9+
	/KIT4w0pN39zHux5SGMULKICR9AVzxCv+1BL3W9sAA7z/EtXEgtAEdWWnS4LFpk7AGWRYuz43Dq
	oz27K5hswhB6B2DI1dVIkfh/5rhFUM7DIajTlQu30fIvkcAGi9SkhiI68tO+YNAQ3pv6J3MJMEc
	3HhEeKP8MBQtBukcHNd3ZJNkGPWxutx8RaZGqPA0k0Wh2RM5ywhRVsnrVMGJbhJKyN3jP4tlV8U
	dlgiiJfM7ybqSgxagDWq0/tQ9QSItmtgDvjLd0V7yHaErq7XBnOdTzZQ1PQVGNDXpw3Yyvfss1r
	5oCfYdXdPaO11dRTPXXv1OBtGN40fpGiUhrjxcw4=
X-Google-Smtp-Source: AGHT+IH0x6YL+2cpf45cN/k9GbVeXNWiPGIKjy2ZeOFTUUYtd3wRJNwtsQ+bN+GZ2H91QNv6Y+XNNA==
X-Received: by 2002:a05:6402:e86:b0:5f6:c4ed:e266 with SMTP id 4fb4d7f45d1cf-5f83884b6c1mr1945283a12.8.1745917708122;
        Tue, 29 Apr 2025 02:08:28 -0700 (PDT)
Received: from titan.emea.group.atlascopco.com (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5dccsm7144159a12.37.2025.04.29.02.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:08:27 -0700 (PDT)
From: mattiasbarthel@gmail.com
To: wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	troy.kisky@boundarydevices.com
Cc: imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mattias Barthel <mattias.barthel@atlascopco.com>
Subject: [PATCH net v1] net: fec: ERR007885 Workaround for conventional TX
Date: Tue, 29 Apr 2025 11:08:26 +0200
Message-ID: <20250429090826.3101258-1-mattiasbarthel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mattias Barthel <mattias.barthel@atlascopco.com>

Activate TX hang workaround also in
fec_enet_txq_submit_skb() when TSO is not enabled.

Errata: ERR007885

Symptoms: NETDEV WATCHDOG: eth0 (fec): transmit queue 0 timed out

commit 37d6017b84f7 ("net: fec: Workaround for imx6sx enet tx hang when enable three queues")
There is a TDAR race condition for mutliQ when the software sets TDAR
and the UDMA clears TDAR simultaneously or in a small window (2-4 cycles).
This will cause the udma_tx and udma_tx_arbiter state machines to hang.

So, the Workaround is checking TDAR status four time, if TDAR cleared by
    hardware and then write TDAR, otherwise don't set TDAR.

Fixes: 53bb20d1faba ("net: fec: add variable reg_desc_active to speed things up")
Signed-off-by: Mattias Barthel <mattias.barthel@atlascopco.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index a86cfebedaa8..17e9bddb9ddd 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -714,7 +714,12 @@ static int fec_enet_txq_submit_skb(struct fec_enet_priv_tx_q *txq,
 	txq->bd.cur = bdp;
 
 	/* Trigger transmission start */
-	writel(0, txq->bd.reg_desc_active);
+	if (!(fep->quirks & FEC_QUIRK_ERR007885) ||
+	    !readl(txq->bd.reg_desc_active) ||
+	    !readl(txq->bd.reg_desc_active) ||
+	    !readl(txq->bd.reg_desc_active) ||
+	    !readl(txq->bd.reg_desc_active))
+		writel(0, txq->bd.reg_desc_active);
 
 	return 0;
 }
-- 
2.43.0

