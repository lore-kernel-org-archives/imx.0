Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388495;
	b=tch9g9gDuKsoeVwO2xY4w2iYtAXPB43WSilV5b0zssgg1tB08gpE59Fq0qRktu3N5fPA
	 cA7l3r7y3FSj5tu3N3MHuG97b6g7O24MUCaaRRllxsnpeyc+8UdD0fkPUiqbz20Jy4Mq+
	 q/n5HbDIEHFh2fzAkYE3xI2krgPzQ4lbdxWiNTptL9Bfa21yUkKBfmoU5vfg6LHXV1ECV
	 yEoHjDaHD/jUEKlBEY/RNtcTK0orvnl3gF49+cy6NoQLVGXD4aBAA7HxXEtR6Aq+fmC0x
	 bTVKqeO2QkiQc40Cl9dXSHsfNVkoTpD5c7/AHMmEDzPeFliYXMKEGLTrR8G0XSEn/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
	b=ZGe4fj51ykbSpOYtfuxzwIGc9zhyml3ZsyT5ojGyYrfBanLV8CxPE6MDAZF5lRoAnB1G
	 4C1tDetdubmCy0kByZpbNVMZQ50xX0uzyTIL/hbhpZSLShqhpeQ8pZJwIq7ePtGIoO5EF
	 yqEbStvTbAC2NBjo+2AY9C2FXWeYS96gHvWVFgOykNP4mkGM9J1+J0HZIHcl/MWgHG24f
	 4j0d2iAl+w8h4tMKqwaDtP/13SWg5iI3r9ioxqFqRf0dcR0qRW4kAnYdUTaESiprx/KHO
	 d0RVX2/dhnMFbgi/ZTF1UTz/8Kmoz7O10UIsa00W1jrabJFqKFv/UjsGBa5DYDFiFdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+qJ9rQc;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FDA606A330
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 09:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FDA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U+qJ9rQc
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so35760345e9.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 01:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388493; x=1794993293; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
        b=U+qJ9rQc07Wp2OhC6/EM8FVcx8E18ZIBGwbOlNPvUtgSQOhRkvJF02Q1RDS0TUVCcA
         nQ/xesNw3RSLgBamAlZXseH03DAZzMHG9wVluiSkOIWpFb0lOrIkqVBvJDOBz+tYuRGg
         HNn+TheLMC0yeV+hNvapNzC/GIWUAvglinOQv1wrvr13tt+AFsvY1Dc+s7XLW5Q7RJcM
         PBX86MdeWSG5F1OPEr5hUTKWoQQnLr+1JRe3MGaYh2yCWYOzpzVzWam+avC2KsnmPbop
         e9PZ9C8S+AXYHhQMvgTY6jg3rxebQXMO4UCSDH7fe5Yn7h2I0KK6lc371269DBlda7nN
         2S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388493; x=1794993293;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxkRXuYhMPK0C30vvCMKN0f/tz8st3ZMYqyTNqjHyuc=;
        b=JWul6oKQjBEPNtdv/+12gZrA6asEmozlwsV9T4dJvi4KZdwCwssArI0+yL986cstCr
         XXPVpnCeX+QF7qoFkrA7dUtpRFUnyBNBTCgtvXQc5MDfp/Wjjr2ozK7R3tBUsNaQazEE
         attJvl7expVqOUuaMYUV2+MVjtnnh17APXNppJUjnpnLdLD3HZZnM8bt6/BUkJLNnHF8
         wZGDUNntFjD39LnHiHQGP2XSsWO6BKTvUjKQuVWbbG5X6FZTmbd8CBEmxYXk1W/qpLJ7
         YlkIgx2x+fyo7evtap1tCToNluI6RtUXTFYTcdFrNspkPoWs3shQbcdR2SZvYu2nxxqU
         38Xg==
X-Forwarded-Encrypted: i=1; AL+hErEQ7ebrm4eQ2v8dn0VtxI/BUBz/5P5CotR5GVwt/oqTef9g5eS/DrfIfmqbYo0kZYIGu7o=@lists.linux.dev
X-Gm-Message-State: APuU4Z/W26LPAFjIESu5Uq/cP6Vzz25sa/iflmHjTW8OJMb08fh6npEq
	FhbqaRxLlM9fl8AsjkDWBuEs0yiaykh+zW1gz3Oblb8xA7t93aTQxtd1
X-Gm-Gg: AYBFou3naKsNIdrcjvZhjoTOiU/6Oju+UDhgThYWsGfosiywELJR1u4fKHV3z8+oJt2
	79z07aAaSvUunN4LSw+qtdcdjDVeVZzUnxNJxWws7sNsEEN4aYwUHOfxRT77PIWYZRAh0ZUQo54
	TRIE5UJ/gUCJd37HWHnJKP+90d8aDEgd/GClVkTDHQW5pwCniI9N4DdBysAjZ0sYNDK4kJ11CpV
	HHMyK3jV2sTR4nxxQwdiFiWoBkT2Wu1M6ZT0Fgul0kdLQj+EGhYbjA1igs6P0UdUPkTwcSHpuil
	m5h2TcjWKn02B9bgOyAJTSdQ3CF/r2ODWmiqd6JyE0ssInc06FOXs0nDT3XX4yvFK2FLxa0pneM
	p2c0UrI99pqjqFATT2zZ4sMpYU605Wypik5GDnsf1ZwVbPvaaa48xvCguAy4UKNVZKT1IGfyFl5
	Oyj9yHhswJnWr02PPxDUbmhHotTCyii0v2eUHbeQ7Hx1IAr2du0wD3dg3C3WEiAQgwHbOwopaE3
	jH/9rmqK/ugstMb35+pqulB/Wnof2JFCI/5Yr096GQlXAE/jRX4K5DTcIaeHprZd57wj3gAql02
	mZBAoJB31Wxg4BYRuMUAr/BFkjteCr4lDu97zkqpgtZ7YaLAcNy76ayC2c7eVY/hg1CBAyL7rFV
	vbqYhDiYcdNZ1dRGMxDBk+mk3H2WpsGuYI5RDKhx3TAxDO2LUuf1bT6rALy9sXg==
X-Received: by 2002:a05:600c:6994:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ba0935bd68mr32873845e9.4.1794388492912;
        Wed, 11 Nov 2026 01:14:52 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005946sm145501635e9.1.2026.11.11.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:14:52 -0800 (PST)
Date: Wed, 11 Nov 2026 10:14:50 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <avQyCgitN-stXoS7@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
 <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>

On Wed, Nov 11, 2026 at 03:03:12AM +0100, Andrew Lunn wrote:
> > 2. The Ethernet connectors, LEDs and their wiring are on the carrier.
> 
> The PHY itself is on the Module?
> 
>     Andrew

Hi Andrew,

Yes, the PHYs whose LED configurations I'm moving are physically
located on the SOM.

I'm moving them following the approach we previously discussed here:

https://lore.kernel.org/all/31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch/

https://lore.kernel.org/all/fac81a12-92c9-4e29-96ca-473c18fca675@lunn.ch/

Best Regards,
Stefano
