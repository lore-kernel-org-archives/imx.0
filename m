Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3624779F
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113814; cv=none; b=GQG9adidHYePPIOtHGKA3rEvbFbd9p4WzJyLHQcw+9y+SEjK7QI7eS50h3JhsMz8iL4P5Gpwc2aqIMVNUSPtkfWjCnHygUN572RAovuyvOlfP+z5wMoTKmQsFk9ToeSFFT8qjTIlhJEBoHj7NR5n3dGCyEAUd1tlW378656NZYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113814; c=relaxed/simple;
	bh=8tMNatK1sJi4q8SWgKJTcOEOVd74qA+MZpB63bLVf40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qc9quOHpzm5szCngUmYDhMo6BQfTRFmEOoria9bGMKsRqAEoECgZNesXF5muuZUASc7MuR4AeZnbbDg1dcZ/3QeDQO/NM1a5bVHm7NvzCgwUUkB/8hbrrDAEWETZNLbFge0xu9I2CKLeh2i8qxbsZeiP2IEOAB7tBU3BOk8QeXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6ZKy3Ax; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6ZKy3Ax"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42565670e20so12468135e9.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113812; x=1720718612; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+SGNEsXbL97x+/CVxCXK+2nldG1TcI8vle2Sq9kOQU=;
        b=L6ZKy3AxIXtZ77AW24CUzEKHe39geyMlJvYjOO7XrOfClvW9kn1u0C0Wr3RQVegAVR
         /S6Ytb4TBEqypuvj29Klqb4UWw424000n+iUY0ormDEutpKU8Ihu3bVVq2dSVs7nGSOG
         yv+9u8kIMC/Oz2UbpOTXn/zFyIw8HdkAz8bmaixRWL/FBe1funMdbHVi3PLXQCfOmOMi
         wOCh3oczYNK7b/0+5iglPTv0OMjh/A4wYCwSBoB6EBed1CuWOYiW5oix3UgM3LELJdUt
         cbNHA3xSsFGZJ215K1hPH5Rx1yWyaKD1l+I2I/2QHyn1DlgMRL98ySNl2fdGSw5h715w
         6NsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113812; x=1720718612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+SGNEsXbL97x+/CVxCXK+2nldG1TcI8vle2Sq9kOQU=;
        b=MI2RmAARi29LPK8vMquXEtaBR7KcufS6OPCQvz1ra1Y+KhOMbGoiN421cSgO8icKgp
         v4fB9A0v6t+Mzzhlp+8zILjW5Eh5+IAAgjwFhO0DghY8HQlfJpD+HtrdYtZq7sUUZhcs
         JVwOrw5weRrnedKMrKiDTcQP2gYgnvp2wBeA72AExriPE3G13GAaVaYPUec4KcdXtf3o
         GmKkl4ue84HGLnFgrdKiMCzF7beC/mu2b0mHxqN6CDv4ViJOI3yrC/RaTjpvVlJ1YKOT
         o9pVBAP7dniAsAuv74yFzKxDqW2g5d5ntNajD7xDZg0FKyW7DtuxoG3xYEb8Gdbz7HV+
         FkMw==
X-Forwarded-Encrypted: i=1; AJvYcCVj0JbvZyrKxWtWXKxALKi7ndVlEODczcKJHQkrmtt50HOvH8RdLzR/tWesVPvc+nU5I8AE+nj3tqXnQjdzKuo+uNLo
X-Gm-Message-State: AOJu0YyFg9xmca4bQB9UXGhJ0sQbq4YgsLWndEiu0ln0vf1ljlArzyEX
	SyGvNbZbiDNkUVCeoi7I5VsJdUTWFefyiZi+G0qBlqNSl6C5eI5u
X-Google-Smtp-Source: AGHT+IFlCPtJM1+sKYumdZ6gx2ub+4aVrMbZyr/O80pjxoUEqlBsGHADGvz3OYhd0xVYDGSg10WjWw==
X-Received: by 2002:a05:600c:3b9a:b0:424:a823:51d8 with SMTP id 5b1f17b1804b1-4264b12e38emr21428825e9.11.1720113811696;
        Thu, 04 Jul 2024 10:23:31 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:31 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:13 +0200
Subject: [PATCH v2 03/24] mfd: hi655x-pmic: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-3-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=764;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=8tMNatK1sJi4q8SWgKJTcOEOVd74qA+MZpB63bLVf40=;
 b=YEtCZD5EBY7hxN5O+Cz2f8AlLr9THmWMnZa7wfo/k7lB8vW/T2U22+sMAVMPb6reODd6iYCWg
 W5ZrxQ0oUYyBTml5t9sZtOXTgwG+laIgc5bGKGBmbIpYGyv23CK9zCe
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

