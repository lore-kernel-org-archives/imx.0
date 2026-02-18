Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F8332EDA
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 08:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771405177; cv=none; b=tFg5Vzau2A4jDwLicyZGYrGnBWmjQgBVCSPTJOO+F1Y9m6dmW30wdfQ/YghybNxn2Sxn1cSb4P80CpqP44q/IbPxtct3vSdYhw6mBBmdE05ugcNKAu2BoRezMHKZxrctrb/B013ZXwO+20tpiBVaeQeRzohr80A9cFmYw1DZgXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771405177; c=relaxed/simple;
	bh=bp0SGlOFbs7qaFo3i1X5NVk+cXHP+qamjp/rZmnb9Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvH59dunxsmYdCIcJccEUdsqHtXfI/GZFwUTHzhocBdh4wPJHbev1/l4P5CuWxx7/YFHX28Q4+53QadNILGyJkSKIKfG+5djRtfgRhfaKA9+WhwYZ9lgajai0kRKLqILCCcQJ+152bObnA2U+gA59XuNl5QdctabFQfqJPAL9/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7kqUO9T; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7kqUO9T"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-436317c80f7so387980f8f.1
        for <imx@lists.linux.dev>; Wed, 18 Feb 2026 00:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771405174; x=1772009974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s4xtdZq7ZOIcHdSeKfZqgNu8Mz/fkUqSTcDWpnIDA68=;
        b=M7kqUO9TbmnYl+XTrbN8HJ0Zd7g5JhWu9eOBVEeaZFA3spZQoVEKgMmZJe8KJMrNcr
         rqMbRQtPj4JtiUS629nudDCfh4sfwmyl4hjnXkARevJ4J29ysBsOoxkX+fw1rCY4ZIMt
         6I5swwU91xQNMP9kpmwcsJE8md1pfubYTgOs+Sfi8VyeeDJlxEMst4i/lvcqtzdAf7Ve
         fXNi7/Fn2yPuT2dzE4DyKWPCC3H7LrkljuCdPVCJ1k7CQw77Us8Fx3p8FFZhEiByypxW
         dWKahUs3FPdTBSoE2ePQ/rUXv10dNV/3rhNQdE3GpTF9NxmwkqkDeIqhCNBqUtIlgSaS
         fTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771405174; x=1772009974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4xtdZq7ZOIcHdSeKfZqgNu8Mz/fkUqSTcDWpnIDA68=;
        b=Jcjd0NLf6C2Q8g5Aj6LQa73SbW5RvbCiKkoorwxU4GHuku7ojaArHfK2vhVsvRnuUM
         kfblehQJvFujmjL+kNYCRVAyNAnT6keYOHY05bgYBo4IDOTqvPl1ifYYyM9R8G+sp5Jm
         w55w9BKacxFNLiS3iO7SbEo0c41kExS+86xkjkqtDC7TOWdoZG2pykxyh5QFVEtosKhA
         v/AU/uOiRFGzpALUS0wYw5ArvUc/zAldBy6DorwXPzfKxjvcccB0WLtc25W2kLcTTqQJ
         Xlw7iUd38WEU/gI2fzabGMevRS5D9J/7KVPmDDaAlEknptJbDvimj/oKssRb329C4yXd
         MqRw==
X-Forwarded-Encrypted: i=1; AJvYcCU7zJqlV59EwXd19tK544/iJKTM2jJQN8v1N6epmYlA/m+2yz2b+mFhaVE2PcmHMSugsHI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAWcExqitsELJe/pTeggl48hO/Ob6bV2N4CHmIJiHkzqjgyEOX
	MKS1ZP3SXm1DKGt5oiKPSiy691dvaalfwm33wh6woNL1nhchMh/ccg9U
