Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFF2066C5
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 10:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739355018; cv=none; b=IwjJBawiub2VdHL3hVgsWaOHWjHTF5IsxfELUfGZ42aYZ8cAUNAJLy2tATNRP8PpymRzGrAu0EKtXTYj/zAkfHVNhtr79vLPQagSXRF//x8z9PAJi8PpZREsvEMBQmSttXKIg0WUowy5QZLrD/g/3K6wcIFU621Znfm9T5DRvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739355018; c=relaxed/simple;
	bh=dksiq7Wu+Tr8U4ZmasPxlXsm3FDPqcOrzej22bOgA+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3Em0n57QbB94epd8JOztB0v1B05TaSNfrx+Q6827jWgxTd2b8atAvG/oaeohwPjXOrQEf9XoyHA4h0xzBdo03gIyekiMECctFFLJQp7DBLvn2tz8qlBkVFmtH0MqftSI/reBOpYxmLrVfxgr92gQkGfJC4IRX3dZP+z/r07Wv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5UArLRc; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5UArLRc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so905261a91.2
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 02:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739355015; x=1739959815; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88AwpE99PaoAeek/DCfv+c+a/zWXUaUFSdw15oFH2AA=;
        b=h5UArLRctVlERz71sM2jJLG3SZqL6i+/xm7i3E06KCtNYAAl5KHp4AVYXOSKP2kecD
         pic01FleynByQ2IH3+ly4XRoF8esxvAUAWF91Sei8uQOKKo9wGJeghvoiuTTu5/KwfYQ
         jfxMDOjI95X9Q+LQcj4wLm90xjFq5UkNvO7ixeCV3lKLCyLkW02XSYOMV7fmGTNHqdSQ
         1BvyYOk6gsGn0J2y18PxIGyPnHFmj5WkOCJyWoQYW+nDZLl02UNztNK1hFqkDL9hIufy
         3U3zbgnBxFwzTveS6tXgwTcyjF8o/RFO6jVDJaTRH8c7WEjSPIQOnOD7IHc+VxX2V+Bg
         1Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739355015; x=1739959815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88AwpE99PaoAeek/DCfv+c+a/zWXUaUFSdw15oFH2AA=;
        b=tt7Fi0uBu9q9eXsBP/3A/DKw6Za2OOL4Oe4zGV7KlSaBObKWy1aGcINrA7RVRjQvzX
         20F+QkD0gDhkxgYzFneivBRz5/DUKAeZXy5bEEj9h0AWkDSGNx6FOx3PwaySqSMPoyr7
         Oj+GFNFx+Xr16zectNPk4SGlNulN6OYNkQwE1qG2hp+aGgCmmTHw06DDqFGk0lQKLMYV
         LnUgsd3AhI/D1m1c2+W+tyQhV9jgD2pLNhUsq2AImQx/NfQ8oJvy3GozbdLSVaPwRgAy
         SpQb6qAVrDcVapu18AwCi+eRRUdIIgBOettMz/Y56MdUecKw/gjK0trKmfziIXTbq5k5
         Ab7w==
X-Forwarded-Encrypted: i=1; AJvYcCWqTeZgkrhOxG3d3mnEeQUkVwgmzC9tImC3VOgatfx0BL45E3VD2nwn8kfL8AZ4CXknWeU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjA4dG1n4aSFFOQQa+t4RR92S43pJJFZJ3EOt0VE3CbBiyYH+c
	SWgtAz6UjCuPJztLQDStJlAqLyl52+WddP6B0fGvzJYfhXh8zOuVLQKo+IZpYOuWnAlDJyq9gAE
	hOkCMJ1lp0YWp5P2CBRmdv40SuJI=
X-Gm-Gg: ASbGncuJsGH1tLF0drQxC8aOSu0Ftco8SKJgLyOzwdidef8df0UvtdlrC6Dzc7xmV+J
	SkC2vk4MmHlCNBTw09liJ2ctqPE/aUHbYohp9UleTC5LSeAFeZm+WMeFjSCzmob/UhnGifQ==
X-Google-Smtp-Source: AGHT+IGmuZRdGl3j3qwqlGA+I6iMmpaYMwad+794x21O14HpgAdBUJZvPf+MREMoJEJJ7oo0IQ1nHPq82m46EvhwjX0=
X-Received: by 2002:a17:90b:50c4:b0:2ee:ab29:1482 with SMTP id
 98e67ed59e1d1-2fbf5c0f645mr4582577a91.16.1739355015327; Wed, 12 Feb 2025
 02:10:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
 <20250211225808.3050-2-laurentiumihalcea111@gmail.com> <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
In-Reply-To: <20250212093610.x4ixrackmn3u2xrf@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Feb 2025 12:11:49 +0200
X-Gm-Features: AWEUYZmaBc7oKF6zAnQ7CZxr3zaURFYGkUGsn3Z_TJnj1f8vLuCQ0QWTQQTBMT4
Message-ID: <CAEnQRZBeQdnC+K92+Udb5awTmom10YHHNt7Ld-pYK4A1i8sr3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 11:38=E2=80=AFAM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
>
> On 25-02-11, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Add binding for imx95's CM7 core, used for audio processing.
> > Additionally, introduce a common binding for NXP audio processors with
> > Sound Open Firmware (SOF) support.
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 +++++++++++++++++++
> >  .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++++
> >  2 files changed, 91 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-c=
m7-sof.yaml
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu=
.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.=
yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
> > new file mode 100644
> > index 000000000000..f00ae3219e15
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
> > @@ -0,0 +1,64 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP imx95 CM7 core
> > +
> > +maintainers:
> > +  - Daniel Baluta <daniel.baluta@nxp.com>
> > +
> > +description: NXP imx95 CM7 core used for audio processing
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx95-cm7-sof
>
> Albeit Krzysztof already add his Reviewed-by, can I ask why we need to
> add the -sof suffix instead of -audio or so? SOF is a software project
> but you can clearly run different software on the audio-copro as well.

Sure you can run a different software project on the audio DSP but
you will need a way to distinguish between the different projects.

There might be different mailbox, memory configurations. So you will  need
to invent another suffix specific to the new project.

We can make  const: fsl,imx95-cm7-audio as the one used with SOF
and think about a different name later for when another project will
want to use the DSP.
