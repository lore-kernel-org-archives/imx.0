Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F79171669
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 21:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712351081; cv=none; b=Qrm9/iqWNcCvMrKiQv0A+Pu1cAcIORAOQ9lQqV0pOxf+tQAjhCy33iXFdwZmSF+nfTdLrYG0yhFKLJrxqTw1gejDiB9zd2+HWTjEedxh5QhGiWgXIgF9+2mWOx/aaXl0TsUoSIPGI0LQyDh4EUH7A+T1vIPKjxLN9bABXO7kATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712351081; c=relaxed/simple;
	bh=3JyIVammCnbfIWb3Q3iM3IcSim1epo/kRoDglyXoAkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fS+cuEMSSwoCOfaq0tfeF+doGLZejW8y+wrraZ88Yi50dGB40HgB/nfaeTSRamvu4AQYE7s9zZb1oq99o9BqWsMaYwRGxaqFRppHaE5EHMoq1s8UGmufMGTxwyxp/I1KpmnYd4TcyM21kK765utxGrltNC2yd3FIhTQra0/ALDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/KYQtHm; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/KYQtHm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a2c85b7dc5so1658856a91.0
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 14:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712351079; x=1712955879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htfOxZNyB1XgNQRSJgiv7F6TP98LyBs0gce5f7UfwWU=;
        b=V/KYQtHmwKQn4JOMyOobXzM+MlkCT9tWUo+Vyxdcu3FMuiWb7eCvP/8lM++b6Bcvjj
         BSz1TYhUfb6CLKiYkqcY1oJgJsnJTAFSlEYfK+xx/ROrLVh1D5LE/wBYgiiyEIziG5Ga
         DuRCtrpAm66aQ7F3kslzA8rV0eqCGEa0x8tCQG7Wn9xA4R9PaVpJPguNpQZdj9UEDbna
         /GdQNZzH+9F69f0/Bz2JB0psARhMCPaz0dArmguA7QAyfwS+w/wvVz+FryE1dqZsmKaj
         Hbo7+CCgQYY/XX7JU4q7mOQv7tch3FTQoTG5QdqUmSiJ0jhwSLfHD71k7TqYuzjQApOJ
         oj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712351079; x=1712955879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htfOxZNyB1XgNQRSJgiv7F6TP98LyBs0gce5f7UfwWU=;
        b=YdD6+Q4qOjlomvlmh66kpbuk8L7zfCfmDXj9FtXcUOB+P9ot6EFSJ+ZcXBtSsRZhWA
         Y33OiBR6RSmVYIMXP5dGQ3VmPRlfySZRJoS9yAof6vXhrLNiMoM7Aez+mSkEUB4qblAJ
         D2CSiLQfywxFNzgLOA1YLvCvx7e9a90/UAV2OR5vFXmqlohdwfPu/OctLHSby96fjJR+
         g6Qs7cApaHVhffDTOzI4XpMuKoOfAK9Z8sPcfaMx1Svo/rCy05VzwWY8FflCaK6+zxVw
         hevPhCy2jzHIIPS32azO9MHW/s8DJ6acaSRZY2W+2V4vy/6A6pzCMl3Sexn5PqU3FSL/
         IR2A==
X-Forwarded-Encrypted: i=1; AJvYcCWGI89VQCsISIx4LAKsGg93oFsXisfqd4BDjMZyQpiZ4ypziC2VBDpeZTPGaVrwWF4P+JibFivQItMNunrVox/trTD+
X-Gm-Message-State: AOJu0YyFVLXO1xk8H1ZbDUad1eR/BmNgw3xEqskxKaVAu4yygsXpBN8R
	gTV4tKWRoCWzwSou9KVOuIfAKQ8yE1T50QEgUsRg1t2aQQw8OgSPeYV4tF0uOFZ81Zk0jjXve0k
	TrniReaisRisUTe/O4TjmA+l5xk0=
X-Google-Smtp-Source: AGHT+IGcXJvM5s6CX0Tp+NFsXBZrQrzbHqMQXVGWOz5BElWGeWss6IdNa9HVaMuQeoCMNTkZQa649YSRuB+7xq6KMJg=
X-Received: by 2002:a17:90a:c291:b0:2a2:581f:c6de with SMTP id
 f17-20020a17090ac29100b002a2581fc6demr2625969pjt.3.1712351079187; Fri, 05 Apr
 2024 14:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240405202243.46278-1-marex@denx.de> <20240405204251.GE12507@pendragon.ideasonboard.com>
In-Reply-To: <20240405204251.GE12507@pendragon.ideasonboard.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 5 Apr 2024 16:04:27 -0500
Message-ID: <CAHCN7xKX7v4tmhjvoPLirEoUG91jpu-8R2DV9eE=mnWt=3FffA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Align both CSI2 pixel clock
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Elder <paul.elder@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 3:43=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Marek,
>
> (CC'ing Adam)
>
> Thank you for the patch.
>
> On Fri, Apr 05, 2024 at 10:22:26PM +0200, Marek Vasut wrote:
> > Configure both CSI2 assigned-clock-rates the same way.
> > There does not seem to be any reason for keeping the
> > two CSI2 pixel clock set to different frequencies.
>
> There's an issue when using two cameras concurrently. This has been
> discussed some time ago on the linux-media mailing list, see [1]. Adam
> knows more than I do on this topic.
>
> [1] https://lore.kernel.org/linux-media/CAHCN7x+kymRGO2kxvN2=3DzLiqRjfTc3=
hdf3VdNVkWjsW3La0bnA@mail.gmail.com/
>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > ---
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Paul Elder <paul.elder@ideasonboard.com>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 1bb96e96639f2..2e9ce0c3a9815 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1703,7 +1703,7 @@ mipi_csi_1: csi@32e50000 {
> >                                                 <&clk IMX8MP_CLK_MEDIA_=
MIPI_PHY1_REF>;
> >                               assigned-clock-parents =3D <&clk IMX8MP_S=
YS_PLL2_1000M>,
> >                                                        <&clk IMX8MP_CLK=
_24M>;
> > -                             assigned-clock-rates =3D <266000000>;
> > +                             assigned-clock-rates =3D <500000000>;

I am traveling, so I don't have the technical documents in front of
me, but I beleive this is an over-drive speed, and 400MHz would be the
single clock, standard rate.  I created an imx8mm-overdrive and
imx8mn-overdrive dtsi file to let users who operate in overdrive mode
to update their clocks in one place.

I also think this goes down if the user is running two cameras instead
of one.  I re-read the old thread, and it's coming back to me, but
until I can get settled into my hotel in Germany, I won't have time to
review.  I think the original idea was to use the lowest, conservative
value with the idea that people can tweak their clock settings if
they're only running one and if they are running in over-drive mode.

adam
> >                               power-domains =3D <&media_blk_ctrl IMX8MP=
_MEDIABLK_PD_MIPI_CSI2_2>;
> >                               status =3D "disabled";
> >
>
> --
> Regards,
>
> Laurent Pinchart
