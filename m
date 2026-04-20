Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCED34250D
	for <imx@lists.linux.dev>; Mon, 20 Apr 2026 13:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693600; cv=none; b=WVkZRnZvYZH8ZkPLRkIWe4Q07LvN91su5fGHCi0g1SnoRYjbXeS+OGgvtFlQMD4TyvhrW3hzGDS4ByMfTWDlopdEKfIeIo1/wukUj7e9ihSktgZAActRmiM2xsDfvGnndNzZQjlpRYTocu18bDepr3S4ujPQTqtloblcFac0S0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693600; c=relaxed/simple;
	bh=SrgFMyROmHNBLrFbCgp+FteKbeTypwiuhwV7d4eZYLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G4N9NP9zaJTe9BY6q1Jkzyh3NOxejk4zquWl449mSi5fPm8ohnj0S55pi8+tF6r6eWqiViFIkaJcPpGkbYXEy707U3rNET8vN4YcozOyXAfb5fda9JmXKS1hE9d3Gm8TRKaDn2kePenzPnb5xbweLBJcIVQcwk0UAl5+wh3dJc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/TLPlOZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/TLPlOZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so27271575ad.2
        for <imx@lists.linux.dev>; Mon, 20 Apr 2026 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693599; x=1777298399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtA7XaAsBped8tzDKGVHSMvp1WbWNwbAvXQ8vkybz/I=;
        b=T/TLPlOZSpK8GrCAtvPZindYTgDQkNrdpTvjbtS0zysVa6r/QP6watx/ReN/F4D4go
         d4mwWEwSL68ThOTqQvXRXYi8+PqCOuXWskeAZt4hvo5+Td6JBJrwraCaGUUO+kUPYl0r
         Q3hr+tTZBIo89wKvoEpWs7HPFlshfFirAO0UX4R2pDJLq+mF0U6YrM/11CLVXAZ9aluY
         AYNKHEEjL40SfVP/EcrjR9ZTkn1VRb/NEYU//O2mWJM/1ufdSF4vj1ZeE8MeDTyNzc3V
         issbxX8teupfg+u4VEu0rfqUTMZy1ic1JINCqqbpg107mX4NXstu0CpDyup1HcsPVgB5
         0SHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693599; x=1777298399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtA7XaAsBped8tzDKGVHSMvp1WbWNwbAvXQ8vkybz/I=;
        b=q3/A0rTICNPbl8QZigxrO+0ywabah0JS6SPzhpLPQcfWelbCuSZfMm1Q5mbtYH+4qS
         l9YPldCm9+7jJJ3fQNoBPETeqi3ySXMFMLfxi+yXIXur1J5eTMIuh8CTF9zXWwy/cQ9Y
         x2DQfbWGuoPTlNy+l6jBongwKr6lfC7zn1H6yUfz1yt8AtFEZPHFZ6M6i7U+7eAq9fKS
         3l8XfUAvGA7TtBvkblXR0UXNk4TUe/Z25jrQoq2WWT/qGjKXFQiwatPPfZDJ/yAMj60C
         1q4ur5kITca0ArpD5TplA0S0pMOcsz2QyN0awRaoZBDgY/hrH2X2ExkiYUrnCT7TJFNh
         nLqQ==
X-Forwarded-Encrypted: i=1; AFNElJ85iidinTy15KzUfRjlLXOXhRE4A5AijwY39mSPvELaTw3huhT0VCRwGZLiFNVgsKeeAV4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv4QUHWQwNhNRCuXNaAyrUnKKFgpOR+9dx9yuMee/fCgVJziDq
	RVbdOCIXuskKPue2SF/JAOH9iNM9IyqE7VsB8qF6iZcMLhU4Lr8dbUCs
