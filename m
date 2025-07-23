Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83589248F5F
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753256467; cv=none; b=A4BaXPuD5JNf/AR6AqLRAiwMovCnOvLbPUppDlu6+df7sNvu2pOIKkWuLO/ektiDpTDEHy5WS4xoSOGj0uCOF/y4N6s5XPwPjwBfWEIieP1yMudmrLOrDwbNBnKAzLCq7VjyLQdiHwDwfijX8MGSxTcjMOjjs5/MWuHhYTqw+WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753256467; c=relaxed/simple;
	bh=KfP1ywzLLeyAW58cpJqwY6sGIJRR7/qC8x/PsTBeZe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q92Xx7fk7MAouWBrvCO3yIlznIWLTwc+yUSLB6MYSchtbnfn1eiedO3HCILdkVlccNKxHpHdrgcwpDhcxnqCkgl/dtmhRGQTqC96W+FP0qDmNugVyQo9oBwiYMRk1LhLQUxMQmKNo4u25eGqvGWQ+FcohA6067noZFkLr1OjDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNaVnL93; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNaVnL93"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3df2ccbb895so54464705ab.3
        for <imx@lists.linux.dev>; Wed, 23 Jul 2025 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753256466; x=1753861266; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81Y9fywoqF7EeyNEvfPWdoet0imEzVFFJD69wE8Ijuo=;
        b=DNaVnL937QfU3Y6Z5QRKrd98nCh7kRDq80qeWMoxuYuUfeJuo44nzXCDzZTdLzBxK1
         4QRRzbT22SmXNigF/Cn5XBmEKKsEGYE6btoOHJuDyPYQt1dk0hc5UYVPsPQPb0rtDrSC
         UzsJOIUBrfJYiwxt6Ztp7NufbZefDfE6QJyEkC/3qNwnzyhqNZPGP1bXEPqCDNZxVvva
         wh7Y8wEKWkAfZXDvcRcZGRC0cdwpFqE60TrE6RfllE1xMWD8AZghd+wY9I2p4nc25ERm
         ozI4P9K+S1sZR0sT7ILJR9pGFFelszPbRqxlXap+B1mjORgbKksIjodCZJrSWfII3TdW
         4K9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753256466; x=1753861266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81Y9fywoqF7EeyNEvfPWdoet0imEzVFFJD69wE8Ijuo=;
        b=Blw746R6kefaPrJ5qY3nl2PekDuGjpG1AWr6pmdaMJezCjx/chOzqrvQ2n8KHfzjMY
         dwFM8TK1yPl4Gt/K+//WgjYmrWEySW6S0p74jtv8w3Hb/xk6OZu13T8H+kR/bWhTg7oU
         0PqCo+2xiV769YzKYQ39id2kBXZ4KLp4MNUVwfORwA2Rv3VPFx4+OeMY8CZ6L8gOKiqR
         5GNvDglZSPDX7jReBjpt3PuWhOBAAV62p8Ou6baEaKggR0r0r4NPL1LGHBQAZeKNJSp7
         sJ0RUOtkNo2bz39CUWNts8hpD2MV41mZGWuMxaDXgrizAHR7PCftOBdE/jRQIZxuFLSy
         gQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHjEnAaN/lsbqAQYPEc9NBDqKTfZLb55UnK1Ft58xZWzQf+GqM0D5TGNl1MirNLd9GlEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvgSefLaJrn35kBCBL/sQjmztHXGwZu3wkJQW5zGSVa9WN8UOS
	IIkKR70RUxmvPHttyJITpLwgjeCVa7JW2SBB+avIp6FQmPeV5PSoTSsYKxau119MJl2sjb0ieCU
	EiiggTeYfglLvgRzQuflQx5tq1h1dxSc=
X-Gm-Gg: ASbGncsNmfNR8pu6+T8K7x7NYG+ZiwzGW8bbgyDrxdStrcBPBgClRO5NjlYRpcrjbVD
	2hZLkJ6eFecLKl/qU0JpO2zo18ScGh8KAiX1W6LovH9HtU8WZvjbDx4ixS007qk1CD0PsdarjpF
	a/b4Ry2kmDACkXh7NQMD/Ndhaw0nal21Qu6MwMScWDWfjqvxsa96hhEC1OfbNKTSptlKBXPsaeI
	RjAstA=
X-Google-Smtp-Source: AGHT+IFxfL3iPUA5T5lDVBBDYyqD7VIFaDA3fQJ5O2oa4O2dCluRKQiYM4kl1jFwdLxNmmpTIZDHo7HQtauQmGufUFM=
X-Received: by 2002:a05:6e02:2384:b0:3e2:c212:6164 with SMTP id
 e9e14a558f8ab-3e3354dfeb9mr37438145ab.12.1753256465669; Wed, 23 Jul 2025
 00:41:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-3-shengjiu.wang@nxp.com> <4668607.LvFx2qVVIh@steina-w>
 <CAA+D8ANQdOuEiHrOWAbqVN2oFAAop2agBzKB2_YsoQ3_SFYYNw@mail.gmail.com> <85f1b9f3-0134-4385-9ac6-f3c6c2eb546f@nxp.com>
In-Reply-To: <85f1b9f3-0134-4385-9ac6-f3c6c2eb546f@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Jul 2025 15:40:52 +0800
X-Gm-Features: Ac12FXwt3CFjI2gmqrSV6-EQJlh4rFyR_XU_vqi0YUQRGTQLoRTFr6d47NZAQO4
Message-ID: <CAA+D8AN6HSTwByHvqfkLnZ=UFPo8W48N5oRf2CtF6pXdCwSXag@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Liu Ying <victor.liu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 3:50=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> Hi Shengjiu,
>
> On 07/21/2025, Shengjiu Wang wrote:
> > On Fri, Jul 18, 2025 at 7:51=E2=80=AFPM Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
>
> [...]
>
> >> Am Freitag, 18. Juli 2025, 12:11:48 CEST schrieb Shengjiu Wang:
>
> [...]
>
> >>> +     /* IEC60958 format */
> >>> +     val =3D 31 << FIELD_CTRL_P_SEL_SHIFT;
> >>> +     val |=3D 30 << FIELD_CTRL_C_SEL_SHIFT;
> >>> +     val |=3D 29 << FIELD_CTRL_U_SEL_SHIFT;
> >>> +     val |=3D 28 << FIELD_CTRL_V_SEL_SHIFT;
> >>> +     val |=3D 4 << FIELD_CTRL_D_SEL_SHIFT;
> >>> +     val |=3D 0 << FIELD_CTRL_PRE_SEL_SHIFT;
>
> [...]
>
> >> But where do these numbers come from? I can see that downstream kernel
> >> sets these bits depending on audio config being passed.
> >
> > These numbers are defined in standard IEC958 spec.
>
> Can these be defined by macros, even in a certain common header file,
> include/sound/asoundef.h?

yes, then will include ALSA maintainer for the change.

>
> --
> Regards,
> Liu Ying
