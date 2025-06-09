Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724323D544
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484188; cv=none; b=RaNV73OTzU4VMfrBtZHDGv1hamIxv3G6ldAENXJ2R9vQvJD8DK3WWlymUlGYH0CDwZhwVQmuc5wbgR7JpjYjxc2zTSPEN04GNU2Ma5Xd9UDEDg/dO4+tiQLCtbebe+d6j7WEbWqBfPutnoSveYpUBytd5oqBNuIutw9ynNjDhqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484188; c=relaxed/simple;
	bh=MF8URYVd6paFLRNZA/wbEoqFzCWsn4Uq07b2eMDDSJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=off8mzmxbRa0WxPMHDt29jtTvBpBOuUbwcNtJ6NPlwDqZixFtmtvEkbx1yriyyX7szzomHTuwSG7PvUOdAMod+LbpB7YuCD/KxkQl1yQel4SE9wCSnp7jidl4HZfAjosQCDtVmA5mJFeIKKLWYs6KixJrk+19Kn7IlPpOleEznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B+x2xiDF; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B+x2xiDF"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-400fa6eafa9so3222442b6e.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 08:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749484185; x=1750088985; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=B+x2xiDF+C/wy1sG4lVxexubnVVNXXs4CuRBajtuXlbK7wSXoZrkpKlqso/vmbJPlT
         tzZM9p8U1BADlmYQDoMS+MRLRJ35732fDtM5uvzdic6PWD7/4NUQfVCQXOtI4kcsWDRo
         dS0Daw/WRwmsgFGwshVZfhDYd85ejcD0fyjv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484185; x=1750088985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=tviFuaS4jvVmsV5lpTWQtiz66Bxoxnuh3pY+HafgEF0ms1kbGVPhvHpJZFDpgqLkDx
         x1MnZqMmGV/rYjZ6z/f8Ekn7gg+AV8KvNv4SBIYlOv4BIcWdh8p1mzryx6s1pVMJKj5p
         0FkFrMQWse3eaDeKGsBlXJYasVF371FVRwTbcH0YOmF6KeN3yOob1XHAkXszlM2991B4
         LTmxy1EgKHnY4dSGcqKDtH6l+Tc0vcO7FV6Idv20cZtIcc5ANDk7dHC0+zXypUO3QSAE
         2eXBAa9vF4a2MJTQqJWq6gOP6r9v6WqBkFGrXLgts1LisaFrEX6/CJdO++xTYC/Spo0y
         T5qg==
X-Forwarded-Encrypted: i=1; AJvYcCUSr5Hrzd6UlQcBb7QRYTGjC6ewIqmVIXpJ7tfHsDix9cEyzZGSD7XQA3OYDHglZhKUO8c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzOJ+ipdemMFe/2Dk7OZY7+bW8kDqxoYz358eGoyQ4N/F0EzVr
	R2yUZQB/y8d+laE0uJqADW82aIMyqK7NTaXunbEU76mWSC21uM65vTnkOfxJzaSsA2u1BHTEzfE
	D48o=
X-Gm-Gg: ASbGncuA9yG6QdAezzjsPfjLgcgnBDyPYVodanlrhjooyUbSLnPmRzMWJ43d0xAryev
	5jLJGRyf+I8/gpU5vWcfCzzSDWvzbeyRh/oniA/MYrcyq1Y5H3bkTUS+wEEgqwst987e2KjHQJA
	fpWQYVwrSj7M4Iw3o0KWMlSE7uWZzL8zU5ixYmcnyASaIR2mNpOYx6rIaM5ro9PlCvfeFoKZKY3
	O40B+xKPVqZrl4fTHqpnKTDoG6vgsxw1toZsCIAbbbOujN28+xduBxa96Uec572Ljnca+c125uN
	WWF0osNYFX0PkjY9/pVX0AVErdxpsBm8heJGKMNpdf/QshdCpATmalk32rGHGvvvaeqAitwlfg+
	MfFvkd0O2bFqW1wSVl0vhEbjwJw==
X-Google-Smtp-Source: AGHT+IE4JhOC8/FxhLPNjjnzjFsoRZa/rzTOjxSBfIgut0+ZWipfg9xUm4SfrBbDOqzl7QHd2xC6OQ==
X-Received: by 2002:a05:6808:368a:b0:406:6f21:8161 with SMTP id 5614622812f47-409051d9b5cmr6848489b6e.9.1749484184832;
        Mon, 09 Jun 2025 08:49:44 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7388a087ad4sm1618688a34.61.2025.06.09.08.49.44
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:49:44 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-735ae68cc78so2973751a34.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 08:49:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXB0suCQpQc88kfJXGZ2Dl3eTfchz5B/E31MiO202dRLtsuYLcsUmY4nFY5Cp6pXJ2LG80=@lists.linux.dev
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com> <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
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

On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibr=
e.com> wrote:
> >>
> >> The auxiliary device creation of this driver is simple enough to
> >> use the available auxiliary device creation helper.
> >>
> >> Use it and remove some boilerplate code.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++---------------------=
---------
> >>  1 file changed, 7 insertions(+), 42 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll snooze this for a bunch of weeks and check back to see if this
> > can be landed in drm-misc-next every once in a while. If you notice
> > that drm-misc-next has the necessary patches before I do then feel
> > free to poke me and I'll commit it.
>
> Hi Doug,
>
> FYI, this is safe to take with v6.16-rc1.
> Please let know in case you prefer a resend.

Thanks for the reminder. Unfortunately, I still need to wait. This
patch will need to land through drm-misc-next and that doesn't have
v6.16-rc1 yet.

https://cgit.freedesktop.org/drm/drm-misc/

...presumably v6.16-rc1 will get merged in before too much longer.
I'll try to keep an eye on it.

-Doug
