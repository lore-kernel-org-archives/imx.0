Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD4C36D9EC
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 10:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533471; cv=none; b=LOeeEaS9Ww9B2X1gSwmFc4S7JhQHG4tZXBQZYBdkl9s6677YVciLV9FNsF32XCEkHTg7javJVNyRYbq0YwuQEhxOxFgbXZ88IvMbuNwf3IlX2/eBDZJc4ARWCLZsR/dLwIPJkT7wtNbFJOcSLDAL1y24eJdZqRvc1eFHjES4qqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533471; c=relaxed/simple;
	bh=5OAA6Kh1dabLTVRCSYH18jP5jWJ/D4gV2amghxzmJ6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ch5kUeUiRdLO8ZSmid7syKHYOxWOdJO7FBSceH0lZ+AAmje1O9rmF/FGv3A1xHBNAizksNYUHkYsF87bxQ56YSZrQNHKR/mRJdMmVqAP4skB4bN3PeYT4Fxvl3R6Ey8sR+OnZ9aMyYWbt8NTTIRtdNSRH84alHmVMnPBQpPHA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwYCzy+1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwYCzy+1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-437711e9195so4245063f8f.1
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 02:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772533469; x=1773138269; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NFR/74Mhz6mqBNodIdVtj44myA0OpEyonX9RTs0IqEg=;
        b=EwYCzy+1QuEERkJccKRMUQ8do4PCK//b9u4rWjWaaXpw3tER/NyOrHbjblwAXWTEsg
         qDPURWgkxIPxuL2XdMhNLc6Ft+dX0CkanOm94xX1ZI4JEH7gbGbpvwX9d1/u7iB73KUR
         PCfzKUvtUOCXwIfLoxlSr3WXLTA8Ym4nAg1icMhuqQcgmeJIN74WwRjlgqYu6xv0tmhb
         IHNfRRW1ymYR9Qx+BOILEQ/YHQEXPB8TAWMcinYDBhRFWdHRlwdbvuISjcsFLLXOt/fP
         ZR6QLsm3wIQwB6s0hLdNbApPhPFBdNOb9D/FX+v+EhH4nWJDoMm/WRloORbAgqA+pmEo
         q4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772533469; x=1773138269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFR/74Mhz6mqBNodIdVtj44myA0OpEyonX9RTs0IqEg=;
        b=WeDgSogFztP0IYjYghpi4cwmE47rtQPBltWM3l9fyNURTxSg9O4hkXmN0pRKHn4OvZ
         ULyrn0IVgIPWqpb8J7Sym4C2He45MgP6zcMag32mCQ0wFVKZGolvZL8L71zxPHMU96hX
         UHWIbYquSV8Ac7Y4EKUilzbNRoKK1eylnTUINOVFUi1jpYrFPIAAi2lR/9/wqZs3TDgT
         g7FBDnH1kEJI8jqAfIFdw9tBEaCywhpIFBvKRIEEPmJXz0RGp/wNLYDfcAOecemDO6CO
         RduN/wGXonow0bumGOEqrNvWgxm1drR64FQePV1vTQmxM8ewoQnoUh6AIGNYRwpFY/+0
         +rNw==
X-Forwarded-Encrypted: i=1; AJvYcCVFfvNO9bpDQNphJcQYVWySMSiekYhOn4s/vt0Z+gK/zN/Na/rBlgGvr4ahP9dG5kLYNtg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yye3nMvDb7tUBCaFIK3ZCmVeQNjTHbderTIMVmiSAuPIMZ5PNQ+
	iTO5UXj9HfCfVwfgGQh9ai+XsX6BMH5Sqdv1blTtVd3dXhi6bxq8c2Kd
X-Gm-Gg: ATEYQzz66DJGBsGuleH9W50HPMfX8DPTmBfqJzqCfGUGZt4tz+wpIZAV0XRuVCn40MR
	8cd8+1F75hOghM0gsUZYDjXH/Dt4dbWP2PAFA5ZzUKRRdFUd6XNVxdm6Jy/JZ9gP9BCQeMcMYn7
	2dI7pueiIa8Kx8LZtZQ8dmnyglQRDxXOFrJj8eRxJeiDXOAnfo16Vv8YYjtTak4Wc0lgDA6PVX1
	em1YnV0L66eQN0nMBt0XqYqX//n0bltNW4tZY/RKTAAk7E+GChg+G6y47u9qy8eNzEdS+SpmLR/
	Q1LHBQULi+mvGHTMECptFOcBFc5fycriS55ByHrXHfwsQ1rn1xolQD0TAV3btFQcX/tlRL3WZKc
	j6sGfxbJon3oj3bkVMY1dh0URV4hjy0QEfNbkceLiUcUBXZjfmA3t+MGWPBmAIo45KEt5FHofUw
	nIyvZi1RETdgZbv7vwDhlzPteyHYGhwhoVwDPT73JK8l0OH6+IjFJj9j+XWWbfPW3/uhn7gD30u
	mWhNo9kk++ASRrnYbjw8NH4LGGg4sKNzFrQOGUO/XiaZw==
X-Received: by 2002:a5d:5d02:0:b0:439:9312:4b6d with SMTP id ffacd0b85a97d-4399ddf87e8mr27796843f8f.20.1772533468743;
        Tue, 03 Mar 2026 02:24:28 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765c67sm35944065f8f.32.2026.03.03.02.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:24:28 -0800 (PST)
Date: Tue, 3 Mar 2026 11:24:25 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX91
Message-ID: <aaa22ecrKugDRM5u@Lord-Beerus.station>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <20260205100125.9095-3-stefano.r@variscite.com>
 <aYSzgRRGewX6uSlc@lizhi-Precision-Tower-5810>
 <aaW7EpLmhxk3elmd@lizhi-Precision-Tower-5810>
 <aaXCkswynHreRURk@Lord-Beerus.station>
 <aaYCq-H0NSuyjFJJ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaYCq-H0NSuyjFJJ@lizhi-Precision-Tower-5810>

On Mon, Mar 02, 2026 at 04:35:39PM -0500, Frank Li wrote:
> On Mon, Mar 02, 2026 at 06:02:10PM +0100, Stefano Radaelli wrote:
> > Hi Frank
> >
> > On Mon, Mar 02, 2026 at 11:30:10AM -0500, Frank Li wrote:
> > >
> > > dts part can't apply, please rebase.
> > >
> >
> > Thanks for the feedback.
> >
> > I rebased the series on top of the current mainline (Linux master tree) and
> > it applies cleanly on my side.
> >
> > Could you please let me know which specific tree/branch I should rebase
> > onto for the DTS changes? I will respin the series accordingly.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt64
> 
> Frank
> >
> > Best regards,
> > Stefano

Thank you Frank,

I'm sending the new revision on top of that.

BR,
Stefano
