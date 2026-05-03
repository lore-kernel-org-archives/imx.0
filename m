Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8523A562
	for <imx@lists.linux.dev>; Sun,  3 May 2026 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777820472; cv=none; b=eTX/TQF/NQw8cklXtmhow04WXlRaVqsI9I65cnp9zDaywRtilMOVF+h99ZDMWGA4pLGK6yOMoqGavb4HZfenBZns5Yp64IXdTG89Aj1n0aBv99JrU9cAQLN9GDKjvSA62DFBBRzusNO/SMYPrNHi7KmOGgTA6aMY4rdZuS1IRKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777820472; c=relaxed/simple;
	bh=5V7sowEBAW/MmZpxWjMjlubJ9iiDob6wYsOok5AvsRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxn+H/HpJR7Gy1A9EbLroKBQ4qQIM/2Q6NT72cV1xLBZ2ahsrgY//K5caY4OAUOInMA4LudAk6fG9QEOyeYsdRrtlAt6Q0HdQbjDyn15YHpOVvi963JKYE9qSwC+fT5XvmNcmJDe/Mlyw4qsjFN4wQeX2asKXHBC4OHuqyYMczc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isxpvhX3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isxpvhX3"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso1426261b3a.0
        for <imx@lists.linux.dev>; Sun, 03 May 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777820471; x=1778425271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=;
        b=isxpvhX3EJjiGqLYWoibL7NdpuVJhkZ+OFEaUPTXU70QrhU88AsCohYDueW0hyh43j
         wbnB26vfcsmB2LMazFGe6Th6lweY/1dW60whxKGzQZT858LuHefZH1RqxdGHTiA9IGOq
         m+dAImv7J5H3RdhGQcDWtW4+yAeiBfYL+QvFj+7l/gaU+h3Wt3DLE5vCTSHmAjFaXgl6
         I8X582NF8rLDYDfA5leyU0LsDKpgXaUjdF4e9HebO4EtlAClyE6qvg5rLkIwJ5ku/eMq
         Oo8layi8srjd12Aj677dzS2X39J22XtmP9UoEYja9J04DT15juS2OCIq4Xov1EMSjM0C
         lsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777820471; x=1778425271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPdyUCj5zFQG1KGlXkDAzMMroAEruqs+f7PQp/GCZoo=;
        b=oyryzUz8R3XFRgrZLYxq2PeDUv+T9J+I1qtWwnMk4ISl6yfl5OfvMfCpi47KweZ3vc
         /c5hcA0pVFbachwKB2jjBCBJfperMizUbVZa/mHG5m6RQ1e6STqGq/oXWD3zTK1mnics
         ZjquoDxo7Rx/2arRXMeavKBeMT0ZeRiUH3VzbNDzSxm3IjKnNfl/QvlB/dLk4JxRlvwa
         RigYsS1BRCHdd/XEZ3PuoN2dmLzFVPw0lp4+rsIVVYB4pdaqKcB/oa0irWxZ4hMm6mbS
         YRQSda818B8/2QxhYjmLh/9FmMvsdiRulYnsjxHc2dT3AcKa1EPrdeVFVu5Ig1CbIteq
         HDhg==
X-Forwarded-Encrypted: i=1; AFNElJ9xkKpeDX4sX2SDmvq8o1nawfAeW6+/43G0Gl69B7J4G0CoAApTyiwTPKkqvZ4+6YJwI7M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHY+X88mh7WDhDrqcjgIDtx1tsACr9CtAUnO9+qwO0aoKFzw8C
	x58aLytNX696pT/bjkMYmAt49qmuhPSgDk2qQWbQjtayKGg/YvBtmzqn
X-Gm-Gg: AeBDieuRiDXGc+JK+nP4rmKgVmBKH/12d98Cs0gL58svBchx8dBIdvH8GXeML+Wwu1T
	MjNpg8PX3KFgbBQ+xDSgU5LnQS8Y+CQ0QMkbhkJK4xZ95uJjWRzR5bauOIcXriyQ40CbEfwf0D/
	r5Ivpog7KM07UUV55f0gx+s8XE+FGECNULNv/kfI1omAbk9cMYjCCuMtcfos6sWsL1TJJLIAIvP
	Bi3SgR+z91mSpQKt9A3+Hq93CG8jclMsX4vSEOj/3GtZVrteITQf4PTEd6SMq7YyZ3WtVu+HbHk
	kjFfsk/B6jZD3/6pE0jv4ij/oJhfYTY3zakK0Y9Dzs2nRjDEJ9bZBc4RkdcJ9hy/WADUBx06NHk
	c43+ujXfg3YeA6q/MS65PWkZGVaWhNsezg3bEercW0D7u2hJh/Xb8FK+c+r6LPaeCtdl8yTs+2q
	nxOPXowEyhJBhTbs1C+WJukICAKjRRyga/H7MeoailYZzOhSZNdojLkZkjGPQm+z/TPprSnq/rs
	mNGysiZDqPvDIp+6jMCb4aYbWvBfbWZWg==
X-Received: by 2002:aa7:8b48:0:b0:835:6bdf:c886 with SMTP id d2e1a72fcca58-8356bdfd657mr1415743b3a.7.1777820470787;
        Sun, 03 May 2026 08:01:10 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8351582dc36sm9699387b3a.6.2026.05.03.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 08:01:10 -0700 (PDT)
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
Subject: [PATCH] staging: media: imx: remove unnecessary out-of-memory error message
Date: Sun,  3 May 2026 20:30:26 +0530
Message-ID: <20260503150027.107173-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dev_err() call after dma_alloc_coherent() failure.

checkpatch.pl reports this as an unnecessary out-of-memory
message because failure is already conveyed by returning
-ENOMEM, and the current message does not provide additional
useful debugging information.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 1b5af8945e6b..85b63993ef28 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -589,10 +589,8 @@ int imx_media_alloc_dma_buf(struct device *dev,
 	buf->len = PAGE_ALIGN(size);
 	buf->virt = dma_alloc_coherent(dev, buf->len, &buf->phys,
 				       GFP_DMA | GFP_KERNEL);
-	if (!buf->virt) {
-		dev_err(dev, "%s: failed\n", __func__);
+	if (!buf->virt)
 		return -ENOMEM;
-	}
 
 	return 0;
 }
-- 
2.43.0

