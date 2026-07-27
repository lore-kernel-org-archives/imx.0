Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A6C42A145
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 20:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184812; cv=none; b=YSWHJ6zXU2U39FPjSUinDnQY/K3WZ0yLef9+YgyQzAVTkwbkXJ4bVhzrrkJDGkFrfpbaIPy19pJqO1fm38qjIFOZ/Wt6/VYozPVSGQBKMdndKOrqv479TPBgaW1eUYYWDZgfIhEmU8IzAuDfv767ThldyozwCNnXNmiTdEWjNgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184812; c=relaxed/simple;
	bh=qp01uDsAO9Xr1IK9DLn05YRNAeKa6fMPBigwOWpIhI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIzlWLEuMJllHmwvy1LweVDrZrij0uahAFj7L+H3FAd5yj3XOsW9mMhGIr4PhV79M99GjNOFmuXk7dOmpf4VgMEKuNDe+zxAMUgJB6QUptyeqGkkQRYRlB4nGIo+ricvv2yEUFlOthmcGa42mDNk4FN62xbjdM57MF5gYZhDIu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwI2YW3n; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwI2YW3n"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423f236418so2400579b3a.1
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184810; x=1785789610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgI+ijDqRF9Cm1JOtFQYfvEWTbPsdipHYMQSOr/erIA=;
        b=cwI2YW3nLAq1twQWexznevEpQKjB8IPAhjh7ArpVnhV67c0tdaR3/yUsEatlz2DMom
         1/wBF4l7rhvvfPu7bajKXsdBPlMPTA06jtTFsMtPnqMLvP7sjqpr1rouO5Yux1GfCvd6
         yNoNoZhumeqc2M7XT4KACikcl2A4nd4jytDbRWkDC6vKn03fIWbkVjcOAnKI/D0jhaAg
         GLmrDG/70zVPYY9nAYip9EhyAH6nKJpLWrv7PTG9LBArjbgYL2yE+lKU8wxjyIoJ54h+
         IdPOchSGLeRd1cETxtc911xcW9ouwKX/t6QDk9f9/grJucFBMu1okRoiiUyH+GLcsTPP
         WmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184810; x=1785789610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgI+ijDqRF9Cm1JOtFQYfvEWTbPsdipHYMQSOr/erIA=;
        b=S4mh6qNwPdx68cxe3V6q+nTXGdnWzetxM7xLwupaS5fGrja1sxiMcqSiJAW0TlcNLD
         YhNaPo4nCn4g8p4MsGmSwb7D7VnlCUecbyBOu0jDwba1FbMa2JnRpx0RHyr3FuDGA9lN
         udlI2S74JueQflMGR1OZgVSd3EZsRWniAQPoXLUb9jB77p3QM2CDS50HrPtl6UTkBWw4
         44eEzf30t1pMazOh4Yx8nzFXinpQEOcmJiSRxoLRwT+LFBdqS+tCu9KS/3ZGp8MAxBja
         d/kvb+a5XSC1s58Oc6ie69GvN+kVTM6qwDb3Ei7dwkanpVYP05WhaoxZcFHzjC+jwW+3
         P5hw==
X-Forwarded-Encrypted: i=1; AHgh+RojcGCETFj3PwvlQQ8es7Uy6cJcmlfhergTXHZ0eQrQilQlqtgZxDXArVQ7hd7oV1eodo0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn+b0fLYm0q09kfTeEZ9LagnUUv8cdw1zqCpqe9HoDZj9y3BU9
	M7Sjp733V1RzpOyYctlcW6VQ1RqHBaZAAFbZIzjjTAKzBJ/dnVPI5zxt
X-Gm-Gg: AR+sD10i4APoSsxY2EHUcuvLC6WIUtujPqbZQ6xVmxZJAOOpTyxsFpfn4hpuphUbfoR
	7Lbe74sPX52q3veaf21tSGvb9BgboR47GkTFa2b55d6VWzN+WN/59+3iZiHE23ViwesEk04o4i4
	ZwD1OTS9w9qGGWkvTA5tJ7TauRnKte+clhCQWzU5XEEUQekAHQsUsk5K5ExevumZfk0tcxmM02p
	kqMnjlsFU5dnUuOKZRL8xor1VvuMNG3BHBVz80QqScS9YsMQmIjV4pzA4vAMMphqWPR21CszQXL
	rjJJxzsfO7XTGuS86WzuKmj4ptPDUgOsn0xUXHe5F3CyubHHQCQiMj+NTAvH4L6lFAHQiG5clR+
	/ZaZ2dAHxQcv7/SJMCaNtHF79Bqid047OsWnFx1mXIObE7o5g2UvqAEgccvJ2O9X62i3SK9Ze9R
	TUGGFf
X-Received: by 2002:a05:6a00:4213:b0:84e:24df:3873 with SMTP id d2e1a72fcca58-84e59498aa8mr8341625b3a.32.1785184810384;
        Mon, 27 Jul 2026 13:40:10 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533d1351sm3583338b3a.39.2026.07.27.13.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:40:09 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev
Subject: [PATCH v2 39/64] dmaengine: fsl-edma-common: kill vchan BH on teardown
Date: Mon, 27 Jul 2026 13:39:01 -0700
Message-ID: <b0bf2faa89ea57cfdd9da400bdacf41fae75a6f8.1785183549.git.allen.lkml@gmail.com>
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
 drivers/dma/fsl-edma-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index bb7531c456df..70b40e60c39a 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -915,7 +915,7 @@ void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(chan, _chan,
 				&dmadev->channels, vchan.chan.device_node) {
 		list_del(&chan->vchan.chan.device_node);
-		tasklet_kill(&chan->vchan.task);
+		dma_chan_kill_bh(&chan->vchan.chan);
 	}
 }
 
-- 
2.43.0

