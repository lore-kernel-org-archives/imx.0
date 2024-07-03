Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9374F181BB4
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021082; cv=none; b=E7yCp6ZBuErX7ozCYM2jLcoKktoPWaZXx7o6osaqOJbrmEaxU/pvf/a3FXwCGx22+naVBxzFc9AFkhndSvcwJefejKdjkQcJdT7FDZh95SF3ZaG1WE1TV3TsX0b/Ow6GVp9aIfrlnpXw1tlQAcZoCbnCRgcJBi1vTtEz6Mn9Uqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021082; c=relaxed/simple;
	bh=U56saMjIfEuTsQ+HGnNS0wH0SrTxaY1/OZS4zOAPdKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWjBGJDBiLd6+jNcOAHP4LLOfiyjOEb6Ww+pnrSIHncHt+NqsDwObvYHMDAXPzlFIEesaEczK75UERNBYf6b4WnZeuPRi1qhkBI+w6VDCNDX0SQ6u61Ic5wyvW418HfMJL/B/ZPMfdxwY1gokQg8yC0x2ZltA+g4uGNEhaBHKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Itueq13B; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Itueq13B"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so3917950a12.1
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720021079; x=1720625879; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKi2JAqKWrjfu71x3mrudLF5NIxjHTPRhhtNA6MHl8U=;
        b=Itueq13BuZfJwN3PTGcbTV2XYAevG/alRd1QOE37gVoPwJ79KEAq19vTRGhn/vvjJJ
         SVIN/3P/28dTx2cYqZwy6euXmayNK6Z7wevwmlEGXF9OQsqoxLliTFkaxD1V1b6ox+ak
         +ibHRPPHZ7jEwbtkn1Z0Ci+W7e4vTTw2iFI664vgu0ph9gKEfTBSj+o5bnP7awzxdZEO
         45KRK3tuhYF+RhJcXetE2U2QEpa5GT0wstTdt0clFm1V3Zloo++LUHHSd5f/pAZX554v
         QE0oLTtfs3ESVXmhOaDruISbmlkBge6asZgiG3T7wXlkFobdC6yyp6IS5E2cUiua8nlN
         06iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720021079; x=1720625879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKi2JAqKWrjfu71x3mrudLF5NIxjHTPRhhtNA6MHl8U=;
        b=bL2lu4wctxt9w/dgi0BPf5PH10DCa+XrXKIzioX/TKN8NbM+kWuzhoZmsOTc+x/4Ul
         EXaDk/C+8nPz2SA/Qyxsy0VYFri6XTZ4OSM88NcRKro0cmHLa1LxTitMd8+j0+nCUwgv
         Afr+JUQ8WSBgCgpKyZ0uzKEc//XqiafVxoMB5ef1nFb1p1dkXHvi7ef3VqqwnyFLq6wJ
         Cx5dNjf3XoOBxd1WSFCRySHtcAIQgNPzizri3/mRXaO1bu4Sl0ukyq8rIy10KHHe5bYT
         EkK71ouSF6OaOBAspmjKkF6OGWchUIvoFiz6FiCmRXmeuHCjy3k6zcPtKZzRPzBocq0F
         hrQw==
X-Forwarded-Encrypted: i=1; AJvYcCWjHSccOnQlA/D1QGxSKSZFZho0acdt2L4ZvLKl/SNLkQGHNS58yfbmmzqGoQdXuwY4L2IqP4xynLKdixX0BWSMuq81
X-Gm-Message-State: AOJu0YzqgLoValoll6ezHQuEmCBihT+WWBf1/sEKaLXoNUyAiq8FN4yB
	SEHwms5g/h5xlIKVj0BTNtm+ohANTdfakYcYs9Sb0UaoOfeWgCkY
X-Google-Smtp-Source: AGHT+IHbzg2lqQpiAO/jvzPTPWoOyHg/cz6NXGW5jL/Cnfvihh++f0NocK6eSj+lGz0hwsNrRyIpaQ==
X-Received: by 2002:a05:6402:2690:b0:58c:804a:6f0a with SMTP id 4fb4d7f45d1cf-58c804a743fmr2085903a12.19.1720021078878;
        Wed, 03 Jul 2024 08:37:58 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm7119512a12.93.2024.07.03.08.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:37:58 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 17:37:35 +0200
Subject: [PATCH 2/7] mfd: fsl-imx25-tsadc: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-mfd-const-regmap_config-v1-2-aa6cd00a03bd@gmail.com>
References: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
In-Reply-To: <20240703-mfd-const-regmap_config-v1-0-aa6cd00a03bd@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720021075; l=754;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=U56saMjIfEuTsQ+HGnNS0wH0SrTxaY1/OZS4zOAPdKk=;
 b=AVQr2VorHlXjUiqjQdwraVmBCNgIgN/uudSFtafwKl/WtWGftc+dJxM5Zi5gaXQbBfZbnAEuT
 WSX95/ir/DMAiRLqHReT4craFJ3a0tXA5uvok85xFHdJtAbPvSW6m3M
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`mx25_tsadc_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/fsl-imx25-tsadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index 74f38bf3778f..2e4ab2404154 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-static struct regmap_config mx25_tsadc_regmap_config = {
+static const struct regmap_config mx25_tsadc_regmap_config = {
 	.fast_io = true,
 	.max_register = 8,
 	.reg_bits = 32,

-- 
2.40.1

