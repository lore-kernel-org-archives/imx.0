Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FE2ED865
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896081; cv=none; b=Wyul4nvJRycGUDt6Eq1GI1WXfWtEZu5OvUzs4upUKPLzijghmrCs8vC9+8BppR/G2pDNTWde44PsnRUD/rSXFIY17DnuG+KBpA3ykbnRUD2VcrE2+z3/v/je+0mgkRdx4wh4ZgSil5EL5tWWRlPX+Ih/p3ILTPnFWTSv+dYo5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896081; c=relaxed/simple;
	bh=cQ5AxTNObd/Ros3LgbI1d2H9KbaWvkEuSSK99ckKyZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=di2BFh681IjW7tqvQatHWlmizsxErX1ZsK1GgBrHYS6OxFtKxOnHh+adne22kuhDxiE9gvQ4bGzc4QMCoTggnU7+buhSRIbHi/corX5Hy2XgnPJAXYg8XmH8+6aOMrQkcDc66hBONM67GhaUFMEt1NHBVjp/u9z/R4tq3gJyXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMisxtxe; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMisxtxe"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24c8ef94e5dso4225845ad.1
        for <imx@lists.linux.dev>; Wed, 03 Sep 2025 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756896079; x=1757500879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0EPRZe8YJObgeqfHix/soVRNAxr+rVxG0fDuUG583s=;
        b=KMisxtxeIT+1QGmAJdbvstFRGFmWAlNTac71NgjIRT0Iv3AZiUR3Sh1oUKU3y6QE5n
         5qoZFRlRhC/tn4P5nqOOTxZRQk0cw7lU+dsmt1CceaOTRLY9PgaxpuU9Lq6kJm0p6MUH
         LlEuBh9+aWth4Wmqc7PZSB6T0uEzYM6Po8oI/H9vwmUPKQ3VEdM4hyldoz3K0ppqHdc3
         rfPa6LrjHFUm+M8aDjkpFL4lgz2kvYSQAmF1vqqz9r/HtUIHOexaY5jQKyx6C29X0feI
         v+zEPJ5Qo43uV3u529S95DI3IkIE4RmHlm2X2clRCqEhDy1IvxiCjsmlQYSUnH83XHNm
         sk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896079; x=1757500879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0EPRZe8YJObgeqfHix/soVRNAxr+rVxG0fDuUG583s=;
        b=Ql8AdH+NI2QTus6l4EnMj5dH+lPn5wlOldXHJJBFZPd7Dl6WQaC5MIV9/CFJP6FKuP
         lQLOZ5vtTpMixGVtbVzEtaX9uu5YBbMmZAnwiuxnvpV/eLoVkY7Dpaa9PPytW6X+g+CD
         86fPiyjp2ZTbdYZKRTvqcfy3OIoC37Ax96lAWDEY7JRuLYgeDLN8/hv3EZm/OYdbXCkI
         B2Upmu5NLT1YgDVIxk5zwSuh5zlefQOddIg8vpBocSIdAyl8WrJZy17oIoI8a29QcrsY
         YScssgzOj1l1jaBCXf5YW2zO2pCFahOMKmaIR/GkfebvpUg9/1+QIrldI1SlUvcItnk6
         MJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCUogUEVDJATD1qGbvdyXps88EwBAAmU8KT+GaRN0DBc0Raq2hQp7hAYXqpmr+bwrjpYDog=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVpYSpd7GHLg+OYgCOB00qYenkDlrB7ZH+ER6wcPVm8Fd6N5M8
	dKPnISZvwjul7w6WfWaJFmRE6mwxXz/a3YayVzNpa09s2LiT2yrLIcdzuEgkyrejqGX8vUqXxAT
	swddGzuj5flK49WYkoeEEkMStZ+MY6ZI=
X-Gm-Gg: ASbGncuCm/Z163HwxSAyNlOQ0Y5duGvMkj1wueNTCVtM2FS2PXkJq2bTEnjyBLNw9mK
	IAKYyhz/b6H8LBfj+DyTveOVUtjB5nr7FYBB2TpKRejmApkK7d3lQC2rFFwYyWZtk9Yp5Dy/H2Y
	n2Sx9fhIlyn0qprgWEg2o3M1GFIfLayrw46BAm8q1sbc2nyCQjVro6RrZCrC8DIn1IuJTElmqJj
	yTcYxE=
X-Google-Smtp-Source: AGHT+IFBlgHU9/9J/ynH5B/Y0lYKvN7CIRjLzFRFLjCUSdV7/phYhX05by3bq36srAY3SNogU76UhQZ1T1/Qk7whF0E=
X-Received: by 2002:a17:902:e891:b0:246:2da9:73a2 with SMTP id
 d9443c01a7336-2493eff73d7mr197893025ad.27.1756896079484; Wed, 03 Sep 2025
 03:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com> <20250901185208.394cd162@booty>
In-Reply-To: <20250901185208.394cd162@booty>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 3 Sep 2025 18:41:05 +0800
X-Gm-Features: Ac12FXx8o6RDyP5im-Wa5RK1y5nzjHR2o5AyrKxsM3tEIkvqqNNrZcDYhIoBDY8
Message-ID: <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958()
 for iec958 format
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, l.stach@pengutronix.de, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Shengjiu,
>
> On Thu, 21 Aug 2025 15:31:28 +0800
> Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio dev=
ice
> > driver needs IEC958 information to configure this specific setting.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Acked-by: Liu Ying <victor.liu@nxp.com>
>
> [...]
>
> > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int iec9=
58)
> > +{
> > +     mutex_lock(&hdmi->audio_mutex);
> > +     hdmi->sample_iec958 =3D iec958;
> > +     mutex_unlock(&hdmi->audio_mutex);
> > +}
>
> Apologies for jumping in the discussion as late as in v5, but I noticed
> this patch and I was wondering whether this mutex_lock/unlock() is
> really needed, as you're copying an int.

Thanks for your comments.

Seems it is not necessary to add mutex here. I just follow the code as
other similar functions.  I will send a new version to update it.

Best regards
Shengjiu Wang

Shengjiu Wang
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
