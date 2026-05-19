Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59983932C6
	for <imx@lists.linux.dev>; Tue, 19 May 2026 06:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171435; cv=none; b=KZuWrQgEdhY/WwAP6srDCw7Yv/OFS7sGTV3O3NhcY7DuY7qBDsIDsMcROeN0Kv4oYP3gvCucBk/aVi5r1F5/yB05NAr5O4k6pon2Kt4Ug3SnfW9JUe888WiFqlO/zfcv+oIjc0+6N+BJw8aqJVr1hCAtVSedNwBioaAOHbjKodE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171435; c=relaxed/simple;
	bh=QQ5srJ1k52NpjI+Q3HaLSa9pVnjXdE8OZht6hpCEbfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPP2qXKsy9SiwJOb44rqxxaCxydafOjTnOSJYPNoPnlRYlQCKtck1tOYcxZqMKsyadliINGtIzQTVEq5gTRVPJkFph8GR/fGxE10SbHhVEE4rWaBcHA0ncZKtLIMQE7AChWFwXd9SGAEKjB+2zU/+7UB0AGaEcXctlrEhSheymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrGSMdzv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrGSMdzv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-835c98b659eso2721292b3a.0
        for <imx@lists.linux.dev>; Mon, 18 May 2026 23:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779171433; x=1779776233; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0chwJesI0BcvhVwn8jIR2v8RSVOpIFD5ULcDL4OMxNA=;
        b=ZrGSMdzvZW0iJ3vIP1Yv0nxid4o7utR8EHXyMaPF9xYlJPB2sY4LGP+klNnambmCCZ
         JAOhr37tBerc8cYaTpL4S1zdbECE3D29R/yWslJUmprjnvB1AA2PFwpRb1kgIBe4e6cn
         +T8sx7tuylhfXmBT8V7sGP0u5xKH9KMmfJr6TyIiGE0/CZQXmdUnkVJhADINw/nIo2AZ
         jgJ/Ippi+zErVi/9vW5DkjwpkiXqLmnARq6xtQTn4YmS3sCHnDg5Xt+/g7vgjLgCFQLR
         4mSkLkTX17kGYJDlAtgZXfHZujeO1pskld6RcL6u/Li3y34vlEICiNLLLWq7S86haL2a
         FQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779171433; x=1779776233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0chwJesI0BcvhVwn8jIR2v8RSVOpIFD5ULcDL4OMxNA=;
        b=EbT1xm5mCzO07qJkvtlHKc8kdSqWH8luPvu9wZVg6aOOjAbtbif6iuu4fVHc/w0xFw
         MVZ+5xzLWml02DqttB4lx1/ZTsCiBqZA8ooKAefDOyN5lzj5TrbyFHiNSlU2vr26hh3c
         6n2fQCxWvSYNizXNqaJeZOJkff+bN2rlO5pg3vWjQEz/9h291IyTWnLCyR+iFinhb5EN
         5zKnlCciC6Il615thRNr/PUvXOY0kUA9cQXPjW2tRwUFK1XkslKuIRmQk0wPAHhAG1LL
         Ta7pl1BNVpaY9WvNlEeTVMfKVTJHp6/g4Kls26h/80KSAK1GF3yahPNfPgAycB9KbHlQ
         mYDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gbk9Js2U9yWeh9w17/1nS+Qz11AVfptSukEQ3C9g22CBoSNGscDxdVQ19OUvfOw8Iiv4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz38MTZexEJqYxEHq5/2TC9TCIrvG68JOtF7ggH2yd6xoBCUimR
	XS9ajFneErFN/9Ec9Afx3iREo3RZOAJ25Hg1TycgOn4SNVJYylxcUoff
