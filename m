Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36EA1EC01F
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 11:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868035; cv=none; b=ohqGOWzztXDbEKXWs6SWi72grq+LEWsY+ELBxv+XaAA5uupj197APeVP4CkyXgOghsZNBqstcpQZGNlqKc7EEh4pspFXpinYOyLVnpe9WVFBdF2e6M0OaQLHQ70wUj0feBr0NxdQAo14bSUL1Qjpo+DREuWyolL8BKKM0Aj8vvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868035; c=relaxed/simple;
	bh=E1YeGuIBk8BwF197H23q4KiKySl80PzVksLcuFV4vmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbR6esdwHuh/T7SZLAd+8yoF+dQpV0/if4v0kcvUsrGb/VXevJUEUSC89DsYvPIN93pkFk+YTg6H5/xDXDDhC7O6Pf+PDNEo1Ue/CIRKZIVBphML7Ls0yPWhIkuD8abT5IibENmxhL6zYbd3UDvhBsQRal9oM3XBvmDTB5hrH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kN8bc6Bq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kN8bc6Bq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so80798975e9.0
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 04:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727868032; x=1728472832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V7Qw24AIjD9e3DTOuaXw9uJfa/Y+gcgalY/kZOlqpg=;
        b=kN8bc6BqhUa8EgHvrOJjIP6BZVnVY3ND1WN/fSX1QzRi2urMME0OcfzsTIeJrTzBsg
         VH45xFb9j1RvUiAkLAD9o3UmBRTr22KH4KCLrt/Zt9QYZuvXG3mqCcGErxBb2615r+TJ
         hhLLQoMgOrrRYlAwXqXwT0S5/3pHY242LCEKZjHJjthYCxjYKwrdUwCeNghtzCvMyWfc
         KXNASgrzarT2YBfLKWwccovBzeCy2Ivqw71Zm4cBCBugX3NH4BbX5iPmR/suvBSRTnE/
         v3KzmL4qq81HeOWdnaXUZbsU3rCOX1jK/HiL4mVnF3fjnFfRgUbZPOtenOF3K4WH3eLl
         ursw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868032; x=1728472832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V7Qw24AIjD9e3DTOuaXw9uJfa/Y+gcgalY/kZOlqpg=;
        b=n8CHhQA31XPPx53kqcAY5mLc0yn6paRwgYceVt33ZQCcZoE1yV3EeMYRsc7HCCBGQz
         Rm0La43y8Rn8NvEdvhA1WHAhgOWeEku7Gs2BwDqfoQTfCrZi/aYwC/082hlhf90jK9KV
         aZ/Zrl/+/hkDB0D3JPNX72K3vNi+qeFRclJsKeAyrMzHgw8zVqc8NTL4fKnWRESznt89
         7zPVTm6ZzEda7ur2EJSoTkhdEUnNkdulgOL6k5qQRwLFnzoW+X94Sra9nBo9ji6DnefG
         ciNKrj4KBcHUYKMT/KqB/T9TQJCI3lsKCXskBgu8eRWWiAwgLDSQTeyYqiEkOIvVektF
         vDKw==
X-Forwarded-Encrypted: i=1; AJvYcCVJMqHC2/NFxvlMtja38Gm6Qa7lVINZmiT5kwb56pzgzf32UUVzR2DqZAfYXfsDX1EAevA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYUzABqELSUKYOdsIzx9jHb1ofZs/PVrjYrqeDpohPHCo62bP0
	2ddAwSK23hAbhWyI+QVnw7UwWC21kDaFWX4aACsTpP9Icj+BKxf8
X-Google-Smtp-Source: AGHT+IGehBz2wvp4octtBZnLUT1OhdST1Vf9e5fzfCVsKngbJHX2vTvVmrVGdPh9ghtRzv5CYCn1eQ==
X-Received: by 2002:a05:600c:1d88:b0:42c:a387:6a6f with SMTP id 5b1f17b1804b1-42f777c365fmr23211065e9.20.1727868032188;
        Wed, 02 Oct 2024 04:20:32 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f771a1209sm23530685e9.0.2024.10.02.04.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:20:31 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	francesco.dolcini@toradex.com,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v4 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Date: Wed,  2 Oct 2024 13:19:41 +0200
Message-ID: <20241002112020.23913-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241002112020.23913-1-eichest@gmail.com>
References: <20241002112020.23913-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Use the relaxed version of readb and writeb to reduce overhead. It is
safe to use the relaxed version because we either do not rely on dma
completion, or we use a dma callback to ensure that the dma transfer is
complete before we continue.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 8e9cdeff278a8..f70522a83f823 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -313,13 +313,13 @@ static inline int is_vf610_i2c(struct imx_i2c_struct *i2c_imx)
 static inline void imx_i2c_write_reg(unsigned int val,
 		struct imx_i2c_struct *i2c_imx, unsigned int reg)
 {
-	writeb(val, i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
+	writeb_relaxed(val, i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
 }
 
 static inline unsigned char imx_i2c_read_reg(struct imx_i2c_struct *i2c_imx,
 		unsigned int reg)
 {
-	return readb(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
+	return readb_relaxed(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
 }
 
 static void i2c_imx_clear_irq(struct imx_i2c_struct *i2c_imx, unsigned int bits)
-- 
2.43.0

