Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FA544CAD4
	for <imx@lists.linux.dev>; Wed, 27 May 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779901826; cv=none; b=GQr60TmyE6Qp5Y7LtJiLlw23FCQHaKGjEMqpAh+m7NnoaUSFMDABbgnRTso+hDFslUgGu0acwZm9E872422VFjWcnJqeJhb585vMdjTQSsv5GON5Llq60CmtRwt2UXaHpJTFObtu+atgZZYRzcER4V+kaoF1gZynK/sh4PIpFq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779901826; c=relaxed/simple;
	bh=OTFZL7/TKZtiOSLDKU/FWj1OgAlmrOFX67f30aNa7r0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WVaDIayLT6LmXzuFN75SluSI3ctLdGeQbmdo9u2IjUW6fx3jbqFyP1wMAVNNI411KCVlKJDf9mIrvxK3ztWroVSdJCBbP3t1I65JXcRMRKaN/B8fPYPcF3SwL/5bUYkb7UVyDqVRNQEG7puzR6PPphz1XOua8gG54tu8OtaSTV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZotGOPl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZotGOPl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba4a1a0325so81175125ad.0
        for <imx@lists.linux.dev>; Wed, 27 May 2026 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779901825; x=1780506625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dr1Vh7T1FjGx+SxxnwuCbG7AIOfy8FpD/4EKhw7fhLY=;
        b=hZotGOPlLJ+YytXwcosn4h0nMCZB745T+JKEOr23ii9lOUXYIy36OoKdQ6qtwAI205
         2mtE46ApljZ1vK8WwY2oAFCEFuSqszd3I28IqDWnruyPn/R8No4MVbu87V/Dw2H3JNpP
         WFoNdDMUT2bHkWI2XDjol+Bs14Gn+qvrQD9J/dpOmn0ZRI0enjoi9vG5G3/6+w70lhdb
         vspnJpjue4Yz3EuMQ8JBIDvjEvrFVAzht4DLTSBsOG74TWRt0Pr2K7ZX2WGQy61KtlrS
         2tKOGZUanquu4sH90jMzsjw89QcaP3uJFgre/eG3rk5Jejj4WLPp6L/HvfQeuALOv5Eg
         irYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779901825; x=1780506625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dr1Vh7T1FjGx+SxxnwuCbG7AIOfy8FpD/4EKhw7fhLY=;
        b=B4DFeeMriHozNZ9jNIpGw1m0hqkbAZ+7v94WzEKPChVSmrd9GIDt+Pd02wEAwoPvlk
         +saACUoiQYc0MDq1dkJUsG7xQYrbdmL8WNNLgaL23IYZpki7wZ+aSx0x4UyfQEbHcTM4
         RqZn3nNNnIJKEYLwBFf7SN7jpO26wY53AbYFg5m3Zrz+MhCr7swJuJqZoe5GE4lNbLpQ
         TIm3prqtm3NjFJtbqOn3vl4LDqwLxz+P+ETQ9Rh+uSH75AV45hX4fNQzlVsBDXAeTxP0
         3uJvs4sQhDLrsV0EEQlfnaT3Wi0isFvQtVRo3fYkGPXWHnAon++v+VkL0KFYDd0y9XMf
         roeA==
X-Forwarded-Encrypted: i=1; AFNElJ9uS2aWuB/2rEvFXdnLZElpPUFlg7x46Tk6LbaKCKAM7ikYMWKKOMN+KoC+kLT/veoAZKE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUbl3DbOSs3UL+X8cKwoInVqDspMtS36cLBxF8r0/qKV3t/TM7
	6NW8lv292dyBEt3oH9xNkMtNvpOBr1i5cAFTnBU3fKtFjBgB5Oq30O81
X-Gm-Gg: Acq92OFnXBc8JFK3prVvojWAN6FHNWN8ZFETuYGEpvAfOszri4AMrhQj9VCZ+BEfQKU
	fb9HqhBVbzn5jECPASS/1q8JZQP1Tet+KXuVLHoS3uQJCILh3j4k3GhI6SwshnSzuDM7tDVEP3V
	rrhn57cymtWjPBpvnsxXCnBuMsF9YDAetJpuW2CgyFodUHLVljKlG9Ow7vJO2VS54G3fL6ENSj8
	+2YI8xxUAtoN4CwtmWkhJaWgCFqNUCbiGr/i7VEKtgGS06z5z206kyuikrbbWjYFCyfPpHIiYHQ
	YiZh1B7lIGhCGdmGZzVVu7AcDO4vl50vEjzb4nfWFQLw01PeB5T8Df/aRPzBJZOz9rOqQiDSocK
	wn8XnBtbZ02H1Zs2oWqbhS0gTkArJx0EHCBN9C5/hFxcIzuAom+h+CDB6QFRGbwz9tB2fsaygRs
	1Pqa48I6i5DKEI/4wBTCtwsfYuijjBzb8fMg==
X-Received: by 2002:a17:903:3848:b0:2bd:8fc0:1198 with SMTP id d9443c01a7336-2beb0633629mr262545435ad.5.1779901824674;
        Wed, 27 May 2026 10:10:24 -0700 (PDT)
Received: from ubuntu2204.. ([240e:39b:ee1:f550:f34d:9da7:5be3:2198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5900b8bsm155788875ad.76.2026.05.27.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:10:24 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: kernel@pengutronix.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liem <liem16213@gmail.com>
Subject: [PATCH] i2c: imx: Switch to new reg_target/unreg_target callbacks
Date: Thu, 28 May 2026 01:10:16 +0800
Message-Id: <20260527171016.67020-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reg_slave and unreg_slave members of i2c_algorithm are deprecated
and will be removed. The i.MX I2C driver still uses the old names for
both the struct members and the callback implementations.

Switch to the new reg_target and unreg_target members, and rename the
corresponding callback functions from reg_slave/unreg_slave to
reg_target/unreg_target. This aligns the driver with the ongoing
terminology migration in the I2C subsystem and avoids future build
issues.

Signed-off-by: Liem <liem16213@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a208fefd3c3b..c9ecca3ef580 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -922,7 +922,7 @@ static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
 	i2c_imx_enable_bus_idle(i2c_imx);
 }
 
-static int i2c_imx_reg_slave(struct i2c_client *client)
+static int i2c_imx_reg_target(struct i2c_client *client)
 {
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
 	int ret;
@@ -945,7 +945,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	return 0;
 }
 
-static int i2c_imx_unreg_slave(struct i2c_client *client)
+static int i2c_imx_unreg_target(struct i2c_client *client)
 {
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
 	int ret;
@@ -1704,8 +1704,8 @@ static const struct i2c_algorithm i2c_imx_algo = {
 	.xfer = i2c_imx_xfer,
 	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
-	.reg_slave = i2c_imx_reg_slave,
-	.unreg_slave = i2c_imx_unreg_slave,
+	.reg_target = i2c_imx_reg_target,
+	.unreg_target = i2c_imx_unreg_target,
 };
 
 static int i2c_imx_probe(struct platform_device *pdev)
-- 
2.34.1

