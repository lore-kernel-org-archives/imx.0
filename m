Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151F033EAEB
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426798; cv=none; b=uQBT0zSBmMx4zwLIKJOnW+B9OQ9g8ELx+nyg7Uvyid09fsrEPB/ayxWTQ8dIJVd2bAC5EmxMinmEozMS/MvELWz0GRPCYhfvEmUb8Vudb7Y8MsV4v1jH6gN2du5eQyRN8+MAogtwDnV+MRy1HciFDTfovvOnNvscthq9itllFxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426798; c=relaxed/simple;
	bh=pPNYtcnldBrPhM4I4orLxdZKoSHcMtjskKXNyUJf+ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afvj+0CoGBDZkihVS3VbKOW1F2BRbVWB4wsTx1oRu4gsUOJ/AxI1vp/Nt5/Nw9c4pbSYt0kAgGPPxg04vmhIitmLts0N2mu1FziPPI+Rk7tFh0oqW6LpMuehIBbL416GebTzorayUNGhN54qeaLPClhUcsuKBinuqIq1M12CLhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5gAF31/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5gAF31/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso41025815e9.0
        for <imx@lists.linux.dev>; Wed, 18 Feb 2026 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771426795; x=1772031595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BM49FiMQXgN+7Fdf3v/nHey34rwS+KTTASqzDHMee7U=;
        b=A5gAF31/ZawX1OnyvKiWFunI73ZkaEk1RiBoWard+LAlyAThLkEo3+CmhLcvuJIgRw
         G+ivN73N6C6Pz1K6xycWvbbS0rKZlm5AvDrt2bm5hiiBjVap+p4rSaENg7Q56upGIARL
         UuNQDIlE4s5lHKZt4iBZx9pmgVqbtDulnznYueV22ZGdXqjRihZ8doqYXJ51RcDlu2lx
         6muzKo8gJMjEE36FEvoGpmYe+Q5HWs/SOKvPKUA816klmDJ5HueK8qc754a9HENiVwTa
         9aFkq0BzxO6QGSEkN5D4ZQZWBd5bkXnUgj457V2CqY9iUaYP7knCiHn12quCdrTSjlVs
         +0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771426795; x=1772031595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM49FiMQXgN+7Fdf3v/nHey34rwS+KTTASqzDHMee7U=;
        b=s/2qvp3mryCcFEcSJpJ8/grzGliuzz7Z6e769mvGc7eKq5pQ7ZikbfwWnhNASuLvAJ
         dlxXpFelXDissnbRB473ES92uL0LsyY611dZysNu4YyjjUggN3LJ6fkfVJ7B5z3a5CV7
         QWkoF+TdcWbvj5HlJV8R58AM0f+EuMb9/46Kmpl1eQs+0EaNXAaO5uJ+dUryZBdhWknI
         dgMbmwRzOUWgIOBkQX/V9iV74WqaHFK7FQbagyH3gNeAT+WmQO8r1mQB/CwMj8IiWUX4
         JKx3xy1PKAGj8ZLJxfexYiOIbYJglCsox9wDpXBGDZXBmx4vS9DIur+Q+T3b1Y37gUQd
         YL3A==
X-Forwarded-Encrypted: i=1; AJvYcCWt4YJMR9pu/gZ9NEtEISlKcGmRJ1BC4HKsJaBv/q9mmOPnPpNN2n2jp7whsSbt2EAaxpY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr7vr+K12yNkR47ISdkSJNpBLW7df4uuBV9piEjXM4Il5g4Ds2
	ligghUhJrKlLesS7Yp76kkiC2JtlbpConQnzIfs/lZ4my7BRPx4+DhuUleDucQ==
