Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A330B53E
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775663198; cv=none; b=lCMqQqW7bO6JN0Wnv3/kRsx+COVrPnQRcv+YM6rv75+ckOIhZjrzmoVucfliyu0kU3zwpwD35u1Yy1eZ/0eeNRnBwUDHyJxlNxiOL3h0et3Q1zJJPMc+znsXAElzVmzXjFiXSz0Hov2vROHunZHXgxwbOgv8q4ZYwAdcFP/pfBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775663198; c=relaxed/simple;
	bh=V1TTOcmexzvL0zMGH90+djDV/QILglULKt5i2NNrPeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdM5WgAI4PEyD0R6EHxJA/KRupSjXnizsBuG3b+gni8PBZhUi9uVS1LE2EEHoHk9OA9KJo2uBbmAIp2Rv0n0yaKWTNJn3yJ9FyfAuXcguPAs8mXj2/Y7mp4KzR6dt8zNHGGmL2DLmVPSqM4PM0fm/rLvomfGJfaYug9xLnndZM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZMZaMtd; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZMZaMtd"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82d03827316so2533b3a.0
        for <imx@lists.linux.dev>; Wed, 08 Apr 2026 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775663196; x=1776267996; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5zH5Yy++LFl5X1883WPkm0h00qGtgJqcjU1g/XLy30=;
        b=SZMZaMtdCeJIwgPJWsD+bELXKvfWiDigj7akr84N0wXNam2MnPpKbLlUgegw4rwH3x
         mZ4PKcBNgabBJND9sCvU5uB1xP3AgJ1tHA8kv6ePof4flmsw6/pSYKFTLYB46h47XL9A
         b7dIOz5Q6lb9B6U/NCF79wK6hpv2AGt8BAsCEbYQYdcnffRdFj3huzea0Ad1XgvmuK0i
         RnYQ1grPWhnkxzDHHYBkCQUZ6lp6OKTLlBN6ovgH4NIjE0L05gAdz8fkltxpu8GsT5oN
         t5pR3/rSDGGjjdYreAv+bWv6HVl1qe6CCUw1bjU78sAsbbmaMLuJfG9fERxpeU9H7gxl
         OBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775663196; x=1776267996;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5zH5Yy++LFl5X1883WPkm0h00qGtgJqcjU1g/XLy30=;
        b=MJCN2iUxA6y2DWUQj3bPhZA10ztmnDJXAx5DWPGqPJ+/8X/B8Sl0jvqnRbmbtwoezi
         7SeiPkq33XlvFvLVzYueqtGcdWGjAVy3YCUZljtf588P2xOlvh4jNskaKuSkj8wxwUWL
         CawzTr66SMqVm+0FKNvyqvOKuf1HoYBjI/KRZkJD63EUPk4c4+gFl8WkIzn0i/0YMyOv
         gmvH67EMGtiz4FI6oiXhJ6Pz3v+gQ/rfRLCJNTu0ALBepH8QW52wpu9BHj3FNqbM/aHi
         w1/lbrzAkqI+JjQZZx7yYN1jmut/UwLM0jaEZs2ZjeRs/HRNYqVJb4q9PWfnfPgTTtTD
         7Hpg==
X-Forwarded-Encrypted: i=1; AJvYcCXBW5kVE0X2rBejKmgh5t85R2bezvR9IjxmxZjEQhm4P6qXWtWikDR/AaGzQWgBGvo4G28=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1ra3u8/UQlNwTASvRFgMdSUshm17eU/IqX2rS56PelNLUyt0C
	XjbJRzZAzyqCpZ5Z1pJWytcu6aOIVj6+BvTYkAX/oOsCcnEZaQ3rlU7B8a8YDcPiVYs=
