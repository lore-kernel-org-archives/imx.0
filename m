Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F02117FE
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 02:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719454512; cv=none; b=q+VZIAXz7tMo370ZRLKoEjSYHY7b9Z2lARQ82ArB49FNn1P97bEtRbc8si6IyEHyzNCU90BadCQjCMjMM9FLrFlpke4Ic4tpn4jfQ6EDi4I61OXrSldwVu+qkyg1XIbVJoSn8/5YSIytOODxPoTJvFCTwL8RUWBkeeeYsuQl23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719454512; c=relaxed/simple;
	bh=it0/8Zz+qHOZNt43zZcQ12BfnWDF1gD5SpFSFNdkaI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgkDVaVJSrEka5lW9+9D7L2M185Fa3p0d7maMC1OowDx56VEzDpvj2Bkwg8sG2xW1A8OsOza+qnEQEUzjN66N6Xq5HVa9A1y310ad9pPbqAtIWnieLZWGDmpTs1CJpwoY2YyS8lwWGMYUwiclzi10Wwjl5ALpuOLycxYF3AD+Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gxh3mN3J; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gxh3mN3J"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-375f713a099so28046945ab.2
        for <imx@lists.linux.dev>; Wed, 26 Jun 2024 19:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719454510; x=1720059310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuXF7M1aIy1YQUxUnC9JmsA/FUZjc7MkV6Eh2ulEEnE=;
        b=Gxh3mN3J8XScrImJqnjZvLY4NcSHS1SItkiP5IuoMxMaeChEfHLWi2109OYm28slEK
         SWNF2Xrmrd0TMVUdTiXX4tSEoXiYeqbnbBn74LfLqk0ZPKT1k0tTsaFCefdKsTHlssV1
         yDxGw+O0FplNx5HwqFuVSaQP5vI81HQucghdOTTfzrUYltPOw7U+ksIOrwWeFHKFiOSP
         NwlgDoOj4X4o1eAkUpkHqk5bR3EAvHnXH0fUNt9SDcWe8Zmhb7+ctllWUHOWphRhymAJ
         ddp++EYlP7fg6VyidAC0TjeHVa2UTgzlGBLVxV8+r3MuTrWxFjZsJICFaEBGlmhrHDHZ
         6nAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719454510; x=1720059310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuXF7M1aIy1YQUxUnC9JmsA/FUZjc7MkV6Eh2ulEEnE=;
        b=A0OTW83UrEn7ck5cHrr+w4tJdHK1UrXU0UkoNO+EIeETXC6cU4K7AJecsyNIXxeNog
         USyHbakIv6LXAUA6Pb+hHLr1IhbaQxeD3AN6U5sJgqbmOipbLPOvv2M+YBKxSczluSf2
         cGKxsXRsPa5BKNA401+Y24lEQbrjRp20AXBtJ9H/jIDuWIu1GthSl7N96lcAWXeUkEEV
         B7/exiURxLm82oWmdPEId82pShKW8VLNGo3gdWyd17P/fl9U4IZJd3bM1bazRsb5rlk+
         OdKrITvD2KxMaYM4RST55nX+pDA7HvNfRZYILYpCIGzfM0Gm1cVwWisYF5uOk2se7Nf9
         Y24A==
X-Forwarded-Encrypted: i=1; AJvYcCXgkti5AO/JTxoqvs3RSxkgS3oUYGEb7ekkRvSooLyJTiwfCtTVhcZ0Mu4eVdka+V8JFQpAdhRHTbkihwLuB6lctAy2
X-Gm-Message-State: AOJu0Yzdns0h7Uli3bg/TT8seSMwfpGC2m95swnPIZJxheUjTbbSdPjJ
	pRtfjrzR0nhbrTxa90u9psNddL+Q4JhRfMHWnrdSg3qUN4uJpXvwWmnJxHt3gKEl51ztEiBm8iw
	fttu6lCaz/wGOPN4A96sbGTB/UEU=
X-Google-Smtp-Source: AGHT+IGOzhKPL9eKGJjIhALK4BPHJBjQ60D8IYPD6gShN5cqmADVfO7MTE9p9CDoxXv2wAYMp4daMjVAPSQagAWhwTE=
X-Received: by 2002:a05:6e02:1a68:b0:377:14b2:71ad with SMTP id
 e9e14a558f8ab-37714b27360mr80377005ab.13.1719454510190; Wed, 26 Jun 2024
 19:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1719291415-1168-1-git-send-email-shengjiu.wang@nxp.com>
 <1719291415-1168-2-git-send-email-shengjiu.wang@nxp.com> <293fb3d5-9b77-4321-8b31-d060cf96565d@kernel.org>
 <CAA+D8AMQv_=X3hC5uQbrDBN0EGo3U6EToGFVjUYcOVHpf5b=aQ@mail.gmail.com>
 <549edfff-24a5-403f-b35e-8929cc14c81f@kernel.org> <d7117060-734a-4f8b-bb05-a9a9473a53d1@kernel.org>
In-Reply-To: <d7117060-734a-4f8b-bb05-a9a9473a53d1@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 27 Jun 2024 10:14:59 +0800
Message-ID: <CAA+D8AMnevQCLfExKUk2bo2wfCHjn8Bp9cVuRaDsW_Zt4aK+fA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 9:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/06/2024 11:34, Krzysztof Kozlowski wrote:
> >>>>      items:
> >>>>        - description: WAKEUPMIX Audio XCVR Interrupt 1
> >>>>        - description: WAKEUPMIX Audio XCVR Interrupt 2
> >>>> +      - description: SPDIF wakeup interrupt from PHY
> >>>>      minItems: 1
> >>>>
> >>>>    clocks:
> >>>> @@ -88,6 +89,7 @@ required:
> >>>>    - dma-names
> >>>>
> >>>>  allOf:
> >>>> +  - $ref: dai-common.yaml#
> >>>>    - if:
> >>>>        properties:
> >>>>          compatible:
> >>>> @@ -112,7 +114,7 @@ allOf:
> >>>>      else:
> >>>>        properties:
> >>>>          interrupts:
> >>>> -          maxItems: 1
> >>>> +          maxItems: 3
> >>>
> >>> I have doubts this was tested. The existing example should fail,
> >>> although I did not see any reports. Not sure why.
> >>
> >> it is tested, because the minItems is 1. so the example can pass
> >>
> >
> > That's a very unexpected change in dtschema. It indeed passes, but is
> > not correct. Why interrupts are flexible? This should be constrained.
> > Let's wait for Rob's confirmation that this is not a bug in dtschema.
>
> Yep we need here minItems as well, so this is strictly constrained or
> please explain why this should be flexible.
>
Ok, will add minitems:3 here, and update example.

Best regards
Shengjiu Wang
>
> Best regards,
> Krzysztof
>
