Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194BD322A15
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767635911; cv=none; b=EgUbr2GHZPZp83GZ6QUvfOI5336hwAcGSpLVkKejTS8Wy9/SvgRZIj5fQ8C3LHK38Lh4Va0VVNuLjqYVCXG0REfga5F1CUrZ9qanG6PiiTgHRQr1EGK81+gf05XVaT3vGd1Kvg/1or7Wci0nJAgyqk8S1mACNh1q75SbZ2pwqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767635911; c=relaxed/simple;
	bh=+T77tsH9pZzAT1bvI0HXd5e9uV41m9xBqP5ek3wZuSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsCVv6mN+/6/buaUbTuU6OBNe2VErMNLqwAluWcGWwkC7cOz10/RmaQ1LGoGPN3AdO47Km//erlqgozmHrSgxlI3dxS7Vr8jROUH1eUB4sfuElP6VD6I8wmft32TW+4Jnl1lj33SGyAVZ4N4okob5Qq4BlPWf5msXCl2k+Ka2yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aA5NF6iE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aA5NF6iE"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso1316115e9.0
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767635907; x=1768240707; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7iZBF6QjNtcl2lReNYZdyjRB+ne20Y2sZ8E6JqBWeQw=;
        b=aA5NF6iEpyftPTvHfxakF0lH3nRH6Qnf3mQ86GzbMbFQGthDyYXYsWcLjNtoL9bQbT
         3E2vMNSL00q38Qd4feIq1kFg27WqK/PuOi2P73R1vX7iLQzQUp3J6Zu5GQIlWZZkI+Qd
         V3VJhqNbwdV/o69SJSPPBWmOGS8TT+jxOdtopVlUIHHAE7ZCtDJbfwXI+9LLDz43w2Zp
         4Tk/XCSbrs+McQ9IacGOOWKtAxCrGYL1+vvuLNBLedIgZBE0MktIUzp61FXsehe4U4H/
         xmCI0TN14xA6eDTnhNg2fe9tRCGLB14EpxV44s1c7UkGbPyMxp8UsnEJWm2hwuMTNg8H
         c88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767635907; x=1768240707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iZBF6QjNtcl2lReNYZdyjRB+ne20Y2sZ8E6JqBWeQw=;
        b=XzELLL+3uDrCm6GSaNZPS07S1XoMNYP3qCUFVoZBPZwxgeNHHUAd/cFLbbdGXwvRcS
         lj4QYChfxtAO4CemGI3LtR5BGT5XNcY/q8kdEoryHtvZ9KZnaRMc325CKkdwqbiWRKio
         fUX4sWlG2RuWxfxbrvklTnxObsyPJVKclfIqZim6MbBeWmOUMAxogOzvoi2ZMUhnFWy7
         1r6XXzASLtA/yfl29e/RY+Ssgebe5UC5XBtdAceWNFQ6Y9hp93rTShBDINK7VssD4eH/
         CCNgCamoErNFETxQfs8dn8r4U82P0azsyt0dPl58VzZZ4XOupcJtS8XvcvdDNoeWEaVb
         kJSA==
X-Forwarded-Encrypted: i=1; AJvYcCXjkSZE5I7OCcsiN17ftZkZ/Y/j5yMWl3GTltY1baeYD4QEd4m8L8rgc04YJpwsx8Oecc0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzxnpcY7WYbPtTlccjHQCKrJCbI2rQCfm8C5kD5kBpZBBe/H0J
	UfD1uiB4cO5rSHWPRgTcA7I2a5HQFKlNYguBCQwD4efxvQAmtCo6lWOl
