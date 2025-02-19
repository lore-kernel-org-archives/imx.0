Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28891BD9C7
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953307; cv=none; b=KA6F6on/810Pqx3IbhOg5MjbuPgheyAaj1p6m2K7yWNoCJlNde7e8L0WC6gWnDOn2OC/qgTiFt05VF7p8XylwH/Xn2aHbFz06PsoxSMiAxsu0AyteyZi0ZyIWOxDPXVKO6nnEcyZ3BAT3zy+Iedt2GmlrDKM5zz7dH5HwvJVcyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953307; c=relaxed/simple;
	bh=zvTczUtf8Y1eEofJZO2thlt6exdwrKA425Rp62SQESg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbhRltRxy31kUcdfu4lxSzH1MYo/SwqgaDe4YkyTtIQ/2Y5Ofju1xB3uI+aiW8egtgBIxIyW2XSDg1DFdG8n+BUc3OefN1TFp1HQUn3Fg4cdg+KbCOHeAEJAcEBj/sOgsOntsPPu7xhrvum6pwkoXk7rJfoXqHMq49F2k+gZ/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luVsEkbe; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luVsEkbe"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa7465baceso12893425a91.0
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 00:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739953304; x=1740558104; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CCUQvs7skbbtsR/YI3q9DDNHuUZH7nkoZeezReFSZA=;
        b=luVsEkbeUlccpWTnKAinDg00R7+dawPmOD7GjO+6pU4/AMajUqOGyih1920aSkskbn
         8bQ6bLXUJ+cIOh8wA9T37k9lScHp+oK64RtMuvTNEcV9R3r1LNw1udPufRSPjqpHh8ro
         nLQ205Yt7PQvF8CDEncs0USvlvDDsrs35eYV1kod19S5+RCEjVo8h1GrJ8QZRAIIztmc
         IKYFVY0X91kngr6r6gQWx80CIzEceSnmVNAdJDaaHlfUj8+z6q3Twd+K/3hdKjVHTIsM
         wZWOSsmt0ydVOV8QFmvO+K00bKSgdMBMhbMygTQuNa5/LYQ9LWxmit+VuV5DPOc/Hrq6
         KbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739953304; x=1740558104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CCUQvs7skbbtsR/YI3q9DDNHuUZH7nkoZeezReFSZA=;
        b=j+cDOIGPShg4AXVSluCvkGqYgYpm6FwgWzytg0yRBYeMRDNVBNQTLxTOKFP0h44hqp
         uHOodsCGyVq/1qn5BgZMHX0oov4+fWqn3EnOI+uAWKYjcBuc4MCvkdsRFHdj0a3YTQI7
         kaO4yVNmC73iCFsjDKoAGpWItLVIDcRZ8+q6skOa4oBTXULIclTd2+wIvv6ESz8/Psld
         4//oFd+qoQzosFD15IsYOLEAxEqO9b/RrJ6EadluOw+I95pm2p2PA/HgrllTpS41EWuO
         bFOFE3QbIp2UOlsFfpJ0byAnf0m3S0LIYjWj6N99WTS9YaDkL+t2mNlyTx9kFzMVkzeF
         pSUg==
X-Forwarded-Encrypted: i=1; AJvYcCWP17nS8O04d1z83Hvc+IjbaYuqgnEerIXEyVIl+Hoh4xJukUGshAF4Mx9ziCXR+QeFRuE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVwFlvH6VTxfl/LHExByymd9B/go6lURpU1AyDSrz/YlMeXq+t
	VWTzGfc3J1hvvNcndQqwNYAtQl6SrmIJLBNt7Weiv0mutm/0OvYJp7bC9l9DCpLzZP1xbZzzJPC
	hS75Eo7sYNImJBlQHZPL9ONLD8yM=
X-Gm-Gg: ASbGncsGgJ+YL9z1NL9ppmIWDWsKpl2UOjsz40FEji9gcWt/29Q4c4Qa3jNLZFLuDKC
	2Ofjog7iqKl/1mIOjOgacJO2U0wCJ1tNkRq8+vPywWealzG4+KbA2khbuCG0FGb8z047CRR3DDR
	NrRkesnhrSyjd5yclf2WE1m+eYfq+mEsg=
X-Google-Smtp-Source: AGHT+IFzIRpiLIjtv2iSzEdqta8V6rWObrEAdpRX7gMmj7WIN0aL5o3A9z+K6dA+admg76L3qNrsQ9fIjfYQvQGGYPo=
X-Received: by 2002:a17:90b:3b92:b0:2ee:f687:6acb with SMTP id
 98e67ed59e1d1-2fc40f0f07fmr26433153a91.13.1739953304594; Wed, 19 Feb 2025
 00:21:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218085712.66690-1-daniel.baluta@nxp.com> <20250218085712.66690-3-daniel.baluta@nxp.com>
 <Z7Stjh08+/RlUtek@lizhi-Precision-Tower-5810>
In-Reply-To: <Z7Stjh08+/RlUtek@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Feb 2025 10:21:32 +0200
X-Gm-Features: AWEUYZn3t8RO4hNneBNPP3WTziJtjhP1rlkqNpTqV_tfmebhGCfYSHFlLx1Yy64
Message-ID: <CAEnQRZAL1npc3-Z_O_7_-SWi=fvWkSv_fv2dcmVf5owVYsi0NQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, p.zabel@pengutronix.de, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2025 at 5:56=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 18, 2025 at 10:57:09AM +0200, Daniel Baluta wrote:
> > Current code supports EARC PHY Software Reset and EARC        Software
> > Reset but it is not easily extensible to more reset bits.
> >
> > So, refactor the code in order to easily allow more reset bits
> > in the future.
>
> Nit: wrap at 75 chars
>
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  drivers/reset/reset-imx8mp-audiomix.c | 53 ++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/rese=
t-imx8mp-audiomix.c
> > index 1fe21980a66c..6b1666c4e069 100644
> > --- a/drivers/reset/reset-imx8mp-audiomix.c
> > +++ b/drivers/reset/reset-imx8mp-audiomix.c
> > @@ -12,7 +12,30 @@
> >  #include <linux/reset-controller.h>
> >
> >  #define IMX8MP_AUDIOMIX_EARC_OFFSET          0x200
> > -#define IMX8MP_AUDIOMIX_EARC_RESET_MASK              0x3
> > +#define IMX8MP_AUDIOMIX_EARC_RESET_MASK              0x1
> > +#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK  0x2
> > +
> > +#define IMX8MP_AUDIOMIX_EARC         0
> > +#define IMX8MP_AUDIOMIX_EARC_PHY     1
>
>
> Does dt binding need such macro?
>
> If not, you can use enum.
> If yes, create binding header file for it.

Thanks Philipp, Peng and Frank for your comments. All are valid.

Will fix them in v2.
