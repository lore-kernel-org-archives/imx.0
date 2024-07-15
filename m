Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59D1E528
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056718; cv=none; b=FFv5Zz0qh5PRgOHCNAHtp5iGX2BK5ll4Zqd5X6p4tTX2c4XhF0Wp7TUMhpZw73mgczzTe9riEFid9LQwsBcudagaQnNmB1IK/Rpg3XbUYDLvJffTKpu1baAfFDQfgFyDzw8gNSyo8ukAXbXRJMsQlRyNI9UgeMJhQh42iQv18Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056718; c=relaxed/simple;
	bh=HX9j+NtsGcCDjemXexGc35YSQU3TKNC7TnNWSqPdoTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dq+AsnaEn8+NcyHWWFXO+C9SIQCmR3ab85s7LJQoCEwv+pxrH19GHSheuM5uX13HLGqvkoSxzMRg8RR7k492Z3qtSQDq9LoHFuiWvPmarR11MMH7VGm+WWW0brhlSWu/rIe0opcvlnUZ6rEEzbNXYsJj69GWn4kXhtuOFxVM1OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6w0P2Ws; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6w0P2Ws"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3678aa359b7so3322661f8f.1
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 08:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721056715; x=1721661515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce5HKGru3176tg37KzVwYW1GSZqa27PAYLpfwOr/uas=;
        b=i6w0P2Ws6dF8QXZDPwR90JRGqA8aJv44YN4XdKtdK5U5HsWtlUhIEmSNJTXCV5TcRS
         SajE95dfC9uSLxJinaEvng6olkd5+n/BzgN5zJTbvAs0Ay+wXk+jcho/xJoxiNY+9cfx
         rmJAxBDp8Y2eUzOk2gJZFQgtZXqxefY+Fj9p25l3CP1rewCG9ZWnic7+Toq6XZEiYCEz
         XvyqlIFF2oaQWun8OhRpwG02afFYoUkrJdNaHhtHKy9oG0zTr9vq4WcWQiFTVqSyxHBu
         vYta25ELc6rOMfNQZsxx7KGSHSC8ehShtT+69ZB4rXesOcEhsOYyZW8GMqI/Mh9M1PBr
         1rDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721056715; x=1721661515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce5HKGru3176tg37KzVwYW1GSZqa27PAYLpfwOr/uas=;
        b=PN9WMb9Dv2HwWq2uUIGS5AW/Qd4Edyc41/o8XZDH38GCNYP2H28jfMfNOeNbOUOKC/
         IPh7UdMewGIAXpJcicx3bMds7OgweGfxdRYErEnoJeD5qAHBv+t0TxqJTe85iGG9CtTW
         dLirxFyresb3eazQMBaILTXht3rIGGRtdYsjnq4yGF87ZfISGmmBOeJTMxOuDYFDD9q3
         QT4PbWfu/5BdE0M5jagzvCbAotuF2eZY5siqM1Igur2A3Bq0VP8aQmjFEcrz+6r0nvGg
         VqPmCsOeSrpsvgPZdMkkccZP5OVfD/STRu7tJQ8y/97fhTghWALmL/2KivtcXOoVa8NB
         4LOA==
X-Forwarded-Encrypted: i=1; AJvYcCWhvRQzpMavgSPwIWmUxO20ZtTLR5OeyWaN3o07/+AD2rA5cBt+dl4T5FAm0qZQyB/OeXlTM4UEgTBOb7FaWeK2uks4
X-Gm-Message-State: AOJu0YxsBfkOgDNByfIGBbQTo/P+8pQ/V73aSIOVIkPzQ8U8qKZnZTzT
	rLGkx8DyWhLRL00HyZ5Tsv7ho6DNrE+xApXAFEfwBJhXHa6/nEuU
X-Google-Smtp-Source: AGHT+IGbuGcZ320eIDhwquWRL5r+JmXNJtzpqJAy33gfEJ4SEJlISeCaCZaCyiBiVy7I1VVyq8qHyg==
X-Received: by 2002:a5d:61c7:0:b0:366:df58:1fd9 with SMTP id ffacd0b85a97d-367ff705372mr8165666f8f.24.1721056714706;
        Mon, 15 Jul 2024 08:18:34 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:564b:c18:f4fc:19ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbb5bsm6682609f8f.80.2024.07.15.08.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:18:34 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	wsa+renesas@sang-engineering.com,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 1/3] i2c: imx: only poll for bus busy in multi master mode
Date: Mon, 15 Jul 2024 17:17:51 +0200
Message-ID: <20240715151824.90033-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715151824.90033-1-eichest@gmail.com>
References: <20240715151824.90033-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

According to the reference manual it is only necessary to poll for bus
busy and arbitration lost in multi master mode. This helps to avoid
rescheduling while the i2c bus is busy and avoids SMBus devices to
timeout.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3842e527116b7..1add946e3bc20 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -216,6 +216,8 @@ struct imx_i2c_struct {
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
 
+	bool			multi_master;
+
 	/* For checking slave events. */
 	spinlock_t     slave_lock;
 	struct hrtimer slave_timer;
@@ -481,6 +483,9 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
 
+	if (!i2c_imx->multi_master)
+		return 0;
+
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 
@@ -540,8 +545,8 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
 		return -ETIMEDOUT;
 	}
 
-	/* check for arbitration lost */
-	if (i2c_imx->i2csr & I2SR_IAL) {
+	/* In multi-master mode check for arbitration lost */
+	if (i2c_imx->multi_master && (i2c_imx->i2csr & I2SR_IAL)) {
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> Arbitration lost\n", __func__);
 		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
 
@@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 	}
 
+	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
+
 	/* Set up clock divider */
 	i2c_imx->bitrate = I2C_MAX_STANDARD_MODE_FREQ;
 	ret = of_property_read_u32(pdev->dev.of_node,
-- 
2.43.0

