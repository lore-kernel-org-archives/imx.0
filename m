Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A0E1CB33A
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632239; cv=none; b=AdUxBKHMxFoae7AuSm6zcP++qkxps9GZDXhY6JpPArNdCurP3Ket4XH7/74wfUo8lGf7D+S53yw3QREEBdb8ulOoxn/fF7bBkofVg8D8nqw400Qe8MI5DhJ//vF+glPrMInYbNQ2UVRmJ2XwT0IivaEGb7t+BNXMdqB5lDLJ6pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632239; c=relaxed/simple;
	bh=sY6AVptqGy7qaDiPpO+WIwajsbuS/yJwZlwaJuIwYwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CO6F0HY9a3hwp/VOFbu/v3go3nIQn5nmcm++yKds5BOCiYiPmLy+BuX2MwLZ68C5GuJELDsOInGTzsM9pPKopDw3AA1AB9Rce9qjBlnntZKY2DgJ78HsURIxNPVrotxBA5jStI0m7tBQVgnLl6t9y4toMkwNzSKc7YD7UaQnu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=s2O1ijwl; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="s2O1ijwl"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-80d64c817a7so1226944241.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632236; x=1719237036; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqMe4af98NHJiZdRmZKfGjAtSzwLMs3Usdpoxv76E0s=;
        b=s2O1ijwltIDsvoAFG5rH3scMHCtJ71wVYRSWwOl3GunRHctznY6z7/Unkr/ryVnfgq
         /8GzKGV0N9BZtZ4xF7OGx1aobAMv7eCs907RqPI02lptE9Hx+WYCasjzCwtQfiQb0LlN
         cwTDo1yBGt32az6NmBNM8DQ7iabeSTRSLUTUQdrhHEMRbb2jVRJiR/E8A3+0PsSDXlGw
         lPqUcCpu48w4SZC3yHKPObwsZaT9BqVueVROSZI5CAsWZHuiUoWjGWlTRaEf7CgDUXHQ
         olziuPdrrt3emBMFLuvG54K7UQQMFEN25ZcrpB7sBZJIYmzu7ELcNceSAIdGgRTb8g/a
         +rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632236; x=1719237036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqMe4af98NHJiZdRmZKfGjAtSzwLMs3Usdpoxv76E0s=;
        b=DjTs5rlUYyom7DW3ZHdYDCl15vscEvXLIk3nSVZ/YjeECnFEX/nWJMOVPdv8So1Zs5
         o8xDwkofEx4LwpJ6hwxoaXLaoOZDzhauMkQH4EhLbuJRNiKQxXFs93dTih7lw3Reo+fJ
         xar17NQpMs4YuaQJahdYjNi9VuJISK5YSShWMGh1nLRAM21L4Pj5c6BHXJi4ZO+8g8lk
         NffRXHkrMFx9l4OWWoz8r2Qx1damHOpfTKT+qxyj1XGeoDJ9re/g9pNDFDusACfnZYVe
         Pzs1EEUQtL94ISIItaTYjI5lUVPGk7c+JbtH726p0JABR+i20AiFsqHTEFiROYmaae3A
         5FWA==
X-Forwarded-Encrypted: i=1; AJvYcCWov+lkAImOkK4aQIZenaNS+/HRwseB40bdknGMdbDlWjJiyPSNuMytEpkwasEjF5FuKHHM4avfKEg8Hlb2Qtg5tvC+
X-Gm-Message-State: AOJu0YwFToURP4nJ+iaUiaf2624h/j4L4BUvHizsKTysM30NxN//rN7p
	/BhN7oM8vI0BndD9ccfQdzAeGqyQ6095fv1G0+U026DF3IJgLeuoX7XqgjtVq70=
X-Google-Smtp-Source: AGHT+IFihHa6bMcNzaeLIOOLDw8PfmzIsl9aK4RVvUYriLx2jOAq5E+Axp1aames8cM1+wIsIKtc2A==
X-Received: by 2002:a05:6102:3b96:b0:48c:19d7:eb83 with SMTP id ada2fe7eead31-48dae3f30ebmr8867679137.34.1718632236471;
        Mon, 17 Jun 2024 06:50:36 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:36 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:04 -0400
Subject: [PATCH v3 24/41] iio: health: afe4404: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-24-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.13.0

Instead of using regmap_update_bits() and passing the mask twice, use
regmap_set_bits().

Instead of using regmap_update_bits() and passing val = 0, use
regmap_clear_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/health/afe4404.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/health/afe4404.c b/drivers/iio/health/afe4404.c
index 7768b07ef7a6..51f4be39d20b 100644
--- a/drivers/iio/health/afe4404.c
+++ b/drivers/iio/health/afe4404.c
@@ -430,9 +430,8 @@ static int afe4404_suspend(struct device *dev)
 	struct afe4404_data *afe = iio_priv(indio_dev);
 	int ret;
 
-	ret = regmap_update_bits(afe->regmap, AFE440X_CONTROL2,
-				 AFE440X_CONTROL2_PDN_AFE,
-				 AFE440X_CONTROL2_PDN_AFE);
+	ret = regmap_set_bits(afe->regmap, AFE440X_CONTROL2,
+			      AFE440X_CONTROL2_PDN_AFE);
 	if (ret)
 		return ret;
 
@@ -457,8 +456,8 @@ static int afe4404_resume(struct device *dev)
 		return ret;
 	}
 
-	ret = regmap_update_bits(afe->regmap, AFE440X_CONTROL2,
-				 AFE440X_CONTROL2_PDN_AFE, 0);
+	ret = regmap_clear_bits(afe->regmap, AFE440X_CONTROL2,
+				AFE440X_CONTROL2_PDN_AFE);
 	if (ret)
 		return ret;
 

-- 
2.45.2