X-Gm-Gg: AZuq6aJUC5xfX65kzIeun3xhrJxOOsbFtzacK4ZBA28cYWu9VoiiRgwFEa0JvFAffYk
	sFesj4Lm2GATdi3c7XqK3AHBYH9g7UXHGFcPXBhvfMQnqPc2RuTErEwHOI5MZ258V212ajEuMfv
	Si0aGsuZdcqPKrEB1AOxIxSOvLYncOxAYw4/3fhy6uSrtBrtkLebd+9Bu/vMgKoawSrze49ZaT/
	OfErnxmT9DBixMfAy8g7fYi6ZjfzyQ9yFXFb7IPBz11U9kXLGwE5icX/MCJi6s5iH/ozhbVJP2A
	/ROLzR630SctZrtSg8HsHiN7HlJGGUl9LZoXCEbjyA0jJrfJd+ZnBS4GjCPnKy4Fr4yE8E+h4tx
	44UQGR/lWKgqw4fUW6mSmQuISXqz8XItMUEuWM4fS5S/3nwBHCCKDTjFxLL9ABegmFJxDyTH1AJ
	QiIxl4sTjvbZeCDW+9zGkN3wJCve0+H402MVwarn6kLS51a/Ukqfyn0uK5RgL4ebtZ1mY+rxsVl
	7eEhz8j1Jaqrdi82aA3jr3NRiouFQjNA2x/xzpAaujj1sA=
X-Received: by 2002:a05:600c:348a:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-48398a52fe5mr34213645e9.13.1771426795105;
        Wed, 18 Feb 2026 06:59:55 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483970ce7d2sm48744945e9.0.2026.02.18.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 06:59:54 -0800 (PST)
Date: Wed, 18 Feb 2026 15:59:51 +0100
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
Message-ID: <aZXT5wMGQgMKHCXQ@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
 <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
 <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
 <fceeda41-66cc-4bb2-ab53-d4b1ec25348a@lunn.ch>
 <aZV_c0lmBwjOI_Ep@Lord-Beerus.station>
 <fac81a12-92c9-4e29-96ca-473c18fca675@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fac81a12-92c9-4e29-96ca-473c18fca675@lunn.ch>

Hi Andrew,

On Wed, Feb 18, 2026 at 02:23:40PM +0100, Andrew Lunn wrote:
> On Wed, Feb 18, 2026 at 09:59:31AM +0100, Stefano Radaelli wrote:
> > Hi Andrew,
> > 
> > On Tue, Feb 17, 2026 at 09:43:16PM +0100, Andrew Lunn wrote:
> > > 
> > > And here you loose me. RGMII is between the MAC and the PHY. The PHY
> > > is on the SOM, so there is no need for RGMII to leave the SOM.
> > > 
> > > MDIO is can understand going to the carrier, because there can be
> > > other devices on the bus, such as an Ethernet switch.
> > > 
> > > You say the LEDs are not on the SOM. So they should not be listed in
> > > the .dtsi file for the SOM. It could be the RJ45 is a cheap one,
> > > without LEDs. The colours will depend on the RJ45 socket. It could be
> > > a single LED is connected to the front panel, which is typical of STB
> > > etc. So the LEDs are a board property, not a SOM property.
> > > 
> > > > > >   Two LEDs are defined to match the VAR-SOM carrier design:
> > > > > >     * LED@0: Yellow, netdev trigger.
> > > > > >     * LED@1: Green, netdev trigger.
> > > > > 
> > > > > Where are the LEDs? You say "carrier design", so are they on the
> > > > > carrier? The DT properties should then be in the .dts file for the
> > > > > carrier.
> > > > >
> > > > 
> > > > The LED signals are driven directly by the PHY and originate on the SOM.
> > > > They are exposed on the SOM connector and are typically routed straight
> > > > to the RJ45 integrated LEDs on the carrier.
> > > 
> > > The problem here is 'typically', not absolutely required, otherwise
> > > the magic smoke will escape making the box useless.
> > > 
> > 
> > You are right sorry for the confusion: RGMII is internal between the MAC
> > and the PHY and does not leave the SOM. What is exposed on the SOM
> > connector are the MDI pairs towards the magnetics/RJ45 and the PHY LED
> > output signals.
> 
> O.K, that is what i expected.
> 
> > Given that the actual LEDs are implemented on the carrier side (RJ45
> > with integrated LEDs, pull-ups and LED supply), would you prefer that
> > the LED description is moved out of the SOM .dtsi and into the carrier
> > .dts?
> 
> Yes please.
> 
> > My idea would be to keep the Ethernet controller/PHY node fully
> > described in the SOM .dtsi (since the PHY is on-module), and add only
> > the LED subnode/definition in the carrier .dts where the LEDs are
> > actually present.
> 
> Yes. That is good.
> 
> Thanks
>      Andrew


I will send the v2 with led descriptions in Symphony dts instead of SOM
dtsi.

Thank you again,

Best Regards,
Stefano
