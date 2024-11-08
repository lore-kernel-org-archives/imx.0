Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36671BD9D1
	for <imx@lists.linux.dev>; Fri,  8 Nov 2024 02:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731032582; cv=none; b=BePtK9cQ8jhn0rW7fnA/vlyUvvFhLcF99RLf8Js3KKuOp4vpf75SUYUCgn4GbnL4BJesCG3fbkmTKG4A3I3RQZRoCUhxP2mj2c6GHUnRcozbIJLwvqWh/re0oTYi3bkjFN4S7Gv7sOxppndSa2RphgMXmE3WOTjAC78yRm1clTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731032582; c=relaxed/simple;
	bh=APyRPtDpOSsz2jYrIwghzGR2bt5juoTmWmJTI3E01SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyQemkoivcKqktlQJpiaCT2HtO+oic1QrKhQbFgmEbff4FuLkB0xycSeKXVTHU2WqGjpsXw+Cl984mvo+cUo/VO+5Qrjx28gumGuxUxNDs8MvIojb6F/h+XPBpVU9+D0yVMuz323AJdis60jHt3qrViegIoa0ObzEz1kxvIxAhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lo/qGudG; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lo/qGudG"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a3b7442db5so6298305ab.2
        for <imx@lists.linux.dev>; Thu, 07 Nov 2024 18:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731032580; x=1731637380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eR7AyViXmeWGMVONEZ/pRYURocoexzHBT2dgSZdiLJc=;
        b=Lo/qGudGRRrSOEqXDLomjGb6kAXbppD4T5p0cv67VEDlOmK908AcDj3y7W++3QTqrA
         bBH420auM/JTL+DplCWQfY94/+KPKGeh9YAVM+oK81L+PAxI6wCJtWfYbmIjYpZ7EcIO
         HAvztZ3w7jVOZAeSYQh33vwmgBwt1KMtJMrdSTt/CBApWHwWdHmq+taLvQcSUShJalcB
         uLpVe26q6k2aCwcx+hCcib3tymQl76IlUeyMoZuFIuW9Zlekqfde7ftsBYpXf1muyc5q
         4Fdm19gXgGH6nVN+985E07Um4zCu1beUZyUPjzHvLT50wuaQJp/Ee9comiIeTLndeTkX
         yEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731032580; x=1731637380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eR7AyViXmeWGMVONEZ/pRYURocoexzHBT2dgSZdiLJc=;
        b=X3AZNbpWh7m49KEQ+udiFvAuj68+dJbmqFUjpsOJzH3D2/XdmhwnisCMqL+Q/QdJrQ
         eVT+KSR6MVtdUnfqViNWGWwd40ThGUf4WKkz4Gmvy4quyuQEqrqEs5oUV6jvrwVbWP7U
         DgomYwzzXXuDmO38jLfwmAnkqHs9i59Fm36XaNDIUrxT38tRns8mrqw/G1epO77oOxNR
         O4mWIkWjaVX3j0SPoVnNu2HBIu8tIE96pH3vs3hnEa7X528vUK8hKjoipYwDc+F//cLp
         uwyWm00Jk4PhOuiHOFp0laIfwrnJiXk0yCplMDfI2zM3I445gJgkBdLDlazBSf5mg3t1
         pV3A==
X-Forwarded-Encrypted: i=1; AJvYcCV/tATX/eFiof1RngKnFqUay21hqWwllR4skW/7uOtoJ5izw/A83brb9OuuurDU34goyis=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUSzg9L63tlJfHSBHeVmYwFG0L/RQPQeCneYabqSSUGTAVGtq4
	fg57q5/5DCjrkFrLuJh7sFz51SWRoikqweT/E/yZMq1PdoPkDCPm8Nf3Z8lQ0fzfgjaXOel8oCO
	KNMV6FkiY1t36dImOxktMhlrxAoY=
X-Google-Smtp-Source: AGHT+IGQ7gpv66XfauvZZ5t0zmt5b2BZyWV862s4RrmNacvxmqQJFFeOQYZ68mwOrld/NXiqMMkWEyD3aFFzolHNfM0=
X-Received: by 2002:a05:6e02:1350:b0:3a6:da79:12bc with SMTP id
 e9e14a558f8ab-3a6f199ff96mr15159245ab.7.1731032579956; Thu, 07 Nov 2024
 18:22:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107102008.3626023-1-shengjiu.wang@nxp.com>
 <20241107102008.3626023-4-shengjiu.wang@nxp.com> <Zyzod4k+LNkpJdMA@lizhi-Precision-Tower-5810>
In-Reply-To: <Zyzod4k+LNkpJdMA@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 8 Nov 2024 10:22:44 +0800
Message-ID: <CAA+D8ANhznTNCt5RqaF17GMYHqYdggMpR_LOWuP4GX5ECApHzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF
 IPG clock
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 12:19=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Nov 07, 2024 at 06:20:08PM +0800, Shengjiu Wang wrote:
> > IMX93_CLK_BUS_WAKEUP is not accurate IPG clock, which missed
> > the clock gate. IMX93_CLK_SPDIF_IPG is the correct clock.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> This should be fixup. Add fixes tags.

I will update them. Thanks.

Best regards
Shengjiu Wang

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot=
/dts/freescale/imx93.dtsi
> > index 688488de8cd2..56766fdb0b1e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -925,7 +925,7 @@ xcvr: xcvr@42680000 {
> >                               reg-names =3D "ram", "regs", "rxfifo", "t=
xfifo";
> >                               interrupts =3D <GIC_SPI 203 IRQ_TYPE_LEVE=
L_HIGH>,
> >                                            <GIC_SPI 204 IRQ_TYPE_LEVEL_=
HIGH>;
> > -                             clocks =3D <&clk IMX93_CLK_BUS_WAKEUP>,
> > +                             clocks =3D <&clk IMX93_CLK_SPDIF_IPG>,
> >                                        <&clk IMX93_CLK_SPDIF_GATE>,
> >                                        <&clk IMX93_CLK_DUMMY>,
> >                                        <&clk IMX93_CLK_AUD_XCVR_GATE>;
> > --
> > 2.34.1
> >
