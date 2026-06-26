Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B839DBDB
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 02:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782442755; cv=none; b=agiISY5hy8EYztmQwFbUtT8xIAWY1i3O++emBnDw6a17VHPVuQKLjRbo5/VPL2gPc0VKmT7l7fBaoPI4KKNK0OPwVinbxov8ULs0rFr1ZN0SDLYd/yYcyiiWsoPz7SAJffHJn8r/H0mPO+Iw+86tE8xRiLczRsK5wRZu/ZFP8Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782442755; c=relaxed/simple;
	bh=54Z8Cw8L0KFu3D/Cv1efbP6u76H/GbdlhPOW5yAC0bE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AfuEEBLclWE9OV8JWVq/HYssZFkarLhhYxYbzs13w6oy3XJk93PHCO4vIFgq5uIcAFOpyJG8EpD9+f2soWOr+/PKUNJoFCCuD02FrbwsvFYhxfgvEUrzg0oLcaqLO45PJ3V7qcAw+EQSqB5VqBAmsR2jAwcKcMEXkjEFuWMXk/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqxaChop; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqxaChop"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c7f11646c3so4098325ad.3
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 19:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782442753; x=1783047553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvC4gX1oHDIM5j6whwgmhqEecsHukjk3hp3brUU36ME=;
        b=LqxaChopDl2vzUK8Z5jH3UHhrfQxhqSYLtIrJY+zqnojzWpZv0k9TvjJfmE52Q2F2P
         nLFbOoH9m6QM+EwkdfIcaFwY7erfxH9ufdjDVV+nbcqL1HX67otINrSOtU42HemiD8Xq
         c5/OBxKVOYj6urT7X5WNoDD12nTxLWmRI2hTaE7RTv5T+vDaEJX1EVWgAnE6zBy5FYQh
         Jvt/5v6ZaaDK30Eg6zrpFJP10vIbeF7PrFcquG/MEv9WUt51oWa0LJacL18+Kn8zO0p1
         xvZlZ8EP4sqoTEboMIB06ERNLAIweIw7dejnm82w7euJsMZoXo/t+dxtIrqSUV0hTrlE
         JPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782442753; x=1783047553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IvC4gX1oHDIM5j6whwgmhqEecsHukjk3hp3brUU36ME=;
        b=r9/1I8r4ffJOrmyLj5yXD6zKLWn7vydwYAMQm9D5sPx/b+uRHlWn1u86THSl195nvw
         702SLca9BO94OhOFybP0PPWlvsE29nkgnfrE+WuNvMCubGnjwwmUCFz0p/hZ7O/+NEKE
         ja1kLINVMvmxTzqH+Jvsk6ddgFZC5Kw69rpd1MHglogE788ycZ34PKJJH1Xkf+qOFOfs
         Xgs/UT6qovJJp0T5BrST05G+Z/8dJA+MHcC9STYWjWmVZuE+LgXrUMmW79HJ8/p0uBeM
         mFy4XyaNpwY4iOHUN1LhI/VoJqhiJknuIxLUXBmpuqP73ogZbOsyHTLNePRIfgnW2n9g
         IhOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoC6pyv3pzHuluDSh0U+gphfgxz+wsr41NVVQTVIVu0jfpcKnNL3Ztl1sjYYQKK4XdfAaM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUG68wVOZnOTd+1gJGPaDr41NvP1SFQLrP3OcqG0INz9iLeMHd
	WtYQpbmeDbVvNNqjWQC/JMle1c8Vwv/Q9ZRdQUHVeNesBhIgORF/yuJ4
X-Gm-Gg: AfdE7ckzbygKNIuWTO21QSPcMoWCR6TijnIsqy9PoqIaIDziO1w/VrUgPC+6w+mZ1A6
	L6vqcfY3Xmj5P3XJqvPmx2+E4Y0MQNwjRT5odewnwG36KXYKGtUiIw2yMVhWwko7YRSN0mmj38P
	Lt9rde2DAo/tgoBkFhVxpAteSC9/u3FpQN5wQfgLLKvveczLyr7Vg9OI3HEr+ifyWjWD35R8aPu
	/8LEBRMVDSM3fAnOjMg4yjBdBAX09+BckVCRy4ULRTExslI5O3uv1Un/oBAtY7A+xxtgQOcBMol
	O0VGxhjn83rwobmWODpCQ+w+MkkJp1z8IogkCNnZhB7t7j4OAvJm2k6K8ZyyzMM8VbR6juEWkOq
	H7/mAyI87OFuklqxgGX7DGv2BlnQwz6i0TVwORKCXJrgtcQa7Vchz8GwciSRCmfoPbIhAMNNO0t
	ZBm3sgZkvjz7A=
X-Received: by 2002:a17:903:1acb:b0:2c8:1f58:55dd with SMTP id d9443c01a7336-2c81f58569bmr423295ad.9.1782442753216;
        Thu, 25 Jun 2026 19:59:13 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm31252535ad.29.2026.06.25.19.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 19:59:12 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@nxp.com,
	andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v3 1/2] i2c: imx: Clear slave pointer on registration error
Date: Fri, 26 Jun 2026 10:58:45 +0800
Message-Id: <20260626025846.106157-2-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626025846.106157-1-liem16213@gmail.com>
References: <aj1UR5ddawsdMbZC@SMW015318>
 <20260626025846.106157-1-liem16213@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In i2c_imx_reg_slave(), i2c_imx->slave is checked at the beginning
and the function returns -EBUSY if it is non-NULL.  If
pm_runtime_resume_and_get() fails later, the error path returns
without clearing i2c_imx->slave, leaving it non-NULL.  Subsequent
attempts to register a slave will then immediately fail with
-EBUSY, making it impossible to register the slave again.

Fix by setting i2c_imx->slave = NULL on the error path.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..17defb470776 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -936,6 +936,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	/* Resume */
 	ret = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
 	if (ret < 0) {
+		i2c_imx->slave = NULL;
 		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
 		return ret;
 	}
-- 
2.34.1

