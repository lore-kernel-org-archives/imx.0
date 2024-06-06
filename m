Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476CD19CCE6
	for <imx@lists.linux.dev>; Thu,  6 Jun 2024 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684617; cv=none; b=AU6iXPXHpOP13h0dYEiVr9616Q88FJpTBk/rDqdP0YqbPqaBriAfOkHI/xJcvCMAeVtexiYdbGT/rBtZzNe1n9x1Can8lqETTvU/NYQPm5LVWUHsmVtovYD4ypnR2MRwUWj555ayIwYMYuKwHWDK3vZjQtKfCl3uMdtJO9YVHxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684617; c=relaxed/simple;
	bh=HoQgcM1v61QTQaw7hxevdOwl+gFbD0LvX+R34v7HQUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVyAsbHTJguSF6vCjf23o9CuKEV57rVGYs9cdiu6B9y+UEUzVXppAvovmHwkbghW8wzt1t7lHaSj1rJ/nLjZ/xTKkoXTVxVK/arYjAgeiTc4PAqpLqof7UWMXUaF82PxByFB63AhFqJBFpk9SpUVwNk0RNHiqY4bTSYQCJiaIwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmpS9pXL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmpS9pXL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421572bb0f0so11853695e9.0
        for <imx@lists.linux.dev>; Thu, 06 Jun 2024 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717684615; x=1718289415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJGZ6Uu/K+CEvU7SenPD0ND/ZswoEpORmUYwGdFQeI8=;
        b=YmpS9pXLwnZlqDcIKxCW2tQwXFdlfO/eh+IacgDSCHwL0BtynvGLsP1QP0YZXYA/QS
         +Ecq9C0crTNOlby0Cpz1v5z/bRd5AWhmJvt2Ub/N77BP+RW8DORNQtVUh1oB17xzl+11
         WLfVFjX5jeqk4THE2C4E7TmhJfe582mGlWndRY9fRDuAtuoJxIb1QWG7qHyHwvNlaXro
         rjWa4h+9GpJPz1YP2dy945kzSP/M2oRilnGBVWElnIk1DGFvRf8jdptvwim9QaF4kuYQ
         WPg/7i3oYdsvkDYYnnssZ7TS/O6cjY8IKoMPBr3dJgocNnJHPQ0LTMf2dmppTVv9yWEf
         M6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717684615; x=1718289415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJGZ6Uu/K+CEvU7SenPD0ND/ZswoEpORmUYwGdFQeI8=;
        b=ERw/WfCSpL3lWT7fwJovHf3qCkJPeWnX5Kg8Sub2Ewv2XO8qqAOFczpxTI3OmWH+jF
         lsNDQqrmIEcz24YfxgLcAEYqMb9J7/+/vdH7tvTE1DcT0K11xAVDxMNCs6DrlB5EWpqA
         gzwkG0KH5XMwe9FnA367sr8quM7nUkl5z3zT6WLTXlHVfpc0yOQXIbbdRQ1Ea2SBXyGy
         3hkGPShxciTdTXhPQn+146Gu1kygLIi06IdhSUWjUs4vEfesO3xK8mgrn05v95u9CiJo
         HD49J9bulUwHg8EboNzTZFKs/cTxhOtQiBGIMEWbBE82L/wsARfsxiA8eGwZUYxlSgEe
         epjg==
X-Forwarded-Encrypted: i=1; AJvYcCXY7+IJnkCziuoWuBeRRh7wIT3Agt8Hnzs/DKYP3FlDhNTr+tLPYYNHJv4kUP1dUnAg73flp64a8BhmNkCFnZwX3fup
X-Gm-Message-State: AOJu0Yx8tJiXpuEHYgx380+BcbYRxpKB9hwfYC077R87+K3D3+dmPt6f
	+2FBIcrXAHJ4Xr/U/Ap41KHvJnt0xUUQfPBVm8hiZFccFB7enBfib/zorsZxDH0=
X-Google-Smtp-Source: AGHT+IHZn6oC9SB1W5aaL9cA3jdYYQVK4SRCy28QGjtvWm+2YyXB7pITSCWXefonmyHypnDRsqTmMQ==
X-Received: by 2002:a05:600c:3b9e:b0:420:2cbe:7f00 with SMTP id 5b1f17b1804b1-42156357f60mr46822585e9.39.1717684614611;
        Thu, 06 Jun 2024 07:36:54 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158148ffasm59540865e9.38.2024.06.06.07.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:36:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] mfd: wm8994: Fix Wvoid-pointer-to-enum-cast warning (again)
Date: Thu,  6 Jun 2024 16:36:48 +0200
Message-ID: <20240606143648.152668-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240606143648.152668-1-krzysztof.kozlowski@linaro.org>
References: <20240606143648.152668-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'type' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  wm8994-core.c:625:17: error: cast to smaller integer type 'enum wm8994_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Year ago this was solved, although LKML discussion suggested warning is
not suitable for kernel.  Nothing changed in this regard for a year, so
assume the warning will stay and we want to have warnings-free builds.

Link: https://lore.kernel.org/all/20230814160457.GA2836@dev-arch.thelio-3990X/
Link: https://lore.kernel.org/all/20230810095849.123321-1-krzysztof.kozlowski@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/wm8994-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
index d5ac066f9db4..094c0b3dbd97 100644
--- a/drivers/mfd/wm8994-core.c
+++ b/drivers/mfd/wm8994-core.c
@@ -622,7 +622,7 @@ static int wm8994_i2c_probe(struct i2c_client *i2c)
 	wm8994->dev = &i2c->dev;
 	wm8994->irq = i2c->irq;
 
-	wm8994->type = (enum wm8994_type)i2c_get_match_data(i2c);
+	wm8994->type = (kernel_ulong_t)i2c_get_match_data(i2c);
 
 	wm8994->regmap = devm_regmap_init_i2c(i2c, &wm8994_base_regmap_config);
 	if (IS_ERR(wm8994->regmap)) {
-- 
2.43.0

