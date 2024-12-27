Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E2146A79
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 12:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303612; cv=none; b=evk62ODtqOeZ9ooGhVHjkRlqJaHeTaQWPglM5I+jbNCN4ePIe4x+FbRZirlxXweQKpf2K0+GQI8+qklIv3SivO2mrfytfOgWwlsHkPbOZDELity/dJUlsindQywBUBh5ORpDT3mhdStl5EONe3E7p/zTWVnaB3jfsODD+2HaqqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303612; c=relaxed/simple;
	bh=oVc93lqqN6htEbKJFN30aoPnMJWeYhgqP4EzmUGKqPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=excMFtIRU+vJNzqvaqOO1wJAuMESpELPuM/wE3YKUEJdnbxOpBe3Zhf2g6m2RmYZfleGfjISUoOyQCc3QTpw45djXslSOdPvLZRIKpQiCTth0zaj8PDQS36+cosN9vLyUbfuGh/9kbl7hdcWhzipEEsJfLhKs77qCGgqzOGXHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LBKFN2ed; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LBKFN2ed"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385dece873cso2679489f8f.0
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 04:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303609; x=1735908409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKZLDmgXnxDTvedApqeYbhb4pkfn3581HbM1Qj4Qke0=;
        b=LBKFN2ed8lQ1So0yfgFRYDtDjOxrVU97mSS1Z+HTHRFvIyTC50FZC1Ca8mkocxAnZQ
         KlT8pyK8jgHvKauVeIZGuUFW4LlQ4XQ4wCFcq+PdGY3hRYtxvUkBLQKtVH/OvGoxDp0C
         wRRe+Nycc6UP7zw0uJBL3F0xNARtLV4K3pfCgkZgSvQkgri+nK1+5FGkwQRz0L7fXedk
         3hpzpwmChEXeND0ZHuNhDAu8D/OYQb7NiNRkNrzIheRDjsnW4X0JLsqgbX0ro4XKMs7P
         UuEshYLeiFKyh9+xaCpmX3CIMp+2S7ZQhKRr11Gem3wlBESQygjK5e1/Hfj+ssiZGCQc
         /YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303609; x=1735908409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKZLDmgXnxDTvedApqeYbhb4pkfn3581HbM1Qj4Qke0=;
        b=UW8BF3MFFgYUpnUXqmdNsIKwTVD70/f9WCoOgmsMnsbPuikVThX38k/pEKI5p36Xsa
         Es0UiJuRGYtd6suHmKpCqg1yX1HS/MXrjnUfEnrXGx7uie6gvLbsSSk38AME5QKYg9xH
         CnqVcbu/4F4wchfbPkGS2+WartZp5IhKGc9E0/v+DjB0VsZCTl7WiC6nf/UYbvVgRIv2
         2UI/9grCNkAUi8YnxI/j2iTF9dM42LEgEjCaTseEL40EIHV0Ccmtk+SB7GTaZ3cmqXG9
         MS02Xg3tnx/K8oVmIlpnWSgOWuYuFus6HvKgS7b+oBUaqkDP19noakeXHkCOEov90BHp
         2AGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX74VfghEjSVzZW8fsUQQTNmPVgTO7aZZSJYjt9vXrl+17xh125nn5R+4kpy3aqg4u5gI4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6MtW2QVFQnnTu0ZdR4tTzElRWCQ/yhC2kXQ5Xp7EUsQpRPWvt
	Rk02ZHDOT0YZI6k1004lBXi2ydWDqzMImFd69WhFHrsLkYJLjDXVdMJQwsc2mTc=
X-Gm-Gg: ASbGncvwzcvHGoDDGwngyN4sBiLFxWiAgBxX6azF26pMgFYsu3lfZUOkZBxqzDaNQkM
	k0LDwt0Gj7L/GfIkSbtGEbIXTQDvakH3V3fW/ekKJlLYJO852epL9k/N3QO/3AVfu2oRZCZekZY
	/KPYFoKgYx8yioJJSkUx5GJCEYb12zeoWe2r5VzMrw6xUvidB6Vs8FoWFbMXIc5R8kaSzs+laey
	TT2SSF5tGmmRNxkyGLPaFEkUpgexmv8XDI0+rhI3dnFpoVnngUCeV8H
X-Google-Smtp-Source: AGHT+IHUGw1dRb20Q7tB744vdpiCFmHJR9m5A9wf0UJHlaCM5WPSJo762Y4NDRosAM8fszG7xNcx2g==
X-Received: by 2002:adf:a3d9:0:b0:38a:39ad:3e31 with SMTP id ffacd0b85a97d-38a39ad4128mr6360300f8f.57.1735303609335;
        Fri, 27 Dec 2024 04:46:49 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:48 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-clk@vger.kernel.org,
	Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x
Date: Fri, 27 Dec 2024 14:46:00 +0200
Message-Id: <173530350108.4140483.17886635259126245579.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112013805.333798-1-marex@denx.de>
References: <20241112013805.333798-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Nov 2024 02:37:35 +0100, Marek Vasut wrote:
> The PLL1416x is used to implement SYS_PLL3 on i.MX8MP and can be used
> to drive CLKOUTn clock. Add 208 MHz and 416 MHz entries to the PLL so
> they can be generated by the PLL and used to produce e.g. 13 MHz or
> 26 MHz on CLKOUTn output.
> 
> 

Applied, thanks!

[1/1] clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x
      commit: b7f67545ca9fa13f6e12debd68a92c1c664e2e3b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
