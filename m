Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC71DA628
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767948138; cv=none; b=nwsMEvO43mlhpITH40Vp+jJDjBJ6CjJkx7hkNj6oOERYOmrudrAuNWxA9mkXas17KHXu0GezZ5JwzSSnqk7ZT412a7Z0tglqkw4NclNjbqMB9MyX+4DK5U4ywgJGPPmCWP4at7Z+I1A/K1zQjurd75KOQRCUOiVhfKQK/gOa68o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767948138; c=relaxed/simple;
	bh=02A6x4UGa/2dbvl2Im6Qey6hXFFU0uIY+U1g300uWoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e177EBLfZMTCJUvJcgYsvJ/BnnKQmnBHdGAy4twmlyT1e9wgIw4icH8GXTvBBF9YqNjYHsmHNLwWjwjC7luW8bagaTI7iFH2PiCCysw853C6Twff2xASw/+LXybRqT0Fp76DFEUZ/Fn5Pyrp/jSEyaxHINq4iF5ZvvSQ+TRjlas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpTlVqU7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpTlVqU7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so960339f8f.2
        for <imx@lists.linux.dev>; Fri, 09 Jan 2026 00:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767948135; x=1768552935; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/+wP7VUxOoGGhH+GyCKQ5tv6/IVz0LS1NxGo+a69kI=;
        b=BpTlVqU7ZPXgdK1aT3JfD4cm5AL0WvnBejKsEDBgC4r8LzRuEF0KtOq0ncbmRMhbKb
         mwrE6/1NFDpcjRfmL1RRmv5TD7m23D2uwYe/KMOutlGLZoozFeypgA0EmXIOPRjmpqFv
         isXjkqsWkMpf0U4DuU5NhDg9DtkuB8Ie18ZD0X7GcazDszS0VsA4IVHQvVy+/qdQyEtk
         6RCk6epIkuiQ4IkGve+B8UEdSetgoxi/3C2c9DRvzAGatfuAvXpy8IqjUIPRYU5UAaRk
         +SBJ5is26DiKbo6JMDJYuVk3W3VaPqkGW2EFwe3BiHopaYbxtuA2+Jg52wnjesauUWuM
         e2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767948135; x=1768552935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/+wP7VUxOoGGhH+GyCKQ5tv6/IVz0LS1NxGo+a69kI=;
        b=fIpB5xwWPsjalSqRGoHUE4OqDV5E9Qvlvcnel2XZRyCJ1b4Ai558qrQ6hhCFdV5OTG
         MxmPzmvNXejxFD+zyZTCA4hfmA/+UcVxnYq/1nTU0U5ddnPUodiUc3+ITbHXiR22HBPp
         2MlwNsJTo9shv8SrfLceRLdU++JfEGGybVeITaRRkBrwTqp2v3DOFFNWiLHsdTxUA749
         0EJbFVgGCs7WQOwx2jjTHMiStxCLYm9XNFWmddHaw46vcOivjLfDihUlsidoAz0Z/CiQ
         tL0CLLX5T2WVkAokvJebcHneXy5oQXcTQbqqM2b9EFnhYGuZrR0Z0nRRA67yBUTAtxyt
         7LJw==
X-Forwarded-Encrypted: i=1; AJvYcCUI2TXqhJCo84ldi2aLUQkfnRcXLM0lfLftSZumfhHVG6DkmP2lsfSivUjFaSSeq09aDOg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr1+df4/St6YNroVBG2Z4lZ2TtZEwU7M7HOZw+/sczMKMBfZgS
	JrKV7OKngFMTc6/jJhTPzluu0zACMpETejfHZM5rb9zMAD3dt08G0vpd
X-Gm-Gg: AY/fxX7+jw6Y+9smlr0DHIrrZDSMRD1rzSg55v04IzST/Hda8uZXLtMnXSffRAkJOil
	7ZgVJz3KGvp/N43mCTqPMcuv/UNeh8vNckCs1DoOQ67DnFsqOAwV04jvunr+aomgntX4qK82r7b
	sKvDHmK1XaEokPe8hOevkQ1xlFnihYyPKdmnbWbLwOZXvdeBoJi1o3GRHXI2l6hOXHZSOEN7LQw
	fDbxto2mptei71qU2Gt9q81QGDsLTTKTWXSThQhj/uQwB96G5Nb6ALbDjq0cq//2E2EccfwInaP
	/CmlsoXiUmAhZ6ywSlT2OZnlzm4Cbjm36TZluwK32JRl7c6+/h0XURugsu40SULdWAzg/ySlUe2
	L7E30ZaYyl2HousynUL0WAhmi9wNL/Cx7pkFUC+n8bE12VMzfupNj7ewoC/F7Yq/uUxR1Onwx8I
	dN2jvTwU1A29k=
