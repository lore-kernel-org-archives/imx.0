Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316589;
	b=skHwrLmAWuJ6zoFkcQCHs5JPDl6Sm8c5ojBNZx4JvaNQ9TAZOxkg66RFd0Ip+k0+Ce/8
	 5aRLfEUme8cdF/DxyyyqkwbBFT1aIDBTvF2bmvd3v68BdHhD4qh9KUaumru3GX0v0PkmI
	 Gpn7i2OGNleP61ppI1vgNCiUjsSzunP9S3XIoInXVPztWBdjloaOC7c90W18uskr1Dyr4
	 jay2XNHINleGk+8hUrAX53vXRc4o6CpjtTHfODgHsBwI1B66trqa5EvMWVCFp3Edc8tgA
	 wC51PwCLGTGr6m2s3dxExoh/OiLnj8I5pXNFe94QEs9OmFBGOWzfB9ygSFSNhMJAt5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
	b=gpFInUtfiCuybSJzExq8R5gf2syxBax9WwIh0IgEb6Xr0JV+RKQMxjbhaww+BKCk31dZ
	 +IkazYWXBEQEYw6gHaSuka5/vMMAo2avW9no5yzR9acSBplxRCOA6XeGu/2HmVOmmUEeG
	 s45UDPEjYTMdnc3Dh1jplLEmIs11gJWZZky+88DgFi0iS2s2aHK4Iqno1U4wTjCN5yJ6+
	 mzxjmN2aQ/GC+5WhfK/gBLIWYtEfAbf1iyj3+3bx4VO2Pvinp0KzSKOXzpG+lywJ2xnBs
	 EHawUwEMPmqQg80rc5FwYkTfaHK27lg2qyxw03lRYBnANoNsZn2xcNlZbkhjAgZLgIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ajIzy38b;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FDB60A382F
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 13:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47FDB60A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ajIzy38b
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1002495a91.3
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316588; x=1794921388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
        b=ajIzy38bbSPatMUPObOfopXX8gaMJ/5Ahpoxdxj0K26Zo8thp1qQntfn+GA/XSwpli
         kLMwuSCnYrUpeOVg2lGxTKe/J6PL04QXBASfbympe8SA7Lww5fbbpPdSQCdncFersf1O
         McoFhpoM4f1hC/dTjBxfxdVwec0nwrPc026RL/Za2SH85HdFXnsyQ1kgTzghMq3dFI1k
         eaQtct7ldukPBX6KJEFpzOT4bA8yikpqHTdOSotkCbYKHTQ/Hn0tiZpDA+TFq7fceFGH
         qC5Dky6dPSsf8EExVPcMfEqQKNtFIfrmSLaQRCLSZ4MKTIYWCYit0K4hAUGlSiB8Sb/v
         +6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316588; x=1794921388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYhmmDhk9YyrIeJ9b5QNPOWsGYE+KiNLYLN1UcJqjIE=;
        b=x5W95l74fCIXgExFfELikLvkbSYYX3Bsx4k3TAX7gglgT0P1tcGOSE7u30niTO2jp8
         +LiNXjPLb8pDK/JyRDOkFHeMfmOTMq5yxlVoWA8X6Sik1jx7+RdgaESHMtBSCoPT1Vn2
         YEZFecIvNrfY7nDswr9y4MAI8tU8aHnRVTl5VjT0hjM3NgGqs9XjZt+eH/0bYiBVtYWf
         AYHV4EGpCEpHims7XPGEFUnHLcHETwFRg4FmoCG1RJ7RPNc5pENt8QJlFbEcECf/SCje
         yN4SU46JTps1+Mw0ExuHNCOY1vl0dBEQk8MiqNpoEusEA/aA+PQPd51yK64VTYKmo0rV
         r7IA==
X-Forwarded-Encrypted: i=1; AL+hErGO47WkV7Co9SlTrHh+M+G1w1RF7bLSp0oUswRuSTJDDcckM6l9S4bSfhYayhgHnhhSm6E=@lists.linux.dev
X-Gm-Message-State: APuU4Z8FOt5X5WmYjKU59UIxUfGB6Yuelcm33hEzZNT8kfIYaq50bs7o
	V8DY+EnaXNiSQSve2eD69fWY5TxFRPApwbp7CDDULXQH9hgLykVTxuhp
X-Gm-Gg: AYBFou3Yzubvd+ePNmO9UJzbrpzmD0/kYCevwCVnxZ0cX6ci0S4WnMNyFFKyGhsHJe7
	KXfpLFxdwKur5dw0joPSB3xGOrq2g2pSL55hJE+FERyjqmBVv3m5jomTB8VVTkPj9LIfLoD7cFQ
	5iTKGaWZTZPpcIu3oKqDh55H1XZHb5gztRHOOJ2vzl8JjRvYWrwQKFJHpmFssGrvOPQ5m3GP1y/
	DcF+x7p8ShOhuTnq/7PFcDsARny+N8K61EEfC5oTF+++nibj/ZyupwNGV8NdAz/3THox0ssoYin
	9yXxiJkNugVEwUkQbDMxxrjTL87dlUNmLCj4Zd8ky5y0Etd55gTy2p3W8WgKSkCXGbyKItBnFRL
	lHYWuwkd+jS1+3pvWqiofqO1HEO6h3h3KQz0qjASVOgwfQLgn9GPwaSGa7LT22CkzV7f/kvWjSd
	w8tOAUO/O4yFQ2viB0mVyAcL4C6XZQzPFg4C7b3KuJMCZmswc0NrHcr0NpzhTk0FoAI9DgV/f2Q
	X+9vj8WH1LVtjws0I7FojR+esNr24aZarWd5mZKFub8cxE31hUgPYtz4vm/qK3MMwhxNSPe8kHV
	RRyq/1n9XLdR6vRQp9Oaun3ZbHy88PA=
X-Received: by 2002:a17:90b:4c51:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3b166aef970mr2935950a91.4.1794316587571;
        Tue, 10 Nov 2026 05:16:27 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:27 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 13/33] dmaengine: mxs-dma: use dmaengine BH scheduling
Date: Tue, 10 Nov 2026 05:13:13 -0800
Message-ID: <dc2a8bc5d071b865be14d8ede93a3b6bc68839a5.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index cfe4d759d65f..3dfd56a53414 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -109,7 +109,6 @@ struct mxs_dma_chan {
 	struct mxs_dma_engine		*mxs_dma;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 	unsigned int			chan_irq;
 	struct mxs_dma_ccw		*ccw;
 	dma_addr_t			ccw_phys;
@@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(struct tasklet_struct *t)
+static void mxs_dma_tasklet(struct dma_chan *chan)
 {
-	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
+	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 		dma_cookie_complete(&mxs_chan->desc);
 	}
 
-	/* schedule tasklet on this channel */
-	tasklet_schedule(&mxs_chan->tasklet);
+	/* schedule BH on this channel */
+	dmaengine_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0

