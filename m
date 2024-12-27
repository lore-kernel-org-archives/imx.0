Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C113C3C2
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303606; cv=none; b=g2T2CUcVj6Lg22afWDJR/TxKpDk1bO9Hszlp82bPAbzP9MSMJjlqwMIZhEloenxbrR9aCyERumsYlGjiou60MSQy9IhLQ00j+L3vX4QOhtTGsYXpRmtFitU6wL8yO9q85cHD5rGKCcApRCGSajxNgR4kD1PuTnx3PjDhe91rm3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303606; c=relaxed/simple;
	bh=IX1Pbb9e9j1HoYmbUCLz0vmxGQOa9VaE8MApR1YCGOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FH7v0EkB308EZf+E+5I1yQ+XlBmWalb5fiK+hF3VubZ99Q6CEBkrybO24d6g2zwRcZ3sVS5DeuLrFVG86I7AszpYSa9toBDMa0TSxJ6ysgM31liFJhRUrVxIC6/RwkdLer1dGN9QyloYlECn0vty9+eh/XGaoRqq6p7KcLdV8i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/JoGxiK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/JoGxiK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43622354a3eso49627555e9.1
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 04:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303603; x=1735908403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAr5MJyxW4tliQqtSvIibq4rtO0kf94wwATw2mUtoLU=;
        b=B/JoGxiK+CigKvsIPOgYiXcW9vHLuCpSRqprMOrayN+/V+8Az83TsWPeLT7kl0ykDq
         7wS2SHZh2+cWn9C5lPZrDMn2BRxUOV1tt7mZpKPW9u5IqAFYI7kW4FQ+0Vrxydvc5MqC
         2AcFUvbDPCDrDI2IwjPoTzuRT0hac6hQrmieFKHX+PRFeILNvXbpmwC7pkXHgUAkoDW3
         fikPcanTp3h1wqFLBAm1oFfHslg9sTKtDSV1pnfcDwmWjFzQBsP+5GQxnjRAaEfm3MP3
         QUn4hbGUmIZvPdvVHckpFuoZD0a+GvavJdjoPH5uF6fC8q7Uu7ZvUlj8987tGmI9tU5Y
         ROpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303603; x=1735908403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAr5MJyxW4tliQqtSvIibq4rtO0kf94wwATw2mUtoLU=;
        b=NKRhjmEdGtyoxLgc0p55Iye6RpJ//mjV0TXPQu4QWTNcQOTjv5vcil1Qzsecu15XR5
         q3UV8CUzZcMyjYmx5/PewOjqQHIpBUBO6gRcUUSts1zMQrT9cTdxOPKFHdQi5wS+9URs
         BKulyBIGsgLoiDs2j0b4cdV7ecnnUDBqaGi/MgTp+FWa5nBGZbF7XGBG+eOxEtatrL9O
         DRoyJ6dsgOrtC5vd7Q/IlFBZ7xJMQr76OIex2wkH/2/j/01Lpa+DRvGtXRZ0/VLH2Hbt
         U+ggMJyZjusMriGWByEZkWj+NczGgtc4i7bXk0XjeJ0RoPTJ1E8Q4N4Mc6weTFCV106z
         KRrg==
X-Forwarded-Encrypted: i=1; AJvYcCWM+AtPe/U0pf00K1oeofbSUAChOr+lPTT3dtZlAk03WLykVwmDfueKCstrAiME9TEZqKk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQWFBbFr1x+5Nt6cytWoKqckrAlvuAp0V7drRzhFqkbCX3a91e
	WHA9sM8jxoRMfXzb76XCCY/WF5oCyEcC4n/GeqnABfjwFX16sjRuMWt4bEx89fI=
X-Gm-Gg: ASbGnctUP3ps/DFhUtb8opRDAaHxG4aUo2ZAUZDR+LVANItOPNE+Hp8ymhyocwRkr/g
	dT7oKSvgipD+dUbfbEloppHqzUvZCgYGL6lw2viwCtEWoWdU2V6juQk3Gmgm1/HWBlDYfIDrWMA
	pez+BlsS1OOD5UPLhn8n0zJhc+49XjbCqpMumiOWD1Tyw33dZ+nnroi9ERKKzFsgPJH9RYAkvnP
	ytYHk49KhJoIgT70Faril/bgbpLw4ofNT2ubQGTKeywHYNEdm0oTU0t
X-Google-Smtp-Source: AGHT+IFOSyN6MsRY52PNGIySqb8jJ3jiAJ8ipn+mH7OpC8pga8Vo0BdkKK7utvCX05gXYmLza6GGZg==
X-Received: by 2002:a5d:584d:0:b0:385:e0d6:fb73 with SMTP id ffacd0b85a97d-38a221fa9cdmr21953130f8f.15.1735303603117;
        Fri, 27 Dec 2024 04:46:43 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:42 -0800 (PST)
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
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx8mp: Fix clkout1/2 support
Date: Fri, 27 Dec 2024 14:45:59 +0200
Message-Id: <173530350106.4140483.17403614068290152779.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112013718.333771-1-marex@denx.de>
References: <20241112013718.333771-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Nov 2024 02:36:54 +0100, Marek Vasut wrote:
> The CLKOUTn may be fed from PLL1/2/3, but the PLL1/2/3 has to be enabled
> first by setting PLL_CLKE bit 11 in CCM_ANALOG_SYS_PLLn_GEN_CTRL register.
> The CCM_ANALOG_SYS_PLLn_GEN_CTRL bit 11 is modeled by plln_out clock. Fix
> the clock tree and place the clkout1/2 under plln_sel instead of plain plln
> to let the clock subsystem correctly control the bit 11 and enable the PLL
> in case the CLKOUTn is supplied by PLL1/2/3.
> 
> [...]

Applied, thanks!

[1/1] clk: imx8mp: Fix clkout1/2 support
      commit: a9b7c84d22fb1687d63ca2a386773015cf59436b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
