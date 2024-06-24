Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4367413D520
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234310; cv=none; b=nJ6MuFK2xyQXt/aEl/cewddPNwBkM2aYGgbr4HJB4qBLRjM+tRNUugR2pYpz+ua2jPGdxnTan/Q4T66qZ6QWiQtaNxmtK1+7hgbk48DBooubd7v5fOQ0Y3ETBQVV77u8k2NqdA1oGi5ezxmuABe4VM1r+pVAYC6laIXTolFkJGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234310; c=relaxed/simple;
	bh=+drNbvux++uug0hPu6tz7VO4BFIyNDtMKC1mDMXPKq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Iz19hTqUX/SNHDKA09/NTwo0ZBsuggQZbXTT10vWv1mvRN7KDXEQWuE4/HYLV819o35vooHjkcuRp0oUvHyx8LHybvB3MKWyccXZv4jH7fBRA9YAM6550C9oY0iwPRbz/rpbE+xfhmm6NJbLGtocjecXGUPAZp16MAmhQ6W98m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzMy2wDW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzMy2wDW"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdea1387eso2001362e87.0
        for <imx@lists.linux.dev>; Mon, 24 Jun 2024 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719234307; x=1719839107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCSs6EoE3tz3KgGGlszJ+JFtOP9WWRkRZnOsk0NEKe0=;
        b=GzMy2wDWbK37S8iUexelLtdP9MYd6BTb6tGpIeL3KkezfwsynihoaPm+nqaEd2DVO5
         RZaOMvtyTJJlyePOi1qyQybLYZRJtT+0MeS1nGU6boljU1WYNTISX840RVf+dn6X5sxi
         ztbGmbby9BstMrH7H84Qx/KPhU0KVQp3udUaR06nVhy7j1G+jNWBkV8BSinnxYVrKKuA
         deUzWd8HBk7xph1bbYdCd2HD92xG9NP0xwhVH4zSzfC8N0rdRTU+Mes9YUAKnsztauGo
         RUH3hzUa0l7cAkAL7ErVA8oX8/oKHkOoFXuEV0PHxbL+Dlbqae/WuxulWQLspO+N4Znp
         rFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719234307; x=1719839107;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCSs6EoE3tz3KgGGlszJ+JFtOP9WWRkRZnOsk0NEKe0=;
        b=dn7zXapEyvKiLE9m1lcQr6hsZU4KmnEHjJf5Vk2aUOnOVHIkoxBxQNtavB/4HPUVFv
         eMuC+62B8QOlmwXn201THgcGfW9/k3tuxiG7ow2uQSwh06nFogR3B/IIZHUMNmJEbjT3
         6hy6hP8Xqmwzq7N0YQC+CWcE1Z34W2saA1Ocfc/JzeDNDeg2PSqTrXIcAqxonVZPpZKs
         VxoiXmrMuQTVDHDesOC7HUdTk950y/LiMgGaPscEhkgOHWKg88F5FgMYCbIHz/kQTMvF
         MDXCOkAsW3VGoNzJXAZK9za5X0qtmaHCu3q3lJhuKx6LA3QDWjDaFnIAOs0OklQ5eS4T
         /EpA==
X-Forwarded-Encrypted: i=1; AJvYcCXfKlHoEskChs9QB/8Mqevmblgl/4d5x+t6HufDxksjq6uXq3ObmrDk2uLgvcosdZE2sBeufo2GEmy7S4fLfILvzYRx
X-Gm-Message-State: AOJu0YxqX5Z5sMExhtjznMi7DQRmmHcsSPq7e5r/ycZzsbjiE6nFHRnx
	36AqwW0j3Z5gxvFSwVEJggCws/wGg+ch/EQepIPkRwyIYohApXcjnbrMYUBENvM=
X-Google-Smtp-Source: AGHT+IEZaZMrjJjqM0Ess2luZwycJQQVw6sc4PZ0oTPthYEnIA9g9rv/bnCXKiQWNCLkhV7ZgfxGTA==
X-Received: by 2002:a05:6512:39c8:b0:52c:e4cf:4f31 with SMTP id 2adb3069b0e04-52ce4cf502dmr2779953e87.49.1719234307304;
        Mon, 24 Jun 2024 06:05:07 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248192243esm137985425e9.44.2024.06.24.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:05:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240602-md-clk-imx-v1-1-5c6d240f6fab@quicinc.com>
References: <20240602-md-clk-imx-v1-1-5c6d240f6fab@quicinc.com>
Subject: Re: [PATCH] clk: imx: add missing MODULE_DESCRIPTION() macros
Message-Id: <171923430571.3352368.17603224359381270285.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 16:05:05 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 02 Jun 2024 08:59:17 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: add missing MODULE_DESCRIPTION() macros
      commit: 1919d77a9591aa692c8de11540ffc0e7d18eabb4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

