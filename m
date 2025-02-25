Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F6814F9C4
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 16:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740499867; cv=none; b=RbOhE1JGqVpjkbZncLt+WCFUG+HC/TLpQGoFIo+igklwPgenmGwSs724JvjBYeeCdVG7II1MxRG8a/ePdbz2tU0lPb7snnxc75S6xPCkkYV09r/FskDiIQehaDUAXfahQ+9jc7E+YMCFgBTEIDdhELQBzyL1hiLH23wUAz51nCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740499867; c=relaxed/simple;
	bh=rCByvJMOjUxh8ZzB5E/B1+AmONBCyWA+/sUB1yHUqbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0A2gIRNysS1qGlKmOuD/2yUMkThkBAwVspJRcLBXmaDZGBm1jU2drWsn2xqKCk6HgYokl9qV7KBYKUcKRLqxQQdKAv5UWj475rkwnVyKZIr6vYxvoPoM8ot7QfQEgVukZksNkICiifwcPGpHxbLIYQRq6hK9pWCrWteRftf/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lE8HEC7F; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lE8HEC7F"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaecf50578eso1135698266b.2
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 08:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740499862; x=1741104662; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=lE8HEC7FTvTr5HL+S+goeVGQiRfGkSx4WzSzpgnJJWmLNW9WJMGPiyHChgI/9EVwe0
         Osgf2JacaN2zCny2V23VcwuafEckxXtdSDhd/UCpW5aiFKApHI+QCGQaoO/n4oEVJKKf
         6jB/kCfrVXMw/cC7cC6sEFLrLWiGigHUidL3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499862; x=1741104662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=HlmuHml4EYZvDrJKcN9UlVMNcZ30u3or84oE0TaQ8UXVEQ4E4M+43ioqlOn0g+KwPI
         /vqofEz5TS3ka35p5pYmzCkuf3q0O//NGgOKRNoNfs161Sz0dgGnYagpsyyMeQYot6ZA
         8YQ+0F0AA5QUcacm0ytk2VfKSnpsH5m8Ov4yoYc9JlryLgl0OjCOAbHscDv/o22EmURO
         4umD98xuwwpXbTJwNF69+DwUUcO43gbcGIrI3ifVa/mePdcZQY+uR+n4OtdfCoBJ2wVH
         kYRf2r7n2LQk3+VUAXg9boMtmIbFy1RbLV2dWvQ8yAkzW4X8zlJoXA45NnQ3MUofTDqu
         LSPg==
X-Forwarded-Encrypted: i=1; AJvYcCVA2OnAPcjbRuXyQMRI10k9NMiLhR6Ne1DKwgg2fQSrqhfY+IfYvSvgRBGlAXSJPk+ygZg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzektV52mMVnK6sk3JAQCpR7keHEBvDaYPzkmQQHhwvdfEx8IUz
	0JEqS837gy0A5+mAoGelShAK/g52+xujEK73CdaWcx107YEmjuFbhs7vTpmCMLys0OM/RQ0KysS
	9upVy
X-Gm-Gg: ASbGncvTa0JoxXu4Fuafabyfh74aaRKiCQi2GED5OmglLXygabNpK4SZHCpRahOULGi
	Np708o+sDQ6CTJhRhgLtqduDyr2bwdcxkvnHHXywh+AgwxbwCzcMv0OTC8hu7kxRBmLV12QHIhQ
	QH7UIOdP4Hq/aokQk0LOO1LNQamvWddDPrRJqAIsB1qOfwIu1Q3j0xQWNIiMze4F3urIzL8d87Z
	6L+FEpvj1BopHxuhAjrNwzcbQ0lxV4WDZLcEyplWEv8ZpI57U3omQNtnlP4BLGH9Jw+hn0Y+q8K
	pJ2CbCNugklKDOidUn6IyzQw+ELZhUheh3Vej3FfFwqt+QN6oxcfWuyqUD0iJBjixQ==
X-Google-Smtp-Source: AGHT+IE765I0ESDiV1mL8fv308LSxxlbeToWS0NX6BsAF19T82Hngp+1JTgbl8jbUTT+p3i695LdlQ==
X-Received: by 2002:a17:907:7d89:b0:ab7:d6c:5781 with SMTP id a640c23a62f3a-abc0da36233mr2109442866b.24.1740499861792;
        Tue, 25 Feb 2025 08:11:01 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed20121dcsm164789666b.100.2025.02.25.08.11.01
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:11:01 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso993575266b.1
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 08:11:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIJMTL5A+B5WLn4yZcgL/lWks/WJVQGb/sJPrupXe7Rc9tHXWBoXKhL1UEHdKN4ot5DWA=@lists.linux.dev
X-Received: by 2002:a05:6512:1241:b0:547:6723:93b6 with SMTP id
 2adb3069b0e04-5483909d1d1mr6678553e87.0.1740499509419; Tue, 25 Feb 2025
 08:05:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com> <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2025 08:04:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
X-Gm-Features: AWEUYZm3vRrajChqqVao9eJTA9wadMF2aiVVZGdKkNeW96YTlQauMsPFnVVKvC0
Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
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

On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++------------------------=
------
>  1 file changed, 7 insertions(+), 42 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll snooze this for a bunch of weeks and check back to see if this
can be landed in drm-misc-next every once in a while. If you notice
that drm-misc-next has the necessary patches before I do then feel
free to poke me and I'll commit it.

-Doug
