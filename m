Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0F5431A32
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184834; cv=none; b=T3LJzTtPWD68mw0CNfH1WUpYjM8Rp27uQrHsGdFhEDQc9KzneNciECrjcIIddqZZfhdOv7g4cdlEhYyVQ8sIyXsn6vNfDqbnaqUgvHA7K/bAp0nyj1SjujxJA0vzDkU1z0L3XJd9SDfV1oWfmYL5rW+ovgqSnBda+RQ218RC3RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184834; c=relaxed/simple;
	bh=ad41UXJMfOEQb8wNXSqsTLm9VUwCcsvBLe7BxK2QHSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtT/vv/Wy7b9gvDo12Fj2NOOm1X3fxcmCftcDIUTHBuO96m/f5i8lQYtmMmc27JaEtYEESEX246krJc23gX5rgcb0MQBJC7e8pEuJkpHJGEMeNLLUSk+8WM/c6y8KAEZ5EELvaTH7bZAsI0Dz3UiVwpZeU/TkD84eChLazcRCWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvYzqAZI; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvYzqAZI"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485b358552so3309126b3a.2
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184832; x=1785789632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjx+7tR04q8WCjgsUYMcsHB4XmblQgjVAPwj0NbvgUU=;
        b=ZvYzqAZI648w02Ntkz0hdjMpG3Zohew/1WraRqRqFj8nLXXrr5tGWOHl6CWm+z5l+n
         aNCcyKmYRAgQARTHnVVSbgCSsm/nYZHIp1fDHk3Avy4wQtHlXS/xkDglfTkfBv0dhKgH
         AftpT8kT0QmqJHe3nRYcvyuZMfRr7oszWhXvnyVEEI1SdYSdHQZIc0Ia4vTIR8XKSxX6
         6io1v/2JSfjdO7aFhq+kiO++HBz+p8grZBZXA5X3hQ7Buyk8zwPlU39KiyvXvK+LRYoM
         o+K3EupSPw81QAHjwrU73FYOPOomcxG50e7G1+CfSqmFRA2+wIax32ci+KY3UlvET76Z
         rMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184832; x=1785789632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sjx+7tR04q8WCjgsUYMcsHB4XmblQgjVAPwj0NbvgUU=;
        b=S+UUXTrFTj1bQjZsYO/QibsQPKk8xGR+SzxF4Q6Yy6gM+c9dbIWvcgjkVFApIKHA01
         ppV52WUiSD0qrQGyus6RSHSMrkGyGCTMJCDSf8nmfCVxKycmxRbPcK9w17XWZTUy4yVC
         5xsPH4eY+XEg6E+S5PraG9VszjArpdBobL9IayCmFLCSOZdMb4QRew9Rb4H4eDk8+CJp
         0WbqrJ+k1VGmxCtFeQCgPYOzel/5LOCxiMncOCI8xvq7udX72udfcWWdg8Fq3gITpmdq
         Cm9jz05tyfVK1dv0XY8XuSJg6XecCzc2d1Xq5rpJw+lJAuDJJXAW9h6j825l4K350+df
         VSQg==
X-Forwarded-Encrypted: i=1; AHgh+Rpx/tUrPFk+X6Yfufe7iakooxtXbNoV+dTP6ROnwz8cJ8eR2bKYKv0LnYaE2QmlgUIN+4E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYmS1YvX+uQX2+Etr7768geMu8An0iQDI1vwg9W9V1KoxV3yb
	c2nNSpzmpmHREyqKurfvd1WzeMrSFRo0hNr0DcsEHNLOsiNVoTQTuE+2
X-Gm-Gg: AR+sD13CEDfWWchjDNWWTo09O31yHRkwNYFLBRYvrCJ6GDFYTlDZ97BrgK8nEZghzJ3
	m+mPlpnY/T4Dkh4pjIr+yqV6Bjl815LTrervzoNuekUpcBBgyWupCeb/lqDjihkGuqXr54hwYHR
	7XwFp6yb6pkzFZbTEy5VANrmlrnJRd0FAg74LwAHjeJeXWISEyDnRRHD9bDXrQ3nILLDkxZZ3tW
	2UeusHNHSbfEm/XpaEYslAH+bfMdtcdUD2ADESWEznVtLOLAXGcEW920gPomt4ZGDB1MPTSoiPk
	hWo6NnlMSoJlJ2scD0ZmThKgUTojXTSLAFPMj3kjkRxPx5QBQQPnxYHKYSZAoE82csi9xGzkvrm
	5TXhHKFjOiXt3KKPRg1Vc6JGNFG6jVSfzXxl382rSBRuW7gI52KJHaE5qlsQVLSlfMk0zCOWket
	/H71Gs
X-Received: by 2002:a05:6a00:4ac8:b0:84e:165:da65 with SMTP id d2e1a72fcca58-84e8d0f92e2mr772302b3a.64.1785184831978;
        Mon, 27 Jul 2026 13:40:31 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:31 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 46/64] dmaengine: imx-sdma: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:08 -0700
Message-ID: <10f4e15741836cf24f08cdaf935da3260dea0250.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dma_chan_kill_bh() for virt-dma cleanup.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/imx-sdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 36368835a845..46f66e5f9f30 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2399,11 +2399,11 @@ static void sdma_remove(struct platform_device *pdev)
 	int i;
 
 	devm_free_irq(&pdev->dev, sdma->irq, sdma);
-	/* Kill the tasklet */
+	/* Kill the channel BH */
 	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
 		struct sdma_channel *sdmac = &sdma->channel[i];
 
-		tasklet_kill(&sdmac->vc.task);
+		dma_chan_kill_bh(&sdmac->vc.chan);
 		sdma_free_chan_resources(&sdmac->vc.chan);
 	}
 
-- 
2.43.0

