Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1DC38D
	for <imx@lists.linux.dev>; Thu,  6 Jun 2024 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684615; cv=none; b=hy9NjAlOpr/nhLSSWA0h9kwCyoXI+rADB1g8r/7EL4pC8lxwKhoiZr9vJhnk6vhWW0GnobM+aPPiyXYD2lWRfjUmh8W9kqubuPMR29q3FSc3qmFYrMFDwbgxQ4MLAjNvxrQw3c0iYFf9Gx9eGKW907rThsA/c4rzTlQfhNWNfBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684615; c=relaxed/simple;
	bh=HYbaZvNxTbJKa5f2sNO1p1OoBPjJdhGaLI/bsnkYCJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYH3Ar4ISMbeq3P0hZOOxX6wTpt8+tdqXE86LkBIAwLeVl7Ty7OJD89QeQskDkSQ//aqzgmTKkEEC/C1Ft2zGQXJyiCrrriULdNKEXjQA2woantVaUocfScM2xcfQfaS+FufnbXvO3iJSjLmkxLztiI71oOsS/cU4kjDtFdbzEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YACCMcyk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YACCMcyk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42158db03a7so10859115e9.2
        for <imx@lists.linux.dev>; Thu, 06 Jun 2024 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717684612; x=1718289412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BEGX/YRM4abY7OJ5gwhaYjtg7TEA+2R15UHkn44kNAM=;
        b=YACCMcykr8os8IREvnNpEwMbFCq4Gd3GQXgeWS0YqyTDg7E4NISivyIn/Y4OvUnDJ6
         B5Mxu/A7UF5KwiLgW4aDCaQiassHwaPAjuErmHIeETS+Nt2yFhWfjMw4GUIjKXo8NGTU
         I4a3PKwNgn8E1aVH9FElXgGOiS65bKOEdJY98AdtOTCtDj0h09VXiJHWP/B4wkK4jCWv
         oQBllAvK71p22pthzRTz1f+yNy3+ERAKu8QXSVfwi2mZzlpHkb7/iRGzPBG52s/DDJjB
         N5U017gTTi/0Ojz5ldcdOOuVqWMvThPS+3DRdFo1x0tF04oZDKlQEHC4pr2v1zlyUX8C
         Qwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717684612; x=1718289412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEGX/YRM4abY7OJ5gwhaYjtg7TEA+2R15UHkn44kNAM=;
        b=pysYhkpOSV2mssXj6qtnaas4gBq7MM/HiL5ceJ1hAxJqiAmOPnYbJFZ8pa7fL0odX5
         JWQNWYaFkg5qf8ctpP50MVYDB0eD3MZj+bEk1Hs7aXpcy9aP9iPoHuyle2UrRHgyeo+K
         vIEcl00tXzMGYpz6QjReBcwyXCphUbWYgPC1JNf6Z0Te0wpo3A7fPgoVIQAIXQn4Gq93
         3t0ag59Bt9h0iqJwr54EKTj+8vVF0/lbCGajEtkQCQnQSxzphc28KB4U5Zm714Rl126B
         xiihXx+0A6O0J2+ZCOZNmiPNVCRvG6A7ew6VYcnQts2KZUOoFU3yBatjBSan6VF30FxZ
         DPWg==
X-Forwarded-Encrypted: i=1; AJvYcCVBCCZkWPM8hiu5slYtiO/Rw566J29c1IBHzD37dVMXxcYgYwr8uwnXGFmxKPd+DmTb1Mu+pG6E5WphjbYk6YMyTxEB
X-Gm-Message-State: AOJu0YxANRUjIQnPuemdLTxMrL4ZlAB90Lk/hK0TzBZFdLMzYRGfWYKh
	3dVuH5H/pxgadWi7Pb603O5PGXciQMC9CuZp9WPqw5aJm7kiu6VChOZ3tTe/MCY=
X-Google-Smtp-Source: AGHT+IEzOvqTcqQFVTM/zPrDfgG4Ch2gvXbBob36jdrxqP8DV2hXHRxxXD0hBtX3K+evZarwhWDdKQ==
X-Received: by 2002:a05:600c:4714:b0:41f:afa6:3d85 with SMTP id 5b1f17b1804b1-421563504aamr51262215e9.31.1717684611808;
        Thu, 06 Jun 2024 07:36:51 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158148ffasm59540865e9.38.2024.06.06.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:36:51 -0700 (PDT)
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
Subject: [PATCH 1/3] mfd: max14577: Fix Wvoid-pointer-to-enum-cast warning (again)
Date: Thu,  6 Jun 2024 16:36:46 +0200
Message-ID: <20240606143648.152668-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'type' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  max14577.c:400:23: error: cast to smaller integer type 'enum maxim_device_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Year ago this was solved, although LKML discussion suggested warning is
not suitable for kernel.  Nothing changed in this regard for a year, so
assume the warning will stay and we want to have warnings-free builds.

Link: https://lore.kernel.org/all/20230814160457.GA2836@dev-arch.thelio-3990X/
Link: https://lore.kernel.org/all/20230810095849.123321-1-krzysztof.kozlowski@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/max14577.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 8f7472c76009..67bf4de4c0c1 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -397,7 +397,7 @@ static int max14577_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	max14577->dev_type = (enum maxim_device_type)i2c_get_match_data(i2c);
+	max14577->dev_type = (kernel_ulong_t)i2c_get_match_data(i2c);
 
 	max14577_print_dev_type(max14577);
 
-- 
2.43.0

