Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DA350097D
	for <imx@lists.linux.dev>; Sat, 10 Jan 2026 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768056544; cv=none; b=sFdA9yheVrUxNvVmrFuY0YEKKAWwVc/GYTl+O13jCPEMZPNVM1/kALVIpQu7UusBv6+9spXkBot/mS8dkjtqkL2i5hpHZQ3DqZCJkaPU2SNFqetRWKqbe06PWX3rQkS9pBdLxSCkKc5o6tl9NW2UuaJbHimieqTEGpNb5VJeNC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768056544; c=relaxed/simple;
	bh=8cZF88ZHHeswEWIoZ1XSpuokeFUHz2t/rDtmfT1Fb54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0vIoduMBxi2HHSaNClPC6XJwrp7DtPSHmQBXX6rj6hSmW79Iz/j3EmEuOWM7ozJsYlRl2Enqjgs2QYOKFsVwPUHOhHLJM6AHKUJj0XS1gUppCVGWUTmQPMWnzhUgbqh/wtqjvAsYNQjE7oFlSLo5YjOws00cjoq3VxpJhdTmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VJQOKxQh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VJQOKxQh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4327555464cso2977709f8f.1
        for <imx@lists.linux.dev>; Sat, 10 Jan 2026 06:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768056540; x=1768661340; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=VJQOKxQhoOnvhNvaY/aTr0tGIw/X8PCJwqiPHVYWEOsduw1dwc3JVaXgKyG4Udtzph
         2BtvrzoJCtV0LKXerd1I0LmxFskmG1/QnNdHh2bLzSn3PeLrS98fuhe5wavC1Y+Ya8RX
         kq5OQEIMle4RR9A3K1ERW6Od3mbahVWoTP2EgrRV2M6LprguzrzWySyZzyIXLlEsmKUH
         b5teekPFVT4Q40KXna7dMjw3+hxd7fSk2Ufv6V4/1YXV53c15K9PpWQsEYtXUGu1Ya8Z
         w4t13xp3RqjLHSni4K+KlONUdce3Zyy3UKFYkmsSa9c09GS4KTOWKf0oQ3qgwoDsNPnq
         7wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768056540; x=1768661340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=PkBiuSSb5U2wPHXJm96CPn9BfKyb9qOWIzb8WbgmGQ+xcH1pWxA/EoOP1Z6bQYpxbr
         ZWb437bBG361DlwtcZBkfmNx24HAQdzrAxEhfPZ1/OV5oOIe/L5v70gh2++0yhDuO0rP
         q2Fd97Awe+T+BmZlU53gc90cYVL9X6g1sYxHMOvTNaI51lPJWH/sXeEl47k9wgDKB6IG
         NyzpZ1cNkRC31wP7qgicIc/wA5HJCgHAbVPyydgaJciOAxbZr4q++dpMR981UddXxdyx
         lrqvHblkj4cZOEzbcldV2GLvFWdEpKqXrsnO7Rn90ZFps02F+wzOvSa9x0eoO6uQiV2K
         8ySg==
X-Forwarded-Encrypted: i=1; AJvYcCXGhkEGxtyBhQ+4dAhwzcsyrEIHHHA7YvhE+9gWzFd6ZxpQpIc4uqj8ANM4TbbupAq9LQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbgoXj3/Gfd5P3AHDasH1rIPdGfMu5Ckx90HSOEN7E6xPus1jC
	DRdWiMnfrFm0lh3dGI7fbK46j1illhFtGVIIu3a3TNBmHI/kNllyT7l5/BwVhuslD0Y=
X-Gm-Gg: AY/fxX4ufzQAIHNZwQbV4SrcvQzS/1m5GB1lj2yJB/FizO/cwbUmXRxzZJMvbzDIUNB
	a0sl3dqCdxzjQH6olPMszhVsnAaijJSllUZIbrmvRQcBRme7KFrmfT+SqC2om8lLJJJPh9iHvU7
	VIz3en2wOByiJcQeqbXHWinypSFrQtapRMJda2HVPcdllVq+Hnv1DN9h1TkPcl3eviPQPsq4/oH
	mGmZd/slIGTemvtU+LoAxZJcOxD7ey3YJ/6OayGMpe4oDPoxE9jzOz+Vo/BGaKPtITQ5AMBaXcC
	AKbCFLfhGEyZLQahKd8gvvC4p//JV+b5wsPFDTw/9ykYOypJZiT6CngWFRRFUT8SpkMducqyjHN
	RPDHG8ECkaELqPnuQ2RTLKez9MEMcEKbOKOqOJ2fo247JN19RM6++fB0OFOYlAbYTxCtNEOJlhj
	ZMyz6KikkVnheazbx2I/KNPuG7tp8K
X-Google-Smtp-Source: AGHT+IExDiyl6+cMqnLU0OScR46v/DhXxaFlI7KfbIz5c0gjBYd8wiO/Eo5iH1Cn00OMlkpwekH3Hg==
X-Received: by 2002:adf:f54f:0:b0:432:e00b:866f with SMTP id ffacd0b85a97d-432e00b8b14mr2891143f8f.60.1768056540373;
        Sat, 10 Jan 2026 06:49:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm27764794f8f.4.2026.01.10.06.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 06:48:59 -0800 (PST)
Message-ID: <b0dec3fb-51df-4bcd-ba13-c2049695266e@tuxon.dev>
Date: Sat, 10 Jan 2026 16:48:55 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/5/26 15:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
