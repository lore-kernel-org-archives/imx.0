Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8487B17F4F6
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263020; cv=none; b=hYa4zsp059UuW/QqROy2ZZy2Le/EVzbPsBPR6OKgnYqYxEqA8zM6q0yiEdThsxyq0QzGfFYgAn5KFhLKi6mU1ad8TvIY6SgMPraVg6R6HGIlnBcLG6yeGz7rwKwKO3T0076Mkt52TtIWOwpm1TGANCwbuLr3q1T0sAWl0/+oi4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263020; c=relaxed/simple;
	bh=GBoNCxNr9REX/WUBO/XisBWT07mZUtKn3mZVR/uqRtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U0jAQGXNVXdnlkjfcKyQ7pvJpR+7fx1nC77tOlHesV5w/4X32ZDQlWlHKSw2b323isiCD3vCphMA4ezW4RFx0jeSCC2wngAT46SSGVibquv6QxETGlLKD1pKoRjI+aZBl4T7GxV73J4AxzuyTE/AxgnMKf4jwITN4UE0oXblOqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwi1oNMb; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwi1oNMb"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso3540541a12.3
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 00:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725263017; x=1725867817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6uJEhYo1wgA15wfbrz/2U4r9R3nPVkJpmSXzlK2nlI=;
        b=Uwi1oNMb67b3Ln39BQ0cXRp33+bWcWiXoH+kLreqPXlzgH7CkGhLvxgg6harWG+6M6
         GmbPY7edDTqVIBRAKyXCaOq/yf3imsEBdsZVBnx3mreQO7LWvfiI2xDAFCxFbkGSWdoG
         YtO/9RjCRMuQZoXkr6au/FR74ygy+KaZfrXQAz59cByPD5iPl5OROBLEJO7vQLckjYsn
         6TPL+ipOGU0RA6mB8we1CkLKV0mva1MoaFOZT19E01FogKzA99m65C4VEZ+OPJCy/cvX
         3N5FpIIkB6JUFO5xtdm5I260fIEittVSkgBjQjQ8t8hdv7z8X/lHjPvVfIaWJX4VrXNR
         JtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263017; x=1725867817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6uJEhYo1wgA15wfbrz/2U4r9R3nPVkJpmSXzlK2nlI=;
        b=niiwbhweXD7w93rcfne/H9LzxPW8DIdxaoY3NFYmEciZGztxNVuOR0lrXkji7O95tC
         jXQuPkOaRQh5oASmsIpuzCX4CoUCiWoeoPtdn1El/NzH+y3BkTEOpbwlArm8DluU58oQ
         K75MvaAZpqGAxfx/X31bX2pLS5EfdtsFTskj9dSQIaXevrBmbP+bceFjmfWuup2/rzrU
         ok2aK9pKvE55iYydL6kiYFhFAC4SHsqfQMps/izTYUAbEUPz5pE1RfrMWtILk2e0GOVj
         /qFJ8Uo+FQpCvdFiC8dW2BMdNer+T6BO03obfrm0quKe5w+dODNpdWSLNPZmpqCpNY/P
         Pr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXipwMzjYGB5NiqhwZntUVSzNPQPTTxYFAmfKb/ACmbhddSR5p6rXHIy6kPdYB1DzaAVMo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGVyGmubm9W5PH7HKiYPEAyCkJ0KAfB68lYgFVadlQ6udfbLBV
	tiJXSdm2fWQHra+4udTc3/a/e4z+xkVdW2uVmOg2EVl1Mgnc4HW8
X-Google-Smtp-Source: AGHT+IF+gPp7Guk0AwVW4KWTtsV4XPy/sheRsdCIms+DFiV6eNdF0CbTkwUp9ipAFhx6UBzgr4w99g==
X-Received: by 2002:a05:6402:35c4:b0:5c2:2ba2:6841 with SMTP id 4fb4d7f45d1cf-5c24236d23bmr4206113a12.20.1725263016697;
        Mon, 02 Sep 2024 00:43:36 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:3786:cf07:4865:dc9f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ff04551sm1975931a12.35.2024.09.02.00.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:43:36 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v3 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Date: Mon,  2 Sep 2024 09:42:03 +0200
Message-ID: <20240902074330.6349-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902074330.6349-1-eichest@gmail.com>
References: <20240902074330.6349-1-eichest@gmail.com>
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
index 2e86d363e186d..9917f3e1d06cf 100644
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

