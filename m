Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1032253FD
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834704; cv=none; b=N0njfCZTsmaT7+c+W1z/hUpJklytTC6QEfvmnUIkSnWM3HXDoOrxqxq1PetF9FcYu0IRczryIk+JWZQBSGQqLt80OGjH0EZZvtCRe4W3ybNqJcXTr1oOROKrd8/2h+LcYtdauSV0zYBsFvzAJENYqU60SfTb50eEH7G7vTWCwSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834704; c=relaxed/simple;
	bh=9sYG9bHos7xB9NTLNoGx74dL9X517YjRrTR6gyjXoAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a//o+9Jyc8NEhxBTuXATnn3+cpenxtM8DSMGvQtLoUq+n0V0yWZZJaaqNFVm49okbUCVIRPcWie94OLoQ6oJIjtln2qzvGWl7uTERVRlrQuBa52SqBAc79UIZef63jZSKn0QXwFq+NuLl0uNzbx6GDC+4w2Kc1uIxUZkWIKMNLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OptVo6rv; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OptVo6rv"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e92b3ded3so875870b3a.2
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834701; x=1756439501; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EixXrQYznjJW/63oKtisPH5UyKT6tWjQS1Ri3VBxh8=;
        b=OptVo6rvdM3KprJLykspxM5fCDTr7G6PL/N2HiYVycWgoEohhGdEn0Z3BLqQd/VJcb
         Oljw3gpCh0oTV32Irq1cTYWQUk6KvuR/Occh5BaFId7VPYOt+yC8SPQxdU1mQtbIBszm
         tiKbC+zpfAsOWED9+DHgWn7E7/yt5Of3fowJCmmll5AefEvK47OMwKP8SV7NzccTNCDJ
         oX4E5ImmlPcrlFsZdr5NQEODpde83g1PqSUt59hTIjTJ8m8lAwoNT8bqLsY57xmWau2b
         O2spLpHLxsHWuMQ+NjS+nMbI2iSj5VO71zv+1E6mG0BnwWbg0Og+I3mnca5TKGexfW4J
         6d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834701; x=1756439501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EixXrQYznjJW/63oKtisPH5UyKT6tWjQS1Ri3VBxh8=;
        b=XPBWFCH14eMJQZlo8fASdqdEPuBJof76bSNbvRy2SNLo9pvV02kZeEOnNl3yXv6huB
         AQetcKha/NfjQADiCp74U8jUGFVNdEZRH6nX/3kPs/aIjd1Kqp/KRp3A8TRE+X7uLZCL
         sJpHuLRabB5ZmbBSwix54cE/epkmyCXS3kd8Y8yAE04u4zZUkcFII/M66Bu1N2Z+Akjv
         7/K6ITGgS0K6Qr57NqGGhE97Ly5OnmJ6mVPvE8l3CKYx+F8G5EVK4TV2ur2SC7sdvmlK
         eD4tdZR8TSJ57XgmE6yEs46mh1R7Sn4+g/QgaDXnTuwT8r0F29k3zbZZx1xR+Tg4BK5j
         NQBw==
X-Forwarded-Encrypted: i=1; AJvYcCV3DDipx0Ud03PgwC1kJ/UdHCnoJGqyXvFpGoKHfyePAdu+/mA5XR4GqMM+uivScvEHBf8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxF0tQvqKQXhfznMTIB05jMEd+nJ+GftYfHXPPIO094otufMz4/
	XlYy+itYd3mQb5F82eQuvtElt2PJTSChmO+9kWVXeKX3tljkUc9i1wO6
X-Gm-Gg: ASbGncuV1YkyK6hIJyKfXf92BfkF7G77O3T6IbQ/nFuVzMkkkSkJvVQPl1xTFkUgsAj
	Co4ejGb4g1oat22sF4PITHV6A9y1GDFVZU0K3b5MT2Gj8XiHUAlxveKgVUvuNHzMoa3CaaXgBcT
	DvRmMY8TE1hFTVfZouZPCuD7Bk7ngK9b+gEkQEgzp/HSAXVxEdECB/tLdVeDFXfTUWXBdB33Fx4
	Z3rafKSatdwVcA0gm5/tMy3/z1V+/rtUBLeK3LM12v4XILja6vr4h98T8g/rPY40iXUwL13a4Or
	spCttZBCx7nsLAhQKGDcaAPIm2VMEDTfYcib3uAP6/Ryw9+GHdDBCaZfWCwplsPPc9CQLwwXxT1
	qp93CE0jG1WUKi6pGJqPGhwYsd4uZ
X-Google-Smtp-Source: AGHT+IGmG2iHm+kPtdB8VyZNf1Keeivo0b/Ddo4YxYKdTXfFyokHg1nQnJSsPhPXXQhViC7G78ZoCQ==
X-Received: by 2002:a05:6a00:2288:b0:770:3064:78fa with SMTP id d2e1a72fcca58-77030647984mr1909008b3a.2.1755834701233;
        Thu, 21 Aug 2025 20:51:41 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:40 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:56 +0530
Subject: [PATCH 08/10] iio: pressure: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-8-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=834;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=9sYG9bHos7xB9NTLNoGx74dL9X517YjRrTR6gyjXoAQ=;
 b=NI1M2YGG1OwJpwbLAJnJ6Qnit+GivyUJswFcnSjAyT2MnVw5sTWxxCLJoS3GZsCiajAbZFUyc
 84hThunItQmAHPZ5dwKUdMNC8vDzpzBO3EbM2n4xQrC+R98ypIPo+hY
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/pressure/dlhl60d.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/dlhl60d.c b/drivers/iio/pressure/dlhl60d.c
index 48afe5c94000..c5f4f5efaef8 100644
--- a/drivers/iio/pressure/dlhl60d.c
+++ b/drivers/iio/pressure/dlhl60d.c
@@ -294,10 +294,8 @@ static int dlh_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*st));
-	if (!indio_dev) {
-		dev_err(&client->dev, "failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	i2c_set_clientdata(client, indio_dev);
 

-- 
2.43.0

