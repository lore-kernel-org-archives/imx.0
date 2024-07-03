Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69DF183061
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 15:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021083; cv=none; b=JZIkGCawt336la5JndL8dmzflVEDS7vjJMDLlHJxgUvoSUC5VYQHtOA0l1fm7gAXJPhGfFd8ZfhvoRkU7ZYn+9A4xm95j76arM+IlL1hPcmi+zZJAzJ4/9tQo4u48h6N1eHfiBpQxyRYVfdzBeS1kBCu7MgFRijOoQD4ZDrS6S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021083; c=relaxed/simple;
	bh=8tMNatK1sJi4q8SWgKJTcOEOVd74qA+MZpB63bLVf40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8ElMbYC3sSLQDgmsxfFkQp5WaRgOu54OW+Hs5RhasfRNl+XplstRCFzsHKubD493elprf15y4aQ3Y9qQQ30xiKK012PLfUaRPBjmh02/7r2SM/l3YICn3pz8cbU48uQP4y6YeUHfXjwh76W6SOOnfrtVyJRc9JCZMPT0oKTxVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eB4rOXQa; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eB4rOXQa"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58b447c51bfso3093862a12.2
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720021080; x=1720625880; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+SGNEsXbL97x+/CVxCXK+2nldG1TcI8vle2Sq9kOQU=;
        b=eB4rOXQa33ZELdAkQLUfjlNt+Rdf9TYMVdKVxsqbyNE6S5FWNp2lHrQTo1kmky6IiH
         IKv3MfwvKPuc2pJI7lsDphr+G8sFGa5v9DbCMNCd/LFMNjDL2i+KRlyV3OQjQEDkQf/o
         MFiVcr9AuTkaG7LuRmXajK2feaLpZe4ZG51BfSM9+iocPxW/RgWWt4c4MZnRNMwnxN1v
         iEeDQ5C8qK+TUb+cW3+3s8MiCsc24g3WY3xf/XDpBypxoxhBkSou07Apmb3MuFbBE6op
         2AGGNL9FCo7FVMzdTdw86azx5ircM/xdauZRx6C62kkWbKqP94mH4J8M+XYk8Dxm3mxG
         qHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720021080; x=1720625880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+SGNEsXbL97x+/CVxCXK+2nldG1TcI8vle2Sq9kOQU=;
        b=ThKklCKkGAcg847BCvaT3VrwaitxYEIPoJdWJqRmcdXpZhSQ/KpIq3kmD0k1KwO6iR
         WNpFi7ee2jyhvgGQPtHvbK2/2qOBBtUXYptgX6XSQhm8K04GiF6RPcGAq5vZnDN5YoWD
         MDYjgyN0OtQwq6mLu7qXJ3EVsTtbLc66Ru0whVk8wAZjbYupkTzsDXVWiM/szkSIBP2h
         0xKOKkYdWXO0+Uzq/N9EaKuq6zOOf70LOq4YHKnuGHgpY9ZOrLFyF+MdEKJI7y+K6E08
         ZxG8jOTSasa3LRmonBz88IKS88AF6YXeMbOkrH0IFH427LfWr14JcXEB1s+sYFlXlhkf
         lK3w==
X-Forwarded-Encrypted: i=1; AJvYcCV8JZnga2Ksshc5wDgQgJ87GYlx1XglIiWA8XwuQIAe6E6n2lEjjNtyGT8999gHLXxZf9D/N5NpHC7YtngVO8aKjQmi
X-Gm-Message-State: AOJu0YyrblV68+n9NVgQjPL6m1n20yT+RjE37Mdqr131FCs4rBwQeWUB
	wwZzBVDJx272VJyZC7x/lqdPNU0Uhgw66kR1eRKofQ52MWsl+GmQ
X-Google-Smtp-Source: AGHT+IENzhhrUxWbCitwYBlyHkjH3e1TKb3joGsSiXgzBe4l0rhKW78in1ln7eLqEn19G4OtGBjFSQ==
X-Received: by 2002:a05:6402:366:b0:58b:9e7c:bcbf with SMTP id 4fb4d7f45d1cf-58b9e7cc15cmr2397363a12.36.1720021079945;
        Wed, 03 Jul 2024 08:37:59 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm7119512a12.93.2024.07.03.08.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:37:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 17:37:36 +0200
Subject: [PATCH 3/7] mfd: hi655x-pmic: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-mfd-const-regmap_config-v1-3-aa6cd00a03bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720021075; l=764;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=8tMNatK1sJi4q8SWgKJTcOEOVd74qA+MZpB63bLVf40=;
 b=AVvXYso+UmdzYbKeaDLFULDlT2RlG/HrJfDW4yf4Ap5vBO1x4//8r97EER+jmE37Hvsp5M2Im
 SD1uZbsw0NaAUCLo7SRKTTIc07GchzH4N7JRHWV0earYvndaUlks/LZ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`hi655x_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/hi655x-pmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/hi655x-pmic.c b/drivers/mfd/hi655x-pmic.c
index 042109304db4..5f61909c85e9 100644
--- a/drivers/mfd/hi655x-pmic.c
+++ b/drivers/mfd/hi655x-pmic.c
@@ -41,7 +41,7 @@ static const struct regmap_irq_chip hi655x_irq_chip = {
 	.mask_base = HI655X_IRQ_MASK_BASE,
 };
 
-static struct regmap_config hi655x_regmap_config = {
+static const struct regmap_config hi655x_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = HI655X_STRIDE,
 	.val_bits = 8,

-- 
2.40.1