X-Gm-Gg: AY/fxX7Ir+Bhbw2UV7PsEomvTmRMUxIX29F8khDqbD2I5XJq6dkzCvPPH+uVr3NApvp
	MKFryrSkr8ijxz7p1LL2vXYfhRRAOp5VEEvsjV6S8ssBIK6ljTKFAwpnJoI1XrQJs8ueDd4YM56
	hwNBsnwf+zSyIM5anHPHnYarLVeUVWoRPv6eNHQNojXyxSxMHS2FGGMONKZo/n3PZwAC265PKLn
	C/1sN8pHhAUisOFf8zoIGVC2ZxWskWY+5imealROUVyD0HSEZ8s4BjBVOVrKeBhLtr5jJhlUwtO
	Oex3CtwAabpM9F4+HpRN3SZ28QrwrTGPOjl/xXN1PDnPI1ZuMB8myHik/DCKUSw7i3Fg5vGlJGj
	G/uTq+UW+Q/FNf/i2FqofI/BAY7PTgRsEWpjNkmxIrLU3bBj3XKtEFZWmY+pnOtIn5qG3mKwwxT
	mwznygkOhXDh0+8P2d1SoWUg==
X-Google-Smtp-Source: AGHT+IHvDnJREnvXI3rgUm0D8mHDlQfrv7fsBdnLRxoQbMQDvEB8slEC6JxGA2RCLuiUgT4GEjzJqg==
X-Received: by 2002:a05:600c:4fd3:b0:47a:7fbf:d5c8 with SMTP id 5b1f17b1804b1-47d7f0a25d2mr1709695e9.26.1767635907151;
        Mon, 05 Jan 2026 09:58:27 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:1b36:ec4b:aa3c:60f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f390a69sm703765e9.0.2026.01.05.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:58:26 -0800 (PST)
Date: Mon, 5 Jan 2026 18:58:24 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aVv7wD2JFikGkt3F@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>

On Mon, Jan 05, 2026 at 05:09:13PM +0000, Russell King (Oracle) wrote:
> On Mon, Jan 05, 2026 at 05:42:23PM +0100, Stefan Eichenberger wrote:
> > Yes this is correct. ERR050694 from NXP states:
> > The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> > preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> > (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> > be no preceding preamble byte. The MAC receiver must successfully
> > receive a packet without any preamble(0x55) byte preceding the SFD,
> > SMD-S, or SMD-C byte.
> > However due to the defect, in configurations where frame preemption is
> > enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> > byte, the received packet is discarded by the MAC receiver. This is
> > because, the start-of-packet detection logic of the MAC receiver
> > incorrectly checks for a preamble byte.
> > 
> > NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> > they show two tables one where the preamble is preceding the SFD and one
> > where it is not. The text says:
> > The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> > between transmission at the source GMII and reception at the destination
> > GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
> > across the GMII. This case may not be possible with a specific PHY, but
> > illustrates the minimum preamble with which MAC shall be able to
> > operate. Table 35–4 depicts the case where the entire preamble is
> > conveyed across the GMII.
> > 
> > We would change the behavior from "no preamble is preceding SFD" to "the
> > enitre preamble is preceding SFD". Both are listed in the standard and
> > shall be supported by the MAC.
> 
> Thanks for providing the full explanation, it would be good to have
> that in the commit message.

Okay thanks, I will provide the full explanation in the next commit
message.

> 
> The next question would be, is it just the NXP EQOS implementation
> that this breaks on, or are other EQOS implementations affected?
> 
> In other words, if we choose to conditionally enable the preable at
> the PHY, should the generic parts of stmmac handle this rather than
> ending up with multiple platform specific glue having to code this.
> (This is something I really want to avoid - it doesn't scale.)

From the errata from NXP it sounds to me like it is a configuration
issue by NXP. I checked the following ERRATAs from vendors where I have
access to:
- ST STM32MP1: not affected: https://www.st.com/resource/en/errata_sheet/es0438-stm32mp151x3x7x-device-errata-stmicroelectronics.pdf
- Renesas RZN1: not affected: https://www.renesas.com/en/document/tcu/ethernet-mac-gmac-function-issue-0?r=1054561
- Starvive JH7110: not affected: https://doc-en.rvspace.org/JH7110/PDF/JH7110_Errata.pdf
- NXP S32: affected: (ERR050706 under NDA)

So from that I would conclude that it is an NXP specific issue and it's
not the full EQOS implementation that is broken.

Regards,
Stefan
