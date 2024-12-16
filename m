Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4A05647F
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734362329; cv=none; b=b+yulA2y5pPhWAt9E8BVSY2rSn/KfHcSdS3q+XhHuwbjBqY5zjMwIXEno+6uqngB5YZnt1zQTmDTkfC6OT7IlwAF5RNVVTw9rnjfEfjTSfq/y1GhpfpE6cyGlU0XbxDHLNedy3RKgYZxAgo+qh485YjBpuw277f7Hqayy72s4gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734362329; c=relaxed/simple;
	bh=UzGoSy4ZSRHs3s5CX4llzjwYLDEDVAKyM9abgyG2RGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8nyIzEbXhUBywZzVKqu36W7RkgGSfVwFlW8oStxnr8knBD+bhbVTy9W/IrrpxHtuXOXDhY56DHTE37WrG4vkE6r5eGSr2v/6pgaHSDzDyCYuleNVJhE1huLpFO11P6wqXSGF6BOXXpiAXY5OyDTZ0/VZBUlK02awh9HGTghdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHXjt9fn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHXjt9fn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2029217f8f.0
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 07:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734362325; x=1734967125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zTbfi6p8iEyDiLbIuWboyEfmfnDgznyILb9W4NSw86U=;
        b=BHXjt9fn2w1g1xzivHs028MbTjNYqOktbSUrPyYrSPaZk/Xa9epec4iT+zRPSmuvlt
         6KcSeeVAKqrjVqtC9zT1WCTxBsjTYGaOZH7zD+CGTl6yrelh3kiH67L9ov3mj2qM84dH
         bfPHr/WNvI8uog5N8lsrVQNkbcHV3Naq9CoQ/+yUlgpvKjg0ZqLM9A7uVG5KJ5T7i8iY
         lWjdnalqZu+6f7KlBhUX060KAqtqMIbcsD0hLN8bbfA3cwhmCx52KPe+mlMeKj7NNZU9
         +FlMQqh5DFwCOD0eAwTKYN/e27zZjaaY9ExGDd8wmxD9Txj0mVccoKN66hAMg60VWrt0
         BqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362325; x=1734967125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTbfi6p8iEyDiLbIuWboyEfmfnDgznyILb9W4NSw86U=;
        b=ULVIeA3CUZm+Bm4rPQqI62YrKfGPbcLl49CxtFYW2z4WMrP3v4QqDKVWfIldAkw49y
         Cj+eQUB/dzZpZ6PEP3uqEdSErYTWYtHIXK/M4RUnEG8YD5R9ODRxiWl6rrkhSMwi5d8C
         tBnap48q/w3DIFrz/+yF1214Rob9kM7wusLA3Jt9fVrVahjBgkZgxkSp8SM5GDPZGtn8
         u7hHpIWBgmT6bDY+unCMP5hyoONHXwV4rzXkJZMFljbO9vME767u55xCWdRaU4solWKR
         M1JFISf7d3x/xBPlLw4SuAaE+0TL7KwGlOhKIi7JT6TmAbdapQZZGWJYTge2L4+VWu+D
         O7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcDM7k1RC30vEQ2DurLG54v3nHSv6FAp0hL9ayxMkfUVqaW+fmhNRXA5LkAGtlry3BtAE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhsKMBzTqocUt1602ve2yyyrsYF8dD7dusuG9hoXfWXof0AcwS
	/AQhvk9x8T69ke9Uo0rh+qiQj0oPcXqR776aG/YbXC8JBEqsDI29
X-Gm-Gg: ASbGncuIeP5rxoCWIGIO475oj0TocQlQK4m2k/LoDps7XZKyDKkhX+VSdrlxYsYGETd
	euxRiPf17pAyKbha2z98PdobfwxDn7jXqoxvphZXZ27nzObyX1Nber/pr5NlyXX6WK2QGPwxtP1
	RZAEnbtJgJTDBNLxvzO4WiN/MsbWW9cOPZZ2shDGiH7q0LJpT9QKBiOAgaZ7205D7NMZ/X5zFGO
	HKVZdZRaZoXSeYquYnLc22ymPBNHv9j6LIoRkZDJPIXnI13dgjbuRSPClRrKHYthty0agEH
X-Google-Smtp-Source: AGHT+IEr92SrsyLf8UEGh/qJ4AcuJCbiE9QwqwVLL1sL4V60D+nHXLQW58JemQqBLG51UkqEem66Mw==
X-Received: by 2002:a5d:6487:0:b0:382:5088:9372 with SMTP id ffacd0b85a97d-3888e0b88afmr11406631f8f.43.1734362324993;
        Mon, 16 Dec 2024 07:18:44 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:9096:1cad:6f4d:511a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8015f77sm8351129f8f.26.2024.12.16.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:18:44 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: imx: fix missing stop condition in single-master mode
Date: Mon, 16 Dec 2024 16:16:40 +0100
Message-ID: <20241216151829.74056-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

A regression was introduced with the implementation of single-master
mode, preventing proper stop conditions from being generated. Devices
that require a valid stop condition, such as EEPROMs, fail to function
correctly as a result.

The issue only affects devices with the single-master property enabled.

This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
polling for single-master mode when generating a stop condition. The fix
further ensures that the i2c_imx->stopped flag is cleared at the start
of each transfer, allowing the stop condition to be correctly generated
in i2c_imx_stop().

According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
5270), polling the IBB bit to determine if the bus is free is only
necessary in multi-master mode. Consequently, the IBB bit is not polled
for the start condition in single-master mode.

Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index f751d231ded8..cbf66a69e20b 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 {
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
-
-	if (!i2c_imx->multi_master)
-		return 0;
+	bool multi_master = i2c_imx->multi_master;
 
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 
 		/* check for arbitration lost */
-		if (temp & I2SR_IAL) {
+		if (multi_master && (temp & I2SR_IAL)) {
 			i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
 			return -EAGAIN;
 		}
 
-		if (for_busy && (temp & I2SR_IBB)) {
+		if (for_busy && (!multi_master || (temp & I2SR_IBB))) {
 			i2c_imx->stopped = 0;
 			break;
 		}
-- 
2.45.2

