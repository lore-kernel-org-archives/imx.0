Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC09212B28;
	Fri, 10 Jan 2025 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524821; cv=none; b=Ov78qFuQLcKbVcNII2I/RXMg5ev/e806x3KcnWaFpv8uqEsuEb8NUhaO+QKp5lVqEVoFFtUZbKiPawFfV+Dm1+n3C70BtqNwNrVZaonA/tqSgu8eMLhPxKh5ocdrFukM/uf/fM2t+Uo27T/U0ljfKei4/cYm1QQWUIXa3LKDhaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524821; c=relaxed/simple;
	bh=iVnoh5XxXBNvRf9VFz2lCK25OBZOXAulTqGhLM/TeG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1J9WT01xufuJv6kNjcXP8M++UcQrmLwLk1AvXfPKLy8QXW/hsoL5OBa3p5doKxSbI91aNAfzxUQHzEejP99c1qYHvRVTxqgX/Vl84Q5sko1GS8kMD790a2sDErmpHIjJA0JyX0lQXfbmNUbqYJS5h95CXWJZW8wq0s1oFE48YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-540201cfedbso2004278e87.3;
        Fri, 10 Jan 2025 08:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524813; x=1737129613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xier1H0iRZQUKFRWlNiMydYcr5ZwkdaYGgLJSuP7jbw=;
        b=awnVivFFN1WOD7muXHxTw9uuA9IhUOSdCKvlJKHXCG4y1kS0PxPF4705ht4CT4tUn4
         vK9OmJ6/h6zsN4R5iPPvV5KYSyDD0E4qs2/9Q8jcSaNcnihgatfu7yUDuVkYZJS2D0D8
         L7PT4A8Yl9XmYUVSAhsdqLI+3McM5ZdBnzyt+SYUW3baaKv76ulUlw6ZvoBPeZjYyOi7
         ssSxT4ilY+NI3eF/njjHEXjhE5ERMps76dit0mb+vLeTHGm0qiYu7I2AAmlyVHbCqrI0
         yG1x35xoADcGbA8wNnl4SHawmT2y0RqAeVCD7xkN4EBFUEEpSYWfQoXLKVEGsJIK6J+B
         l/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCURg4r1GI2Jw21gsUCMJHLltgS0YA09rs7u5N2XeQ3aHOn5+DYcMalEGaZIBQhNnr/GmEg=@lists.linux.dev, AJvYcCUdvI8Xnb72D8GN1sKie74uN43VUDjjiVKfZQw6tlJW4X6RaXXCuN7EAu1yZ5if0+e47W5Qv1a3eUMn4Po=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy+9j39+qY34y/g4BGELKEWgrzClHOTwT7+S24jts8G1BfCUha
	CvYl11EXNf/gcPrQ9Lme0qikCTv2VhuivSwjfyudxnmOPoIcWkma8diRq/Ey
X-Gm-Gg: ASbGnctvJEXJVBlNEJwmhElNzfLuvI0CCDKuS8wNNNxMewI3nOcdzyT1XF2DVAj4y0d
	z00qwYk1kbE9Af0gNV7AsYgbFzBJHcGwdB+N80Z3zUW7H5mqHTJoJLMMaktoE9LoeogShgJs6tq
	AxwFKRkMOYtJZhaxEuaJpNlnbNALxl/GEAUwh9q+iMt19XBYZSMfDl1c38eNg/aivyaqLh6IlEh
	HjiQXPMpmlBTECuzpHKGGH4P2E98898Ww6a/rbWep8OjZ6GUKVoT16+p5NtYkB97a+tud1IXb6G
	e7DqGPYcnV823w==
X-Google-Smtp-Source: AGHT+IEO/Y/20yCUJKvCwL66UcxyEa8x87RS6ztbg0s2d3SoVYHtR+CWASf8nCTK4JZ6dC1Ijiy+VA==
X-Received: by 2002:a05:6512:4013:b0:540:1e65:1d7d with SMTP id 2adb3069b0e04-54284545eadmr3664803e87.23.1736524813372;
        Fri, 10 Jan 2025 08:00:13 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be548desm576845e87.107.2025.01.10.08.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:00:12 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3003e203acaso17666351fa.1;
        Fri, 10 Jan 2025 08:00:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzH6K6Ft+t4jYzBGkZG/0TI9AGamJbWOzlDLjVTxqEZvOxcfvFmvu0pFbZBT2fxhr6buy5/miZYE5LpTI=@lists.linux.dev, AJvYcCXaBteOEidRTJmOaE+kpG9FjynXzhWLHgsR1GKMhkVmzmj/KyY2YoT6HXnR/qYPZ+KBymE=@lists.linux.dev
X-Received: by 2002:a05:651c:19ac:b0:2ff:cfbb:c893 with SMTP id
 38308e7fff4ca-305f459ab20mr34723811fa.6.1736524810623; Fri, 10 Jan 2025
 08:00:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 10 Jan 2025 23:59:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64p9S+o7+97GqTHak1PuVR2AUo2H8BQmmcFgA7CSiFKtQ@mail.gmail.com>
X-Gm-Features: AbW1kvZjBbLkmy_SyJ-PR0LLBGaZFrw-ONgajjMHJLqhUh37HElpVRr_LdJUQeI
Message-ID: <CAGb2v64p9S+o7+97GqTHak1PuVR2AUo2H8BQmmcFgA7CSiFKtQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: thermal: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 9:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 48 +++++++++----------

Acked-by: Chen-Yu Tsai <wens@csie.org>
