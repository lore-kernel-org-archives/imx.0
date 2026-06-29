Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF2F1B86C7
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 02:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782700766; cv=none; b=FwkLB1PsF+PoTEUk2Vy+vB8fZPCJh6Lyp7aFnfdFm457MpSj6Km2MnxCi7sWnN4v5vfL7LBouqe7MCbgGLgcSx0yj08Hrww2DA+Kzd93j9NHv6Op8gznDEMYphpqTC8w/mXD044b6Uz/j6qbHNoMAe77IaDFQSKon0jo6OnryfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782700766; c=relaxed/simple;
	bh=3yf/BQq8y+lBmy/U8Na/4Wdy8IPK1JZVpOtqu+QvhLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MijY5D5zlITdpn6w/Nf97frYe+r6KXcWiiF9GLfSnQxzTdj/PgiOYw52IdCpALhv672MDA3gL6Y3zlDw7SD+0p+H3U36T+4zqzE9VT1foBsWruRs4e3svA2MJKpM9Vhwb544Cyl0nNHZx3/paSQG4y6RmaAcXTl6NEAY55/o6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQRhNMN9; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQRhNMN9"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c969ad04c1dso283249a12.0
        for <imx@lists.linux.dev>; Sun, 28 Jun 2026 19:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782700764; x=1783305564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjYx+8tIMWDajKptnVsnfbgFJjxKrPWEBY6WEuIFPcI=;
        b=EQRhNMN9vPo7PXlDveqd3dHT0YhUIkwVYXD0Gt/cLCrDn1+aTYae7J1Zm0er1Ef7Q6
         0Kx8kcE1fcio4vKDNwkJnLJ5VY91Al8plPS6gFEIQkRR8P5AarRw4bqNT0BXDeY7lxzH
         qo/VoaWCK+pD6SkfRDXs1MG3oASe1WhL/8xYE0wWmTAehZ1f6ueHI/gq4VO88bvGSeuA
         UxX6jrfGgDTFXa/GmehRAnyybSuVY2D97ON4P/Gj9szYTnNvYUlE2u9Y+wzibIrf+dEn
         8DZIPTAZOw9b1UknWH08+AqzfEnDz6uXeTfN0JubplqbtiWlcbV0L/kBfiyVKL+RK+ft
         SXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782700764; x=1783305564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjYx+8tIMWDajKptnVsnfbgFJjxKrPWEBY6WEuIFPcI=;
        b=eQAIF+hqVCXDDP1m4Fv1lOi46DmP7UGJwNch3AGaP19iQ+lDo1+piWceK44H6pMO8Y
         gLBmWKzxKj900iJ1TFEOv+f4cY+843Pld1D+1W7U5BzG+QHU/KLyJSfpWw7FEbze6/D+
         6X20G3Agmk33LAxuznJO92eG5h8Ar0/0Ht2/wrwJDGiDK2oTzpdnbzj3uP3AHDVNeoLb
         23g4E0sVTtxG/kdZ3zdmjeECS37oS8wV7MwrWJmhP6HokJc7YKAsNSXPbF0kHqhB7dEf
         chowR+0foLaqgWLJKhlnCLx+4go+jns2MR/GAzzvMECpwUotXHWz//5YuLSrRTwTr090
         AWRg==
X-Forwarded-Encrypted: i=1; AFNElJ8U/zj/U/SUa3zdqz1BfOzyCkgoNDkKRFqegaYRQHu3mmVmkVPqLcxip0+8VXBvyz95wjA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9623bIeTx7QDBpqbVW0DcJf4LcFkrOXOhmExHz04EqKnzeLlG
	LoFvKnlfUC6SFc6p2lXcVohu4Oo18kdsPkr5CLa8DhsLOXHBU/mVLhxA
X-Gm-Gg: AfdE7cl6wj9a7gBFTWQkFL4Tqf6Z1P90d52cjQ/YOdOpbh/K1jU4d81HcVqOmn9mfml
	+k77cnGHZMOHOhTMIQl5+ca6gdMAQvDpmpjVJc0plNC1xhwJgzg6rd7l2zjDw3tr60JPw4XtS17
	BC/dTRqWLoW+PdstHpeyydKnQuc6lI5UmaZ5lZA/TY+Due+ydH3Kd8JV1Hr9MPuDXg7o0DqCjdr
	JPlsJXaIFjEAZFm3tXiuURz38AJ1zqhCWNPO3ohcD3gg1RSjQpl4U8nBWXFKZTC281fXLCMpybL
	VOzRnz6RhThrleCHBrR+cQHak3NPndCRGUgUpoK4OPBz4kEr24Ac3VB3hOJ5KSCwxpywx7lR5YY
	UVsGfKkzJIvwl2lnqGJvKylXWUI7xnkqfmddeMu+l4F73i2XUlFpIl0e/gmA1ab4PY7EfIDtFED
	pRPI/m3cqib9HdGfkl5Mq7XQ==
X-Received: by 2002:a05:6a20:a10e:b0:3bf:6c08:fb8d with SMTP id adf61e73a8af0-3bf6c091306mr7342972637.47.1782700763765;
        Sun, 28 Jun 2026 19:39:23 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm6914869a12.9.2026.06.28.19.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 19:39:23 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: carlos.song@oss.nxp.com
Cc: andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	frank.li@nxp.com,
	frank.li@oss.nxp.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH v4 2/2] i2c: imx: Cancel hrtimer before clearing slave pointer
Date: Mon, 29 Jun 2026 10:38:29 +0800
Message-Id: <20260629023829.152651-3-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629023829.152651-1-liem16213@gmail.com>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <20260629023829.152651-1-liem16213@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
disabling interrupts.  However, a pending interrupt might already
have started the hrtimer (i2c_imx_slave_timeout) before the pointer
was cleared.  If the hrtimer fires after i2c_imx->slave is set to
NULL, the timer callback i2c_imx_slave_finish_op() will call
i2c_imx_slave_event() with a NULL slave pointer, which results in a
use-after-free / NULL pointer dereference.

Fix by canceling the hrtimer and waiting for it to complete after
disabling interrupts, before clearing the slave pointer.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Acked-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Liem <liem16213@gmail.com>
---
v3 -> v4: No changes, added Acked-by from Carlos Song.
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 2398c406e913..b1c6581db774 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -960,6 +960,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 
 	i2c_imx_reset_regs(i2c_imx);
 
+	hrtimer_cancel(&i2c_imx->slave_timer);
 	i2c_imx->slave = NULL;
 
 	/* Suspend */
-- 
2.34.1

