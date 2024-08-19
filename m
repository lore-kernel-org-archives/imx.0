Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11160158866
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052062; cv=none; b=APnBxWxMZ5bMEYtUEq27fNcYs4bdimGEQCUyiPyR/PtscVvjA3Ve341wqgX/txwceyPsexJezMIW9p8+7C+1FRYa0UZzhFfw0Q4FOnXt8qQffVzuzd57sh8aGru9LQQRTHlOY/l2nZd1TrLWlytXgAEttY2L1cbFJtq3nNeFY9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052062; c=relaxed/simple;
	bh=cCzB2PLlp9czvX63xNjd52f9N0rDYZxwBsib+7fMQeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrbLPnOUN9EFu7FIBsd6kkLRHYBDXNqRFEqzpVHrwpeUiV3h156iAxl/59W6PLMP2o7Q2BgpuVRzBbkQvz6SBr8ConXo7oezM1In2p1NMPta7YyawuAegfJcDig+ITNEli0epg3qy7JHIQSaovMp8zXXH7QeRLlYI4dY9nv9j+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJbRIZTZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJbRIZTZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4280c55e488so20418765e9.0
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 00:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724052059; x=1724656859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hORPvwJyh1pncU6srJU2aZd0plw9XdxlfvVdC6EA72Y=;
        b=NJbRIZTZ/lD/RbQA2GhyyCk3U8FSCznABTZ+0dLLY+AbIs3NI37ugtjM9lk7ltywGE
         MscOZitQ6tWBnfzZJCQekE24YTV37m/hwuy6UnLf3w7GcGvGi6DfXm+WXA6G/tg7AbaR
         A3KaRq9OaZEAHbrHYg2bXwLC1XbRFkYZvd5IJI+Lanquz9mGGm5em21UDtx1WF8e6MsF
         RRMgGEsRN5dR7wgLYvjHu1deWTtcRr4FneSweIVOekPUexjZNT72UNQ0t5si2WmxJ6EY
         OZJqfwzpMmNCaBBPzGYWLnrnP3gusLcD393vYZUf5ECM/6cJmJeau7BmfnVMZ7jR87t5
         fyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052059; x=1724656859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hORPvwJyh1pncU6srJU2aZd0plw9XdxlfvVdC6EA72Y=;
        b=QoxCSdi0FsfMt9hND4dNGyO5PeU/AasdveKre01dsXRxMk/tI4tBjUHp/FCRAP8cwZ
         NZRM+64g5wc7Kb5kaHBwMg+gdyJ0d2QrMAVLB/BbiZAlDSPA3+sKqdW1IZSj/jxGgJms
         vnH/YUNB1M2SDhQhqiarKELvjlCyA5nFa7YMF/LsSEgV5FlYGh3ncZpQuYQ/5u3n3rum
         3moErl8bmt92IYDEJGsCKxRO/X5WqirVUizaydF1eyZUGXhBsU/0vX5Q5nvyosB/5riv
         fMrJ3+TzA8qYmFpEG6GlaaX/mskXW+w2AT4O/UJ1ZMHgvoUMN+QexoydjQXDgBfqlEcK
         D6cg==
X-Forwarded-Encrypted: i=1; AJvYcCU3geNC1tiGbBbCsMQbzxdfgi7UsZvqKVrFevYtw/O2BpRSQRFFxTr/8PO5HIOlziH5xip9QhQMtdZIsvJk2gswvS8x
X-Gm-Message-State: AOJu0YxkLeBmlM8g2WC9jpIZfSlsLBxjqSeG1i9lz28ISW00VKcJTChG
	FivrzqLlEWWGITW5GAARB7CYinJdDgI1gGDq/cETUGJyMBmExC9t
X-Google-Smtp-Source: AGHT+IGOTzKSg8W8hVyaEXI0HVPdRysysLEpf0RHZuY8lmPFwi3NAM0xoi+k233+RjaJ9gKYv0ipDw==
X-Received: by 2002:a05:600c:4f52:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-429ed8a3958mr68907965e9.0.1724052059061;
        Mon, 19 Aug 2024 00:20:59 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm9683734f8f.79.2024.08.19.00.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:20:58 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v2 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Date: Mon, 19 Aug 2024 09:19:09 +0200
Message-ID: <20240819072052.8722-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819072052.8722-1-eichest@gmail.com>
References: <20240819072052.8722-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Use the relaxed version of readb and writeb to reduce overhead. It is
safe to use the relaxed version because we either do not rely on dma
completion, or we use a dma callback to ensure that the dma transfer is
complete before we continue.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e242166cb6638..ccb466c50f598 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -313,13 +313,13 @@ static inline int is_vf610_i2c(struct imx_i2c_struct *i2c_imx)
 static inline void imx_i2c_write_reg(unsigned int val,
 		struct imx_i2c_struct *i2c_imx, unsigned int reg)
 {
-	writeb(val, i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
+	writeb_relaxed(val, i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
 }
 
 static inline unsigned char imx_i2c_read_reg(struct imx_i2c_struct *i2c_imx,
 		unsigned int reg)
 {
-	return readb(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
+	return readb_relaxed(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
 }
 
 static void i2c_imx_clear_irq(struct imx_i2c_struct *i2c_imx, unsigned int bits)
-- 
2.43.0