X-Gm-Gg: AeBDies6KcuKp6vHStvIXV/1zsX2SjpmoO09QacLmVVmcj0DuJpv4VGeJaARKb2hr21
	LAIgqtRj1Y8GieMJBA5Jh2d8eX72P/S8miIG7LGDIPmFvqS+bbu8CrR3dF2ki+s24drRYlGY/8x
	CjMhIlYSniZJNX7DxZxNKNF9mIHqczyaoz3TYw5Wr/J7ISZh+4VnmyoApfnvftfqygOt4jGA1H4
	C8O/TR7zUgSZFCv+WMccLSlb1ay353Ixhjt4AiLk6Ilzj/QWHK62kPB0MJopTejaO2uhRKbCAvQ
	OOS+0wWdfw3FoXePTQI38VgZN3GQa2hQxQOVdZfLRilxHA2KhqzmHxUSh2cQw90bRWzrZfeEmHX
	wNOoBTOogvYAQBtAhbXO/MElSGOCceuy4r9r06lyS6/bINTpNtheCAWc36OCLKk2yGP1TnK8xoY
	7G/fWFsNEFyc/6E+hUlCDEKzGR1A==
X-Received: by 2002:a05:6a00:188e:b0:82a:170d:fe1d with SMTP id d2e1a72fcca58-82d001e92efmr22313731b3a.1.1775663196006;
        Wed, 08 Apr 2026 08:46:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bec3:28f:3ce4:6925])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm21534378b3a.29.2026.04.08.08.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 08:46:35 -0700 (PDT)
Date: Wed, 8 Apr 2026 09:46:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <adZ4WIaC6WN97JhR@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
 <acqjS440STRl2sK2@p14s>
 <acs2PAZq2k3zjmDW@shlinux89>
 <adUghiyZbe3fmcNX@p14s>
 <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB8459AA009C932EB9D6139A11885BA@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Wed, Apr 08, 2026 at 01:30:16AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to
> > SM CPU/LMM reset vector
> > 
> [...]
> > 
> > >
> > > Aligning the ELF entry point with the hardware reset base on
> > Cortex‑M
> > > systems is possible, but it comes with several risks.
> > 
> > I'm not asking to align the ELF entry point with the hardware reset base.
> > All I want is to have the correct start address embedded in the ELF file
> > to avoid having to use a mask.
> 
> I see, per my understanding:
> FreeRTOS typically exposes __isr_vector, which corresponds to the hardware
> reset / vector table base.
> Zephyr (Cortex‑M) exposes _vector_table, which serves the same purpose.
> I am not certain about other RTOSes, but the pattern seems consistent:
> the vector table base is already available as a named ELF symbol.
> 
> Given that, if the preferred approach is to parse the ELF and explicitly
> retrieve the hardware reset base, I can update the implementation accordingly.
> If you prefer to parse the elf file to get the hardware reset base,
> I could update to use them.
> 
> Options1: Something as below:
> 1. Include rproc_elf_find_symbol in remoteproc_elf_loader.c
> 2. Use below in imx_rproc.c
> ret = rproc_elf_find_symbol(rproc, fw, "__isr_vector", &vector_base);
> if (ret)
>     ret = rproc_elf_find_symbol(rproc, fw, "__vector_table", &vector_base);
> 
> if (!ret)
>     rproc->bootaddr = vector_base
> else
>    dev_info(dev, "no __isr_vector or __vector_table\n")

No

> 
> This makes the hardware reset base explicit, avoids masking e_entry.
> 
> Option 2: User‑provided reset symbol via sysfs 
> As an alternative, we could expose a sysfs attribute,
> e.g. reset_symbol, allowing users to specify the symbol name
> to be used as the reset base:
> 
> echo __isr_vector > /sys/class/remoteproc/remoteprocX/reset_symbol
> 

Definitely not.

The definition of e_entry in the specification is clear, i.e "the address of the
entry point from where the process starts executing".  If masking is required
because the tool that puts the image together gets the wrong address, then it
should be fixed.

> The remoteproc core would then resolve that symbol from
> the ELF and set rproc->bootaddr accordingly.
> This provides maximum flexibility but does introduce a new user‑visible ABI,
> so I see it more as an opt‑in or fallback mechanism.
> 
> Please let me know which approach you prefer, and I will update
> this series accordingly in v3..
> 
> Thanks,
> Peng.
> 
> 
> > 
> > > 1, Semantic mismatch (ELF vs. hardware behavior) 2, Debuggers may
> > > attempt to set breakpoints or start execution at the entry symbol
> > >
