Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853174068
	for <imx@lists.linux.dev>; Wed, 20 Nov 2024 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732117185; cv=none; b=srluy8APo9I2FaWF4RvHQ8xwrMFTBWe7GAfbfjxgER1LPhDfrsvpkgSc+d0yGiOQJcxWcEtCC19XevK+TV2e2n96bbdlB8rJK8jQnYdOXEaOSDx6srPAkey1bnhxIIhMwSMBbMueJe7ZbEsgMFBBEjxd4I39/gebVJBFjcNrs1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732117185; c=relaxed/simple;
	bh=gvszAwBmM81FZKcpUq0PwEIiHeLEdt1nkAQ9S4kXO5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyW7Sh9fKo12z4vWKsmptxlUyUAinT7Bed6usofhHlhCqZeze4V2bR99INLVoF2Tf+uwrh1DQ3uYKe1edDfwmkejAwmS3prpZVQg7TemkUc04+9CTSvKaLRn0dDwFOLH2i8UgPZ+aGx7V778YOkWXkjzAjiagiXFpXBkDyRwYn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C70s+C5K; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C70s+C5K"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7edb6879196so1705582a12.3
        for <imx@lists.linux.dev>; Wed, 20 Nov 2024 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732117183; x=1732721983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GT0pzREV3J2zvk7nPHKF5lsRBHdeeSGwYUopMf2XrA=;
        b=C70s+C5KKRNyXn7Q2iSYx9Z85yEPBX3iUwqAx+8CXNDa01hvo3u7OE5HwE48AeRvWx
         zwrrwkN989JViYWIzB7374dxe+YnP+C8/X3R7UfZZJ0KAwJJfTd9o1ugeLdsNRo5aZoZ
         XLndUHAh9e6wALJtpUeIXTZ9lcGPte80UffmAuCxBPDELaf/l6pZG8X120x2GpAvQfnK
         Zkaq5aHc5aVwWX1Hu6Xwnv3YAjGGYtiGH3RRgNI7lwt5E07SMh/qiquepxqlNFsw8SFX
         jVEykLmeNDigmpdo+a8kaeOZFzOs2wIo+7/hNOUMPZjSFHthAaTp6krNXYfXXkV8W/fM
         yHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732117183; x=1732721983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+GT0pzREV3J2zvk7nPHKF5lsRBHdeeSGwYUopMf2XrA=;
        b=JyruU4pLpkJtrN7Udptt+rLfd+aCa5FlrhDJuBGodrEMbbUsrlaCEl2mmSrmasFiok
         GSwVE5pQUqNv4V1O+KRgpcwCIjGlC9Cs3y9nlh+gLRfg0ElELAf5/3s2Xh9OXFwx6+ma
         BVALHXwoZva5cf3+LkAwXFDN3TWfz6GO2FJYkp8sdqSVenEJidwgI8Gdb4Zni4HIvFAn
         P5b1vQY10IwuYd0pMvRUmVcrgivBDOcfoKX5kJxY+O4ROwRh2rxd+nKEESoUXnXeOnvN
         +06LjXXxd2Sh+TAXu7VFHrMq3m5IwE2mp5db9Q3u63hY8OZ8PtwgXoIiCWhaJ2pTTZg1
         QScw==
X-Forwarded-Encrypted: i=1; AJvYcCXeZJQqL4w0CEKT6meGhT9rYtHeb6GjcLWQR4U2JFvvL6uk32ebthDB0WiKZcNJh68eTTE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi0R1Z5gAMV66qM2tmOhlDV2zGpRecZd1l7q/gP2puoBwTiPpH
	bHGDqI4V2+bbfeg7Sjo5fY+z2q9hj5fKUC38IdwAvUpqn/CWKv6boFpvvV6H9DqtD+A9EOM+F0V
	9JJhmdexckw+yykhgybrUZzE4gkk=
X-Google-Smtp-Source: AGHT+IHtExCHm+hnVUXyYz7nTokaTlgnHFY6hCDnZrAs3FKOIXQBuExWWJ5/go5fXw69nnGBgXV/+vib6N/Ya2OTMnU=
X-Received: by 2002:a05:6a20:2587:b0:1dc:7d9f:948c with SMTP id
 adf61e73a8af0-1ddb09139c5mr5284381637.46.1732117183019; Wed, 20 Nov 2024
 07:39:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241120135859.3133984-1-daniel.baluta@nxp.com>
 <20241120135859.3133984-6-daniel.baluta@nxp.com> <11dd729c-df29-4d10-bf47-73e1fa01322f@pengutronix.de>
In-Reply-To: <11dd729c-df29-4d10-bf47-73e1fa01322f@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 20 Nov 2024 17:40:47 +0200
Message-ID: <CAEnQRZBh7=niaH_yoHD0uQQs=4GEB89mf_7nqVjfAWums=tTpg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: Add dsp rproc related mem regions
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, aisheng.dong@nxp.com, imx@lists.linux.dev, 
	conor+dt@kernel.org, robh@kernel.org, iuliana.prodan@nxp.com, 
	shengjiu.wang@nxp.com, frank.li@nxp.com, linux-kernel@vger.kernel.org, 
	laurentiu.mihalcea@nxp.com, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 5:36=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:
>
> Hello Daniel,
>
> On 20.11.24 14:58, Daniel Baluta wrote:
> > With imx8mp-evk board we are now configuring 'dsp' node for rproc usage=
,
> > so add rproc specific memory regions.
> >
> > Also, enable dsp node because it is ready to be used.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> >  &eqos {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&pinctrl_eqos>;
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index fa4ff75af12d..e6f3ac02689c 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -282,7 +282,6 @@ reserved-memory {
> >               dsp_reserved: dsp@92400000 {
> >                       reg =3D <0 0x92400000 0 0x1000000>;
> >                       no-map;
> > -                     status =3D "disabled";
>
> This reverts commit 010dc015b811 ("arm64: dts: imx8mp: Disable dsp
> reserved memory by default").
>
> Please enable the reserved memory node in your board DTS instead.

Thanks Ahmad that's a good catch. Will fix this in v2.

Will wait for few days to get more comments on this patchseries and
then send v2.

Thanks,
Daniel.
