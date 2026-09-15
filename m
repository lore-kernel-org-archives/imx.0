Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64563F5BE6
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468436; cv=none; b=tSOE3/DIRs3PEGq7OhuXj+KgdvB1ACEtc2c20rNYKjkuL8JVG+0ju2UnJnvSalSH0uH6dpzj4VlH8l7XEkfiO6rXn8MUC7ggstdSgDUoE32dnIS1vq0qRMFwwuVDAzBHfBCLRgb/4kr/3E/Pj/mYRj0302ONkemttEXvJASlCzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468436; c=relaxed/simple;
	bh=24iyB0qQIhRBRLcksSKKzm9eIHZVgNfeEOfit53HP7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDzSMd2n6h9/6Szj/a3Cm2IsADX9b3l/R41fEQSqLmpEfY9AkMBd8ziLmP0gWjnzdlMzk+ULNGdircflBLaAsQOjfwcV+6235F8WLclpp7C9vRcdlhW6eIYInF9mQbuJpGX0dzbHHtSqvmOdKdCY85VoX2SrRxZWZrUMMRLFua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyIFAlv+; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyIFAlv+"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so19964466b.2
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468432; x=1790073232; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=;
        b=GyIFAlv+QeMRX3EjN3FnHOf79hkNXSJcu6gjLVnLAYEu2B2yO1ZaVvOBHSHL47QLfB
         Tqf1t274ONimQtyIYdB6RSPZ7WXNSb5XAhI1dWxi5wb+CzfertuctWlHEwSl7QnWvDsy
         rK7wNgjULt5UDAx/YMs6TzE0j34SlaHsxd60O0MKPqa1Xju/2v0H0Qov84F7m5CDszrB
         yg02cJl42D6QBKWFyk/n4d+IYFGi9DqBHd7TJHXO08ClvEPB5Ah0CewBhks9MLhKKynP
         tElNjtBFxGtw9cDx34pgWZgJaKjpow8e3MHB5L2qhNvok35lIAnkgAh78JCKiYWyTVmq
         U6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468432; x=1790073232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA9NWFMPC9pCLE/rtR1qK/Zvon8swdWRLmKM7jQZ0lo=;
        b=uik002ag54i4Jyl4A8SDcEFPoNJquGV8N8nEH2zlcoyiXE3/NNBiKNGb9oiWrwnJLj
         eE0uLHe2CsagBUiM4GaVcGB15Gkn6GJk7Zg3jofEFW6Cb09TGQu0JfnfLvG4b5nSQ5sf
         AnycJbfVmtQqrBzgcHpijnodrpFhEe90Oe3WhBDqHEznIdf7/GhwrbPt7uy1waV6Zh7G
         JbFgBTDXQQrQtEkM9+ci3XC7SNn8E5MxtzNfAn1369qBdYEqEGGJooEsI6Ve8wsWK5v2
         vMs0B6VJWC8e9IAXyEEQrkCUcky5D5VM3EQh5riTCcVTJeCe1Cl0stA0ybhxvMagB7fx
         d8ug==
X-Forwarded-Encrypted: i=1; AKwUvBzqN7mJ6cP9oKTtIr5lnKIX8SvWoTXxldXFUT12DNUx3gUUmSqap2Suoi5OZVPy1r/HIpE=@lists.linux.dev
X-Gm-Message-State: AFuF++lDoPNLqvgfNgwbpknLaf0AM4d9KcljACo++3qfcAFWTkDlje5P
	qbJZaFKGNvKJBc82Cc4WJtk/lap1U+LTxP0/mCv3QvG+q3BhnoKnHC8h
X-Gm-Gg: AYBFou2OANqkjElbERiBNijQJU2/vMefiWcPf3mt+Cd+mk4cEvkmrNYkBhDguqOiEbn
	iZPGmAVhdyt1bZXOcbfwBzm9oZpVxQ9AJnFkM5+aDAuhVZONLj3hzncE/CTnqZVEMZsEhymXLOP
	fsJrukwPQagjmgJybqJ35tPe1Q2DKpmVTsI9dQ71tbTRcgAr0xMUqeJiYu4OV8JTERLB7CMtAVg
	lIF7Z8VUU9iGaTFBC11xcxTi6g54Yq6wW+GV7Iy8NOo5PVWpm8NlpbCzJhuI8HREPDQ+aKSqn8C
	ZxMyJXtMzx+G0FL/xYjV8R7SdQwlmjGmtcbtaillViAtvoejmlHcsLry81+4qPRJXz6zqnRBTTi
	VnHxPzhzs0V8P2wdRh0g5RfDOrFQ6aUaMdRVVhOYlQQkNOYaDjzYuI9rMe725H3vDRujOkLRc33
	o48OkBLWE5nvvcsxwslaGc/N0kJFT9sOe0DVhbdkzdUOZRNmyePm+DkJZtCQfi7pxclHzcOXOof
	wB/4zeL1EyF7OCFDce1iwvCowaW8lK5uoEf8RgfNs1sz/TP1PUZKg25eqtKU+xFZmd3iLUoFwMu
	VPYxjgft+Pnb6rwRFXFHNlvplb2ucHH+CF6jsbjeD4N+NUWRcTTtQp0dSTQHCgOZ2JxLut16nLs
	nCk+cndbpK4ojnAbDUUcPNVKH9AymirMMQ0zyZIf2WfUi+xDDStRqdR6Isw/co4a0Kpe8/z6Rf1
	atNDDV+aw3LIIgnrJNFQnt3eCts20Q4XfVE8V/Frz9Q4naX1PWC9VvMqWnSgLam1ELyNlF3tvVn
	DrOaUujK98bt2fb
X-Received: by 2002:a17:906:7307:b0:c29:5a76:72be with SMTP id a640c23a62f3a-c29d78fed36mr38938066b.24.1789468431681;
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.oa7bb030819b2a894-tp.internal (219.40.147.34.bc.googleusercontent.com. [34.147.40.219])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e8a1sm566041866b.6.2026.09.15.03.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:33:51 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] clk: imx: scu: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 10:33:45 +0000
Message-ID: <20260915103345.1334-3-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915103345.1334-1-joshua.crofts1@gmail.com>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_clk_scu_probe() disables PM runtime on failure, but doesn't call the
pm_runtime_dont_use_autosuspend() function, causing potential resource
leaks.

Add the missing function calls.

Found using Coccinelle.

Fixes: 18a50f82cd2f ("clk: imx: scu: Do not enable runtime PM for CPU clks")
Fixes: 78edeb080330 ("clk: imx: scu: add runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/clk/imx/clk-scu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 44220e9c5c2a..18f73e679331 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -525,6 +525,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 		if (ret) {
 			pm_genpd_remove_device(dev);
 			pm_runtime_disable(dev);
+			pm_runtime_dont_use_autosuspend(dev);
 			return ret;
 		}
 	}
@@ -533,6 +534,7 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 			   clk->rsrc, clk->clk_type);
 	if (IS_ERR(hw)) {
 		pm_runtime_disable(dev);
+		pm_runtime_dont_use_autosuspend(dev);
 		return PTR_ERR(hw);
 	}
 
-- 
2.47.3

