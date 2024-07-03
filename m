Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1E181CFB
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720021084; cv=none; b=f2PvNNUcyoEArZxKjzhbj7XnqrdcTlvEFhFvoOsEo+ukmM1lYMM8pPv1tg8IzVXLnQVQ+09NKyDxmmEh7To9B3+XybbK5jTWW+oKpihVtkYho/QOBUOfzV7grEeRH1O4uIPVf44nLpIjYz+W8Tudml3F+zK00ufNESj4pHVYBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720021084; c=relaxed/simple;
	bh=enRHrVnnv2v5OSTzZ1elKgS5KbJVuE9GP9SdZn7OqTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6qcBhXd1e0uvtInNOMW5JgPB4rKIiusk05+oJVsg430/U+ehdNQc4XrINZtZXQgPTg5izExPKkvL+4/+dDG/UwoGNn65XA2v+VFiuw3NHCOqLikwLQZu+L/8fIZbV793Jms0+SvNbcRHrco/HnDfHdEQU1JH8XNdVr0e/JA4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dw+NPoPg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dw+NPoPg"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so2695328a12.3
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 08:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720021081; x=1720625881; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOF3cIT6fgv4yx2bUJ2liLgQLjKC8cJY9QXkjtPW8ps=;
        b=dw+NPoPgP4klaClKQwqvZ+F8iH64PXVNFPAPoBS+K+/mGDrabT0kVKPEjtEUwHE54n
         Yvd8k/85tHS1YXTLb/iir9bnbjkbSOgs8ZHYf3FCNtKaSxia7IYTWMmevdbsi+cphVlV
         4lssIp0jRFi5gsXDKtmEMgm7cD0t5X8ERkeAIde6rXh8Imepzp/ku0cIJt4Av5N71z8j
         MBixkUfQBDl4UqyZLIj8JOodEWQekQrQZw4Oum1ETGEYkLXzCUsRRHPC7wKySUamBpQc
         kgi2XnpN87cakULZQ4kMcvjmyt4OMQRgi05F+ZCUIHtcUh8iH1uMMmBQBAK7Od+gJH9a
         kvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720021081; x=1720625881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOF3cIT6fgv4yx2bUJ2liLgQLjKC8cJY9QXkjtPW8ps=;
        b=LnE79Bz/X5M1F01gd59SYkTYxltLy8qOqERUaevlk99dGRHew+188p0NUQ6oQptWaK
         9qf2ikGsDNY4EK4y4WPIZDKQBvB6kKy+8nChoswMrMt+UINtcnvlGcFbsp4v4n/1m1gl
         6ZAn4E5A2cWVql5lJXrOLXwWJ8VQvg3fXQpqSRgjS7ZHSarnPvcrawX4LiVdKC1Jy7KG
         F7WfYKS5/d+p0f+6mvpr04yALseYnHp/VDiGq0UI0jF9eHINW5r5tywyk7ibY2+HVd7K
         sajJ/pu7ZON0G7+4aucWLy91wbDVEWWoDAIelUiffK2bctrZTa+BWcr/HAM7VHIO3Y92
         c5+g==
X-Forwarded-Encrypted: i=1; AJvYcCXUrsv3GJt9lkG56qOhCvSpGKRoqPY6uyr5psqfqxhhHWBDQvJ3D/8PgJKzmFSqv9WIbHGo/PH40eGMr8CRk8S0/37B
X-Gm-Message-State: AOJu0YyKwrFmsINeyGwawtiuuSpb1tW4ewG2fHtKLGO4cBpiUxZ/tlG1
	SUe2u/Oqfd4zTx4Rldq9UmY0Cw8Walzrpj8em8SQts845EUYf2qw
X-Google-Smtp-Source: AGHT+IGSE4aEWfxmeppRozJV+rmVgbv6IME6lttf+K58LZUqL3dz1V1l21Nou6E9t0oENUhRbHfj0g==
X-Received: by 2002:a05:6402:2711:b0:57d:788:aaa3 with SMTP id 4fb4d7f45d1cf-5879eed8ea5mr8336189a12.8.1720021081125;
        Wed, 03 Jul 2024 08:38:01 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861503b4c5sm7119512a12.93.2024.07.03.08.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 08:38:00 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 17:37:37 +0200
Subject: [PATCH 4/7] mfd: wcd934x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-mfd-const-regmap_config-v1-4-aa6cd00a03bd@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720021075; l=720;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=enRHrVnnv2v5OSTzZ1elKgS5KbJVuE9GP9SdZn7OqTU=;
 b=QbgK/RJ2y1AYAvxFVQHd2CneM97DgD16f6V7hHZQ2LSL3bcRTs6LL4tfSPiuQQedys5isuUHj
 DiMaxpsYltFDLjKM0vuY1pxsrjgg9vn8yRsJjrNWK6Wn57TY+mMo+dC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`wcd934x_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index 7b9873b72c37..fcd182d51981 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -109,7 +109,7 @@ static const struct regmap_range_cfg wcd934x_ranges[] = {
 	},
 };
 
-static struct regmap_config wcd934x_regmap_config = {
+static const struct regmap_config wcd934x_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1

