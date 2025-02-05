Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D552144A3
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787467; cv=none; b=YaOHfVSyZroR1izDP8qBnjGimChH19UFA94EEVqsAZvKYWqHJHYcExGFUmdi0B0BPb8Mz9XEBpHLbQV6IvKEKwXgMlWbm3fOYoe5hjVFaWz53tXbu3/6MvorYmtALeW75WBD8uVj4E35rG0yuXH80SetR10mdRURxIMVZ58zFQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787467; c=relaxed/simple;
	bh=Zr+evapb/nefpmf01Gqpy0YSDWxRxiHvWclKrOSHX0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rBwgGoNlimq+XYWkTNV/Kcl2PtCE0XmmRVgGrh6WbITg0yJV65Vy+wydDhPGn3gcVekAWfQrXVpCYIiFcZDJ77WEHVE8RLudN2UhCJETN+dbIYU+3xRFFrBbRJHIiyiwI4sebF8OY4pNRKfTwt3k6ddDJnGMHpXHP0sD1IMElEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcEfTY5T; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcEfTY5T"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7157cf352so266723266b.0
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 12:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787464; x=1739392264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAjVcNoOfbq0GY3dIYjgRmnP1VxE85PspBstMgf/BvQ=;
        b=fcEfTY5TO66K28WfJ+cPPQCpGEQxuYI7gRoJtAgwI8Pp9XGvxm3MRMYMv6IG9E/Igy
         vk7sR9av5a8ojybKJ6S+gekdg7z/qbtsq3dugftuKBbHYXUGzAeB4MnXsRg/sa4OcDiD
         dRSDR7JQsi7pyQAX+ijsy9MF9bAsblWx1TlUE5haFadTKKGZCqHeneLxHUz29iJQZoDq
         NNUm67GISjabws4QRz6UF4POO74HS3G5Gr5jhQUR1LYyTPNdON0TNVN8xgylLHb3NL9R
         xZGk6Urvxg3gMIYD3eAdvLCkUk+fXKPxIDDdGQ8o3f7FGkKYz9nJnGoFQofgUDAbmZeA
         pGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787464; x=1739392264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAjVcNoOfbq0GY3dIYjgRmnP1VxE85PspBstMgf/BvQ=;
        b=NZWP11/C5315VycOimVU3XelZ6aKRJvlW4DnkTug9sva7icXdtbzB6OKftX+nAI/zB
         08OuI0CPv9KrWZBsB//JKfDah+IU3WgmJ7TGPzmDI1OAWJ+9XxmIIXkcz3s5m20L4rTF
         JI7lMcP3CNgGhPtbR1tHzUvIvs3GF6JOW6poNK7/FugCF5IBc1ir6SjblXq+dhJcIzdK
         YdSfMvwOhGcyzhnxzG8VIsR4u16RYorVcFR6fdo6ysj0f+MCShD0VxxilU8jcdaUAQ5A
         yjrwOeKQBiJDsihokBsjt+7fQ3eyL5+gTg4wIaV6xbLuTn1TlczjafgwIkzCRso1x/Tu
         Muyw==
X-Forwarded-Encrypted: i=1; AJvYcCWbqoZgl4XAZym+wEXRBtCAWA/dDVZKTjJGRw02iTgVvthefO6j7bS8azS5cNueBS0q+F8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3u36ip8xK5Lqi3CBkDVuYzQ5hUrRqfdn4vYK+fJdzPSUeMupS
	ZTCa8u6BbAw+nyF3F8+mkL4Vi3hQrkVD7/R5jc2rdZxVMRQucNxA
X-Gm-Gg: ASbGncuBCchro+BK6pGRMt1fBMD14nxc6GYjWAENFvWyUs2nrzNfcN1UyHJ39IM+sp0
	ejMGgNJARTN/nLVcs6gGwwgOd8B9b+bNiuseKZJv6QXF9Vrumy7JKaMPfe/gFltw/C7IwKa6b8g
	HYBDTcwuqvxdUKdYGIaUEpKlIlSX9wdHDqgRXq86AGfOallyD8DFe2LtgC7m9WSEFxpTrxjF+c5
	Ls8/VfAZ5vgOxgnjUC1chvm3/oNcF4ZQcETq08eCPYaMSpWuOct/kX8AeB7942pdexdaUK4SYnd
	BEcfmmvy02cR/i5XvzTUzYZojdwMyGcp7+e8545k1zTn6FNrLJ4L8g==
X-Google-Smtp-Source: AGHT+IFGDx2SZaBxQ+c7tA6+S6jcfUkYnjGWtcmfgxTCXalpz5BRRqDTA+J+vlJhnihyUB4ysGWTVA==
X-Received: by 2002:a17:907:1c0f:b0:ab6:726e:b14d with SMTP id a640c23a62f3a-ab76e9d8cb5mr86659466b.23.1738787463741;
        Wed, 05 Feb 2025 12:31:03 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:31:02 -0800 (PST)
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
Subject: [PATCH v2 5/8] ASoC: SOF: imx8: drop unneeded/unused macros/header includes
Date: Wed,  5 Feb 2025 15:30:19 -0500
Message-Id: <20250205203022.2754-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
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
index 5d6524d695e2..5ce094943aa2 100644
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

