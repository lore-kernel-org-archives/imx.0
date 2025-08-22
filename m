Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798321FECBA
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834681; cv=none; b=o9YZ3iajBdhhf1pkRU7aDAE+TYQPs8P+SRGTvqSBeQ4/N0Z34S7Re9PSsgv1lFYaJO4LgOty/PbeJPK3cK0XnvXeuKzZL1c/f+2nOEwKbmirj//+xHxpdtpOf3wKYO2jlnoIvUVrA0H0a7IdfybvdjvBZBh5ZkHSD2J/2zIdW7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834681; c=relaxed/simple;
	bh=pH5Ai2hUrCDisN8BOZgbmkwzCO0ZlcGH3OL3twprr98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAxqNN2nVRMtac+TGZlcxKNolzx6eT1IxA1w8PzzbmFyB+HmmmkIjOe3U2JjDgfdQXp8YDMZvpKRxoP7qKZXu6h09/x7a38D6PTEZaykleQGue78pfag2d1CAR/Da2mYIeIlA5rFVF2JH99eeNZXcMBo0RP12eEugcb0T4B10jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lsj/vNh4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lsj/vNh4"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32326e69f1dso1845350a91.3
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834680; x=1756439480; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=np6SZ5B7upvOBORmSoVmVjKcF6KBdFBAeJOHZZ+4P0U=;
        b=Lsj/vNh4Krm95eytco/IxfU+8xszUjv1epl1IglYdW/x8pCi8zUOY90QmsMZieGsF6
         ItfQI5BIvyLjainxMundzEAlqYZ5Zrha6U9BJ87PdLKRZR/jIY10hVkM2xzOSRJHdoNn
         P12LP4uSleux0pD+wviPC+sx7WXrxrp9k4O6PMmUpvYhPC4L4o7bD8r8aDnZ1Giqmhtr
         YG1viWjvEAyFomOE4sNPFHTQpAMK+DLei64QQmYdjILVcqm38mG2Fxs6tOqDVMKtxNPz
         Sr6BExCLixSaQ3oi3zK+Epc0jJJ4yfJU2EwUeMRXPc1ACmt1qaUJF2y5LKRUdnVXU/zd
         87Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834680; x=1756439480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=np6SZ5B7upvOBORmSoVmVjKcF6KBdFBAeJOHZZ+4P0U=;
        b=cPr6ZWctN1wYg0zKRneTe8AQoZZQppAiaYqE+6pwveHsuEiKnrmv6uV4c4Xqt2lvZu
         aaugBtzyJl/oBe9wxrcRaojb+ibuXG+/7dHS/sycKeEA5rFltIqP7ZcYoxzym1H5U5Mw
         vB2XALHN+Rr8/AS1ozG6r2ktOaaI/bLjgxL0jVMXnBq/6dXGOD/9NAt47o9QKz/Dp+Dy
         xpfwqO/xiQ2ITZ5pAvLgVq71EEQ3TcskNCWlu4b8++TeyxU6kSXi2qwaZ4vJHM3+KXYK
         kRH4wJ+bs2IZWQfEuPpxta5fahu+XtWDh64uhuXHwho/syXLTHI/pUC1PQGbfJ9/zGdQ
         3fdA==
X-Forwarded-Encrypted: i=1; AJvYcCVMKgzpBXEE9wQZTLGuvqNngEyiuzDqFNb7XsbLL4200HNJablqS4DlzB+l0D9SW3EFlzc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5ErnXdPCz+cWQnWIriNy3YcFUZ66QXj3RWUwQlJD7MC1pnqlG
	zsJJFT8n8SJRToNtm5RJ+tboPN71IHmt5FubJGmrIPq+geAm8lbrBeBg
X-Gm-Gg: ASbGncs/cvOliv1l2K1iEBYWHDMS7A7Aj5JYPTgDezK6+LYbZ2ISgJfeFLyfxQvzSuP
	G4qYVrDsoqAnXQsHRpLMjjQcEHltXJP+lwv6CP0U9PsKU8zXkmf/rHFHJg7dpmucapUxKBbs85D
	dCVxkV8rnGpff3sqFVYwpqFrliN8UqZvhgIfqNYwI3CST5SqX9OHO3st4h20xxpgUIF9dtyD6iq
	JG+tdDzHSBLw8jsyRTdHa4IfAnWKGJMWQlYM/xWnSKSIEu9P+9LlugEa7K7UUkRyJYXhn1LAnuK
	c1DD8PS8jpSLdVyQJtLy438uihERwWlvdFF0QObAg7IoLPfdf8dAyjgv9E6vR8mRQGS0ppd9Squ
	x7chCp8JZt0PAzhDf49l1dqzcmtq1
X-Google-Smtp-Source: AGHT+IF0W1wMk0TjpqOG5yWpDYSHE+kGycH9vB3pAPEZix8kJbdhTkbj67P4mBR5VUeKZQKxuFXy/Q==
X-Received: by 2002:a17:90b:2f47:b0:31e:cc6b:320f with SMTP id 98e67ed59e1d1-32515ee3cf2mr2179359a91.5.1755834679733;
        Thu, 21 Aug 2025 20:51:19 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:19 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:54 +0530
Subject: [PATCH 06/10] iio: light: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-6-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=855;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=pH5Ai2hUrCDisN8BOZgbmkwzCO0ZlcGH3OL3twprr98=;
 b=Y4ggOYOq64L6yz5Aop13NAzu+enc9eQG0wtQN7sAaQGY/CtYvE7KKRmnVjQ/LyhlGnFPJNk+s
 4PGO2+PkJQrCiL+ev9sp3RlbFbdj4x77C3RhVe0TX59MpA67qjAQTzb
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/light/stk3310.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
index deada9ba4748..c7ccf58e52d7 100644
--- a/drivers/iio/light/stk3310.c
+++ b/drivers/iio/light/stk3310.c
@@ -609,10 +609,8 @@ static int stk3310_probe(struct i2c_client *client)
 	struct stk3310_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;

-- 
2.43.0

