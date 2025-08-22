Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA08A27E7F0
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834693; cv=none; b=gvA1vZLeuyeD2wQSUf/Ui+0ygTvPXgDtKI9xn9q8jcmGOJQpn+vmuVv/20u3KHHjk2QvNKkwKRE1oZFf0zCDuVxqhLJe44tHxqTF6edhtaP2CEjt43OqlrLOPI6lj0vXWaLzn/JExkrZSRGfC+9VnPokbFWe7P/M0QJB1+qbRFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834693; c=relaxed/simple;
	bh=E1V6sSqy5U5ix2vZ9xw2GcRNF44acNubcMe6cIl813U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pX/ZAKKqfWZ8SyWT+yAkdQAytqcWQNSi/PHZznKoCIv9225ATDIHi6PlQ+nZcoMFzmIe/6q5LM73JiQEggpOF5zHy+7blrHZCpEgxdu2NooyEzIVtisfT3TegHyO6OpLBSU91f2YoRFJrh4cp7akQRky35xF82QPFH88U6N3wBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Te5XKD3K; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te5XKD3K"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-323266cdf64so1296918a91.0
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834690; x=1756439490; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ic1RSwaMXXzlWjrwYqAcZq1BU5xUJqmqIIBPYXlasM=;
        b=Te5XKD3KARTgYq9Ok2tZNnUoKrvhhQfAp01q7CrZH71PvfoVxmQ2hKDlJqSyRFZT5I
         5pAp0KNulTSXA5JBLzcGgL3k92XGVdYi6M96a4JIDbtzp5yRCrmJiODDoilKlD/0yDna
         ZdFgm9+2SE4DiZsDMPezoCXI9XYIp6bijpjBNyZJYyDRW8mSM3xRj02GKTGN0WeOZEzn
         WG3fHrSac0Qo/3Kpy9uDPbj34itdPkc79kfYYrwprhIXIgIhuM81Zxxrv8henmrTCBW+
         Fx/Gysz9OaEQFGYz1NhP27HDw0eLvxt/dMPOvuV7TKIRxCremH10gSQV+8HpwWb9VFLM
         KCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834690; x=1756439490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ic1RSwaMXXzlWjrwYqAcZq1BU5xUJqmqIIBPYXlasM=;
        b=oIPy3TTZmFf5NisojV3ImJqcwe8mxXDSPzAWcyhVNQKd8Tm9aLAUgYSiUwDM5Exzxa
         w/e3JP/8DRsmFGTXctCb5SqZY+cx6XVJktiOV0yxDCTOXoSQz5T4KGkJZicBJ4i9P935
         OPnCvgxB7llDlWUgwPQ1/LtcuqXgrPTlxFlyn5z8SpzbIKUxsho08ycYU1V5buprPfUG
         jmayj2305Wu1pCGeef0hGH0JyBHs+y9XeId9LrzXKi9fjWrAsi7vLccehedCCnD91LGL
         KWewkX5ZhLTHHsVRTUS4lZIcNxzDOHe7P+Pv0vdznuG4nh2mxHGvzss0QktYlLOvbVcr
         xlNw==
X-Forwarded-Encrypted: i=1; AJvYcCUdIWvCQOZ50z2MZHTL5F2lBIkq87gfjk2Qti02n0iGcgN+w7HX00SAiYeOIViOEiPbxic=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7NIok2w/0HoPhkNbOmn1mg2jBXchCATgUHPcIrr82nsES/eiE
	vmFUd8XsuCgJZpMNCWtAkEPAlXGVi/umtm1tqD2Lar31gcRb+XmzgtyL
X-Gm-Gg: ASbGncuOlkdgqMZgJWXcScvq3nQ+9uev6UPHPRoJCjR1yvhLQ8nE4kzYzrw3cjAHMcr
	OIlSOvbCWMYDy3LyhHRtbd01ysIsuKvpRcD/lGYuSlr2ypanKTJKDA3PLZjz9SyZLVk8gx7q9Bl
	N657U04FxjKNwLr/VBgNatWctBfdown1f3dGLKSKuUuYXzcsny0uFMrV+ltB56+zWpsL3UwS/Hu
	PH0V5xu72k3FQsX9H8S9DxfV6I3FSBPWwFzeVuS3UWVc5uH9x8fY6ukYcEP63Z6cvzjTK4WimiH
	o67uwp6QttfCI8RJqCjD0hDtcN20a+wI8M3RWuPMzUqBFNKtJQzytfwd2xQzV4hpfZSItzYWwkI
	qDRg6cd8kMCJQMnJfg1hUr+zISqhH
X-Google-Smtp-Source: AGHT+IHazmWMn5flz3tUaLeTbaWTObNzUqMBMWJOszgRw6Z/ukldWbaL+PRp8cadzUHNkyL/sZ9JwA==
X-Received: by 2002:a17:90b:3905:b0:323:7e80:881a with SMTP id 98e67ed59e1d1-32518b82606mr2312355a91.37.1755834689799;
        Thu, 21 Aug 2025 20:51:29 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:29 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:55 +0530
Subject: [PATCH 07/10] iio: potentiostat: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-7-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Dixit Parmar <dixitparmar19@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=902;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=E1V6sSqy5U5ix2vZ9xw2GcRNF44acNubcMe6cIl813U=;
 b=aWuPdlGcfJX5HdaU6dQ4HYX84kcudR6WWXh2AU7VNH88OlFqJsDl+0zRF36EXeUVuuUYIi8ni
 WpnWGOqUnKCBWTnDisswIM4TkMfukTERrC0n2E6vcvNG0UpfSGUKNEb
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/potentiostat/lmp91000.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/potentiostat/lmp91000.c b/drivers/iio/potentiostat/lmp91000.c
index 030498d0b763..eccc2a34358f 100644
--- a/drivers/iio/potentiostat/lmp91000.c
+++ b/drivers/iio/potentiostat/lmp91000.c
@@ -321,10 +321,8 @@ static int lmp91000_probe(struct i2c_client *client)
 	data->trig = devm_iio_trigger_alloc(dev, "%s-mux%d",
 					    indio_dev->name,
 					    iio_device_id(indio_dev));
-	if (!data->trig) {
-		dev_err(dev, "cannot allocate iio trigger.\n");
+	if (!data->trig)
 		return -ENOMEM;
-	}
 
 	init_completion(&data->completion);
 

-- 
2.43.0

