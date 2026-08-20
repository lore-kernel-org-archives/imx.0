Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A20541A55C
	for <imx@lists.linux.dev>; Thu, 20 Aug 2026 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224481; cv=none; b=QjUhkCrvRiN4DY4ObkIPuGtrNoZpujHGCN2DRTGQtEVQrMmv0xq0vH4F/Brc+enpPmWyYMry/z5yqQmBBzrfMYq8yPDxQcHTp4ANMbyn9XSIoO3jMyUspbpo2mis4iZemMhrNKqhYN8tULakKz5hA+5oDp4LBshmriCu9ib3G0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224481; c=relaxed/simple;
	bh=ZdtX8xsbh4lQi/ck9/fe2r/hcaarQC4xCPivdR8GLbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBalFMWAoFIivOiCgNBhzujTKilCgDJcEKSD45DNyyu8fJNel0kIgsrgEIm76CCkMR01+pLagrmqRuk8rlC6tD3knlTTxC/OKsv+zVowwTjk7H/7phkDSDrDgzt63V01BIz0UPro6XpmUrCuOadTf49+FlpueRpa9yLYdh+hjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ja7SYWpY; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ja7SYWpY"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso3172402a91.1
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 04:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224480; x=1787829280; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aa8JvoP4ttlAqARvv1+FX+80Og3e2TOWzjjuAVcvE4k=;
        b=ja7SYWpYaAcYVGHo9egLlZ35aYo9AQ4wU2aXLpjiT8ukRgSjX1KIwoyUlMxSfoCSUx
         mXXbI2D3LTTfYvh/qPFS7fCttKq+tvFE2+BZa7bcjF3H85uKhqgWoZtq+GpSyTmkHOnE
         RdQDhTCvptYDXGJfOOgCHEDmndFIJGvEgJzOycTigUwgOgQnIuReeBVDgi3T2MwTDWEw
         tbFTsE7ncnctpCfJ6ZrbUrM7C6/GVuvRzYovxfc3Tp6oAwZAAOHn1yKJ16pTIZh6cGYU
         9ctaJo3rcnV5Xr3h+c6PbzgrJWtOfgP+Nnz2Y+KwuP4C4sxUVYFnobMpHhYJkTqls7sY
         wIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224480; x=1787829280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aa8JvoP4ttlAqARvv1+FX+80Og3e2TOWzjjuAVcvE4k=;
        b=XJku5wXOqm9cfbQTPSaHR1nyZ4yIu/Sy36v9Tlh1yy5gaN1JCO35/qI0Z1fG9WCeGi
         eAYuQQDpbLTyPfbatExmXxPjtG6pIR25NCRzsM5K3wWx9ZcfH47oM8j1cCLRg1flyioV
         ucXFMpjVek7PPC4xWHe3GW9qKdcCvz74A0z0mmgJRH7NLGC37522p0WuShMqWs8s6KH5
         UDvrhp0+FIkSRlfbjzNExxSFBmf5Z5Maml0ugVeJgLbbSJzt1sdYZWRa5sPol64QOE9n
         Y75WSk0tzo0U9bL+vH0vrBzd3VD4btJYkipH3DLT6mxnvzx3yLdrgl/Dhi0UGY2mfvur
         J1lw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4bdoyoCdY5y86xPju5vftU37JoektSMOAyDModukIdHt5yMscxoZxH2/Igx+ObxDDnF8=@lists.linux.dev
X-Gm-Message-State: AFuF++kL0QYWlPAVUvYt7gy9Hx6z8YvZLyMlEY/o8Ytec8avolY3fdtT
	cK4lU3QJ/iaxzn7nveRgFhZzNUcueU+W1Y014i+yqOyjIPLXs0hn4DUF
X-Gm-Gg: AR+sD11pHUYbEb782lCekuyJziVTNVTubxwfq+w1sk3VQOBHFR42WikQVen+shxeKMn
	I/7UkUgCVozDqsugV4bBk0oW0yq1yD9IYfWZXtEPCO4rIbaV6LGPN2kaMU0BQsC5sK3aSRijGVA
	IDAFz1MInQtXprXooOi/7BvxUmBGVYU7w9BHjWlPdsrZTBeCRNh28hlX+uKx5Hyh55lA+3DOjY4
	MrVK1TlzTkU57X5ndg5QZBI9yo0WtDlkGzpWX0tAdyTkad8UluhC4qBBbLq8UwyTTwwxmRTHUhW
	Tl+1psx/1YJ8Q0nJoMmAxZ1rl1uZMEHdxTVabTxrWABK+TlQY4QZFRRthNtjvVl8VP2XQdAG+pz
	awCE2dhcEM9+CvFsj4/ESamJbHOkd3IUE78FHWwET591vxnAxNlhFQ4hmqsYcrHMy3Ma9VptxSp
	FCmiTOsrvjuKUxNPUkZtVoP5EXEGfK4xplZcgR7UfPLy8wKabLhK63w07xOAPMnSPLOTBJlEq2O
	EsPq3iFxY4J+3j72quwkJLIY5OvbIrNtoU5bZ7q7S0LMg8ANGCSrjtCtpZuQw8mUa7bTtuZzYqu
	2RtF
X-Received: by 2002:a17:90b:2e42:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3958109a525mr23538513a91.13.1787224479729;
        Thu, 20 Aug 2026 04:14:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395ada57c39sm719965a91.3.2026.08.20.04.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:14:39 -0700 (PDT)
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
Subject: [PATCH 2/2] net: fec: Handle PTP initialization errors in probe
Date: Thu, 20 Aug 2026 18:14:16 +0700
Message-ID: <20260820111416.97917-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820111416.97917-1-phucduc.bui@gmail.com>
References: <20260820111416.97917-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of fec_ptp_init() and abort the probe if PTP
initialization fails.

Only call fec_ptp_stop() when PTP support was initialized to avoid
stopping an uninitialized PTP instance during error handling.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index ced4dbf8cd90..b6c22d6c1e69 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5384,8 +5384,11 @@ fec_probe(struct platform_device *pdev)
 		goto failed_reset;
 
 	irq_cnt = fec_enet_get_irq_cnt(pdev);
-	if (fep->bufdesc_ex)
-		fec_ptp_init(pdev, irq_cnt);
+	if (fep->bufdesc_ex) {
+		ret = fec_ptp_init(pdev, irq_cnt);
+		if (ret)
+			goto failed_reset;
+	}
 
 	ret = fec_enet_init(ndev);
 	if (ret)
@@ -5457,7 +5460,8 @@ fec_probe(struct platform_device *pdev)
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

