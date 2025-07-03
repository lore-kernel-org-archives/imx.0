Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F862E3AE0
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 13:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751548138; cv=none; b=LoeK+atceEEp4u/z9SRPjn85a9s/4/zAZhBAPmcnb0jvpZ84f26PVYD6Ab+u4iT1k7fn1z4xgQmG9lIl3mn4sX89/yOm5EQSq+cyONwNgLlAujg+nQVbEgHgC8JUgoIbOtYxIVJYO21Xg12tsfvxOptRQ+nDOV0b5DTrl2OI5Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751548138; c=relaxed/simple;
	bh=pZbI5ym7TtzcRfecHeI0uDxdfaVbnqScARauxiC1Sd0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=imOwKLFqt7k2JYiZhIMsSQkActsyPjf9BUJ1Bch5mCHBxLe2MJk1VLPghejL+OX2gBrnUBUh6E+h8R+ad6prihYRMtvFkf9UF8bnABwWK28tVyzyaLC2ZVc05HQh3syGP/+nuk3AvH9xNN3mtmwTkPdHd9mbBoENxLWAo/JrjhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8rPQ5Us; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8rPQ5Us"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a43d2d5569so66853761cf.0
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751548135; x=1752152935; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSWkEMF2WVElgQiqk1mWdTcpv8AKmbdHRCi0k3irPWQ=;
        b=i8rPQ5UsB/15IhQHtBLUrk1sNAEg2Vz4d1W9vWLrDVrPk96tz1E4N2BQAQ7izSwXI2
         Us9QQDhOuYBDp6rwxCTnmamdB8jDdWVASHQl4gjd7quYtUevr90dD4UXv6MBCehE9Qux
         X559m7M8mut4+jzL1gaWpQvF9NyU3dhNkOFDpXHNku8lErVCqpS5YYRCcwlaM+NaZpGX
         i4TkQpKPh205/rk8RxkRyCfMdZtchL1lQpSM2TasI1NrWUkKNkLLLITYNZPF9YyfvYBW
         A8nSmAXclcUuX5hqAYML7doaeuvzcpFRM6NX3M1iTUVMWzbLy2sXaqnGNCTdwuPdoJle
         i02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751548135; x=1752152935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSWkEMF2WVElgQiqk1mWdTcpv8AKmbdHRCi0k3irPWQ=;
        b=R408axhVcLoH5zZlqA4vFjC73Rx1+OhOaW5/mwfNN4Ox/mV2zQ/ru8zi8rnLgMlIhi
         7MrOPx4sQVWAzobPV54jucWgMeXTWEylrOFdQ8/j3LBEqvhJlUGK8JlLoYG9cBXlflot
         l1zEY+kpTdleCXmzN0thYj72hBSlA/RPz0tceairn0KdgquAEczJYDd6au+2pNloeJSx
         K/ENXtEDqJ+bSgQjUEf14qx5aiTgKBxHzKn3OnoUsOYjCs/ML6HxrL29ZFkrMnamFbKJ
         n43L2EBozF4fF2EPGSuM2YuTvGUm0wb18KPIFVTWDM/fki+lLYTc+t2gl8NCs4LQQX2L
         04jg==
X-Forwarded-Encrypted: i=1; AJvYcCXOGmHs2z/qb6jgxSrBR/k8dT60da8ObTIM7maZ2fjv7janjBjmFXc+6yzjz//B6N3Cx1M=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz6RmBoCXcSABumi9g6KSu7r0oUZYK1EBF0NX5AzPU/MdT7Mcd
	dWBpyN1H2/WaqvDY7d5hXn9g/899JfKDopFT4IsrhWCyvUnPJsQjh06a
X-Gm-Gg: ASbGncvRmwzm5cEIKQLUvJqzOXa6ZsMNuqyvCxNShn5x2zzbx3SP40Ql9IyxImLSOaD
	1RQQIdHOIkfz982qrIXvW4gGDtNskdpYFhnEaIOKlXMtUgtWBMYCx17BVM9pSM0fJlvv2G4Bnil
	bkUTPqopSgMkDgp1gXsBX9BSGIOystZytEwFPOP/7dnu7df+tAv9aIgW3Cw5xBKDciTNm5hjFNI
	eisiwRjBkhSD/1lqS9faZ9RCGcV4Lr9sfcD8/j8cZaOC8tfKU8Yzp4TE7hXsPyWYMNZ73yl514u
	JJiRlVDwVqKzQCadrLNJrLJWrjWp+6kBUoMgaUNaI3UnpGcjGY8Lh3vFioFTrwXWXBDAYG+hPKN
	uPak=
X-Google-Smtp-Source: AGHT+IGroe8sSDGARASmREqDinTKJNPHDZfD5QFZoPsxPWLxadIu9TXjl+Rxu7ZcO3g4suDjXSuCiA==
X-Received: by 2002:a05:622a:153:b0:4a7:ff6d:e94c with SMTP id d75a77b69052e-4a9879c6e11mr49451301cf.22.1751548135066;
        Thu, 03 Jul 2025 06:08:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a7c0:b293:bc62:f957:108d:1060])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc57d7dcsm107314561cf.60.2025.07.03.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:08:54 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Date: Thu,  3 Jul 2025 10:08:31 -0300
Message-Id: <20250703130831.18830-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Merge the contiguous ITCM and DTCM regions into a single region to
prevent failures when loading ELF files with large sections:

remoteproc remoteproc0: powering up imx-rproc
remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
remoteproc remoteproc0: Failed to load program segments: -22
remoteproc remoteproc0: Boot failed: -22

This approach is the same as commit 8749919defb8 ("remoteproc:
imx_rproc: Merge TCML/U").

Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
Hi,

The ELF I tested had the following data section:

Memory region         Used Size  Region Size  %age Used
    m_interrupts:         680 B         1 KB     66.41%
          m_text:        6984 B       127 KB      5.37%
          m_data:      130224 B       128 KB     99.35%
         m_data2:          0 GB        16 MB      0.00%
[100%] Built target hello_world_cm7.elf

Which triggered the error. After this patch, remoteproc was able to boot
and work fine. Thanks!
---
 drivers/remoteproc/imx_rproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..bbf089ef48ee 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
 
 static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	/* dev addr , sys addr  , size	    , flags */
-	/* ITCM   */
-	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
+	/* D/ITCM */
+	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S */
 	{ 0x00180000, 0x00180000, 0x00009000, 0 },
 	/* OCRAM */
@@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
 	{ 0x08000000, 0x08000000, 0x08000000, 0 },
 	/* DDR (Code) - alias */
 	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
-	/* DTCM */
-	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
 	/* OCRAM_S - alias */
 	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
 	/* OCRAM */
-- 
2.39.5

