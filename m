Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B4F188A3A
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731660734; cv=none; b=JN7/18x9pTaD4Op/f7ZE6Cp2MUQaHXoOgdfOM+sE9ns8/3GfPAU2ijfY47F7sFSVUCEJQOS2JndeKjB6lvIul3hO0SA54WZuk6LjnhaE5jva9bQBsRYJG3KvkM/vNhFg06avTKf8fErR+f8/JkvdVWRtPA9L0zoS1FaskYSA7k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731660734; c=relaxed/simple;
	bh=bGxmR42ZqhzPo5U+KBhp/Vo3Bch/V1hPQBqkPLuoFbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4T2bTUk0YyXYVkl8dQswpMHWCPEidYqKkfcLR4CXUp4CKb7snklBJIAOl3qxTOd27TTb+1F1g6vBW2ZZ2u78tfq+LQtlbGpvZ5UIbvea+YPA4IoKzOz9YbClUsbGSWRvnZvs09RlIg8RCCJLMoaunQMHP/ujzrt+HKJQIt4ix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=B8xrTBYc; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="B8xrTBYc"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e38261653aaso533043276.2
        for <imx@lists.linux.dev>; Fri, 15 Nov 2024 00:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731660732; x=1732265532; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6S2nGodUHkF7oQtN5BOS0le7eARr47Goh8++DpENQG0=;
        b=B8xrTBYcJCcTozuZv00whEP+qVpfHSzM4SNMsvFUyq3l4NZ1LgBTnw700T77MvQgN+
         Cw6935OtjbEFEaQQjsL0x1xKv472nkXSsQN15zXn5jruYVByR4d/mbAMKCOXq6/iHqEs
         kZlK18alzWoWDF7oZ1S9K8sEdpr91g7zFZIZFwzt+1gQcXohNVRy9sLu5fM/umj+Nr8F
         Fs0U9k9yUyGFgN11BmW2SypNMykAKHFsd4DN/+GB1LivlJE+zzzJuMzIH4Wq98Pl8Zgu
         IHJVZetuoACd+vCp9rfWVAS1IE3WR58LAT9kdde7WoeA1OGlFR0nQzZKnwCMaZ/iMU0S
         YBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731660732; x=1732265532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6S2nGodUHkF7oQtN5BOS0le7eARr47Goh8++DpENQG0=;
        b=soeC58mEYvS0LHadt9kOoiBYe1tMM1YML5aS0MICBtG7cAkzEJ8+z2z22DlwX5VEtF
         iBsLuGtggkuYT1V1exb5OLFcftt3Tz3NxGg0J42bLAIErFeioojaAsf/zBTryO0jgXbX
         zsHjGGu3QG9yEvz042bXs3Us42WcQj+s/ECXIFQV/QricYpcwNiDkevgmYTt8JZneZWV
         BZzbG12JfVfn4cRIrFcD0sMgAPU/h+WJR1P+m/gW7wQgXytqYnFgh0kwD4djA83JWtAt
         fNrKSIAg5sDVkdkXFAdou6QUtOX3y98VrBf4abc6zepdjRygnFONZNrNskh45PFo2+CU
         oDow==
X-Forwarded-Encrypted: i=1; AJvYcCVsdb54zFZOWiGrbhAfqyusQfzcBb3mKVK5duvEfcl0ZxVgqYLlqdszlCa3Ht6s6cFD1GY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM6MTVrM+JKR5a2Mp6CaIEDtzYPEnoqxHBgc6VfzTRbrZDBHLX
	butbKvkCDd6EuovvYJao+tELmI268USJ4ITY4Y0amfAFwKxVhvDHTQR4EOQK5vAfU6ccDfDBmgZ
	vePGKbpLtBb8c798NeXZ9AfaDgbeFD2/CLhR7grkOT6nJoWL8Xx0=
X-Google-Smtp-Source: AGHT+IHV94ciQ8ydggMMk7IA4ri1B28vEf2MSAaktiuDxaGnxBdFoxYrqrbgaH4WT2Q9fn8dihjYsjg1qMjvep1DlaY=
X-Received: by 2002:a05:6902:b09:b0:e30:cea9:ba28 with SMTP id
 3f1490d57ef6-e3826165b1bmr1162795276.30.1731660732215; Fri, 15 Nov 2024
 00:52:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com> <20241115000637.GK26171@pendragon.ideasonboard.com>
In-Reply-To: <20241115000637.GK26171@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 15 Nov 2024 08:51:55 +0000
Message-ID: <CAPY8ntBJu+mA3BcYkkVpr1L0jf2hp6e3kbpyGkB7mwbiDQDGzQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: imx290: Add configuration for IMX462
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the patch.
>
> On Thu, Nov 14, 2024 at 04:01:15PM +0000, Dave Stevenson wrote:
> > IMX462 is the successor to IMX290, and wants very minor
> > changes to the register setup.
> >
> > Add the relevant configuration to support it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index da654deb444a..f1780cc5d7cc 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -170,6 +170,8 @@ enum imx290_model {
> >       IMX290_MODEL_IMX290LQR,
> >       IMX290_MODEL_IMX290LLR,
> >       IMX290_MODEL_IMX327LQR,
> > +     IMX290_MODEL_IMX462LQR,
> > +     IMX290_MODEL_IMX462LLR,
> >  };
> >
> >  struct imx290_model_info {
> > @@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
> >       { CCI_REG8(0x33b3), 0x04 },
> >  };
> >
> > +static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
> > +     { CCI_REG8(0x300f), 0x00 },
> > +     { CCI_REG8(0x3010), 0x21 },
> > +     { CCI_REG8(0x3011), 0x02 },
>
> As far as I can tell, the only difference in the init sequence between
> imx290_global_init_settings_290 and imx290_global_init_settings_462 is
> 0x3011 register which is not present in imx290_global_init_settings_290.
> It is however included in imx290_global_init_settings, and set to 0x02.
> Could we therefore use imx290_global_init_settings_290 for the imx462 ?

