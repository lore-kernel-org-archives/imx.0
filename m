Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015843659F3
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762877145; cv=none; b=UC/6yw4xSw+Zs4RL0srzBi1UXKxy1iLnVmK7LirZvzkwKhyNPG3YUoil7vy9Fwb5TeP7W7PXk7uhe5WQ03tu0IkVrEs5PuxEpu0sGaByQBGNeUCv2lbMcUsdKkCFYPYsQEnGeXJLYoPRYsAJPB7x35+Y9tCzOFCx9lsIUeE4JnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762877145; c=relaxed/simple;
	bh=bh/aGYh2TxqNDfolJ2dzfp2J9SHIt4utWVkJr4yXJW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=acP928ipK55Cg0PgjpPOoPMtSvhKOrbt22Wc3QeTn21riGW+zgYVGgrbY7AU4/6j6i83k54vA+foQCzu50/hNkKqQSCK5fX6CgWGOtfe5oHSsUufzHwq29gm0WYgfa8LbqTIPFOSWaCeKSU6gQC2E/KN/9F9IFeCGAoJtAjcfhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OHNUbGJp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OHNUbGJp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47117f92e32so38412665e9.1
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 08:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762877142; x=1763481942; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RZXbES+suQSnoFPsMGN23SzPRLTGjJvuz6wdaZN3k8=;
        b=OHNUbGJpkYYn3RAlZlwlZkEfd8IzpQo4o9nQiUroTnTSoeh3BtieYLLz//bjfPnWC7
         YYTih8IQ78CfQxHD4GV9me64BfH0Zs0LupaFlBvJAI3WpPu8SUBWplBF0opoJjuDPxFs
         dEaEjgcLRawVpt4zf+rWZexl1cqxhX5rybK7F+GIxi2DWs22IFqHnoEsP4b5qoZePUId
         QOZIWqkVZ7gtzVTjkNVuAJWFTxj9x/TJZ7RBagsAfgHCXI8gH3ZbOx+yz6BfhM38dvSH
         bMUGVa4QRp1CHS2y9mvFIr/4TrddNt95YM8aFOGbf2tbtAjXxaa/4pBMI2jFLticRYBO
         3Gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762877142; x=1763481942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+RZXbES+suQSnoFPsMGN23SzPRLTGjJvuz6wdaZN3k8=;
        b=BCr5SN6kkchEXu2jVJsaiBixp7bOev7krvB+GyjKf1nfELk5zBgv8OUXFu7rNF8wmw
         S4FuW34iuSI3uPx88svUfDa51b48LCeioalMcYH53pbqftGkQE8cVL7+WF5LoMp61JQK
         o1wys3V4/qW2hAPB/u4g04BB/B6/jWTfC0HiB8RhAEBeRx6jtIzV/Kae/1loab4haoCQ
         51/lbc2b2XXNChJ1HU6EtosYj7kZKYouWpSf8Qtf1vUusfSvE0jQlcMDJyc/6MVxmBjW
         Bb+y7UtpmVJKxD1oyxnRAjreZkxf/bDogTHdLe7wgH/3BfR1pITnhyxAcMq0gLDYiUOH
         i5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe9TllxDAocOOKAAIB1IswTsyhb4NKMAiDmTS3QVW8N/uH5jPkOk+8WpKmMst02E+Q2aQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6X5Qzcqglwh/XvCypAI9ezQDjWO/yVxLoWSXW85OH09Oizmsq
	EQzrmEwuRuWhRTH/seWyvLA3YRDlnc6WEIaFHMptvdqrKMA+IbQSyaLMWFHou7965DE=
X-Gm-Gg: ASbGncv1Y1Gl/32M1ehidM/59pmZ2EDmXJMGltiIBmaqeio4QzBAb9eUe/qAsL2nLmX
	dAz7V5BF16pQ5sfUEZ57/riwF0p8TZyuV38z/4Z+3C+91say4nM6/v68HkaCKZrUhirRSr11T9A
	SnJh9dOk3MgL9Uxaci3qCijg9+aZqxWYqnrYPdYFz9n5G0aG0KYFQpwbzYn16c4GwX42k8BJXzI
	L+/Mjr/eemwHzz64giEnicw0p0xsl+r99+eqPsclZX0cz4mw7y7DVPClSR4AVJ5ExBSMO7dRoiN
	Nw25LoHHHIes/lWqSHLZ5WEb83P+D4vcYt1++88EpSs6VICUh/pxzgymh6xGcMmFL0z1kVy8p+f
	ONcFmmHz9qalMC+JgsHSuFLM0eMGmfNSQ6JgFVTKXlzLlMWinbjsMLps5ZqGyBJGdXqOkkYz2j6
	6EiQr0/qvZAMJLjXK69sI=
X-Google-Smtp-Source: AGHT+IH+MYmpINWnsFKQUpl4/+4Jobxe4uN5z+gwXyp65Xhhafeom17agVpTYxk/6AzKP9Q1JVntow==
X-Received: by 2002:a05:600c:4ecc:b0:475:de05:661f with SMTP id 5b1f17b1804b1-4777329400bmr113603115e9.41.1762877142176;
        Tue, 11 Nov 2025 08:05:42 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm384957555e9.15.2025.11.11.08.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:05:40 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v4 0/8] Add support for i.MX8ULP's SIM LPAV
Message-Id: <176287713958.95002.12532568280694164920.b4-ty@linaro.org>
Date: Tue, 11 Nov 2025 18:05:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Tue, 04 Nov 2025 04:02:53 -0800, Laurentiu Mihalcea wrote:
> The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
> LPAV subsystem, which offers clock gating, reset line
> assertion/de-assertion, and various other misc. options.
> 
> This series adds support for the IP by introducing a new clock HW provider
> driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
> allow it to be used for i.MX8ULP's SIM LPAV as well.
> 
> [...]

Applied, thanks!

[1/8] reset: imx8mp-audiomix: Fix bad mask values
      (no commit info)
[2/8] dt-bindings: clock: document 8ULP's SIM LPAV
      commit: 3b521bf8c51246466e2c337f1f2b60acfdfe82d6
[3/8] clk: imx: add driver for imx8ulp's sim lpav
      commit: fdc1dc7dd53b95805d3943ed36785c1ec812915e
[4/8] reset: imx8mp-audiomix: Drop unneeded macros
      (no commit info)
[5/8] reset: imx8mp-audiomix: Switch to using regmap API
      (no commit info)
[6/8] reset: imx8mp-audiomix: Extend the driver usage
      (no commit info)
[7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
      (no commit info)
[8/8] arm64: dts: imx8ulp: add sim lpav node
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

