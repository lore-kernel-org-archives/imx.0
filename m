Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5996A20E030
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603154; cv=none; b=N9dSvwSyWWgGjoGR+5iO2ahnAgDhfRmgX3udKDTPtikLeF+N9wq1x59h8BGTHianZqAaSiSiT7ZqQQo0EuIZbX+Lf8w/+FXn/ZSdCxNHMiMrve3wvxKMmn0LMG3OeC2dz0j3yxfJ1xv3jDbgf5j5Z8UfDOa5N9oNS0/u/6zE8rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603154; c=relaxed/simple;
	bh=105ztv0GxeKGez2Y1scHpelgc9Xdh5IcIC+jWLs7RP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9HJI0pUcraMrF/uTR/6YqRnskk527YhsQiiqc2TSey5oiWoRRxfTl99GFVp+xm6YBAnHnjIWUqUiQiSE/tlIyu4wvmWIv8son7KLhG+bKqcIl/T0HIebOeFpFDlS+cC2mwHCpAAehCzliVk2oyjuAAaMZBbjM7KGDjZfMsh/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldqZYPMI; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldqZYPMI"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9e44654ae3so750181766b.1
        for <imx@lists.linux.dev>; Mon, 03 Feb 2025 09:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603151; x=1739207951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVLkWQiYUuhhhsdwpTyM3ZsFW0DY+2FMF1nD3WQqkOg=;
        b=ldqZYPMI802kYvGpR4Wrr2V4R3WXZYK0Wsjy+FdS3pobQAFmb20YuTuz9src6d5ajc
         mKKGJPetkCA4f8cNsA+hbDxAR1AD8TBT5U55Uh0V5bnmfIp+F7AjSyckRPjeT/8dzgvZ
         1WrC1EseWQ+HIbGeRtpC4nSVH6QyPYu0aOYbiJeIG7JiK8CtQKYfQRVKnAiVOSEAlwKX
         ohTH6AewQBTObOrQqfXteZd2pgPTWrzoBx7H2ArS4VMdijZVa3e82yz4BOzahknR58Cr
         ngsRMkKWVqcRuW042dbyBAY26rUXoj2SViwgtCCEG13JU8jyecPZN3gGJc2LffS6C8aa
         l9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603151; x=1739207951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVLkWQiYUuhhhsdwpTyM3ZsFW0DY+2FMF1nD3WQqkOg=;
        b=YPi/15yGs0vQkavS6CNnCcinWEmT2QJzS3lk8A4PFjBN4/bm4QH/ImTonNpTRfEtRm
         oButCc1mAbpYcIqC8qyiGJh2vb77zjM6fkcwcFG+CwWy9ydTXj2Zbx15SudroWPC9n8F
         mL+0UFq7q47a4NKXVkcnRkWmcspwyfub002ZWYiDECcTw+usJ7q8PZQFhmBR4gEL0eaF
         luHPG3MRrGlgemxmjo6NuRr0FdV0vAGQIhgQzLAcs7czE9AWJztzPXyMBzFwbnYGtZ32
         z/W5ipGrZ0+QrjIwIVkWisPQ3P5tpt6lTo8MkXcEJG3/8l6EXESZCh9km0wgENmmYuCA
         hzXw==
X-Forwarded-Encrypted: i=1; AJvYcCWuP1V8en+b4rBcCI021OPgsQHRKFqiovvk19KzYpmPGwlhXdBvvMVqJ03HqPqEe+vbifI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpO9fAimWxSmnlN1MifVbExKirFFHNgaJwzzoGe0Y6v/dT/6Lh
	r38XAC/w4fDZi6qs5DkinZl4ATI8ZxwwSQpeiJQ2GTywipSbf5/hoeT/3A1U
X-Gm-Gg: ASbGncsCitUIzsVcjrxvDhiqpQLqC3mhFgfEOVzhSNGFnN24j/DhfhMEGh2+uzUaT+i
	UlxP5d4mAqqkCpaIw9tCPTcxs41PGPBDXEdhxMmLvQeH6DOotNE2I9JBExrupE/aOq9HXHT7x+2
	uBloP3QGHQsT5x4uuLUg+gkIJL7+svWAabEYTLmtAJy7ga0utWDPrZSV68z7SHxbaFTzyxx3Wgp
	UNc7j4z84zH5TG2LHHsWQCyfEvm8a6+1itPgQ1F84sqWbCZBRMc4zXeNvxK7FL4wSu5oTJw7qYf
	8cHeZakjz4dEDLXWhFoSlehuO8dUJxVUBYJWpfY8oWzbQzMXag==
X-Google-Smtp-Source: AGHT+IFWBtIzBa55lZGBmGM864Rxc9R4mw2rCLQdHmq6rtMQaJzvFs8EjxgL0A6Ds+KOpWrF0JHfSg==
X-Received: by 2002:a17:907:961a:b0:aac:2128:c89e with SMTP id a640c23a62f3a-ab6cfdbc4d3mr2826766466b.43.1738603150375;
        Mon, 03 Feb 2025 09:19:10 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:19:09 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 5/9] ASoC: SOF: imx8: drop unneeded/unused macros/header includes
Date: Mon,  3 Feb 2025 12:18:04 -0500
Message-Id: <20250203171808.4108-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Drop some unneeded/unused macro definitions and header includes.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 93968f077d52..1efdb169cf07 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -6,41 +6,12 @@
 //
 // Hardware interface for audio DSP on i.MX8
 
-#include <linux/firmware.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/pm_domain.h>
-
-#include <linux/module.h>
-#include <sound/sof.h>
-#include <sound/sof/xtensa.h>
-#include <linux/firmware/imx/ipc.h>
-#include <linux/firmware/imx/dsp.h>
-
 #include <linux/firmware/imx/svc/misc.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
-#include "../ops.h"
-#include "../sof-of-dev.h"
 #include "imx-common.h"
 
-/* DSP memories */
-#define IRAM_OFFSET		0x10000
-#define IRAM_SIZE		(2 * 1024)
-#define DRAM0_OFFSET		0x0
-#define DRAM0_SIZE		(32 * 1024)
-#define DRAM1_OFFSET		0x8000
-#define DRAM1_SIZE		(32 * 1024)
-#define SYSRAM_OFFSET		0x18000
-#define SYSRAM_SIZE		(256 * 1024)
-#define SYSROM_OFFSET		0x58000
-#define SYSROM_SIZE		(192 * 1024)
-
 #define RESET_VECTOR_VADDR	0x596f8000
 
-#define MBOX_OFFSET	0x800000
-#define MBOX_SIZE	0x1000
-
 static struct snd_soc_dai_driver imx8_dai[] = {
 	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
 	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
-- 
2.34.1

