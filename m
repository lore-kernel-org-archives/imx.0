Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4B145A1D
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113850; cv=none; b=e3UFFRRRkFUUaJxN6KqhD5+JMbAoWnjE5votBNYoCudDMGLn0sO3cIXK1LMJoscT8YcAEAQU4F5aefI4UEvrieT4a/srpX/pY6xE8jfZz3LKlugupRlA0m5wt7WylxLQVL4InRQakK/10Jb+7sRLsf/oR61Rpc9DrgQ/6PscMFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113850; c=relaxed/simple;
	bh=l1Cj78yZY8L2tTDG6sw5fSc8edu6SL6nJiCxRWtiPUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnXbQxVrHu0AqAfMsAjE3Iuy9scgQjJHes8Ogk/SFEwtV3jfhobeXIi6Z/x53SMN0OgH9aLHIkq+0QyoFkvTWf7u8EAqcVaOdgJLAP1ynd2l0EhN3qca97DFcw0x3xooxAcGm+Nbg4ZoBHRv4MX6eS22y2Q4Iwu+bXjZtjOPzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCiBsHI+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCiBsHI+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42579b60af1so6051945e9.2
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113847; x=1720718647; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKHYWbzkMTD6qk8aJRMT+i6jtpdTExyqbOxjXHTRIgE=;
        b=dCiBsHI+w0fc+oOrNbR+XB5mw5nW96T95SWOUW9gHm8p1Zwn433s+DdKZ9ejbpD+zv
         CDTuU+VdfowQ3DVOrYbaJ/SqFXMb7QBuNnxy7pzZGIjdbwVdW+UkKPQA9GyHZv+PMB1M
         7k+168bBeFZfff5xALu28hHYoIgo01NTsOMLk8Wysx907x/7CrtqoEG2KfuHc/AMcdSx
         MpI0d/YzC1jWBTrU1l7IVWwjwrRSCRIBVkzQ++AWE/ff36pzFVM2X5kooxiyErZ9JMho
         sYTMlLXX3vm/ljK1HQL/0UNzvr7w2IwNvPqwaoxA1lzGWdOhbaodYTHk/+vTiGovTnZy
         pTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113847; x=1720718647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKHYWbzkMTD6qk8aJRMT+i6jtpdTExyqbOxjXHTRIgE=;
        b=tvbONPlrZgkBE7fy5HAVVsClKjIYOCS04FqF1BB5QJE4I3hquihpuQa9JbKnwFgNP8
         OeDcRb6EWbA6AW50cqGw0xR7T5tzwbO1Cb/gOGBABW+umGYPkEcYwBnSyvSdtOhazATy
         K8p68z2G4TkmSUTT8ECzuMADnw+jESn7Pd11v0msm5bnExkrG1mK/uLAGYILnRIJuM4y
         UjbUAZjLYIBzEJhvC+8ksg0Ards1dObbI1cDHLzpt2qChnQNM17BU51VgP7HAvZ442bW
         ZUthjY7SUOzWVFmTsPZaVZI8QYXAqSEUZmrcEuDkAK/T4nHudrrws4WjLzpdxARbSkU/
         aqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQwOPLve0SPWiDTSZjSLaRhOCSPC3zm5Ziggs0W91IVDetweN03L6GrB0OEGzBi1s83e+ljSPiI+7tv0M+qqrD0rks
X-Gm-Message-State: AOJu0YwscpozQVq6Tf75Q2EYt9EWV/vzG0CaZn6hJqL8HwtDG783pVWk
	7IveSefqKyAQh1jfN1TNXUI7f85U2a8R5dfWetlZGxnT22/qn8YR
X-Google-Smtp-Source: AGHT+IHQZ4Gzn4G/A+zIb9YJ2Q0ClP0LZcg6Q/8xU16dU9Jcz7FFgRTHzeJxzyBqHfPRtw4+F+JGUQ==
X-Received: by 2002:a05:600c:5116:b0:425:6851:8172 with SMTP id 5b1f17b1804b1-4264a3d8045mr19854075e9.3.1720113847160;
        Thu, 04 Jul 2024 10:24:07 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:33 +0200
Subject: [PATCH v2 23/24] mfd: mc13xxx-spi: Constify struct regmap_bus
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-23-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=755;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=l1Cj78yZY8L2tTDG6sw5fSc8edu6SL6nJiCxRWtiPUE=;
 b=tgsjQxPaXkJ9v9t7+dV2nb9XS3bWZJKrIdxeCdZx3svXnlCSkrJAPABlqxbHhy6nedQFMauDC
 XP+11fvCOmaDAuPvCKPD84p9LPLlmHO3Pe9gkiHXJXCPJEp1YnGpdbD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`regmap_mc13xxx_bus` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/mc13xxx-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mc13xxx-spi.c b/drivers/mfd/mc13xxx-spi.c
index c973e2579bdf..9f438d5d4326 100644
--- a/drivers/mfd/mc13xxx-spi.c
+++ b/drivers/mfd/mc13xxx-spi.c
@@ -116,7 +116,7 @@ static int mc13xxx_spi_write(void *context, const void *data, size_t count)
  * single transfer.
  */
 
-static struct regmap_bus regmap_mc13xxx_bus = {
+static const struct regmap_bus regmap_mc13xxx_bus = {
 	.write = mc13xxx_spi_write,
 	.read = mc13xxx_spi_read,
 };

-- 
2.40.1

