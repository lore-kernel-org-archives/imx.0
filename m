Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAD62DAFA9
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371507; cv=none; b=J45QBPbwEQcWeEkFA7teaLomOLIZIItYWg1EqwWkgPMA6YNCaLKH/6MbvcCAANd5BxXar7AqdSnahn4D80LTrzkUzAZPzlkIROE2i+MVN52SSesizm+NoKz2KBzpShpUcMVJDuNn0QysCILQt/HJ6lPm2XCGhKedjJCS0NgqoFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371507; c=relaxed/simple;
	bh=cT3Hg/8SGJkDy7HTaTfodhduHUgAnrmxwuYSn134zgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OTdlKJaB/cugY6ToaAnKzI2HM/5+V5TO5TRsf+See/Yxz5jalt/b15/R100eftiRcbXaJw0WXgEi9WhAonTgacx9orUP+Ex7Hup1zjTbO1M5XIIKioVruhx+cQO44/+NJhe8+fQX1EihLXZhfPfeHKJ6Ytb0NDA2RDrdn3DQY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgPYPbN6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgPYPbN6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c7f1db3ad4so9701195ad.3
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782371505; x=1782976305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyhtrgUl91lDu8t83AeqgjUXFN0xPavBjbeVdqHjXo8=;
        b=GgPYPbN6T5mOfvkzz7EPH5YdeAaq7Ve3OsGvDhZmgVEaIRoVGOt44R1at0Du9IiyJa
         pgPV5XU6SsAd9vUTnqPW9k+kiito2brcxJTHrZicyysQm8PRfcRXE4nkigs/I1Gno6uF
         ytSxAAv79gFBhjOqNX3QRC0eiG6fr/W7r375uGdiuHS+SYPHGn7qAtHshCAW7uzf8EMj
         DOASsQLx1d7bkgqirGlnMJ1+k4e52yKvLOjWqPXp60R8++Z/u5AVUPprdh7zz1FsFxfy
         k7DS1iDvW7fq9b707iMWWTkE12S0C9J5w/5wn4b6qD/Ornvx2J24kB88qFD1YWZTqZKX
         f22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371505; x=1782976305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyhtrgUl91lDu8t83AeqgjUXFN0xPavBjbeVdqHjXo8=;
        b=UZ85LNN6oc79rqIMALl8b0pmr93hAoTOFpnJ9OfHUrFb/YjYWGpvptWLYaDTI4OxSb
         w6f01C8jtmIFD46lJ9QgXvnX7VvM7oZ7cOh+DqCH3FI9IDphcLChdiL+SzbOe9LrcgpS
         r5wTq3DN0OfUyJtiDs+quPMKTlW9tIU8SnZy8PmyfecG6l5RnMs9qF4MlcnG/Zg9uKCl
         cmk80c+V11806K4OXHiHpxvOwJamS3toZb9drPosynohbJG/GAUoMR+mzmSFGJhTROdZ
         noBvLqZ3ItlAMZ00wgAOCNoVSJUZvT220CfJuqn/56SgrZxHjbjfzv6t+6gdPGj94eRL
         9/8w==
X-Forwarded-Encrypted: i=1; AHgh+Ro2wf/ccS8gxttWXT468nU7rskP1lk3v6oawAiozr7N5zmmUFhJY5bgec0wfR0yWSgoy4E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwR8rJWZRKJTyIVnB/JnszMaz4zfoXGdO7OFfbtiJ8pCVrnlfp
	+ARP0l4A0tWFnu4cv0lPyfIBjAz9WPWCE33aJPkUgKt6BvK+VrEdI4Rl
X-Gm-Gg: AfdE7clhKrSOynuTyOzsOxdnByNwcHQkihEdIncBRFGXoWJp0TRK6MpIqNwJPe2BMa8
	9j9Bv2nJTE05xJpXqwZgXYnNIFz+/IJH7Cal4ZBdjPxHK1EFqqnlKEY7lMSJrzg7Vqk+e4s84dQ
	qdJ9oUmSF3YMtP6XUgzVe4+jm8YttpH5fRGAOO9kIOO7NrvUdO+ROEjOrT09FW6ELjuq1v3xGyS
	aTZ6msXWPYzIDw6z+XacNYe0kFwkel4zBLQXS9mWixrRfzoAMOYNBn2845Og+bZHa7lFsVAXZFV
	+Zj00ASGdE0Nu9+tvNXl9B+NumaclAOUQyozmW0jdf3QXpXO2pHvtwp5MANVuovkBEV0ygt3l9h
	JAeZMneSwval72t7YXD7LRsGswrABrjq1IZ/i6xQalZ0yctUUxo7oBhpVeZm1VwpJ2pGR39xfWM
	Zms/8jfpHVBd4=
X-Received: by 2002:a17:902:da92:b0:2c0:d097:51bb with SMTP id d9443c01a7336-2c7fc9bfd9cmr15548495ad.1.1782371505585;
        Thu, 25 Jun 2026 00:11:45 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f58cbe35sm14624385ad.0.2026.06.25.00.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 00:11:45 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Biwen Li <biwen.li@nxp.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Liem <liem16213@gmail.com>
Subject: [PATCH] i2c: imx: Fix slave registration error path and missing NULL check
Date: Thu, 25 Jun 2026 15:11:30 +0800
Message-Id: <20260625071130.93544-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two issues that affect the i2c-imx slave handling:

1. In i2c_imx_reg_slave(), i2c_imx->slave is checked at the beginning
   and the function returns -EBUSY if it is non-NULL.  If
   pm_runtime_resume_and_get() fails later, the error path returns
   without clearing i2c_imx->slave, leaving it non-NULL.  Subsequent
   attempts to register a slave will then immediately fail with
   -EBUSY, making it impossible to register the slave again.  Fix
   by setting i2c_imx->slave = NULL on the error path.

2. In i2c_imx_unreg_slave(), the slave pointer is set to NULL after
   disabling interrupts.  However, a pending interrupt might already
   have started a timer (e.g. for slave event processing) before
   the pointer was cleared.  The timer callback
   i2c_imx_slave_event() dereferences i2c_imx->slave without a
   NULL check, which results in a use-after-free / NULL pointer
   dereference.  Prevent this by checking that i2c_imx->slave is
   valid before calling i2c_slave_event() and updating the
   last_slave_event field.

Both issues can trigger a kernel oops or permanent slave
registration failure under certain race conditions.  Add the
missing NULL assignment and the missing NULL check to harden
the slave path.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..4f7bcbeecfd0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -775,8 +775,10 @@ static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx)
 static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
 				enum i2c_slave_event event, u8 *val)
 {
-	i2c_slave_event(i2c_imx->slave, event, val);
-	i2c_imx->last_slave_event = event;
+	if (i2c_imx->slave) {
+		i2c_slave_event(i2c_imx->slave, event, val);
+		i2c_imx->last_slave_event = event;
+	}
 }
 
 static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
@@ -936,6 +938,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	/* Resume */
 	ret = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
 	if (ret < 0) {
+		i2c_imx->slave = NULL;
 		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
 		return ret;
 	}
-- 
2.34.1

