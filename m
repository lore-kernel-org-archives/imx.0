Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF831A0728
	for <imx@lists.linux.dev>; Sat, 10 Jan 2026 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768052539; cv=none; b=rgzuFhZ566su5n/MKAATWZTgW4/20fkQm2+wqKGOT2CIclCyzxeoVq9AJYNt7jgMrSOpN+6UORaRsonwKr6CPrtWyI9HcRBUVfoFm78vK6kRXoVImXgF5pDHf9KDtf2H2lAZAfIw8CcUnYJWHX1z1iipxIwemph6Ahwg7TV+FS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768052539; c=relaxed/simple;
	bh=QHBtpr+1g4aUJXrWVXx2b2WrXDmyNzy8zeDOP6GFxq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wz2KnCwRPJGxMSv6B7r3c8DfOfZeAuAmhJxnWJ1v1lQruM2lvrJcTA4HxbjU2R/9v+lHICZHr35AqbkgnSnwaQBHzTw8ty3O5dsa7RBK7Vn3mQJwupcOAA2/a+gvb6KzwnIB8kM9C3vrQXhLsypKxEyYz/4KwHKq1SSDRsHt5A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vil1iHaF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vil1iHaF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso54165725e9.0
        for <imx@lists.linux.dev>; Sat, 10 Jan 2026 05:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768052536; x=1768657336; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niKD7lwOtoha0TRVTxtTbBYIAZIgplZuxoTzqvKJ568=;
        b=Vil1iHaFL9TP3tBKdh79ZsC2Fg1MyGxfXn6RNI3xpmxOdieLn7iwefQzXihFxqsyNl
         pOVvWSxeCmU0STh3+jBLEoCdM2CsUGA0LLYKboZUNV0hHszPhuNBXcGQ/dk0xiejsiiE
         koGM7T1fY8mVE3i9j9qvWTZjijSDb9t3vEf88M1JG3ePOOojnqv7UDMQzG+J6sZqcTAx
         bqSPzu0/86mTBZESmy+9GRm/itATMPgZE4OPoFc2yEZxCOmEvN82OlbO+I2+DhwyNT0Q
         H+cCal9MZp9HmpiN0pQvVfaxid+CkUavellNwAhGwg5Nn0x4ApFfd7p+RM/2cexsmVo8
         gE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768052536; x=1768657336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niKD7lwOtoha0TRVTxtTbBYIAZIgplZuxoTzqvKJ568=;
        b=FnvriAyCXqNlhQH4+o/+eLAJWQbpicoDaKu8i0HKocO5X7d2E3vzukorCTRd5dZCYa
         gh9tUoaAVBvnjO5M/GAQDaeGvoDkq1Fi0tEHOSvVIdWVzWJT6Vu1SkJD9zy9kb8TCY3j
         DHnb52YqQdcmVdCWo6zqZSWvAxixFRn4J6/a7ZuzxqY5d3ltKCmSVnv1/v9C5yfgT0CB
         fuMK7jLzpdSsFtzd8NiBAqKgdT0OlXRiY/BDc1D+Y67vM9B4DPY1O7DMH2WFIr0uDKFU
         JqVnlXfVoccR+fdAGHphf9DyC5EIfsq231tEFh/AcRxHC2lW6EFVuzygYz8GOWFmjg30
         N93g==
X-Forwarded-Encrypted: i=1; AJvYcCUwj/dMatfwBCqfmPpDH+hSTO78i8ScAImD7QYDAphYTcdbPZb2AXxf7TjLDsMV6w0fCJo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUXwoArw5V4H0EDI4VwE3udTAWyIHOwKZ5lZZQR2yItwwtrqvq
	Pfy4oHVPyOPj6zxrJQWy9JykUjN4fWLwlphGWdhn90qaTaSnRYZvE1te
X-Gm-Gg: AY/fxX7oFAzaVNBimPrYfE0WHE879xS+EBbNgq1WcoYXxyxkHFsjE2/aLle9Y8oKq5d
	Wu4bBTA8mrt2KmFjKXYgibKsTJs6m3mFYq2faB3yMoESXqLS/DU1gcVVgj2h5UfLdNawNipcQFP
	BQTsb1oy7q9v/Spp6XH4cwVTZjKvKP7ZCy2tIsDnqQO2pKMr7ZH8CirvCo6SDQj2/Q/bMYe7FLg
	BYUyoMJujtqMG44c5zHBw2MpFzfH3KChyIr3VLB1GnAidcVMq9FBtIkFZCmw4TB2t9YxxEgmYo5
	Kpj95Gm8Mnj2mxQjR7nx/wzUfghu45CXwjX9mcm65yJWVziZFjxscDECYffyXbp0twFnMtLWEAA
	t542b7NhoS4hX426hNRZj33gKQkUhFopjEtsYuTlJ5PIFewSfnTmNKiNNPCTflxUkD+GR8Xlexb
	04TtMy5YKMOk/OSlIvnJcBpA==