X-Gm-Gg: Acq92OGVMkxc9kcEgFuFxm/ofn0yxCQtFNqSyBbgMYPs+lNp43tcbvs2bi60WvrM8L5
	rvjv7GlDWXbf05E5AVkHS5MotJAanInOfMuyBap2UrgqVDD4dppbjVWAmeUfqLd9IYYwM6n4pZD
	qA0Y3tpqA+GJ1KvaiwUHAb4pGWpcWs8fMgnM37JgOYwCOB7MdRkDwvCmHxUEHFFY9oG9yHZ3/Ck
	ClhjopQLXt/YK9152Q4Dn8qMTW5cYx/C8yodvS5NvtVyfFvSKF5FAhj+PlF7F5NElUgrKACZZLz
	dkXZLlZyWJgdAauqHDdoiE6ikll76kbYh5Cebl3Dy1pHsRTZm2gA9WvH03+FlG54KohAzCCRAD5
	iPvtKbB4K6OQn1rqyiNC6ctqReStUUxe8jlUc6GuagQvtF+qzOjRwTA6UZDcuFiYsELuveFZZg5
	RPUkpMsZtEV/XmDHllP2QEbwqPUgcpRA==
X-Received: by 2002:a05:6a00:1797:b0:835:5aa3:2dab with SMTP id d2e1a72fcca58-83f33c333f4mr18789859b3a.6.1779171433260;
        Mon, 18 May 2026 23:17:13 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c7f202sm16112266b3a.43.2026.05.18.23.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:17:12 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Tue, 19 May 2026 14:15:56 +0800
Subject: [PATCH 2/3] spi: fsl-qspi: add SpacemiT K3 support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-k3-pico-itx-qspi-v1-v1-2-c32afeeaf741@gmail.com>
References: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
In-Reply-To: <20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Zhengyu He <hezhy472013@gmail.com>, Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1005; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=QQ5srJ1k52NpjI+Q3HaLSa9pVnjXdE8OZht6hpCEbfA=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDABXIRd9mve9a3LQBUJIUGDCj75EfmGr6SWgm
 EgLvgHfmoaJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCagwAVwAKCRDN9pw2gLgN
 2B0UEACbVrBMVl9AKoDlOthIdXOqinDtkvcCtGfWilREm6uKD0VHDaDqUbYqUyyngN2LzVqqsbM
 4fPTAtLTqOVySq3qbYFX3li10q48NOGWn5QFQ5v+JNkNd/Fe2l8mLhiSiKRtYG4M34VtWUBChoL
 L4FVnsJ7mLlU5zChZFZYySvPDRsgheMHCJpL1MUvfnB3Ln3iitWB2cyhV1Ir1LHYUnALTrVSzIU
 X7a/fAWMFmGN3z3Oiow1a11VMmZPFgW3jtrXMavZ3hVCYbUtnpZkwuYRUAReJqNEdFfm4m2WOYe
 +8PnK2BUOn2U7pnF4I8qnlcAqU2h1xxUGSXXywuRLuPigKDnpTAmhYwhtZqkpJTt4UDNkMbt57j
 JwzUhz1F16xy8nm2mHzgB2folx/0lKSpcxEz9VkjmixyFn6WA/SAUzBCQnK84kXdhFuJxavaN0v
 YeIJ9Fms027WtDd8alyE6tnGz5Nue//wz9sXiIcd9dbi/Y3vA6y5gMtXVsQ80hTZ9XkfEcm1n0S
 orR0nudtNEWioux2TH/BmzcDbRE/rxyUAzeC5Y6Be484DxyHtGdNjw1RxFS4WKD4ZJs8PaHivbf
 B0OcC9+Y6MuCpmZjh0N8Cb22uSIcdI9nfNP5iPdRJNBPgeWp0uaweU83FV4ew/fE7d6tYYYY267
 UwbX6qasCIKqbwQ==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959

K3 uses the FSL QSPI controller with the same programming model as the
existing SpacemiT integration, but has its own compatible string.

Add the match entry so DTs using the K3 compatible bind to the driver.

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
---
 drivers/spi/spi-fsl-qspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 57358851029b..bb94fae32609 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -1015,6 +1015,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
 	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
 	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
 	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
+	{ .compatible = "spacemit,k3-qspi", .data = &spacemit_k1_data, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);

-- 
2.53.0

