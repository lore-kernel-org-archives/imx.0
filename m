Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C7F1F9ABA
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 22:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731708123; cv=none; b=I8hZFdYW3rmw+UZUyB4tGpgcxylNTTqMMd8aDoBBoGZ2NsX2YULy4kpVpmIB4A6dxdtwu3Xxw3Cew0pYfeIk2NeCM4W6Wr4TPdqjGYTMrbmHwCllPQBzxODMFUBbwwEN0DfvIzmovqniQUgCDoHAOiFn15Mt4JQX/GyOTDCMJXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731708123; c=relaxed/simple;
	bh=mjXdxM/krU+P7U58TYMn8wwGLeOHGr9wU0Hfmf9pmZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbrHtpkL5spFtORjuv5RMlb59HDRbQPzarn1AVobulrEH2553U2M3a7B8nj9W5HMpmrU6D3CVTqlIoAl1hYY77Ww6jFAKiwhJQt6UNjNELyDiM2dC46Fr8zFneszGgeZbYaBRv7MksPx4B1jc02BvKbpJmbnO4asUGv7E77VSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com; spf=pass smtp.mailfrom=mandelbit.com; dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b=QqWsnRua; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandelbit.com header.i=@mandelbit.com header.b="QqWsnRua"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-381ee2e10dfso37499f8f.0
        for <imx@lists.linux.dev>; Fri, 15 Nov 2024 14:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1731708119; x=1732312919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7BXM9uHlPL6jMEU0OEeFrxwAP6qySqgpEWYWoYZaXg=;
        b=QqWsnRuaaMi0mqDHhp5IadOWiG2lfTHhLE4ioQQhH0us8KbI3M+vrd+499g8llsv4l
         W8sflovrYZylZV2pLkTVVbFTj552kZHfCi6qK7flbRTWIhrXVez5KeTtYOUF/bGmzDF4
         Jk0NEzCf0cMSzuZtWB8UMsfWweANR2v239shJu6WLfPqJpyAyivN/iVu8ljsy2ISiTGE
         kX82ub3r5RMgVnrud/iyP60f8+3HI00Hj9tL9f+DYBmVoMeVCAqs0btZFBVUA6ULDxcO
         6/CIgo13Z6cjVGagPUb3ohf0/TQ1YZnhbp/NdN6gNXpRKvy/WQsNv60/Wn20Qe4Mq//2
         3rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731708119; x=1732312919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7BXM9uHlPL6jMEU0OEeFrxwAP6qySqgpEWYWoYZaXg=;
        b=fsqe5XL568kNdiM2l9oWUeI5inAfdgV4wqs52HJeu552tzRxAvBNc3TjbzZtaNsV5c
         XFCyLd7tw/edJ8A4gmgwLBsWm8yqij8T5Dhwb7DRlA63vRsvJOaW61Df4lSbvgIaw0IF
         /GGnetuYct64qVJnLLQ5sJzBv+asz0/7M4zP6a1XfdhL5rtvqNUkxlZFXIApxSdl4UFQ
         Uw5khVc4rsSyStz2EhDOrxdz3EiaUScQ3w5WRzKNXB9g58qwlKDAWtEckkG0kkk7i67a
         tNJjR5P9wJkiSA2G/AZ0VSSoKKz82iYEZQVuq8/yV3nDNANhCb13B/g/4M6FQokeN3mX
         3MJw==
X-Forwarded-Encrypted: i=1; AJvYcCXSWRoIau6vd/8g0Bb9NU8S70hYcnFsTgommjkiPy10KwMmYVKeAMiwV05Y08PoABSbCLo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0LADePBNuni4o3UwaGEzCc/eiRtmmWjLcTrcChxFHg0D2lVub
	4XZqrkjLUcSq7w6O33qy8OCkL59hZ9lNc8EyndeqOwFDGhMuq9RffZ6OpMDuyF4=
X-Google-Smtp-Source: AGHT+IGjkzoAQXFxARiQrL8p/xLqSrw6wqKEEJ3PXcTvMHBD/NA7oyekerT58FzZoi2a9uv8ptBRRg==
X-Received: by 2002:a5d:6d83:0:b0:382:2e9e:d68c with SMTP id ffacd0b85a97d-3822e9eda85mr2141749f8f.38.1731708119172;
        Fri, 15 Nov 2024 14:01:59 -0800 (PST)
Received: from serenity.mandelbit.com ([2001:67c:2fbc:1:1b94:c354:f504:96f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2e35sm5470537f8f.5.2024.11.15.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 14:01:58 -0800 (PST)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-spi@vger.kernel.org
Cc: Antonio Quartulli <antonio@mandelbit.com>,
	Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi-imx: prevent overflow when estimating transfer time
Date: Fri, 15 Nov 2024 23:02:02 +0100
Message-ID: <20241115220202.31086-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The words delay is computed by multiplying two unsigned ints
and by adding up the result to a u64 variable.

The multiplication, however, is performed with 32bit math
thus losing data when the actual result is larger than UINT32_MAX.

Fix the operation by casting the first operand to u64, thus forcing
the multiplication to be performed with 64bit math.

This fixes 1 OVERFLOW_BEFORE_WIDEN issue reported by Coverity
Report: CID 1601859:  Integer handling issues  (OVERFLOW_BEFORE_WIDEN)

Cc: Mark Brown <broonie@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/spi/spi-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 0b6b0151b3a3..eeb7d082c247 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1685,7 +1685,7 @@ static unsigned int spi_imx_transfer_estimate_time_us(struct spi_transfer *trans
 		words = DIV_ROUND_UP(transfer->len * BITS_PER_BYTE, transfer->bits_per_word);
 		word_delay_us = DIV_ROUND_CLOSEST(spi_delay_to_ns(&transfer->word_delay, transfer),
 						  NSEC_PER_USEC);
-		result += words * word_delay_us;
+		result += (u64)words * word_delay_us;
 	}
 
 	return min(result, U32_MAX);
-- 
2.45.2