X-Gm-Gg: AZuq6aKtCFguYr1Xp3nJmR/Mzf/n9zoqRSHjstYBhP8TL6yHs0piN3ZFNQwITrfp8kq
	c7w3UsOthwchPsI37xAho/Yo0dJTGkcqageVjUtGZF6sE4ttsmLEOItuTwOwAgNKzTPDMAlL4Nt
	Axb8SAo37vA5I5210pYg0gFc/eM2cLAEugNjVEqd985oqHDsfSHaEn4sEjFkogMxVvXXRroBWTC
	2zaFaRmx+OojFK3R1lRiSpnDrhMhgdekIWpjA7tlJ+VhGdiXHi7BXJ3Y/fKSHwD+yFBHlKb2K+I
	/aFddiSbSx+VXwKAx6MrnRlGI21lugioG4DJc0aL80M+4ch8H9BbsKtQAyAM0CsvhBr55ZcdvfM
	VH3trjzdBul9lEygbWpuvlnwwAh1XVKXcnAP4OOtFvSsmfr70mOuUR71GDTX7crcVWw3xSh6u8i
	526439aQznsgVE5yDAhIQMqVn3QPiW+k4N0NdIx/8mQY9QGwWOZUQv//YSSbmxny0RiEZwAmmQy
	yI9+RKygBqKuq2yQDpunJkESIMfIGfflXO6SD24cYG+ZXU=
X-Received: by 2002:a05:6000:2410:b0:437:6b6e:d108 with SMTP id ffacd0b85a97d-43958bfe6a7mr1881588f8f.8.1771405174240;
        Wed, 18 Feb 2026 00:59:34 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc85csm39968574f8f.22.2026.02.18.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:59:33 -0800 (PST)
Date: Wed, 18 Feb 2026 09:59:31 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <aZV_c0lmBwjOI_Ep@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
 <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
 <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
 <fceeda41-66cc-4bb2-ab53-d4b1ec25348a@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fceeda41-66cc-4bb2-ab53-d4b1ec25348a@lunn.ch>

Hi Andrew,

On Tue, Feb 17, 2026 at 09:43:16PM +0100, Andrew Lunn wrote:
> 
> And here you loose me. RGMII is between the MAC and the PHY. The PHY
> is on the SOM, so there is no need for RGMII to leave the SOM.
> 
> MDIO is can understand going to the carrier, because there can be
> other devices on the bus, such as an Ethernet switch.
> 
> You say the LEDs are not on the SOM. So they should not be listed in
> the .dtsi file for the SOM. It could be the RJ45 is a cheap one,
> without LEDs. The colours will depend on the RJ45 socket. It could be
> a single LED is connected to the front panel, which is typical of STB
> etc. So the LEDs are a board property, not a SOM property.
> 
> > > >   Two LEDs are defined to match the VAR-SOM carrier design:
> > > >     * LED@0: Yellow, netdev trigger.
> > > >     * LED@1: Green, netdev trigger.
> > > 
> > > Where are the LEDs? You say "carrier design", so are they on the
> > > carrier? The DT properties should then be in the .dts file for the
> > > carrier.
> > >
> > 
> > The LED signals are driven directly by the PHY and originate on the SOM.
> > They are exposed on the SOM connector and are typically routed straight
> > to the RJ45 integrated LEDs on the carrier.
> 
> The problem here is 'typically', not absolutely required, otherwise
> the magic smoke will escape making the box useless.
> 

You are right sorry for the confusion: RGMII is internal between the MAC
and the PHY and does not leave the SOM. What is exposed on the SOM
connector are the MDI pairs towards the magnetics/RJ45 and the PHY LED
output signals.

Given that the actual LEDs are implemented on the carrier side (RJ45
with integrated LEDs, pull-ups and LED supply), would you prefer that
the LED description is moved out of the SOM .dtsi and into the carrier
.dts?

My idea would be to keep the Ethernet controller/PHY node fully
described in the SOM .dtsi (since the PHY is on-module), and add only
the LED subnode/definition in the carrier .dts where the LEDs are
actually present.

If this is the right approach, I will apply the same pattern to the
other Variscite SOMs where we currently describe PHY LEDs at the SOM
level (e.g. imx8mp-var-som, imx93-var-som).

Thanks again for the review.

Best regards,
Stefano