X-Gm-Gg: AeBDietgjdmu2ue6LgNnXsjDX0Dx7DWXZma7yn34GmPam1dvOncz2dpx8Jy2TWU7tO7
	B2Flo1DPPQxVwatcHFyBFSPi8oXGHcPyn/PtQA5M+c66Mq/E6tEimlFkyPeJeIybfMGgW+tzKX1
	oAqHHAQAxvoWwSv8C0P+rXiCspc8RpqS8GufjsTWSfqWeY8UNfqTxb0XhbtsQjhMlqbJqEpg96Z
	D0Ov8GhOFKOVs3qJ3KgfD2WxznaPQH8UjUnnHJwRPcvCt1LntBwKCs/c8PSPKbD8KpF5UDiIKzI
	Qz5B1BkOTwR13Npi8eCELKJypZ6aYKOQh4Vtg4OQk0PN9KXn6RfwdZEXNA9I0ug7W6mMAvYCAVv
	Hp1sJqW6T/VH04uElj/ZQcvq3aFNy1NYQwowQuMXFGzyheZ+0yQ4w4Ir28TphcYl3rK+h6X5Zwb
	3yXmKroNxk1NPbdmLfTT5JVstWe9WdUOTTw5wmCSLtRGB6AC8R+/30hE+PmXSt3tOZZ8Pcxg6F
X-Received: by 2002:a17:902:ee84:b0:2b2:4697:78f4 with SMTP id d9443c01a7336-2b5f9fe094fmr113361365ad.31.1776693598648;
        Mon, 20 Apr 2026 06:59:58 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cd18sm112575965ad.45.2026.04.20.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:59:58 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: bhuvanchandra.dv@toradex.com,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	sherry.sun@nxp.com,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: [PATCH] serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma
Date: Mon, 20 Apr 2026 19:29:03 +0530
Message-Id: <20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpuart_start_rx_dma() allocates sport->rx_ring.buf with kzalloc() and
then maps a scatterlist via dma_map_sg().  On three subsequent error
paths the function returns directly without releasing those resources:

  - when dma_map_sg() returns 0 (-EINVAL):
      ring->buf is leaked.
  - when dmaengine_slave_config() fails:
      ring->buf and the DMA mapping are leaked.
  - when dmaengine_prep_dma_cyclic() returns NULL:
      ring->buf and the DMA mapping are leaked.

The sole cleanup path, lpuart_dma_rx_free(), is only reached when
lpuart_dma_rx_use is set, and the caller lpuart_rx_dma_startup() clears
that flag on failure of lpuart_start_rx_dma().  So these resources are
permanently leaked on every failure in this function.  Repeated port
open/close or termios changes under error conditions will slowly consume
memory and leave stale streaming DMA mappings behind.

Fix it by introducing two error labels that unmap the scatterlist and
free the ring buffer as appropriate.  While here, replace the misleading
-EFAULT (bad userspace pointer) returned when dmaengine_prep_dma_cyclic()
fails with the more accurate -ENOMEM, matching how other dmaengine users
in the tree treat this failure.

No functional change on the success path.

Fixes: 5887ad43ee02 ("tty: serial: fsl_lpuart: Use cyclic DMA for Rx")
Cc: stable@vger.kernel.org

Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
---
 drivers/tty/serial/fsl_lpuart.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index f36d50fe056f..296a096be351 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -1376,7 +1376,8 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
 
 	if (!nent) {
 		dev_err(sport->port.dev, "DMA Rx mapping error\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free_buf;
 	}
 
 	dma_rx_sconfig.src_addr = lpuart_dma_datareg_addr(sport);
@@ -1388,7 +1389,7 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
 	if (ret < 0) {
 		dev_err(sport->port.dev,
 				"DMA Rx slave config failed, err = %d\n", ret);
-		return ret;
+		goto err_unmap_sg;
 	}
 
 	sport->dma_rx_desc = dmaengine_prep_dma_cyclic(chan,
@@ -1399,7 +1400,8 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
 				 DMA_PREP_INTERRUPT);
 	if (!sport->dma_rx_desc) {
 		dev_err(sport->port.dev, "Cannot prepare cyclic DMA\n");
-		return -EFAULT;
+		ret = -ENOMEM;
+		goto err_unmap_sg;
 	}
 
 	sport->dma_rx_desc->callback = lpuart_dma_rx_complete;
@@ -1423,6 +1425,13 @@ static inline int lpuart_start_rx_dma(struct lpuart_port *sport)
 	}
 
 	return 0;
+
+err_unmap_sg:
+	dma_unmap_sg(chan->device->dev, &sport->rx_sgl, 1, DMA_FROM_DEVICE);
+err_free_buf:
+	kfree(ring->buf);
+	ring->buf = NULL;
+	return ret;
 }
 
 static void lpuart_dma_rx_free(struct uart_port *port)
-- 
2.25.1

