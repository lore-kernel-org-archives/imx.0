Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51293237170
	for <imx@lists.linux.dev>; Sun, 27 Apr 2025 06:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734590; cv=none; b=sOMVQ5SlmPwrEyb/UmZ9+nOS0K+xmxc9YTiBebhtpOjAg2KtNbCCfxO4E6E6rQRO2QrsB60HEqoUaRUC0OZsmmdbWDBO5E5LQYsKjqnFGV16GaqHH6QMkYvx1IJrkGelDs78T25DWsBUyUtHVg3fVUVKD+z/9trDvq1dXxuzqLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734590; c=relaxed/simple;
	bh=JHmA+1ZeQK8oyp8y9eMk6Hv0vqiXhbFGyjgYkZxY8Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwGJUoKMFq3ZKCIkAJ5wOXEWVwRi8uwIFh6yrZIqedBCRrQXrKzhSKiAHsWZq1s/kpMXTvSrADI2+fTGvy4twIGTubzOE67h//BCtbxFJpVU+ZP6EfRI/CZ27MNhUdDJ1Pel9Atoscq0oOzGe5/xg2dJMceKZppPkZ3h2E2OyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3emH/gB; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3emH/gB"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-af52a624283so3255224a12.0
        for <imx@lists.linux.dev>; Sat, 26 Apr 2025 23:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734588; x=1746339388; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arlXjTtgy3BAr37xUh1VQDxToO9hlb9HPCoLz/1bTAk=;
        b=m3emH/gB9o2I7LBWIXRntdbnVe815mGJ5mdV7nPQBGCfowfCll5zqpF9xMhIJNL9rY
         Gd9LhVsiuhqaeVg73uJOmojoUz4AmdMxTSQfLwkZfzu07QopUK/tnvcdOuXgaFAeGCzB
         JR98Bg5YsoDT+C/n9d7E9NJG9r7EmGVlDxB3VbqeRX60wNi2zOCL1b2HZRmnv2wn33J6
         okZ6Aw5wZ0kDAOWGALrP2OamhkS+VDZZvr5e5vrlhtARmVR45/IeR8wovglNyfVaebzI
         3cI4GBP2xtN7QVxmmqHE4vIwG2LZCgOq94+SGo//N2P7nxNJ9jKe/3Q+iWuyoyk2piAD
         0q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734588; x=1746339388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arlXjTtgy3BAr37xUh1VQDxToO9hlb9HPCoLz/1bTAk=;
        b=f1hkWMijkHVghAzt7BrnW0mm+vD1SM53twk9zfMPR/AGizRYvyJSeY+3idspmSFNYV
         fVBWou/oW+Gz2HHOZQoMYYeopM0QOrLYs3+yaj7ktFoCYaA11gh+PcQmKD5ebwFDrJVc
         2CV3fOxZkQkgdq7PFqPPXI3iCOFXq/6Lcjf79Y7LgCBbOlUMoFD0gujDtfORQjJzkoHt
         PKNz0+MksfOa680qBcfRtao2iD3sRDxjRuKD9CUSIKt4IqaAa9INME6dzzIlA0NM3EsA
         RdGrXJV0lEDYKMy3zL03nqqGqP1wWgrIrtSFLgiLAZyhIf+K2EeSyIverKc0xo6I76Ye
         8xWA==
X-Forwarded-Encrypted: i=1; AJvYcCVT3ydmEbd8Ftk1tuBF8AVAeV7jNTbZ5FHb5Jr6RZGTMBUzsc5DHKY3Dgh2ZdTU0aNDoQI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQbbi7dD8T9+FCqltXALbXhZZo/OzfFuJPPibvfdINUaMFnrL4
	A9exSIVUpBDfENtmAvmbvJ2NyMi9kAXkJ9/wyanl0Mn+xK3MDPItcjTdzaOi8R5dMQVN
X-Gm-Gg: ASbGncvj7ctjhWz6rOWN1zYqaSVezQew6eg+Qxw3GDsvwv50vrZURFGqciXcFfVwctB
	b5YNLNNcgms8oBVhNXxJKG3YKIKn/QqzQQhAzwHj6D/57bvPPJyJLZr5Gc5XwYaKWsEw+RJqVhI
	Cq7a5l37oCPoJ9KLX5f1ABosVbugKi4mqyBsotw3jZazo/pyxJ0yYGF9ErMpnl1VczTThngUdwk
	lU/ArlaS5W8ihAKtIviUHU4QwpRKbTWEhPQxWMRfc2BpT193x9gOrN9UL9/bPtDDMCKSdFxO0hZ
	eLwH340TUQCujOrayvc2jd0F
X-Google-Smtp-Source: AGHT+IHI7FfMmiHvegnH3jYRRExzK2Sstbajg7ZocUmpjDuKv+l+0QX83bfc8/fIIkBGnpajgMyTQQ==
X-Received: by 2002:a17:90b:42:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-309ee37b550mr17322947a91.7.1745734588534;
        Sat, 26 Apr 2025 23:16:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:28 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 27 Apr 2025 14:16:10 +0800
Subject: [PATCH v2 2/2] i2c: imx: drop master prefix
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-i2c-imx-update-v2-2-d312e394b573@gmail.com>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
In-Reply-To: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=873;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=JHmA+1ZeQK8oyp8y9eMk6Hv0vqiXhbFGyjgYkZxY8Io=;
 b=brBU5+4z/15z6LPbx1Emc7dlsMzWr4mB+pXCEvGTacv+PnzSKbtWKD2fEFPLA/3wrRBLY49cj
 ffZoQ1gOG/EChkqymt2Edi//dG0kft8qcLuY1pf/DD6+0X0LiDOVCjO
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

In light of the recent updates to the i2c subsystem,
drop master prefix.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a98bf01c5dde..fca3d1adb627 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1689,8 +1689,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1

