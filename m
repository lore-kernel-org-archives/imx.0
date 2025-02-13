Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B5C211460
	for <imx@lists.linux.dev>; Thu, 13 Feb 2025 10:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441431; cv=none; b=k5rJUlb3unZ4Dwnj6GYVGDIZX4Nb0Tx2+OW8XgYM+EQ1dHjbAcE7f/4LnaTZ2bmIJKnOsr1NUZCABqllyzpa9t3pgwbLqbCgJANyszF5ziYbTaXqGjaXoH1UJJ64HmYh4Z7ZPFFWwFxitJ9J/E7rKK+kStBQcBYS/WOhodctnBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441431; c=relaxed/simple;
	bh=bzt6k+aa5u1/W7RojxBuWDr/44deao41NZx9GmrqMJM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EsSVENtnynjuClFfMvhPSj6k/L9W/ck47MlngiVtl0md+itr5vd40JJ2R9mZANlNfyS58Se+vYKNX1qTIP5DtGx+OM0csRn8saCcChXRzF/PO51D9jo7YEmB5Mpn3RezCZHsLm+CVJxvTclrvfCuQKi6QZRjEwDrbKcZOzDmIGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zu60y61Z; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zu60y61Z"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38dc73cc5acso379796f8f.0
        for <imx@lists.linux.dev>; Thu, 13 Feb 2025 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739441426; x=1740046226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=;
        b=Zu60y61ZKrHYINdOYgwY5x3uRwDGl0oAAEesj0Bg5T5JYmoORVCWzTvUrNG5US9Hru
         lXGC8q92gn/F38THF+pmakP9uHpuX1Pe9BN912Zcwm86h7iFD0hcEvjUSnciTC/pkAX1
         hwJeSqSOclbmjO75BuaeCXLPTLbKq1j+fFcfrEJRPSR96GInVHXMr8gfPJGfD7szauOF
         0lXMOCag3KXXJ4kEww9FLKHKQcrg3xwlAUBLbxbzMD3e/5KPGLUsAajsKrXenC3wIHvC
         P3+KWijcb+A5ADcc2M16UL0BnRSu9MMSkpWnqDMg7CBWzA9lbRLBT9GeFfnFMfXLJeOA
         1+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441426; x=1740046226;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cb9z6DcnNl0g9HoZcHoRWOLXyD9UxXMHyf9eNtzv3So=;
        b=eFvjdTesiyloT9CtWcbRDM7JzTLfeSyAPsuW4sI4F7UOCR2tqCtYBjDBEZTZ524jZm
         KiZyg6sOuQqEp+LsXrsv7/AYKKfy0BGhSnbL3NBE7tOQDLYFD1LP1NQIs2Gkg5EynL0h
         jFPph8/8IKncmmPYL+rAMCted1GE8mQUYmZ4CfJ4uWvaklftN5tx5Ou4Nt0GR/qMKM4L
         dp27Zo782fRY0vH7zZOaZ2WxlNHt5Q3i9gatTYmrxlUyZASwedcM6rL752l/6m7jY1Hw
         Aw+Cp5VJHLNnB6lo8IS5wvZFTRQg+O1ttqzSJmYGpUHHIQS17fttiZSSIcthyMjmXI1X
         MZaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWRSlXUn4FoomVSrkZeNYOPP3X1Vwc15U9eV6DuvxL57LfCnWT9/saV+h/zNlbIPmV2Vc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW+pVyWnUaXth60U1PCN/yiGhTj79s9l1esv4C0ANpPDKOetfa
	YjSOieDWuI7KVRBsexBlambmU5znfV9hq6FNmwBoSAcqaMyEM0Up4VXq/pyBR4A=
X-Gm-Gg: ASbGncu44XIknhszc6hQiCOp2ozbazKbkQOGdC37bFKKYJhfgAAJ7UvujXD0P3amnYh
	PG7EaMjePMMwHkNQHe0QhR19J1tZ26uNMnLSeE5n/YC7uZiMEjrOXcg2O19uRax1U6m7qjhOLx1
	IjSXC5havNfL3O2SP2HX8EMhlTVr2aMXPVhXgfwQoxfjNAUtoKbG1QXUxVbl5qGDlf685lGD6Hp
	Dr++OaiCIGw+moapkubW+QArvx3b22FzftAl69VhPjI1CPHtuAgCWy1uPBffhIiMEArJVbMo2/E
	yTnNu+FYJyqehw==
X-Google-Smtp-Source: AGHT+IFnAzzmsoX/LnTlYKfUwdNafAjQwt9ZvkB3qt0FKjzX4kx3PyzgxFabDyvJ+Y073z4cgUVqUg==
X-Received: by 2002:a5d:648b:0:b0:386:3327:4f21 with SMTP id ffacd0b85a97d-38f24f9cc70mr1962954f8f.27.1739441426065;
        Thu, 13 Feb 2025 02:10:26 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c36sm1435555f8f.67.2025.02.13.02.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 02:10:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary
 device creation helper
In-Reply-To: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
	(Doug Anderson's message of "Wed, 12 Feb 2025 08:38:25 -0800")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
	<CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 11:10:24 +0100
Message-ID: <1jfrki17fz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 12 Feb 2025 at 08:38, Doug Anderson <dianders@chromium.org> wrote:

> Hi,
>
> On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.c=
om> wrote:
>>
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>>
>> Use it and remove some boilerplate code.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++-------------------=
-------
>>  1 file changed, 20 insertions(+), 64 deletions(-)
>
> Thanks for creating the helpers and getting rid of some boilerplate!
> This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
> Fix multiple instances") which is in drm-next, though. Please resolve.

Noted. this is based on v6.14-rc1 ATM

>
> Since nothing here is urgent, I would assume patch #1 would land and
> then we'd just wait until it made it to mainline before landing the
> other patches in their respective trees?

That would simplest way to handle it I think. No rush.
I'll rebase when the time comes.

>
>
>> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
>> -                                      struct auxiliary_device **aux_out,
>> -                                      const char *name)
>> -{
>> -       struct device *dev =3D pdata->dev;
>> -       struct auxiliary_device *aux;
>> -       int ret;
>> -
>> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
>> -       if (!aux)
>> -               return -ENOMEM;
>> -
>> -       aux->name =3D name;
>> -       aux->dev.parent =3D dev;
>> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
>> -       device_set_of_node_from_dev(&aux->dev, dev);
>> -       ret =3D auxiliary_device_init(aux);
>> -       if (ret) {
>> -               kfree(aux);
>> -               return ret;
>> -       }
>> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, a=
ux);
>> -       if (ret)
>> -               return ret;
>> -
>> -       ret =3D auxiliary_device_add(aux);
>> -       if (ret)
>> -               return ret;
>> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, a=
ux);
>> -       if (!ret)
>> -               *aux_out =3D aux;
>
> I notice that your new code has one fewer devm_add_action_or_reset()
> than the code here which you're replacing. That means it needs to call
> "uninit" explicitly in one extra place.

... but it needs one memory allocation less ;)

> It still seems clean enough,
> though, so I don't have any real objections to the way you're doing it
> there. ;-)

Both ways are valid indeed. Just a matter of personal taste I guess.

>
> -Doug

--=20
Jerome
