Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6F25F7B1
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742822726; cv=none; b=KT9WtTyXAmsgAJHNOJ0cnI1aQdp9A4pIgQXDhvfnrJLGfjwk7PlZYqOtLM1dF6WDnDzknKPXdoStvk7Ej3+7YHq3oRqOIb0E2A6ppEnwzhmZbMQ28SXY5pjmuKUJq1OSsO5quXZVV/3DMQ646X23PVqMzgAuD4NUtqBpbvkkdPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742822726; c=relaxed/simple;
	bh=5sydytHx7h525TTyhjomwsCO0JsaR5Fp//WMRl6worI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eP1sWjhprHo3X4HiytjJlyyYLQRT3048CIZgEPFwmIC7gZxqPQboa1au1dAVGJHSmjY+TJaEkzMgw82SeHzJUDiDvsH1piRNgJsAz/+hljXv3WJUD/86uN2G5CE+yPAZ9aySVWOi0c/Ngtl03tmb58mQ4GCsNiIhL2PxvW/GTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1866619e0c.1
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 06:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742822723; x=1743427523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pysUx5KjUsnCC7SRGDXolsL0u/kPjjXuwebo/Ew3v+g=;
        b=Dzm6iBYFS0bHZ/WQnr6wFpC3CGvppw/BEKoUqpE7JXagl2Z/dr82+r/1G2V7io5F0s
         otKGa7WuCWT54h6FCCaZPfzIP6aHA+NUmfHAoSZ+Pne4No8uG0sgNUcSVFk42JUgiR/c
         lHdEb0hIRkej19Ogko9UaO9hYBhcG6RXM9MLhBVR1BhIk2LiVIx5VdZCCIQM+bVKVzgx
         hZZzFjF0DD0RziIg9deidy2OnbvHyUEzN9YkVH78hSIq0/l8uolWnY87Fkn4XWAg+JBR
         lvOSs9xlGsL/3Z1GR9rMnb5URmcbhyotZPhcXWc3uUJqkvLivOQxk//uXx1QkwcQeSxl
         MccA==
X-Forwarded-Encrypted: i=1; AJvYcCVay6qlefXW764coV5QsPnyXTv3q49R6ivTwA7l+siel2mte8MaTXC9hBbj97G3/Y7F6+0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTHmdHH22XPD2zJ90TLaP77Twiugeu+ZorwVc7KUIDOcI9WSfb
	FMx5OpMv4RgU0ZrGgtpnKOcbrlACmMLfd5xHkSDJb/oPrxt5kV8WcIC8GAZt
X-Gm-Gg: ASbGncse3VZYFCI0i8bu7bsirHFdnM/NljJIwXO9Llu5fFz4mGZqbb3c7LNuWEOqyqL
	ZEelkhHG3+vwkM7T7g4rukxnrCwzD9lR4LmdUzwT32jdBTxNjC1olUTThX8MLVnK41CNWklki54
	y9/sHL4+pq9ONMXNFZkulVS7h4uNFKre4Moy5XVFlR79qRYFXKSPed6hDeBinYPN1hK4hQ/Cp8j
	cGbG+lnSg7hl90mSOMs4bOHPiD4C5/SNedjHPZ4FkB8OkCKzpE0Nx/Kr5tn2FU8eSCVDIdFQgON
	rxJIfU8AZ3Q2xEfV5znkohkHcIGMtNPsvDRNEcnNATIH+2iaSZvT7Qfzwt+FlvsMHg5Upp04CgF
	w78xsQXs=
X-Google-Smtp-Source: AGHT+IELuTFIq3zf87l0yZ/qXgwX0CSdIw8ojDEuZAMurU6H4UA1IuC2dVM1RyvvVgdF8m/eVbk0OQ==
X-Received: by 2002:a05:6122:2398:b0:520:60c2:3fd with SMTP id 71dfb90a1353d-525a833acc5mr8648969e0c.3.1742822723114;
        Mon, 24 Mar 2025 06:25:23 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a76428c5sm1373726e0c.29.2025.03.24.06.25.22
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:25:22 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86fbc8717fcso579059241.2
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 06:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVALtKl60HeTFQyjKpC3IqZaXcquJQ5KWQVGtsA8k1iVWpf7IpHK9vH+FCdcySY7ph+lCs=@lists.linux.dev
X-Received: by 2002:a05:6102:fa0:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c50d5c5525mr9355749137.19.1742822722526; Mon, 24 Mar 2025
 06:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 14:25:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKFgm_44XXq7Zq8yqosBCQc1CK9dkJoz4nLQ=aDNx-Yg@mail.gmail.com>
X-Gm-Features: AQ5f1JrAqzrQO9P6bZUVH1yKTkJKGarnEoNgpKJ1GLu55BnPfqFnSLdxcuz5LI0
Message-ID: <CAMuHMdVKFgm_44XXq7Zq8yqosBCQc1CK9dkJoz4nLQ=aDNx-Yg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Manikandan Muralidharan <manikandan.m@microchip.com>, Maxime Ripard <mripard@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Sander Vanheule <sander@svanheule.net>, Bert Vermeulen <bert@biot.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Mar 2025 at 13:53, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
