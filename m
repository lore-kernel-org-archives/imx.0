Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BA24B28
	for <imx@lists.linux.dev>; Thu, 26 Dec 2024 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735224064; cv=none; b=txIkKuxr20u0IonzT0Uj391IZAF+5HfbLvzX6yPICD38Q2SHGM1x4lTG4FB4yzLuX3AxbzijAmLtcJQXFbMW409mHUg9bEjMLx09Q6KXQ6dA2qc3OWCx+TB3dP15IRKOxKIVAf2yNQdemVgKJrAs82x1ZmRT8gLfyWoz2PbeAcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735224064; c=relaxed/simple;
	bh=CDJo8kESXFKCvYAWUmatdZJVWIm0WawwcEFXIhXwWVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6rNwRZUp3oRCrViJwHyNyoGKUATfY6NWmV/NnQsVGEb+9i7GPyYEjiHpyB886a2PQX5Dp9gk5vPxDcyBFBNYt7hYFrB34uqWXK3QScc8Ddy9cBMTaFQL73IwtYEdM4OdyOoMW57c1XaCkjxFo/4CZFHib3gHbeTVcFIlynoM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sj0Lss5e; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sj0Lss5e"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso69153475e9.1
        for <imx@lists.linux.dev>; Thu, 26 Dec 2024 06:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735224060; x=1735828860; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EaV50W72dcye3DySmDtBOo9K9oTUuHhi5CzxEbusJOc=;
        b=sj0Lss5eIHwWQD81YBrwEcPUC6NTSWbe9QIkERdCyA69cPkWuUbf5Dl2j7EFZny0CP
         pCpBsq6oE+N3KmHso4v9tZeyTCWSq1Q8OlK/svj1Obn//zO4eQHBhOzYIcNdUbw+IZjm
         zfG8N5jA1wMsgqRx8Iv967Bsdw9WX59Gw9gqvAfDSsmReI6TXVWxYxjznxQlVnTVrDrV
         t2BfXSnVuZnk+tkTjLVqf4IhZ22GZMgb8jfkM7Yf4+s7dv4WYM92NT5jGK76p9pl68OY
         saeN0HaX4qNA2a2q5ChvUMGvQwQF7PF2WO6mpyOW7+E7gTZbJbrx//aqREIOGkGLjSQa
         S6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735224060; x=1735828860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaV50W72dcye3DySmDtBOo9K9oTUuHhi5CzxEbusJOc=;
        b=Ju4Q7PLZAWADLV99oRmS8NbhUWrdyl1BdyslJzxAovG/Wq0wZ6GnJipJOg6ur7Rrjo
         TKUVibNOkRxH+I6qa9Hd4yvksql1X8ibd+IG2hbw81uGBhsjLrfuvSmVNwTmh3qBhhv/
         iLUNzZ2592epC+VyxO98il+jLybFXqa40LQfC3lbw07JbHiCs9/MPYHnARwC1WXXeitq
         4jWNn2XRLAp4rKEIte21Fp3Ln9r4ZlLNyfaxKhLFX9eNVlcKrAo4O/gEYr2zdAd5Hawz
         SeUiwoWciudE4tQmmR+Ysv8LyUWa6J7hqukynghvjfrIy5aPxaSKq3pjXFhvmxo/AYr3
         pl6g==
X-Forwarded-Encrypted: i=1; AJvYcCUPQmQJHkla6zLYM4b3vqqSBhHH1hDiygFukEJ1dmZMpb/HNKY21BVTxDA3BHjUwrzhQyM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyruePSK3Y/O6RSq6lfZVR8YdCF7nSArVRVeJgmAx1S+bC0Z/u0
	4EokK7fsJFJtYjLwH1KVESL4EjcZxyvJ70N8aNIKZsSkOSpToDmAtv4rlSjqdFg=
X-Gm-Gg: ASbGncvbHp1Bb5BO2YMLwM/7PdW4sj3FXPxvIhFdf2TaiMa2SiPbfTVUQ5Y4dpYY9JS
	vhg1+jWwY9MYejiIqGPMCi9CiBiouHalFbn07ZanDZa6mJmkkoA5cJR9S5FMd+edQBaZIG8LQF3
	xDsgIvu5X3X+nt45BNPj28w/uV9TiNE/oRIp1vjYWV7zdyo6x9h++RWQPlbPRVEO9VMaUrh/m4F
	T/mH1kj71PjmH0vjPIAeUgGKD/PQ9WjzdG8vhmDn+YT3ClVPG+KFRI=
X-Google-Smtp-Source: AGHT+IFAkeYRxenuSnMh5whe4fj3qf2FXC2/YY8gmQiLBoDE4x9299sSrv8G4XcwveZUu2qAO5Z/wA==
X-Received: by 2002:a05:600c:1c95:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-4366835c1b0mr210961505e9.3.1735224060629;
        Thu, 26 Dec 2024 06:41:00 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c4bbsm233695145e9.32.2024.12.26.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:41:00 -0800 (PST)
Date: Thu, 26 Dec 2024 16:40:57 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: abelvesa@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev, shengjiu.wang@gmail.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as
 SPDIF IPG clock
Message-ID: <Z21q+Xyz7bQjN+yJ@linaro.org>
References: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
 <20241119015805.3840606-4-shengjiu.wang@nxp.com>
 <Z1bkixjbyFhH3ZgL@dragon>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1bkixjbyFhH3ZgL@dragon>

On 24-12-09 20:37:31, Shawn Guo wrote:
> On Tue, Nov 19, 2024 at 09:58:05AM +0800, Shengjiu Wang wrote:
> > IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which
> > missed the clock gate part.
> > 
> > IMX93_CLK_SPDIF_IPG is the correct clock.
> > 
> > Fixes: 1c4a4f7362fd ("arm64: dts: imx93: Add audio device nodes")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Hi Abel,
> 

Hi Shawn,

> I guess it would be the best for you to apply the whole series through
> clock tree?  In that case:

Sure, will take this whole series through my tree.

> 
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> 

Thanks,
Abel

> Thanks,
> Shawn
> 
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 688488de8cd2..56766fdb0b1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
> >  				reg-names = "ram", "regs", "rxfifo", "txfifo";
> >  				interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
> >  					     <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
> > -				clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
> > +				clocks = <&clk IMX93_CLK_SPDIF_IPG>,
> >  					 <&clk IMX93_CLK_SPDIF_GATE>,
> >  					 <&clk IMX93_CLK_DUMMY>,
> >  					 <&clk IMX93_CLK_AUD_XCVR_GATE>;
> > -- 
> > 2.34.1
> > 
> 
