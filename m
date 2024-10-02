Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13181E7669
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868032; cv=none; b=evW/Lhl+jIp3yqszBihrVwIyqVkkr9iABIe1hVz9pQi4fcrOwFzaKoosL9yCRk606iXE0pSW2hKLkBbAlNSud2BBW9ZBxlNybiMMiLmmeNYCOVGw8KOTFH4i24e8r1Fxpg7zF+I4qjkRIn0oGliILgAUz0tEQGp4yz5uQjSCtAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868032; c=relaxed/simple;
	bh=xEztw/GwwhLD/gX/2JuP2k+o9OcVESh2PGvr7/izPNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WghZVzvrRSu8ttHRbZiApEfsXCF9Wk2NV0etDJI2MBWZddy5CsHy7wtz7h56IKzZ01RUWbUltyYQvdUXqeCts2lQzA6+2EaiZ5ah0i+ksxkZt49o7C/i4LCND4JF86BpGq0pcBc2+rfuaB8rV+cp0DS7826eWteifq3Bpcv/PdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKtNIb9q; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKtNIb9q"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37cdbcb139cso3752390f8f.1
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 04:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727868029; x=1728472829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWe1LOAQAUHDMm2EMz2P+3VNJFGofn6qsW8nJYyiXVM=;
        b=TKtNIb9qK3D2KNQ9wgmhoBiB35NaW1SCcuDgSQ8kHDQGWWXC6LgqKzXRXs/b4FY0R9
         iJra0164mQsqJ6rkJAKnYvrLWwTAo8ePN9/FpD+qcjW60bQm4RmmInNVZ6gEzj2dkC7U
         X33eAaG02dj+zFhbdLXikfITcmzUTHWgvHMohEv0VxqOHfSsd3yRSbR6rSB207PUWFOO
         w+XhADH2tEsz/uH3nLBosnAw9HUQsR6c1xfZSG3iw5GORq3JJiAO4qNkEOaMzFhjtaG1
         fjGJw1yeAzyT2ULBTdjPocLoqr2idGn4HvJ5KZVgFwX7gj+iTNmtsVia02iaEFdpV1wS
         P7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868029; x=1728472829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWe1LOAQAUHDMm2EMz2P+3VNJFGofn6qsW8nJYyiXVM=;
        b=OjrtBPm+GSWwAb8n3ehKKkIihW/eexIQMZ07+YqodbiUP3cudRXgTt+8WA4JNwdfTg
         5/Uv3yLMQWUNWOlzSdYOGFhnldsyZB0cEZMGzjgA2cpSELYV7lgOZY/RBE4HqopGSDLX
         uVC4opo8rVTnV3O/4fN5OsENQUZKY6QsFuy6CV0sCAuCbzNqea7U28FoihJ5VDpNVbhc
         6WTJMfu3u8itYROHWDNl21D4WiHht+RqV2ev4gjeoSHeTPwJTantBTIs4XWxdZ05B7U9
         L2TM7YRyACfPCpUJ/JCFnnFWvUh8/mwnj2ZW2fbN7trp3zLNg7wpzKn3H2QnoZU3Dn90
         A+kw==
X-Forwarded-Encrypted: i=1; AJvYcCVWoDMdX+Onu51R4P1eQcC78a2Mdo55pBC3NM5RGAh1LnqYiL6ZB1g1h3iLK3nTIrg0EeU=@lists.linux.dev
X-Gm-Message-State: AOJu0YytCgz3It6HaMEhYHihGdBmXoFEmb6C6xp1cDq0WunBvGZWC2c6
	C49cwcqSg2HzgByjZ86oZJecPPUp7ULsvUlLy116uJJhQ3uuJ2bK
X-Google-Smtp-Source: AGHT+IFGTSatLO1Ox4UQ8gJUxFQ+Sve6VZQyHmLuQ8fa68lXptO2HqFrHIWSzqjI6q344kc1YAHVhQ==
X-Received: by 2002:a5d:6189:0:b0:374:cbc4:53b1 with SMTP id ffacd0b85a97d-37cfba0a641mr1674756f8f.40.1727868028950;
        Wed, 02 Oct 2024 04:20:28 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f771a1209sm23530685e9.0.2024.10.02.04.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:20:28 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	francesco.dolcini@toradex.com,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v4 1/4] i2c: imx: only poll for bus busy in multi master mode
Date: Wed,  2 Oct 2024 13:19:39 +0200
Message-ID: <20241002112020.23913-2-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241002112020.23913-1-eichest@gmail.com>
References: <20241002112020.23913-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

According to the i.MX8M Mini reference manual chapter "16.1.4.2
Generation of Start" it is only necessary to poll for bus busy and
arbitration lost in multi master mode. This helps to avoid rescheduling
while the i2c bus is busy and avoids SMBus devices to timeout.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 98539313cbc97..fbacdfaf6b28e 100644
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

