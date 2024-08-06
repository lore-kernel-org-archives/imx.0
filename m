Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5CF9E6
	for <imx@lists.linux.dev>; Tue,  6 Aug 2024 02:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722910674; cv=none; b=Up2EFbosr9efWT+TqWcChSOaLxF1+n+ofZjTUzUve69mf9aOytrKdn+qTeZ1UcPdNP4s6As9O+lnu42qP5ixGeJeXPU2nxxrbtLo/x1dhXnCLb717UcrISm3q/K3AxgM2RO0UZX4HXAPogMcRAc33gbMAFFKzlgCUNH17yDHoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722910674; c=relaxed/simple;
	bh=JRhQfo/ztHvpjlrb+wxSoTmiRBUjOuL3IDj6gu4IOT4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qtBr4ZkUlYb3vPdLC5u+B/S4s6wEzj4j+DxgGtk4WbN2/0Z32r3KF5gKN1t64b+6j4yMc1obD+oAMwHyDF5FD0L8kCuVUQjGlPg9rYdARYq3l98b4sCHkBLxO/sJtcDO4FkUSqIJJcUDopL7FLOt4wEkZZXjo/qacJvI9q2uoYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntOyRNBS; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntOyRNBS"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3db165f8211so70764b6e.1
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 19:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722910671; x=1723515471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+ehD75BWluQoZLMCLsE4DRj4fPkWd2bPdDlGv/84Is=;
        b=ntOyRNBSS0aDVzeOKMTGR3DiQwvfmPXF/MC7wmFLealrOqHaoZ++WmhxDanblBRHKt
         jYmN7H85vgM7SuDG/xiIgq7h9xXJgnXfREHYfgzxRro5oZvOA5XDvfphKo2OB110de6w
         A0CkD8yGJNQm/Qy1bLo1d9MlEvkMgJuiReIsy5WlnH2kGLLVTxLWaOFS3Usb7bKZ2es8
         wV9mks+q3uqPwBM2KuaUIcqKj331H8Gs5uWyVybeABjHNwNj/N7W/6Fik1jCepl+hLbf
         ZUiEiqo+rFlUknmIPnwbKfcFdeTuDuww7pCLpVw/rEsWVUu/GYU4HmjApwKLEe1PqKfj
         SHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722910671; x=1723515471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+ehD75BWluQoZLMCLsE4DRj4fPkWd2bPdDlGv/84Is=;
        b=Oh4R5XTfpYtoxs5y5CghNtvb4D6th1QXUBUtzM70AviccvEHis7Qfa0N3jej3oGnBW
         p8wE+AJ3YJ+hwvwEB3jDhxv5ZWUNu6iWUcyzN8WaOxKhC+tuFzpq8DCpYvxuo53pw6ig
         g8oFKyihDYfP2hXnGXoUfng51+GDBeQMs6IgG0oo0suau6+fjSSIzsok1AYsxkO404Xi
         NLzBSyqaovW7Gf3NfljmhQcSQ5wk0daFpQBD/72HJZK+n46Tn2YiqyFVxz/WElp/wsai
         zqLxO4BT4Df6N0kaNmdxXlcxcvlFVwZyXll1COa2L+NOnP1iLmar2iJJlb04DhusPaNY
         5rNA==
X-Gm-Message-State: AOJu0Yw75QqNpwR2wH3TRXynTzL599PVJnwo73xDZqiHD2FFVypJhaM4
	o6mZT2k5nD0uiGZDU35bQTdwB57oP71XPjLaQluonL0RdXPMGKq2
X-Google-Smtp-Source: AGHT+IGipj1l5BHjyuJ8T+rj9N2QAzB76ZmbF3UgMJBLoPA5tI9PQ/S7wtGfIv+QxEGplcX38KeNUQ==
X-Received: by 2002:a05:6808:1811:b0:3d9:402e:4d17 with SMTP id 5614622812f47-3db557f613emr8289854b6e.2.1722910671397;
        Mon, 05 Aug 2024 19:17:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3668:14ca:30e:638f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b764fb50ccsm6087006a12.71.2024.08.05.19.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 19:17:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: vkoul@kernel.org
Cc: imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] dmaengine: imx-dma: Remove i.MX21 support
Date: Mon,  5 Aug 2024 23:17:44 -0300
Message-Id: <20240806021744.2524233-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

i.MX21 support has been removed since commit 4b563a066611 ("ARM: imx:
Remove imx21 support").

Remove the i.MX21 support inside the imx-dma driver.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Fix typo in commit log (th --> the)

 drivers/dma/imx-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index ebf7c115d553..e913f0db99da 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -167,7 +167,6 @@ struct imxdma_channel {
 
 enum imx_dma_type {
 	IMX1_DMA,
-	IMX21_DMA,
 	IMX27_DMA,
 };
 
@@ -194,8 +193,6 @@ struct imxdma_filter_data {
 static const struct of_device_id imx_dma_of_dev_id[] = {
 	{
 		.compatible = "fsl,imx1-dma", .data = (const void *)IMX1_DMA,
-	}, {
-		.compatible = "fsl,imx21-dma", .data = (const void *)IMX21_DMA,
 	}, {
 		.compatible = "fsl,imx27-dma", .data = (const void *)IMX27_DMA,
 	}, {
-- 
2.34.1

