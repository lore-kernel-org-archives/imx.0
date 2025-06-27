Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873C221ABCB
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 23:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751068317; cv=none; b=Aqq6MfZOZQ4ofB+tW4rB+SNStcLVfjmxSfWbhs1x3h4gNbJS2dcQDCkZ/DB3TJsCqlxm1haXkX66yn8d0DlpVBjDfRoSRlNcCOSoijfkjzML3EhW9Det9mdqrYh/ARlJK3SpDpJZnOp14utsufh8tL31DClQBBtFPa1Ci1MLqc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751068317; c=relaxed/simple;
	bh=kyrV6L+meAj02dvvdma6O77Vtcf1w8s3JJQjUVYj4uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmME/WdrtcNrNDdhJtivoPBXEuZKxbn2QvWWkKJ0XJRrgg5NI1Q+rUUUEg7Ra9kqzRa0tZhIMqsWZeGUSKEXuIokC5PZ8dSLawvPeT01Ll8R7ExsKslLeQH1V5hmglUE333VK59mmIfZyQGCzTSfYX1s88MMmECgajuKLJ8jtmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=GRHxYCpD; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="GRHxYCpD"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6114114daddso211175eaf.2
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 16:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1751068314; x=1751673114; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzzFxvtsJDUS1GN+Rp5blvMdsxvFtXnK7MAb3nkjiUk=;
        b=GRHxYCpDojCwQf6X8ITjSSrclTp/EUjLoZsLacHWWD+BxvfJkBM2E+ZDasH0tYSRpH
         bH3QWPFkLdcx13JvU2ITihK0hkaC+fk9wV239J7M6pqTsa5gQdBx3nwCK+eKZj9YIKOU
         L0bMV+uv3O4NBjBbT9V5+WtlEQ4viI2+EQGJzn2TngkuEBSmVYuDAbthd7zKNqL7VGaJ
         YRHgIOKogoELO9IuNRfAyljREr6l7GeYmECPOmTBRwB8e57KGi8CxwSiJgFui88OuuTn
         wWZOz2QUwD0Snu4/VSo1y5oRt0wEyBaAqYx97zKhxgwjwKblFhblOZYueXW4QqhSdGgv
         x1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751068314; x=1751673114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzzFxvtsJDUS1GN+Rp5blvMdsxvFtXnK7MAb3nkjiUk=;
        b=WpoxqH3b/rqdARAsRjzJ9K21ommX3LMzZtUEG6gBqbQkzo93ZF3mZB9BkG3ssOOwXk
         nBbW56JsH7zeG18U23hI8x8mpx/e2rrhrwocI1zhfSScm/EA4ShDwZBzFqrTPCIuwQrm
         CcL4hZaOYFCfupDPxAaR6Fzb1JxJ5Db3U6beHEdqZ/eOCnoBznQjtJXM+49M8IRB6xkh
         DSrq00ISTpVpDZct1umAPX5SH+b80Ce1eWi3s1dFiDtxJwopyzWtoMyLF4fF7COPmqHh
         JkiAYvET1/FP2YpLI5V2JKII+kyW5LrVR+R5SjOFF/P3fD3hI7+VL0AZ6BoDhS3HFwHz
         9/5w==
X-Forwarded-Encrypted: i=1; AJvYcCXBqgXye2HMDCMB0gssbl88G52ZMoIQ8fQdWAsdzpaKfhkuuHWKQGDQtQPyjetBgda+iPI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3g5EWzzNpZA8CbMbnW7qyQcCfU8Y/2FgB6yTCseAUBKTGrKT6
	3zunG7pw3U9ei2Y3ENoMllsjkouHobyvpviC+bvAZrNFLNf/DVcglYGhMT71ASKE6zNo7nPD+AA
	c9HauzYPi3Hszswo0rYbzxoG2pq5JoJiqzyQelRBHWw==
X-Gm-Gg: ASbGncvGwXl3I0PYOeg6mFwaDOATM32KWxkJa1y/N9Inc2n8zvNSyPZ9gWNFJk9mWRd
	sh+sCKhPLLPTSCRBnM+CVgSaOGrkf892wwRvLfvaAE568Rj2n81nMDt+HfQpDLDLCNedxwP0wbL
	Z3miKH9HoyO9lc8hZdt6bG56E9+EL2eiZHZ7mMhKIMqvA=
