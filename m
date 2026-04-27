Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B83331F989
	for <imx@lists.linux.dev>; Mon, 27 Apr 2026 17:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309659; cv=none; b=JLYRlwp2jz6i+JB9a8ye0rmXYqtaQY5PRuCIQ4oBm/5+5u1RnNIKhXgpiWTNpAmfAeVK5ifqzojMhkRZ5Fm6FYvwD3Nnn8thA8ftqU5XLSUs6Zqa0asnp9W9SvMyKJwWYkg1DJDouTDunFKB/QxWPXjsGoAqWBcRBbg8GQNWeRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309659; c=relaxed/simple;
	bh=2BBIVyuBfJT/9Pa5JyxKH2ni54xydMVjGCoT+247qyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXJF4HACH7iSwxsb8wMjk9p+clDTLcKingLGAFkocwIGpw95w7n5SrWHjnCezdTP5tZpjl686Om9jMKzIanCGoQet6xOlatXD3ExEGw2nOG4McGUPGhoSsPRcQ1hhuSnpJRVMeooUdxN044PyEkt7ghxDWSum5/rqDMNwMcQW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C36fv9F2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C36fv9F2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so6811274a12.3
        for <imx@lists.linux.dev>; Mon, 27 Apr 2026 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309657; x=1777914457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=;
        b=C36fv9F2I89QoMvr6nCMT2jvm0zpjcgjBiK5qfrokj6sT1GTm2yazatn1C2bdIaIbB
         3yJkb0N4Pqr2ajj7VEX4e+xLVklsHPGbIvmkWdXls0/VHaR5wqqA2tDm169CrR5vubkV
         CxzTJb1zreG/HTaBWiKLRfygJhI/5COwoJW7TJCger4N+e0mYSgdMk4jcetshRySXU9b
         jEG2taFyyS90l1l6YFTp3zmO7mJ3CvUqBKD2JmHJJmBeiMaiVapPW5/R9EGI1VlUZvVW
         fgy6S2oNxYiWik3kbggay37JAknLD3Qg2+sD181wFSUNdN/DoO1z3Vj9jtjBzXJNgH8V
         jBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309657; x=1777914457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=;
        b=MN8PGzbkj4me831hfAyG7/MOVc9W4/NMPkZ7Q5waRHxtG2Sv3nmSE6N+3L/Kijds1A
         WSSB1aFuvlzmeCUITlB6kfxydyloR9p0z9itYX6DXt3pyGC5od0F2VHlELOx743i2b32
         6++EIL1HPcn3peLk81QsF+njQZV4iN2aW0PUvH/EEZcUYidieAn12pDa5UVVDHPcDL3U
         Q7rpwGPdM2mWvB4SPoJgBHszorrdq78eTGAJE0WObqdTScDndW1YD+XWEvXc1+KlGQlE
         pGtUU7ZAv8QVcBW5JhlCpvH/qsF/JgvIP6wSTRSRYvJ3tCIC2Rtg9wb8C2EAb4nH6Vfe
         o1Dg==
X-Forwarded-Encrypted: i=1; AFNElJ9dhB8b57zAchp+1pLurXCbqY45e8pyT7ufppbGfftmqoNwyn8sLpD7HItGIEifhLo78z0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjZ3qP3wq7upPoltFablyxtcvwALf1q3969H1dPrr3YY4NTcWV
	7Z70hI0Q3z7aJybus//hxyqdyNs4xjkFrcrlfevCQHBzjh9Ejf83vbd+
X-Gm-Gg: AeBDietoXZpco+wBwL7TJEG7mMrVUYuz5jfxS+nXX9iKbaBJdEN6ft1Jvs7QPtJzuBZ
	I9AwZo7keUGPwnnaReHsoElDCzWR30psYs010pgO1nSKKbDtf2NQtRhLJSGEg9CcXVP7iisIz/e
	r2x0FBpFHTPGdnPXPZ77oKbevudHw8o18WsqQ+oUm/0r0tQQwcLtDKRgZ6Lno7o1CyzJ7FBh4mZ
	Pfrw3dzq/7FpAfAZe88d3yQs9zYwvZRDL4UpM0zYk5bH3Ot53aAb+zL2MFAfBP2EWki7pcA5sxJ
	egbnYcaWLAABzmlCMZDRa27lJezPQypfb1rAOWMMHgN1SgQg/zbRJvl3Izu3JICBJFpA+HPrzaW
	qlHllqNk6CsrQiEIvHzc961EvsrgUAw2i9PC0V8MOGMe3sOosmiZ0kNqdVDx3VNRqZngDj8517N
	omj4WLJtCbS8e9ahew98QZAF9SFS2G9+GFb0v6TbuWqhEj62pHzA1m/TpeHgOS9ffAK9PmRnotj
	O07UAD58GUZYiE6g0wCCjVF97yOlZHp
X-Received: by 2002:a05:6a20:6a09:b0:39b:ba95:b127 with SMTP id adf61e73a8af0-3a398c117f6mr307416637.4.1777309657446;
        Mon, 27 Apr 2026 10:07:37 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm39497551b3a.55.2026.04.27.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:07:36 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: imx: remove unnecessary braces from single statement if block
Date: Mon, 27 Apr 2026 22:36:33 +0530
Message-ID: <20260427170634.23072-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from a single statement if block to
follow kernel coding style and improve readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0

