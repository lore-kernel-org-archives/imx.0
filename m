Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697E173359
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011012; cv=none; b=UhK7SY5eLcg/p00Z77aMZBrxTWRSOchVLQ0TO4Y3bvVXw2wblD2LMj1hmx1FwX7iWV4zzDDgPp2Hx8v7RyfceMvrBuopX18QyoeX+g4hT/dsQRI3uXDUUxCPQuE0QtqLv/mKngIEUoIyBiS7dYzefBYvQPIbt+mez+XeAcMmHvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011012; c=relaxed/simple;
	bh=TndIeG9G6FrdR/rn55DgwdEEotMupyiOMfJyv1C7ABM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EiZ2EToSPzqcF2SOf1IUDr8Uxa9rTfDA3TRcyxeVNws5yuIEG73Apl39pgL6tdK/qCFXsscjn0vk6MKXnr4GEzz7kkiQB3+l3kRBpfrGe3xmfeh0ypaeAXKvZ12G62cuShPb/WUVoHnp6hWuI+oZU7ThzyyvaLTcJA72dZTuh8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=tH2S9b1D; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="tH2S9b1D"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so8156960e87.2
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1720011007; x=1720615807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmBlGZ7JugDA6yCRv+tI74EPUOAWuL4mr31Z/ZqddMo=;
        b=tH2S9b1DLMI5GIu6YWt/YMSSr6Sd83Z9F0Anys4KXbJqVIg8gCBXfd+qzOwlWVbNlG
         B9O9UPLaH1CqNvxr5uXwzzH1IAThefa5hQ3ESZzA5zXSh/lPxbblPASAg1n0jOg1xauM
         5mg5bSJfAN2MF70w8EDv4Uc0Wm92bcagWAe5fua9xEQi+gEoadp4qEAun/AD6blPn1yt
         KZNYtk+iywS8aj5Gusxksbb0g+9BjDkXj2LsgdVpOTgUMn7JUT0MM1EgJtkLyXF9AE7t
         yECq5EWNGlDpTQZywuOJitflb1KcXwHeokQGoQfUPE5ZR1gJ0Fy/5PJ/Q2Bj3Q0B5hyw
         nzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011007; x=1720615807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmBlGZ7JugDA6yCRv+tI74EPUOAWuL4mr31Z/ZqddMo=;
        b=cvY1cXxfpOkSjZscpu+THu4SE99qh1BxYzqrYQPJ8JuYyKfRJbYbs4uQAXKUnKTNW5
         jyIwIWX96osjwJQL6kbML3Ka12TsUyrGvSnJ6/mJ/qIEzEBK3Z4y9obzSIxGm1MTOgo2
         KA4LXwpvq/4n0WNGsGFKJ8ntS5zyYsiayFnkly0tAVzpIajCGwgauwwBFJHVcxog3mPA
         y5mc8iaQx48Jd9w9Jm97a4Cz20Q1QA4uJybPeqIdqjzgnVZhJ12o9qQ+NWaHEJeMyhdO
         fInhWRDhNEAvNnGVeAe0GM+dvR6EmtvWBywgjqlnVK2ksazHmNdGAomr08FyiOtLbVtu
         0+gg==
X-Forwarded-Encrypted: i=1; AJvYcCV2jQKTOi1jZYhpo2iTHqGf1+iCxV3o00uSmMHARjwE+XWBGb4K4biV/wSkgOD+8HFUAWLJE8isr3JDhZ008rckS/zo
X-Gm-Message-State: AOJu0YyZFxjPN4S996/mxCyR3xjrtNRPoHg06XSg2KQE+CToRrHC3S8Z
	Ul7eM4Jh+fk+OsxxNMjtjZ78G8rmuoNxK+jn3pV5iS7s6hjf+XAyJqBD1r5AS78=
X-Google-Smtp-Source: AGHT+IHlez9j3K0WoeC3XHS+M7qci4/FmMVRo4FxFL3Nd1FA6LeH36IAKdcQ67uBJOsYRMIHSlMkyw==
X-Received: by 2002:a05:6512:b11:b0:52c:7f12:61d1 with SMTP id 2adb3069b0e04-52e82643bdemr8858443e87.1.1720011006993;
        Wed, 03 Jul 2024 05:50:06 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4256b0971d2sm236399635e9.31.2024.07.03.05.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 05:50:06 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
	Richard Weinberger <richard@nod.at>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-crypto@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sigma star Kernel Team <upstream+dcp@sigma-star.at>,
	David Gstir <david@sigma-star.at>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] crypto: mxs-dcp: Ensure payload is zero when using key slot
Date: Wed,  3 Jul 2024 14:49:58 +0200
Message-ID: <20240703124958.45898-1-david@sigma-star.at>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We could leak stack memory through the payload field when running
AES with a key from one of the hardware's key slots. Fix this by
ensuring the payload field is set to 0 in such cases.

This does not affect the common use case when the key is supplied
from main memory via the descriptor payload.

Signed-off-by: David Gstir <david@sigma-star.at>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202405270146.Y9tPoil8-lkp@intel.com/
Fixes: 3d16af0b4cfa ("crypto: mxs-dcp: Add support for hardware-bound keys")
---
 drivers/crypto/mxs-dcp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
index 057d73c370b7..c82775dbb557 100644
--- a/drivers/crypto/mxs-dcp.c
+++ b/drivers/crypto/mxs-dcp.c
@@ -225,7 +225,8 @@ static int mxs_dcp_start_dma(struct dcp_async_ctx *actx)
 static int mxs_dcp_run_aes(struct dcp_async_ctx *actx,
 			   struct skcipher_request *req, int init)
 {
-	dma_addr_t key_phys, src_phys, dst_phys;
+	dma_addr_t key_phys = 0;
+	dma_addr_t src_phys, dst_phys;
 	struct dcp *sdcp = global_sdcp;
 	struct dcp_dma_desc *desc = &sdcp->coh->desc[actx->chan];
 	struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
-- 
2.35.3