X-Google-Smtp-Source: AGHT+IGgc47EYY0K8HdBdfElHz/fGDss2oWTxTnf5NF11fTfAkKrJuQZMypuhZquvGUVIV3cfJTO7ety3y21wfQ3YXo=
X-Received: by 2002:a4a:ec42:0:b0:611:befc:38e5 with SMTP id
 006d021491bc7-611befc396emr2467182eaf.4.1751068314368; Fri, 27 Jun 2025
 16:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com> <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
 <CAHCN7x++XGXu6DsPaOc2EpAbxzy+RZbDq5A5-j5a4roGDhv4fQ@mail.gmail.com>
In-Reply-To: <CAHCN7x++XGXu6DsPaOc2EpAbxzy+RZbDq5A5-j5a4roGDhv4fQ@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 27 Jun 2025 16:51:43 -0700
X-Gm-Features: Ac12FXwXGulBL0jbVqQnJxN_WDCz81yMYRpGFHs9RhAW_Av5urg3MXFIWan08mk
Message-ID: <CAJ+vNU2iY4V3yp_58NTSht2XbS_YiWU+T5jn7fcbrkBMGygzJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:40=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Fri, Jun 27, 2025 at 12:56=E2=80=AFPM Tim Harvey <tharvey@gateworks.co=
m> wrote:
> >
> > On Fri, Jun 20, 2025 at 2:52=E2=80=AFPM Adam Ford <aford173@gmail.com> =
wrote:
> > >
> > > The reference manual for the i.MX8MM states the clock rate in
> > > MMC mode is 1/2 of the input clock, therefore to properly run
> > > at HS400 rates, the input clock must be 400MHz to operate at
> > > 200MHz.  Currently the clock is set to 200MHz which is half the
> > > rate it should be, so the throughput is half of what it should be
> > > for HS400 operation.
> > >
> > > Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini develop=
ment kit")
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/a=
rch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > index 21bcd82fd092..8287a7f66ed3 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> > > @@ -294,6 +294,8 @@ &usdhc3 {
> > >         pinctrl-0 =3D <&pinctrl_usdhc3>;
> > >         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> > >         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> > > +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> > > +       assigned-clock-rates =3D <400000000>;
> > >         bus-width =3D <8>;
> > >         non-removable;
> > >         status =3D "okay";
> > > --
> > > 2.48.1
> > >
> > >
> >
> > Hi Adam,
> >
> > This caught my interest. Where in the IMX8MMRM do you see this and
> > would it also apply to the IMX8MP? (You've patched your IMX8MM and
> > IMX8MN boards).
>
> My 8MP board already appears to be running at 400MHz, but I did check.
> The reference I found was in the 8MM TRM, under 10.3.3.5 Clock
> generator, there is a note:
>
> CLK is different for the SDR and DDR modes.
> - In the SDR mode, CLK is equal to the internal working clock (card_clk).
> - In the DDR mode, CLK is equal to card_clk/2.
>
> >
> > Have you encountered any issues when running eMMC at HS400 due to this
> > or is it just something you noticed in the RM more recently like with
>
> One of my colleagues reported that the eMMC was running slower than he
> expected, and I looked at the reference clock and noticed the 200MHz.
> He asked if it needed to run 2x that since HS400 clocks on both edges.
> I looked it up and found the note from above.  When I increased the
> rate to 400MHz from 200MHz, the throughput doubled. I also noticed
> some other boards, including the reference from NXP had the clock rate
> set to 400MHz, so I don't think anything unreasonable.
>

Hi Adam,

The verbiage in the 'clock generator' section is not really easy to
understand but you're right, setting it to 400MHz also bumped the
performance on my boards. It looks like there are a lot of imx8m
boards that could likely benefit from this that are not already doing
so.

Check your imx8mp again, in my case (imx8mp-venice) sdhc3 was not
running at 400Mhz without the appropriate change - maybe yours is
running higher due to some other clock configuration you have.

I'll be patching my boards with this as well - thanks!

Best Regards,

Tim
