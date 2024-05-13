Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D3714EC5E
	for <imx@lists.linux.dev>; Mon, 13 May 2024 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715603091; cv=none; b=p9G6wTm895gg6Ju7ujMSbi2ml5F5AxfcJmG1N8XQJEQ7N4N2Gthip8aQL0ZhhS4lffGS23ElJ0GHi2UdUmEUBhfrLH1MPMKP1da9ikZII7H5DgbgwKcqEs9+QbiPsY+xTjsrWv1jAXoaqvnR1APM59B1PqDBJp9cuPt6s7IKHXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715603091; c=relaxed/simple;
	bh=gGMG42Zz0ybZm0xvlkq65MZ8X026PNiCDiLOel1ltDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUaMMhbLRl8O04yx81mfJY5bHDMswFFiHldy6kgsm6ecmJ/LIx0+i+dmXpLZ3wKmRs+yj1Cy/aJ21rBXVE6q3Jjn/YC7PTp/4WmxYL7+bJO94Wlyd9E36JSTmsza7TNWgsTlM3vm3T30xrAAE9QS3cp7/5Mp0uS0gWAXTsHR5Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjTeYmua; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjTeYmua"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1e50a04c317so22309345ad.1
        for <imx@lists.linux.dev>; Mon, 13 May 2024 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715603089; x=1716207889; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uEdXqbZ7OmVXroYRzO4MQldyt0w8o8Vs1CnZronQ5I=;
        b=RjTeYmuaXoErCc85tELApTNdxfMRkPWp5Ch2t+0qzq7olXDzPvwlwROpbBHygmseW4
         GNXrAZuVi/Bj2BuPGSzdNkmeH+BmP/+85io+4/mqKDgGlYPUY2WbDNH/zbOKYEcMNjV4
         MBhDXrYgvbSpX3UGXIWQilcPBNiuHaNN77sfqRX+Plvz9vdcwClyZEjL+163UgYMsjYt
         RnkjXJAYHdKnBuP4VQKa1pT9umuUtE98n6uQYUWGUI+8PxSQrzwl7r4jYbzaZqKIMwdi
         B0IXlTkSvSOySLh0VSe9a4SKRsfjPdBduvOxzYDb3+qEEe2ycLTKW0XWgKQDmFEbTAx8
         WFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715603089; x=1716207889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uEdXqbZ7OmVXroYRzO4MQldyt0w8o8Vs1CnZronQ5I=;
        b=RjG68Errqvy41lr/XTa7z9j8iZq12ZoJRIdnaua9itgYP4qaFg/H+cgxLXRLteZeUw
         ioRzSdF3llLzuUrhN/pD4gnthl7yb6seFOlrdic1q8w7ayAXVsxk/6ch/HJXjSO9wzkV
         pz721J/QmtNZphXtU9yOzAQgyirxDEfzfF5di5tKWdqB0SOwHAbBJXRYS2G4jdDmPoMg
         eTK0/kaZPOBYjF5h7lXU33lpmc60OXoFi6bPjLTzHWE+s7FfnfeBWYH3MiBi2issON0N
         daSNvs2UHUu/jU/dVICyCH1PCQOezKhmDPzju5k+4fRAufP7vCWieTFoUsBj5JBsNZB7
         WsBg==
X-Forwarded-Encrypted: i=1; AJvYcCVhBaf+Nmi7UP/xUEEFIxfjHj5fvUAcqtiSehOuedKc7qUORL0PVQHETH0FTlRNMF+9VGj5r+7YpwsVAP4E6Ag1Zfkh
X-Gm-Message-State: AOJu0YzyXQ2VcysF6W6Oe2taw7SRgplRzsLmzD2WM0lCLmVcThmnixWL
	pIboc22D9qyyU5PXdz3eminTaO3CGj6JPyYnlVkgrfc6gkNc98ds31h3smrJIyxtUbjXauSs0QI
	Sl7VhQOVP2L3b/aK+BEMNjcwJ3ptRaQ==
X-Google-Smtp-Source: AGHT+IHdqWutAgLlnkeZq9lfl0ycFYjE0nnS3IKxHwLVKS8LDItaYXZI9kZ+SBHOfXOhLhe5WXWhAIXZE8Bv1REbIiY=
X-Received: by 2002:a17:902:e847:b0:1e0:f473:fd8b with SMTP id
 d9443c01a7336-1ef43c0f5f4mr119026505ad.9.1715603089219; Mon, 13 May 2024
 05:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305004859.201085-1-aford173@gmail.com> <20240305004859.201085-2-aford173@gmail.com>
 <CAHCN7xLsEvP0A3mQJRzX=nXGr30WD4RU9vQVw9ynqzSi6cDNRg@mail.gmail.com>
In-Reply-To: <CAHCN7xLsEvP0A3mQJRzX=nXGr30WD4RU9vQVw9ynqzSi6cDNRg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 13 May 2024 07:24:36 -0500
Message-ID: <CAHCN7xJGnutJ8szxqG+AHyEU5ULOMAcn8Q21N0=FBp18EYSqmQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge HPD
To: dri-devel@lists.freedesktop.org
Cc: aford@beaconembedded.com, laurent.pinchart@ideasonboard.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 4:18=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Mar 4, 2024 at 6:49=E2=80=AFPM Adam Ford <aford173@gmail.com> wro=
te:
> >
> > The DSI to HDMI bridge supports hot-plut-detect, but the
> > driver didn't previously support a shared IRQ GPIO.  With
> > the driver updated, the interrupt can be added to the bridge.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Shawn,
>
> Patch 1/2 has been applied and sits in linux-next.  Are you OK to
> apply this to the IMX branch so the hot-plug detection can work?


Shawn,

Do you want me to repost this patch separately since patch 1/2 has
already been applied?

adam
>
> Thank you,
>
> adam
>
> adam
> > ---
> > V2:  No Change
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch=
/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> > index a08057410bde..fba8fd04398d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
> > @@ -304,6 +304,8 @@ adv_bridge: hdmi@3d {
> >                 compatible =3D "adi,adv7535";
> >                 reg =3D <0x3d>, <0x3c>, <0x3e>, <0x3f>;
> >                 reg-names =3D "main", "cec", "edid", "packet";
> > +               interrupt-parent =3D <&gpio4>;
> > +               interrupts =3D <27 IRQ_TYPE_EDGE_FALLING>;
> >                 adi,dsi-lanes =3D <4>;
> >                 #sound-dai-cells =3D <0>;
> >
> > --
> > 2.43.0
> >
