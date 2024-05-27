Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C54F161906
	for <imx@lists.linux.dev>; Mon, 27 May 2024 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825859; cv=none; b=B/ZaGJXPRvSblpYNseBjMJopU1zjzEt45rzTLSiQDHLlrFgEdrwgyjVHflMTaT5IKmrzGKtlYON5kbAwYUykrFsfHbi9J42NC/8GYjtg7UMJCginAKPFBZtIif5J5YPENjdK9er0mdodRMOiY/FSmkO7a38QQr0PmzrdbfNDTGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825859; c=relaxed/simple;
	bh=p/Ie9SW5LLry5odHyn1Z+OtVpPLJguI7HShBHpE0eKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gv90DtKclArAYJN3TYbEtWy5tZAsFBzWmhMRkMkeGkAnCpme+kMAl0C9rgJz6TxuZHP63Ilt+yxCRtOqgTmBupbItw/UgzcB+CQn251ru3o0xIRh9qOAzlPfml7UrC/kPhf0FAxJDqINywv8C0WN9l1LUEWtebgPYLHjKxbsz0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnqb97n4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnqb97n4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35507a3a038so2423023f8f.0
        for <imx@lists.linux.dev>; Mon, 27 May 2024 09:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716825857; x=1717430657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GX7MWRomctyKxwYidxaCMCj15SrJj2c1nUuhZiJGE4Y=;
        b=lnqb97n4I488m3g5X47CJ72rxE37N8Cpc3ZhzmzOsuoWdflr4OgZRr5IWteallntU0
         5sH3cKJfmcdBpRl6XWwR+VB/mv5mD6w4pNzHJyr+8u6oPvvYr28F5z8hZijk2JrY9uPl
         dyLFk7C6CV37swNCpTmbMZapGRDux+kpQyXX2ViSlwO2O6m8cbAypOjMxKRztepNBmDl
         zSv8EG4lNKNKyPjCKTSqebDqRSMGedoRZ9hGMhvur/UcFxRMh5Z7WPQ2r2JAFojENK5w
         ktwgaoQFms0uZTaEwJQm5wcRzCtE1ekCxn+a046JQUujkJCzVRwFspI3mO55ESYAUiwz
         o48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716825857; x=1717430657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GX7MWRomctyKxwYidxaCMCj15SrJj2c1nUuhZiJGE4Y=;
        b=nWmJH319Qgu0Dkap6yywGzCahY9LFk6MclNhpByIQVJ2Oe//Fr9gS4Nozx8WFeIz6e
         jrjpEfS7on/DnVGXivtSdga29Ms86q/htjZLRU89okZaBCcQNpeBOG0VJ6YQwOy4Ku2j
         faMJM3iMMfMyl9rAGVyhHyLBq3CnmKa6qxPJJXJG/k0q4U6uWZfE6+sm/MIor9w6sY3/
         fK3352cieRwmFTRb4UgKkMM2McxnwIK/Tp8BP95w6Yld7Nf0aVyWm49kfBrpGfYA3yUB
         VbFF30b8g0XToKOg8eaZopgp5TU0bjYRgmoVHWJ49NPc6SCzryD/p4frS3s4gMcKZwKa
         /J2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeiro5SuSSQUKHd9Q2tC7emQf0d2xg2nRVip523DlbkERlJy2AqUL+Td0fweU80b98R3YGB6KnnYE8WzA89IZzEojf
X-Gm-Message-State: AOJu0YwC255Sjs5/Dumao4scBamJQlDOOVwhjH3E64n9JopSj5VTiF8f
	9C9VysTf3fio1pXThB6w0MeIH/JfjEoAysyxPGMcmDKwhZhSy0dc
X-Google-Smtp-Source: AGHT+IGIGygC2UpwgSkACZB8IxM9lQz/dCKFi424OCk/HsYCzOxG44VH9Zf55MjJBWI44kLuK6cLzA==
X-Received: by 2002:adf:e444:0:b0:356:4cfa:b4a2 with SMTP id ffacd0b85a97d-3564cfaebb7mr8173765f8f.3.1716825856453;
        Mon, 27 May 2024 09:04:16 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579f96519sm9349394f8f.26.2024.05.27.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 09:04:16 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mp-verdin: don't limit i2c2 max. clock
Date: Mon, 27 May 2024 18:03:46 +0200
Message-ID: <20240527160359.1965512-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240527160359.1965512-1-max.oss.09@gmail.com>
References: <20240527160359.1965512-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

Verdin I2C2 may be used to access other I2C devices apart from serving
as an HDMI DDC channel.
Thus do not limit the used I2C clock frequency to 10kHz in the module
specific device tree part.
If an overlay configures i2c2 as DDC the overlay is also responsible
to cope with an appropriate I2C clock.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

---

 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index aef4bef4bccd..3c6b47edd4c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -650,8 +650,7 @@ eeprom@50 {
 
 /* Verdin I2C_2_DSI */
 &i2c2 {
-	/* Lower frequency to avoid DDC/EDID issues with certain displays/screens. */
-	clock-frequency = <10000>;
+	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	pinctrl-1 = <&pinctrl_i2c2_gpio>;
-- 
2.42.0

