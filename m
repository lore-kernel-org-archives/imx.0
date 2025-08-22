Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997A02E7F13
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847590; cv=none; b=Blby51lQ1heF064NGcswEODA7LWg/aNAITj7W+5KLAaVkMDY8nf/sjjuM1oghjxgWnqd3AG4Cy0DHrtIEdu9b/NG5wTFvPRAPkxBK32esS6KFuHjBuoOoIN8y5LjqFo57CmBOhReZzfv9o6j0h0k6tHEBbgnPO0/mBudzzKFeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847590; c=relaxed/simple;
	bh=0cIVGZsKog3LpWjaV7XG6J5KkdzzL27b/J6vLZIoci4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmhazsAKqIThtxIpFqzvW2/hvFjnFyPSYuWiPC2TiwA4hBgzJrMZ9hctgT3DNoH5K3P14sL2Z7zAhRY/d5GVSOpmONyn/8OSMbdahQjDDNVN0E/kTlaQ87o/IKv4g9Hz3OJGlwjEEuU+guhWkqocVeMS5ym/V8ytGrfywMxjIqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uW74wwdt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uW74wwdt"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so13420475e9.2
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 00:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755847587; x=1756452387; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=;
        b=uW74wwdtZpCwMQK7gSEx+bSw9aSmVgWkKQx3ep+jSbEsSh3hU3Bb5xyjnaneuv+qwJ
         eJNjtOAmgWdpoenARXFLiCnVzArI7E2Qj9BThyxGNsSab+OJ1nIsdcKqwyf97ERGEz8x
         TgXU3xO42ZQUfkbh/mbJN9Ts/D32UiW/K+SR/1o9DnkisA/8zccwyAoa1abwujpdL/vh
         195vRhSjJGGys77egoZLBgVr7ML9q0gtilhZdwVAPFTzSopsH0MOVhKa4zbDVp+iLS5G
         4IzrLqsqOTnpGIiff3HouoOC0QQaHN9oHSqCzjy2sWid8zY+qXKX/SoOKQhw85RI0vch
         Ov1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847587; x=1756452387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK3kj6aT+uG8TNpObwIxTe+g6r92LKlTq+gjwtDBVRk=;
        b=WT7Midp2p6iJsbA4u1WjrMd5vnHoxSu8a7BeLZ7oQH4rhIWKLvPJtKsAZf5IjXRGii
         f1dk1C3/0qesm7E8kdYTlr3rCMsvYwOdUQ3HYtq11tnr/BPrzPu6Z/UEkkRZVps4sQVr
         xo2p1XbeB/wDAhs8uPl5ePwJq763b/dVR1Vf5RKIsj3UBJ4Yn3/UJHOcp69fo3yDZIgG
         bIP+So5jsEeMAxEDSxE2jX3uUFBJD5GriLM8ozo8U+naQM0Jgb3oUnQzOzAVvcNg0s9l
         EmnyP6Cz4ZPdklWu4DLZDFNuUZRiTESkoL5+gWPjp0xr0Jxj4HvZIk3GQr3Dg3jlK67/
         QVZA==
X-Forwarded-Encrypted: i=1; AJvYcCUvX1qyda8QYhkEp6otdJrWP5mULKSU/1XWsYd4R9zi1PSksiVOd6KGKqbOb4EZ9ySjJus=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIEKwKmDaRBbDYKju7b/9zUFI8S8moYibw5oKThxnqu+gbURL7
	B4ebDTv2O1Q1WyATeXff2+hE7sZgHjhBkY8WLayefA99rcLiSNzcpJwnevM8VNmp9iA=
X-Gm-Gg: ASbGncta0E0KBhZhLbTH9RIjKjsjq40jgbq+L33RlrnT5t5DuXgiHV8fXuVWlXEzHyQ
	aBgPODyViwphP3E4xxdv4gKrfKabHKaoO0syygFExZ5UjfolKMCt69I6komg1Gyv0mAEbEhGv/K
	9F829C1nTZ7iUTY/dUxmS+2IRCXij6WB7EGIzGiLqN0KRZ+8pYr+8cEE6zRa7BwcEt7MxIe+D30
	1MherMG3v+RLTlPDMZ2o+pv0mEcy8HNHuEo3nJqlHAmUEaXNakX2pTx8K/TgrT9Mvv/lChvniEh
	aiiOYugZqzWJze9gOpH4HUgxW2Mo+bBP3O1GtCed0QfVDMB/J4Forh9uLvGvYrPcTqLQhOphYTT
	80ALEbCH7k1U/rdvamDEqIj/1Z04ZC/8/Dkgb2+tguCoL+VIBV0h32yTFXZxYGMZWuD5Dl7ecMi
	CHtYhRfA==
X-Google-Smtp-Source: AGHT+IHDuHRP55niLwTskQO1m/b/5ctH5UZu5kjoy3BiQ8RvkZmMD4Fr6kF/PognPgs2X/R938TpUw==
X-Received: by 2002:a05:600c:1c28:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-45b51798fb1mr14095255e9.3.1755847586840;
        Fri, 22 Aug 2025 00:26:26 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b50e2f0adsm25076255e9.13.2025.08.22.00.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:26:26 -0700 (PDT)
Date: Fri, 22 Aug 2025 08:26:24 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
Message-ID: <aKgboFjwjtZsanWb@aspen.lan>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
 <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>

On Tue, Aug 19, 2025 at 12:58:59PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with intgrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..30b591152fa31d5e43243cac44c72028b05b5f8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim max25014 backlight controller
> +
> +maintainers:
> +  - Maud Spierings <maudspierings@gocontroll.com>
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - maxim,max25014
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

Is the interrupt useful for anything?

AFAIK its perfectly OK for DT bindings to describe hardware features the
driver does not use... but is the driver missing out on error reporting
(for example) by not using this interrupt for anything?


Daniel.