I'd done a comparison of the datasheets, and register 0x3011 was the
only one that changed. I'd missed that it was in
imx290_global_init_settings.

My datasheets:
IMX327LQR-C rev E17Z06B93 2019/03/25. 3011h "Set to 02h" (value
changed in doc rev 0.3 from 0Ah)
IMX290LQR-C rev E15510G82 2018/02/09. 3011h "Fixed to 00h" (always
been that value).
IMX462LQR-C rev E19Y13C13 2021/03/19. 3011h "Set to 02h" (value
changed in doc rev 0.2 from 00h)
The default value stated in all of them is 00h. In true Sony fashion,
there's no description for that register functionality.

So actually it looks like it was the addition of IMX327 in [1] should
have changed that setting, unless someone else has a more recent
datasheet for IMX290 that updates that.
cc Alexander as the author of that patch. I'll find any discussion on it later.

  Dave

[1] https://github.com/torvalds/linux/commit/2d41947ec2c0140c65783982692c2e3d89853c47

> > +     { CCI_REG8(0x3016), 0x09 },
> > +     { CCI_REG8(0x3070), 0x02 },
> > +     { CCI_REG8(0x3071), 0x11 },
> > +     { CCI_REG8(0x309b), 0x10 },
> > +     { CCI_REG8(0x309c), 0x22 },
> > +     { CCI_REG8(0x30a2), 0x02 },
> > +     { CCI_REG8(0x30a6), 0x20 },
> > +     { CCI_REG8(0x30a8), 0x20 },
> > +     { CCI_REG8(0x30aa), 0x20 },
> > +     { CCI_REG8(0x30ac), 0x20 },
> > +     { CCI_REG8(0x30b0), 0x43 },
> > +     { CCI_REG8(0x3119), 0x9e },
> > +     { CCI_REG8(0x311c), 0x1e },
> > +     { CCI_REG8(0x311e), 0x08 },
> > +     { CCI_REG8(0x3128), 0x05 },
> > +     { CCI_REG8(0x313d), 0x83 },
> > +     { CCI_REG8(0x3150), 0x03 },
> > +     { CCI_REG8(0x317e), 0x00 },
> > +     { CCI_REG8(0x32b8), 0x50 },
> > +     { CCI_REG8(0x32b9), 0x10 },
> > +     { CCI_REG8(0x32ba), 0x00 },
> > +     { CCI_REG8(0x32bb), 0x04 },
> > +     { CCI_REG8(0x32c8), 0x50 },
> > +     { CCI_REG8(0x32c9), 0x10 },
> > +     { CCI_REG8(0x32ca), 0x00 },
> > +     { CCI_REG8(0x32cb), 0x04 },
> > +     { CCI_REG8(0x332c), 0xd3 },
> > +     { CCI_REG8(0x332d), 0x10 },
> > +     { CCI_REG8(0x332e), 0x0d },
> > +     { CCI_REG8(0x3358), 0x06 },
> > +     { CCI_REG8(0x3359), 0xe1 },
> > +     { CCI_REG8(0x335a), 0x11 },
> > +     { CCI_REG8(0x3360), 0x1e },
> > +     { CCI_REG8(0x3361), 0x61 },
> > +     { CCI_REG8(0x3362), 0x10 },
> > +     { CCI_REG8(0x33b0), 0x50 },
> > +     { CCI_REG8(0x33b2), 0x1a },
> > +     { CCI_REG8(0x33b3), 0x04 },
> > +};
> > +
> >  #define IMX290_NUM_CLK_REGS  2
> >  static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
> >       [IMX290_CLK_37_125] = {
> > @@ -1455,6 +1501,20 @@ static const struct imx290_model_info imx290_models[] = {
> >               .max_analog_gain = 98,
> >               .name = "imx327",
> >       },
> > +     [IMX290_MODEL_IMX462LQR] = {
> > +             .colour_variant = IMX290_VARIANT_COLOUR,
> > +             .init_regs = imx290_global_init_settings_462,
> > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > +             .max_analog_gain = 98,
> > +             .name = "imx462",
> > +     },
> > +     [IMX290_MODEL_IMX462LLR] = {
> > +             .colour_variant = IMX290_VARIANT_MONO,
> > +             .init_regs = imx290_global_init_settings_462,
> > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > +             .max_analog_gain = 98,
> > +             .name = "imx462",
> > +     },
> >  };
> >
> >  static int imx290_parse_dt(struct imx290 *imx290)
> > @@ -1653,6 +1713,12 @@ static const struct of_device_id imx290_of_match[] = {
> >       }, {
> >               .compatible = "sony,imx327lqr",
> >               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
> > +     }, {
> > +             .compatible = "sony,imx462lqr",
> > +             .data = &imx290_models[IMX290_MODEL_IMX462LQR],
> > +     }, {
> > +             .compatible = "sony,imx462llr",
> > +             .data = &imx290_models[IMX290_MODEL_IMX462LLR],
> >       },
> >       { /* sentinel */ },
> >  };
>
> --
> Regards,
>
> Laurent Pinchart
