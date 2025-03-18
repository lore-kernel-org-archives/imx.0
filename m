Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB4620E008
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742312970; cv=none; b=dOT3AIGZXHBw1zOhSa1mK15zt0YGvhBk1ohbJ5wF4GRuemNBsMbHCYtuiiB0oQYOBUdmY+bB6qz5FSXzmru594agSM1JLhY1mwcamIiq0qmG7p5tzSMWbOc4+hQ033hj13ZaFdm72z1R9eiPBQJdxbH+4axtuqPHjb1+N/SgS5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742312970; c=relaxed/simple;
	bh=9IcPCCGUZr/pvJFEOPTdZu3qhFBek7e24MNCUdrqCbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsX3Osk8zqHryh/l9vN2hLFVpEqNnTT2bRhsCH6WwCtWAXT3eHkckS0PMC7vcnybOCyRinVq0LDTCV0iZLdl9PdNKryVPGmfqrTpm5/gDt0TLd1vV0LKQ22ME7r5dohCsJyZhdiGpD5kicUNG2CZluCH/r3Zq2+F605cLEOGYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuN4Di8e; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuN4Di8e"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso8132139a12.2
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 08:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742312966; x=1742917766; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L6Ipmc6ilCbSYurjtaIb/33JjbYe+per91vNl3/7Nh8=;
        b=fuN4Di8eKrlbobM7IM055H3kueaKETqrBWACU+p4x2f0es0hgBjXnZNSJvuHjg5pzh
         N6O8aSakcaiNzPpZvkrrxs398V69DTSkkdxdfkqfHZ2Ss459cUlNel63n0ThvnZyDcqC
         I8uQTB8ICfIh0MNNx0g7IjLmcpNCglr0YZYvAmWbpodPvjcbMUGbqo5JE2jU8A1jD3XF
         f2oCQRWI+v47+3lvTfU61LFmKErmIp5pdZEkhH0HgAtc7sPNYO2xHIuenk8meBdaXPKO
         GerAodcWcVQ/WA8JIMpT/u6yofV9C5ERcVgmYznZqIi2bNF7stdABwl6Cebd53M7xi5Y
         Gncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312966; x=1742917766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L6Ipmc6ilCbSYurjtaIb/33JjbYe+per91vNl3/7Nh8=;
        b=aEprsQq2pZNHRMOpGO8K6RzUEQEXjmW/5MVtsUbEEzbuPjz/v17CG3fFLqRK5aOw2w
         7Tkln2fQMuovha6yv71vFb7uYISoABg+SEH/83Zw7RYZ+cJ81hsLJFmsJKRCL8x/ldVm
         1LArG5XCqoRcHjeVcIkuw2Be3BhaogbPJTGbgHZ2v73dyn42RlxarYwv07+UScupi6Qm
         YKCDgMnQkrk+R1QW17vnbvEXgcrQ4cYBquUGOH9++pVsncaHLTbQO5F/W56Z6P1hmJqR
         /zbVHmR9feI3cDzsqql7u38QWhfm1poWtvKe8xsEDuAvZ0BPEe8YkmVyo8LOhvDDSu6C
         otBA==
X-Forwarded-Encrypted: i=1; AJvYcCUZuj5pWfjz6qXoUIV34j5Y4EVZE5X6wJ8y0KfbgZb1JAhe4i42ozOR7uYujOIjSVabU04=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxqb5xergzbdOxy2cVC8dVpCs7haQvZgCkfTGFnYmaX3Fw3Ncvf
	6L0Vqgf4wlRywfiKzK3ASwlizTQjPXOS+frSgUuIAInZjy/502ez
X-Gm-Gg: ASbGncvHKBzFOFQ5vEhUnCuejYRMZeFQygLpsicXIwhlVR6R6I/Ul3ISgFfrXtBFJYa
	50Sd9cVKzf/MeOBV3J9LL8AUf1gVoekJ/lEyHm/hmIF2H12qw6gE9pFfyzzJ4vRHo7f5RCIdwpx
	kLBRvFIXkbpY56Iu52P7az7b+44SUf8f9BYJ5POXVijReevx8t3zQ2BIEJwIg4M74fqLHShtyX7
	/JZkcPEGp9OSqqjLhlhowsclXGOtxswQzo3OknCeeSXE8SBo0avlZgfQiuX3zEOwyqiIc8HbbSE
	4/ONewvB+BnaZePUbhTBHVR70W/0nRDrjTSI43CPw5zkXeXDcI7bzNXLcBLgM4enKuSm6t5GhGL
	NxqNokGjbAgOitSB2M0Wk4KlSm7hUIOIu2K4JmBm5Qs3uuQ==
X-Google-Smtp-Source: AGHT+IHMLkaV8uHFQVg2vHrzXkQR9/w+ti4OyBuv1b8SAJBLiHJR2w6USAKnVcw7fN1kQSv+zr3g9g==
X-Received: by 2002:a17:906:da8c:b0:ac1:e332:b1f5 with SMTP id a640c23a62f3a-ac38d552e43mr506689066b.37.1742312966212;
        Tue, 18 Mar 2025 08:49:26 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-251-108-181.retail.telecomitalia.it. [95.251.108.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0f5dsm885226766b.63.2025.03.18.08.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:49:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:49:23 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] arm64: dtsi: imx93: add alias id for bbnsm_rtc
Message-ID: <Z9mWA5ldMDqZcVf5@alb3rt0-ThinkPad-P15-Gen-1>
References: <20250306193014.490091-1-Frank.Li@nxp.com>
 <116096172.nniJfEyVGO@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <116096172.nniJfEyVGO@steina-w>

On Fri, Mar 07, 2025 at 11:19:13AM +0100, Alexander Stein wrote:
> Hi,
> 
> Am Donnerstag, 6. März 2025, 20:30:14 CET schrieb Frank Li:
> > From: Joy Zou <joy.zou@nxp.com>
> > 
> > Add rtc0 alias to set bbnsm_rtc as the default rtc.
> > 
> > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 56766fdb0b1e5..7d9aa15ebf5d0 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -34,6 +34,7 @@ aliases {
> >  		mmc0 = &usdhc1;
> >  		mmc1 = &usdhc2;
> >  		mmc2 = &usdhc3;
> > +		rtc0 = &bbnsm_rtc;
> 
> IMHO this is a board property, not SoC property.
> 
> Best regards
> Alexander
> 
> >  		serial0 = &lpuart1;
> >  		serial1 = &lpuart2;
> >  		serial2 = &lpuart3;
> > 
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 
> 
I agree with Alexander, furthermore if we look to others dtsi we don't
create this relationship at soc level even if we have rtc there, is not?

for example:
arch/arm64/boot/dts/freescale/imx8mp.dtsi
arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi

Regards,
Alberto