X-Google-Smtp-Source: AGHT+IGYAk2S3Qdr9OmtCXbZaajNREwTznfK/Lnn5IG7bEwG+8LMc/qLBJq9BAHsaKGTT3hoN4rQcA==
X-Received: by 2002:a5d:64e3:0:b0:430:f68f:ee7d with SMTP id ffacd0b85a97d-432c379b79cmr11104260f8f.47.1767948135127;
        Fri, 09 Jan 2026 00:42:15 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:66a2:be50:e0d3:29f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacc5sm20839538f8f.5.2026.01.09.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:42:14 -0800 (PST)
Date: Fri, 9 Jan 2026 09:42:12 +0100
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
Message-ID: <aWC_ZDu0HipuVhQS@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVv7wD2JFikGkt3F@eichest-laptop>

Hi everyone,

On Mon, Jan 05, 2026 at 06:58:24PM +0100, Stefan Eichenberger wrote:
> On Mon, Jan 05, 2026 at 05:09:13PM +0000, Russell King (Oracle) wrote:
> > On Mon, Jan 05, 2026 at 05:42:23PM +0100, Stefan Eichenberger wrote:
> > > Yes this is correct. ERR050694 from NXP states:
> > > The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> > > preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> > > (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> > > be no preceding preamble byte. The MAC receiver must successfully
> > > receive a packet without any preamble(0x55) byte preceding the SFD,
> > > SMD-S, or SMD-C byte.
> > > However due to the defect, in configurations where frame preemption is
> > > enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> > > byte, the received packet is discarded by the MAC receiver. This is
> > > because, the start-of-packet detection logic of the MAC receiver
> > > incorrectly checks for a preamble byte.
> > > 
> > > NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> > > they show two tables one where the preamble is preceding the SFD and one
> > > where it is not. The text says:
> > > The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> > > between transmission at the source GMII and reception at the destination
> > > GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
> > > across the GMII. This case may not be possible with a specific PHY, but
> > > illustrates the minimum preamble with which MAC shall be able to
> > > operate. Table 35–4 depicts the case where the entire preamble is
> > > conveyed across the GMII.
> > > 
> > > We would change the behavior from "no preamble is preceding SFD" to "the
> > > enitre preamble is preceding SFD". Both are listed in the standard and
> > > shall be supported by the MAC.
> > 
> > Thanks for providing the full explanation, it would be good to have
> > that in the commit message.
> 
> Okay thanks, I will provide the full explanation in the next commit
> message.
> 
> > 
> > The next question would be, is it just the NXP EQOS implementation
> > that this breaks on, or are other EQOS implementations affected?
> > 
> > In other words, if we choose to conditionally enable the preable at
> > the PHY, should the generic parts of stmmac handle this rather than
> > ending up with multiple platform specific glue having to code this.
> > (This is something I really want to avoid - it doesn't scale.)
> 
> From the errata from NXP it sounds to me like it is a configuration
> issue by NXP. I checked the following ERRATAs from vendors where I have
> access to:
> - ST STM32MP1: not affected: https://www.st.com/resource/en/errata_sheet/es0438-stm32mp151x3x7x-device-errata-stmicroelectronics.pdf
> - Renesas RZN1: not affected: https://www.renesas.com/en/document/tcu/ethernet-mac-gmac-function-issue-0?r=1054561
> - Starvive JH7110: not affected: https://doc-en.rvspace.org/JH7110/PDF/JH7110_Errata.pdf
> - NXP S32: affected: (ERR050706 under NDA)
> 
> So from that I would conclude that it is an NXP specific issue and it's
> not the full EQOS implementation that is broken.

I just wanted to check whether I should continue with the current
approach or if I should instead enable the preamble in the PHY for all
MACs. While I prefer the current approach, as the issue lies with the
MAC rather than the PHY, I can also see the advantage of always enabling
the feature.

Regards,
Stefan