X-Google-Smtp-Source: AGHT+IGNmY6EuRXQMgmECxnNtQwrRUp+VeCi3/b3F25cOPZ8t8M9RwpG6+Ph3Pg2FEMSimcUer23+w==
X-Received: by 2002:a05:600c:4f53:b0:479:1a09:1c4a with SMTP id 5b1f17b1804b1-47d84b3b389mr154806905e9.31.1768052536352;
        Sat, 10 Jan 2026 05:42:16 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:6968:58fa:e72d:87c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871ac28bsm85184595e9.20.2026.01.10.05.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 05:42:15 -0800 (PST)
Date: Sat, 10 Jan 2026 14:42:13 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aWJXNSiDLHLFGV8F@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop>
 <aWC_ZDu0HipuVhQS@eichest-laptop>
 <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>

Hi Maxime,

On Fri, Jan 09, 2026 at 10:38:30AM +0100, Maxime Chevallier wrote:
> Hi Stefan,
> 
> On 09/01/2026 09:42, Stefan Eichenberger wrote:
> > Hi everyone,
> > 
> > On Mon, Jan 05, 2026 at 06:58:24PM +0100, Stefan Eichenberger wrote:
> >> On Mon, Jan 05, 2026 at 05:09:13PM +0000, Russell King (Oracle) wrote:
> >>> On Mon, Jan 05, 2026 at 05:42:23PM +0100, Stefan Eichenberger wrote:
> >>>> Yes this is correct. ERR050694 from NXP states:
> >>>> The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> >>>> preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> >>>> (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> >>>> be no preceding preamble byte. The MAC receiver must successfully
> >>>> receive a packet without any preamble(0x55) byte preceding the SFD,
> >>>> SMD-S, or SMD-C byte.
> >>>> However due to the defect, in configurations where frame preemption is
> >>>> enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> >>>> byte, the received packet is discarded by the MAC receiver. This is
> >>>> because, the start-of-packet detection logic of the MAC receiver
> >>>> incorrectly checks for a preamble byte.
> >>>>
> >>>> NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> >>>> they show two tables one where the preamble is preceding the SFD and one
> >>>> where it is not. The text says:
> >>>> The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> >>>> between transmission at the source GMII and reception at the destination
> >>>> GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
> >>>> across the GMII. This case may not be possible with a specific PHY, but
> >>>> illustrates the minimum preamble with which MAC shall be able to
> >>>> operate. Table 35–4 depicts the case where the entire preamble is
> >>>> conveyed across the GMII.
> >>>>
> >>>> We would change the behavior from "no preamble is preceding SFD" to "the
> >>>> enitre preamble is preceding SFD". Both are listed in the standard and
> >>>> shall be supported by the MAC.
> >>>
> >>> Thanks for providing the full explanation, it would be good to have
> >>> that in the commit message.
> >>
> >> Okay thanks, I will provide the full explanation in the next commit
> >> message.
> >>
> >>>
> >>> The next question would be, is it just the NXP EQOS implementation
> >>> that this breaks on, or are other EQOS implementations affected?
> >>>
> >>> In other words, if we choose to conditionally enable the preable at
> >>> the PHY, should the generic parts of stmmac handle this rather than
> >>> ending up with multiple platform specific glue having to code this.
> >>> (This is something I really want to avoid - it doesn't scale.)
> >>
> >> From the errata from NXP it sounds to me like it is a configuration
> >> issue by NXP. I checked the following ERRATAs from vendors where I have
> >> access to:
> >> - ST STM32MP1: not affected: https://www.st.com/resource/en/errata_sheet/es0438-stm32mp151x3x7x-device-errata-stmicroelectronics.pdf
> >> - Renesas RZN1: not affected: https://www.renesas.com/en/document/tcu/ethernet-mac-gmac-function-issue-0?r=1054561
> >> - Starvive JH7110: not affected: https://doc-en.rvspace.org/JH7110/PDF/JH7110_Errata.pdf
> >> - NXP S32: affected: (ERR050706 under NDA)
> >>
> >> So from that I would conclude that it is an NXP specific issue and it's
> >> not the full EQOS implementation that is broken.
> > 
> > I just wanted to check whether I should continue with the current
> > approach or if I should instead enable the preamble in the PHY for all
> > MACs. While I prefer the current approach, as the issue lies with the
> > MAC rather than the PHY, I can also see the advantage of always enabling
> > the feature.
> 
> My main concern was that we may end-up with a lot of different fixups
> for the various KSZ-family PHY devices, especially since this feature is
> sometimes undocumented.
> 
> I've gone through the micrel.c driver, and looked at the datasheet of
> most PHYs in there, and so far I've found that to fix this issue, we
> need to set :
> 
> KSZ9131 / KSZ8041: Register 0x14 bit 6
> KSZ8061 / KSZ8051 : Register 0x18 bit 6
> 
> So in the end, the complexity appears to be a bit less exponential than
> I originally thought, we may end-up with only a few fixups in this driver.
> 
> I'd say, I'm fine with you proceeding with this original approach as it
> minimizes the impact and risk to break other setups.
> 
> I'm sorry for triggering this whole discussion only to get back to the
> starting point :(

Not problem, thanks a lot for the feedback and the discussion. I will
then proceed with the current approach and send a new version with an
updated commit message.

Regards,
Stefan
