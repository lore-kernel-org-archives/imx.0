Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E119047A
	for <imx@lists.linux.dev>; Fri,  7 Feb 2025 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945411; cv=none; b=TZ+ShJPu5Wdc3w6ESU4e5PbbuEPScLoeR+BhVw0N9AJepRjqNpolq73bnNZlIae+HwcMHUSLGLDES2hx8v+RhjiZjMB7Xprs2FIYzfPTjs80KTglABbrMab9u+OQdysECZKGIId7r07FIssxRiEI/+PkETSUgbnCvfYVsCEZt6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945411; c=relaxed/simple;
	bh=00dstohvcxyDvJB+7xKK0xdciSDo+aZ2Nro5KZDfjqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l625W0yMYDiwuCTXlIrnUvrE7XFbn+/J1+oFVPu1e2Ox5rA/Gx9A3rKKkTyGnAH26kfBTWxCVf2f336DirpoOA2x7cD4Y7ETIcQ0Mvi9Lk2AB52qtBQ1Huk8VbnDHeace4SgJvCONSoSLhxuc7A84mXcsYfx8qb9oxkN9hUKJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grasw7EA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grasw7EA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dcc6bfbccso417332f8f.0
        for <imx@lists.linux.dev>; Fri, 07 Feb 2025 08:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945406; x=1739550206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJkU1KmB4l7DHwE2bzrMD4bmWDxpx3bz5pQap38Kxjg=;
        b=Grasw7EAHEyQbLwnFFPfRtKF5/wKTbRuQajvN6476NE05AOlYBHhd+AharFJq3cqQU
         //1tD4iEoRVpBdrMsgRofKthyqTS2OPD2pgTNtx1XSyWYv+ilZ7FOfojgCIflv9yHTD4
         LGN9ioxF4kCq7llo5GPCb2Mi1Rx6Efizig4Q0RiRwp1L8+YD1iRDNmESbPkxnhTyT2BO
         9spAIZ7GBrXTB/t8/KtzqkiZ60g/dloxuvIUqyY3iuT/4thlv8ZOYxHvpfy1ECpuxi7v
         gWoniIxTJl6ndV6jJYEzAI8KgR5qJWRzFIMFgMY141tbZjbWz+uBNkI53xhgtfPauEDT
         Hxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945406; x=1739550206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJkU1KmB4l7DHwE2bzrMD4bmWDxpx3bz5pQap38Kxjg=;
        b=R0udTUnKNNuPSkaiKJtNsOyXtlblRgEw5fOY1u52SfLkuWWsgp4kflwAOXC/IZKh2X
         Ex9vIQQvDy+aokm/K9vUrp2ONgCbBVM7+KQKB/5aJiOw1V9kNju3rLryQkmR9jQYHEvr
         cZNyPWBFWyV74T+HaTppNYWXareucu0i2mTLdvWGRTdsHGTrzoNLVYf+nAihRdiCKrhS
         xJevdQOMXUmClC7tSSaqJ+Gr/pTmBijomtFqBwPfoXPb8VdOj5HQhrR95aadq67Nddrz
         vu83bXe1KzHa5HPlzXI14oPrp3SsMzkgFWoUxzLB0AgmgZoPfgBEat+cvH69paKSi9Tc
         vC9g==
X-Forwarded-Encrypted: i=1; AJvYcCURgLCVxY3Oz2V2BaO4qAfIvGMyIPdkCNsDC8sJRspPF7fn7vKS1moAZPcI+rO7ZSaLIBU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Epe1h75LzQ9o5n00elmXOduXvUpwscqOMwDT1djEk8FuNaoi
	Yy26BvoEawofuw1uvRAUqsHlnAuNvNniScdeY3y5zZnVXWSGj2ijmyt0VA==
X-Gm-Gg: ASbGncu79+i1Xzmji4iwwSZWFj3CDCDpKgdoMU+qTJE64R519wy8IdaRBD3rb6zBUcG
	e0AOHW91yytWoe4YaOdrPivJjFsVDS5TKn8gymv/bFGtBynZhdwwr4V8DaiPs0odp5ytFMeTXgd
	bm3v1sMPes2HyGXP09C/n3RsB+6BS5at9HW1i8/A37SSbX32TyAe9VfXngU/1SGS8T6vjwdaGpT
	RAQujxn+9N0+YphXcz96WPwY5FMi5Cexyp30qT4Fp7glNjc7fwuKdwYaeXNGOfuxaGNttYWc+y6
	W94s9XlWmXVqy45NeV0EaoU87tQO+vX7YcX8pbzoZgcWD7Iaoa1S3w==
X-Google-Smtp-Source: AGHT+IEDx2e4YeD52CE58CrpNv/sjvtNAXkVfDjYGlMXgzf4qcCOVgfUIQ46bJE1JrrmbEoqvZJvWA==
X-Received: by 2002:a05:6000:144e:b0:38b:ecec:8576 with SMTP id ffacd0b85a97d-38dc8913e36mr2674138f8f.0.1738945406261;
        Fri, 07 Feb 2025 08:23:26 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:25 -0800 (PST)
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
Subject: [PATCH v3 4/7] ASoC: SOF: imx8: drop unneeded/unused macros/header includes
Date: Fri,  7 Feb 2025 11:22:43 -0500
Message-Id: <20250207162246.3104-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
References: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 52dff369d9cf..9a32ebe3eabc 100644
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
 /*
  * DSP control.
  */
-- 
2.34.1

