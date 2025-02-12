Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306D1D5176
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378816; cv=none; b=NksaFI1nW0aSiwIvl/4SdIjxGbiRRcMmheNxSlSCEmB7DDUjEsppo1cHdA79jBGGJtn1Eu2XHgFFdjreqj7iNueu9CV0F/QRInBx7f+UL9sBu/ALhwu/bEO41ieF5PN4TVuJ133/AmYjwOg6O7UUuo560EdlUr/swf+nsEn5SnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378816; c=relaxed/simple;
	bh=BULMItlD7UmqT+FeS+xvhAotN9kxf42G+uPp6a158Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GynOukUWAvQ+gYVyd7XooYdqw+A6SgPGyhrsoLBUVJC2eOa5G8p4U99tJX/C3LCEEh85hmqD7SZ0BNjz75xjRF4wmA3YTslRo1c+8F+Cbr1YzUSgMf6rVwi/vjO7ekaml3UYUpbOkpJTnEKnrkmoVWCNkS4V/TArIEhH6C0x2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e7vB1drA; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e7vB1drA"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7d3bcf1ceso503009366b.3
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739378812; x=1739983612; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=e7vB1drA4oxOv+sleNBqn6PY72RZ9D+UzW2UklS9PL/olPDGYKKGQh70r79k4MYNbB
         MV1nlbMG7pwtdcttgF1xR2wdEkX9eq0HDImeV+aIzAXFfqDgZ/PsAqdtukbitZgKnyzD
         PDUVMVcejahb2WStlzjxreKaiYCbVNt9ztX6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378812; x=1739983612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=ZeYeYec1RNysO6fOuvO1OU1fZ6g2aToSSSOo+BmswerYdGDNkPLaTrxEejaB1EYgNG
         ceSMr47vFrvOpxPkyMf05CCZ9l2CwPrtrt++teD2z9tfzo+puFoCwvCtQ6qpihlmZEP4
         3NQd9vOz5MneaoDLvU4d1BWyV+wi2WRBXdJQRvjgPWmIgEuIrxF049ok/39+8kUBDWJm
         Qt5d7/GRP5V9ik9UzmYFjdUk7XlRbDk+9+Y/xdQ3SDqeo+GF1qib8BfEoTQwfrC2C2Lp
         H38wV9ksl4ViezGCTq25YJTfg5DUL5OPebDpaNA4143A+05+lHrZPjX0dGZ+8GaAAj3x
         Iowg==
X-Forwarded-Encrypted: i=1; AJvYcCV1UEsjK8aQVmlEr2VSiA/FwEZH6d8hTMeO6dI7THz7qFWw59OLoZ9PTc+vtOqLgkjmUKI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZRLX7X0MgVtbmqIwL+dW9RxI0K+PBB1PPoaLNCP2dqBN8MLfQ
	pLkVVxIKSyrB1jLBO1njYRTuM7k4666HEdR03QD6C6VOZhXi2VL7iD58oQSfoyS5+k5HuvK8DX8
	uLZlW
X-Gm-Gg: ASbGncu1gjrAKik+DksaBPxWmN4hXpuizuuTNZV1o8funa+a8xoXZHL+daGKYOcu89A
	81F3q1nSDUHhHwi6Y799jS2XOXpwxKroOXJnPRD7r/oAAhqeo+JevCb0nxe0LF8tiCGX0asCZ5Z
	9ltulve8qvYtynHybm13RinOmpq8IuDyGQJRdx/8Xyl8X8sih/M+i4hCafeL83kZGUx/kSSOkBI
	9hSWUfS8bOJF4Vxufa95dmIQ6e3dsPKV/EO7+WkfS/dArPGbJFU4p7DgP7jWsWVUBhmiDc+Z3zD
	mBiCHjSqE0Ona9LeOZgcEty2GJfrQkvC93wwP+BuFMWjLVSbaKhiBg4=
X-Google-Smtp-Source: AGHT+IHMBSvETH4sDUVLMg3gDOqMnYy1tZcx9BjykLT6ry2DeUQvPSTuW2+OZAzeLA5oIO5ciiE+eg==
X-Received: by 2002:a17:907:cf8a:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-ab7f387457fmr420864966b.38.1739378812285;
        Wed, 12 Feb 2025 08:46:52 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e70bfsm1305475666b.104.2025.02.12.08.46.52
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:46:52 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de5e3729ecso9215580a12.0
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 08:46:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXga05cq9oPjyQIJIV1kgAXhE/Juqib7x0kFz1GIXvu7CUOuvzTjfnnIgKJ+uO+txSn40M=@lists.linux.dev
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr1571346e87.48.1739378317154; Wed, 12 Feb 2025
 08:38:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:38:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
X-Gm-Features: AWEUYZnEAQCx0nU_sk8MYOvtfC7Gu1h5Zsl0lbrfbQPnQTV4y2laVQqsVCR6NTE
Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------=
------
>  1 file changed, 20 insertions(+), 64 deletions(-)

Thanks for creating the helpers and getting rid of some boilerplate!
This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
Fix multiple instances") which is in drm-next, though. Please resolve.

Since nothing here is urgent, I would assume patch #1 would land and
then we'd just wait until it made it to mainline before landing the
other patches in their respective trees?


> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
> -                                      struct auxiliary_device **aux_out,
> -                                      const char *name)
> -{
> -       struct device *dev =3D pdata->dev;
> -       struct auxiliary_device *aux;
> -       int ret;
> -
> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
> -       if (!aux)
> -               return -ENOMEM;
> -
> -       aux->name =3D name;
> -       aux->dev.parent =3D dev;
> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
> -       device_set_of_node_from_dev(&aux->dev, dev);
> -       ret =3D auxiliary_device_init(aux);
> -       if (ret) {
> -               kfree(aux);
> -               return ret;
> -       }
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, au=
x);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D auxiliary_device_add(aux);
> -       if (ret)
> -               return ret;
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, au=
x);
> -       if (!ret)
> -               *aux_out =3D aux;

I notice that your new code has one fewer devm_add_action_or_reset()
than the code here which you're replacing. That means it needs to call
"uninit" explicitly in one extra place. It still seems clean enough,
though, so I don't have any real objections to the way you're doing it
there. ;-)

-Doug
