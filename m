Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B4237DEAF
	for <imx@lists.linux.dev>; Fri,  8 May 2026 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259158; cv=none; b=cx1iZw1Bc3D4Af8FZxsa3q/Gp0gnHBHIw4a+Gca5MkkNTtXVtHN6Rp3iOKvBb/lDXHxtXQt9BL2JnjFm+6YMVObwCaee5KWM/FSXLxRUh5HIkGB2o44781ywIt16MyDvCz+HUylKZVHxN+wUNpWvvx2B5Iw5XS0TDWgFjuy1My4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259158; c=relaxed/simple;
	bh=BQ4r8c1KpfYE3hCqwq96T8uwxakS+v2i2hWNPC4C2e0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QuwGxbAtzy3rEQDYcnfa0ud11W1rgMbnlMvnrJlBBetLPZxJvBWmxVhkq1JLdm+BCnymeW/2a/QcjnUYOnoycpwruh9ZO+Kuhq0D92oG+5pY0yFQkqqSJJiJrOtg+YsCyb50zSPbRVBtSgoyqr3SdAYT7QjkzFLPzkPZpG/T0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zy1gKqpr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zy1gKqpr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso20756015e9.0
        for <imx@lists.linux.dev>; Fri, 08 May 2026 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778259156; x=1778863956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDPLWhf2Swx5+TpPMoElnS74C6BcZSaXrBoYo8J5R/k=;
        b=Zy1gKqprqntH6KT/xuVnZFvFVqmOPf5HP6kxydmcaz3xfS6wfOcen4C9QGlexbx304
         NpK5SatP+VUXp7vyUN/9AvpkS9rmr6oC8+1bvmdbyFiKqPneIH/uLwf25cvBxyXQ1ljD
         +gOxJyUeU3u8kRGnyRNp0AuDuGj4U3axDgKHj+d3HBD7YXDuLkSywj5pue7vLG5h44jN
         oOR1gbEiduwZ/t9R+y0FsXk2wiaKzV1QAVSxp+8hzqvUPbyE3lZViu6RMagk7ysWU/WW
         fHbEGMxi/DCTgr83Uns3fzpXWImYuB1DbGN+tdCljdkMxLsc9LS3MlGzt9WV0TOH/WlC
         f3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778259156; x=1778863956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDPLWhf2Swx5+TpPMoElnS74C6BcZSaXrBoYo8J5R/k=;
        b=dqGBvnoCy4HRz0ppSKX8LwaN8y437z3ZUydltjnlVhgF7dz5Ia+3Pmjeubsc/OIxKK
         gWfioF+EIrn9f9VlEqojzrWR2pj5t9JkSI9V2+hPAi8Wc2fUYR2n90CI5DqltgBdIDtT
         nR9NPhz0yVPaj6czXvgUSSmS59KngOjbsfXkA1WPwnNha92wKKiKtRBTeP0On43TiWkM
         RoDPp47prFt3tDEmZ10o1T9V2hRKPOFeXfZijze3lNAnfINTNnQZ/Yzn9IQUKW1CxGmw
         dyMDof+Qm4VMljFPV6dH6W3EmHFcgjRJsrY4Oj0uGYez/U9PicUNNNQaEtW+ya7tnCQT
         Er5g==
X-Forwarded-Encrypted: i=1; AFNElJ86oeJYBdagvYafdHJOnKldYnwtrW0hOH0QAb0RjCexecqdTTyXx1IRO7insFkQzyumV/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyD7Cdt/SaqW/yTq18GJowFc1pTFHH1F+8CU6hvNDDzHAoGoOki
	CiXxpil0L+k+ZeDRSp+iRuitP9tZhZ5blSwDp8SNli0VIkd79nRPnfho
X-Gm-Gg: AeBDiev3yU1nNCeUGAtG4ioVSeyxW/FrbmGRpGK9NVH/B+l5oGFDlRUMsTrCUPzLpwc
	lCXuwuB9UjjZzGwkW/LglOvn7hSq/sEAlag1n+bDoTL9uQ8/l18qIz4DGmv1Vzyj0MRdSTLgwSg
	IMd6e06PhJtl3kobO7YZ3kQLsQw/hxnjst6zgUwwrIa/ZkvpXPeeCiarDjhxSN5IclVzoIYL9FA
	PFOmeIekekaAZ1xMdv4lBdX1GLKIQEIL0OcDS0b4h1XOQpBLlmuRT8S/ivyed9wlCcgF9rE7l4F
	EGV/hJVXQxHBZ4Nnct/wY6eqZIiYTUhBY6Swo2l7z2S7zb/g19beYlmepl2OyH1uvECpiL/YEyD
	fz5+9Al+lvAcO6p/nA8k4YuMcW6HfHEJ+DZGUxypymnf77FMvFMlQ8sCTaIbU/eLclww8TWkTLE
	EZNR3OGWixazPxHZd3bTjHrQ==
X-Received: by 2002:a05:600c:354b:b0:48a:554d:b9a2 with SMTP id 5b1f17b1804b1-48e51e0c7c9mr202325015e9.6.1778259155336;
        Fri, 08 May 2026 09:52:35 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd35abcsm6637015e9.7.2026.05.08.09.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:52:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] firmware: imx: Fix spelling mistake "mismatced" -> "mismatched"
Date: Fri,  8 May 2026 17:51:09 +0100
Message-ID: <20260508165110.73435-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/firmware/imx/ele_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 78440f62bf92..e5117a1f1995 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -110,7 +110,7 @@ int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 	 */
 	if (header->size << 2 != tx_msg_sz) {
 		dev_err(dev_ctx->priv->dev,
-			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).",
 			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
-- 
2.53.0

