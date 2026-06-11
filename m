Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3285E314A60
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149164; cv=none; b=IzzDdMJk8dMf6qAkIUWEN9GyMeRUf3Lq27brMYNaiXdiKHqqr8/8TmbXW7r0cMlQGlRZ1GLARl/qn60vRDdiJ/WIrqvFLskVHh23GZCDUUXLry40Vor5WQuH+Le3cwez07NeSlKL5PhTaTPEa/hn89Ny5N8eiesXKwgSWk2GvgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149164; c=relaxed/simple;
	bh=Vo8Rw9tt6g7PrwiZR9y054LqY3f8BJvLsPe/+9ij88I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3Vc8FpBzXPgTlOH/ZhuKDD9mIVndBGyUZy+56Y/4YTEOYYNuJ3tUET53YiT+K8EgLHyGIb6L3/clIMvnzcLgMLzKoHjW896pqD4glLrB+t3asIn+tHBoEPE4+o7jIC9ZEIeHo4ea/TJny312UnwpbRHIIGKY0odu5BlcsV62pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGlTLA46; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGlTLA46"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842288702fbso3151999b3a.1
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 20:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149162; x=1781753962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnZoQBUpFkHjuMRCFUnZLcjmhUm98D04lIrK4n/JyBE=;
        b=QGlTLA46OZ3Qnue3MLeJVXCnfp/v9EWGAMPlXAtBnpE7lB8godYsD0xbcNU4RGnHjI
         rF6yA2GFb2zwtDA5gL5dsdJj0VFQ/f3ekTq4fNcw/PGcG7HsWj0j4wqcf1Y5tpMoWn6u
         Rq9hNKtxgvnxohQ2aN+6621M8RCBdvIqc3rdK8oa9RvwlVwyEIMAgnIRYA+A1V0ezR0M
         1wZ/C1GFdTbSk0oSYVGAvQ2afY4TLx7jrt4hOpWuNkti7Cv9eUC94UPxW9rtJMPu5sOu
         kenXD3p911M4aTz5TB+oR7lrRwgZTCOCT/DW7SXZ7FH3PK7/9HRvUktEmv9s3SjOukY2
         y6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149162; x=1781753962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnZoQBUpFkHjuMRCFUnZLcjmhUm98D04lIrK4n/JyBE=;
        b=eCwjU114r3ll0BE8y/mu8aVAEKJRff60IHnQPKj86tCaM7T6sct3C4+Xmqqut75SwH
         aERnV7rKEsFgHTB5Keh4eqDN/QVKSKo6h4US7xAcMH6JFtPECwy53XHbjbRNNSbhABgz
         DYLPqjPXGzRorwPAuCVTuQUGH86UriymZA0zCWiL30PPAPyIykL+wqtCIffzstmgvk37
         mX9KcV5KbmN4UcwRrnHmLz/5vxhEcG8/clgOMXl1jolCL+YDDHGAgRNUu5MO1WtexFkX
         CYeO2lZTqPb+/d2C45o4xsLhfwzADIhudhKgS3KaE+6yge+cr1sS4Ybc0BHkXemhsNc+
         LB3A==
X-Forwarded-Encrypted: i=1; AFNElJ+OQZvZJKPYEzDs7TzG/i18KqqmDP88bb3Ihlqx2OmgZI1NHw296SL416dG5E0YTe3Pgro=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4MoNqgXeyitI9T+vQhLW2yW4UX4+heQFzidfv5OSb4FvFEkKM
	HCDx2L5TgcppXIqCmU1tdQj3q/sbeztn21ktEYUCpE82yycWshBRBA0V
X-Gm-Gg: Acq92OEAOxygj8Br9RgO75XW1oPOzq6NStQu2tRsKsNQdW7UqAjuDLM85Yir9urCt7x
	G2/IuAmxD9dIg3cCiPJVI+sSmvqP0Js/JwYVVJBcdQeWq3jPu+TW8458fJlJFC5vXyaFBBUyYtJ
	hZaTEKU2t51TR1N7FQiraaoP7t9eX6nRZJG3zkpV0Rh9Wx3e+OGXO+kADJBJkusDjcotgsRj4qM
	zcrEZUrRSJdK/gVJ2hYKIgJMCy0n6j1BKaOf+XKZi7zOD98UU3dGtfNvjZic4kNVy/yflUAkfXF
	+srYDt034a2hXZMzEqK0vccW/jdCxSdqmDTos/mqR8W5wnSpQzfZNGUTZq0No7ZAvi0mDRSopIE
	YdPJBWl62bX5Nvpb922oOrmHEGpFtTpRaE6U5TufBJUKCdxQXqnB+XGnD9m/vZSaANKv8QTgIQ8
	krp41osnIxBeb3ahNrsA+s2qkrPEwt/kRvKyfFNyf0QuMh6JpjPFj7dA4ogyQnREwuDkdriCzcw
	Q3btX50vUKrH6FCufzpwCpUoy9HyYsxhKdUMZbTHgbKIw==
X-Received: by 2002:a05:6a00:1705:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-843367cc762mr976724b3a.14.1781149161619;
        Wed, 10 Jun 2026 20:39:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv3 6/6] serial: mxs-auart: terminate DMA before releasing channels in exit
Date: Wed, 10 Jun 2026 20:38:56 -0700
Message-ID: <20260611033856.6476-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mxs_auart_dma_exit_channel() calls dma_release_channel() and then
kfree() on the DMA buffers without first terminating any in-flight
transfers. If an asynchronous DMA transfer completes after the buffers
have been freed, the callback will access freed memory.

Call dmaengine_terminate_sync() on each channel before releasing it
to safely abort pending transfers.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index fe48a372d022..ec2c60dd0f52 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -872,10 +872,12 @@ static int mxs_auart_dma_prep_rx(struct mxs_auart_port *s)
 static void mxs_auart_dma_exit_channel(struct mxs_auart_port *s)
 {
 	if (s->tx_dma_chan) {
+		dmaengine_terminate_sync(s->tx_dma_chan);
 		dma_release_channel(s->tx_dma_chan);
 		s->tx_dma_chan = NULL;
 	}
 	if (s->rx_dma_chan) {
+		dmaengine_terminate_sync(s->rx_dma_chan);
 		dma_release_channel(s->rx_dma_chan);
 		s->rx_dma_chan = NULL;
 	}
-- 
2.54.0

