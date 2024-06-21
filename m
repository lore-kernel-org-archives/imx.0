Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95A4155CAC
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951903; cv=none; b=JpKGwejpKCYEMGK7GNZnR/nuBaOunRqEz7j5YvTaxG30fpDNXI2Atm7vSDxz+ifEyXiHYtPGa+tHUg8Hlk2Ma9OiQbIy4xMSN8lKI9NwrkuLTZONtaD91vxR7If1BPuyqc1e1UXqWswIrDHURi2lOMTMo64SOqm1v9RF9BQnQmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951903; c=relaxed/simple;
	bh=IXZaJwoonaXAaG8nRSLWn+rv7pzccaEi+tHComAcTnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SHwqYdNTXwmrHbsas22PbaE3TST3MuCL/t07p3mGiM5jsZqHmhZayVofYWXCwqfzCM9+52cWZOgfD9KSZhyGfAXWl6FwlWG4SNYpkVrdtzPri6dtn3ROKZ4B3xFIkMe0QlQlac/Hx1Z/Kpiyje9XxaHj7V9Ik9InfbotnJs3kDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqRnGbLj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqRnGbLj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-421820fc26dso16012435e9.2
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951900; x=1719556700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjXqcRlv34M001faSimJYUquwzCRuq58MB8h3usWsF4=;
        b=aqRnGbLjzcoy8CjifgJuVudic1Gl6dfkRMlqlmYGEqU8KgzVFr8RCiom2yUmMOryVe
         lsPIkBBfxhDUZi+6xBY/s0364TFUhNH71nJ0Ja/wMVAMNUCeHD3hYIggTUTuLfn0sWMa
         4EFM6Jvg3GozlmqWxAMUEkHj3/laEUWwb+IEMjXHd6TVrxAl5PLUTgWuwOp7vUAIHQ14
         G/eUHAx65IA7Bxm4IwYAGs18RINRnlxO9hYiEQSXEzwmgYjC/gg9yFJjjMsl3YyzWdBJ
         EK1Ty/QH71XEmaLkZfnyieFHrgYurpy3cgqsCFLq+8gR8xZz1zROitoMX/ODCUOcuVGw
         ga/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951900; x=1719556700;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjXqcRlv34M001faSimJYUquwzCRuq58MB8h3usWsF4=;
        b=J23ikaaaDCc08kvAvgHgOoHfe1MyXjmoBcWcoHfL0HVpZGi8qD4w+PkOu0NtW52GVk
         P1EQ8/H8WYJRANjRBZPI1O5xpaZsmEjBp7+YL8ZFEWNcv32vamMJ/oo0mfFYJ6RQtgNN
         keH7MCO/UGazYPHRPsBZddSLLIp0GYvRIjQMCHj8HBEPC6LNdByj02UBCDLmJ0Q/baNv
         erV9TZi76hdc10Z6VgOdRNsy0i+lUOdyfNmg49AtyUddayvSS6MZT3o5Z7Y6s/Qyjmfw
         Rmzhij63P+YYCBxlcXIUQc/mPATf92W8lCgr6PYJK1vuYtjJCHeEtHgQsCx4yLcMv6Fk
         S9aw==
X-Forwarded-Encrypted: i=1; AJvYcCVcWsdSrMutv+I5LNZiy4FhlmdazzfzADpXSDizAM6ivM418qMg6y5nRmnsgNPaCl4IztxEB6jRfkVeUSFw33wAwOZO
X-Gm-Message-State: AOJu0YxNxjgiLl/u1qup3esxD5fsjhjDcimyOpdlLG6WRGvZ7LNIcp+G
	wkX9LU3JnQAMWLLnEv9xEmfsYGt4Kx8pIT+2rVFcHp8wxgry+zWLDF14Sap5Xho=
X-Google-Smtp-Source: AGHT+IEiWE3LOwtpN12PBZwo+HPa101V8ycfDZ32up/OGnZ40ETADhDqdiNS1elyZsP4oUBOaW75YQ==
X-Received: by 2002:a05:600c:3b8d:b0:421:7ac9:460c with SMTP id 5b1f17b1804b1-4247529a970mr54295265e9.39.1718951900172;
        Thu, 20 Jun 2024 23:38:20 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d2122e7sm51100865e9.40.2024.06.20.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:38:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 "Lukas F . Hartmann" <lukas@mntmn.com>, 
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240531202648.277078-1-marex@denx.de>
References: <20240531202648.277078-1-marex@denx.de>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
Message-Id: <171895189899.3641239.4256976969663530341.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 09:38:18 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 31 May 2024 22:26:26 +0200, Marek Vasut wrote:
> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
> Allow these clocks to reconfigure the Video PLL, as that results in
> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> clock accuracy is low.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate
      commit: ff06ea04e4cf3ba2f025024776e83bfbdfa05155

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

