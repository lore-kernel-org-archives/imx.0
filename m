Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460D1CFBA
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 00:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750119249; cv=none; b=bpcJKXLmeEvQSEBlVtm74mKyUl8zuy1OFf9Jz4IApxXuSa0DGJxtjSHq3lTFyWgXVW2T1L9wHB3yu2Ha1BBNWrQz1QJH6Nwp+dm3RyvvXox/SrZ+Lo6PBPB8SvZvJMWrPGjZiOjR+1NKMonFRzehhMhoOnT6qaLQRv1yO1F4ACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750119249; c=relaxed/simple;
	bh=BCUpnu00PdYTBYe5/iMD4TN6t9Gob1BlHNTNi7fYXxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oDVtfZ66R2XWg3NpiOXI7B7mOUFrpO6aM4a+GK4m5O0ZSo4cYOvuRvrdRRQo9qoGI5RM/ofB0nfC8N2VTW2QtBglUa69FtvK9vwKoW3vTL8R3NlS5ERexUOK9pUUeB3yYrnH+nyNE+naayhm23smf05XnnWW6RGArNkMKn3QIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ag86dE17; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ag86dE17"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23649faf69fso49615935ad.0
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 17:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750119244; x=1750724044; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=Ag86dE176FkWVfOm4sX1bButBVfmgPB0Jne/YfLr0aKNIgnwzOs9SxbV86lDIgshOo
         VwIctpzkpalkl6x3WD9JjGiD+X26p+aOkEI4ylVRS+9089bV8vT5tayu0Uc3Eyi+SM3z
         y3i/Ylo32It/dCNy5QclMJ0IG9wGl3jPOvTIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119244; x=1750724044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=mGVEqL4k6UN9pUylVhFYe4RiGD54R1yn7qFOU88eSdG8qVGcIxH81/Jw1cGMGRqEWj
         J1Cyl51csW9W01fxOuqbi0gsgAalnWKgTRKSrWk2Q7pVh5W2d1zuZFMOPdaJobaYRbla
         SrqRize4f8JNgn1jAw+RjoJNABKOj/a8RAPm9leEyul/WAH5YKetYAlisfCrDZtGxisR
         uI17XWlTA7GsNlobgnsbWW0cp5bdrWkjAilE83HZ0JIhlRIEOFm+RNdputNYlsbDioQE
         qG8uDfpWvI0kyJZ3aUEXfzzO2MljUhZISipCQVypptI0gZxSs3d306TVQeyizDw9z4ug
         phgA==
X-Forwarded-Encrypted: i=1; AJvYcCW1XSH/soGbtiBWV5zcwD7vuy+3L6QPbc36KiS8Yc82qgnQZM8XSs402kAgxGmVjVeUiDw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAbzASoNkOC1odre3wC8H9aEq4tUz4GBWhPHloK8aYfDMq4lE3
	bkfPKyG1L1vkJuwog7PBb6zDq+tVN/+RBWoNnLHe2U93udwS+VeDdvJGXRmHwGY7DKRJBdoaQX/
	ZRBw=
X-Gm-Gg: ASbGncuPYziIKOvvdri2Nb5b445iHvGHlIct57T+BzHCRHY+bFnpGlJRsyS/wZbj/Tl
	IKw/dqNh/RRi0QfOWPyr/BRD1Oj+fzoJACXyGLBNbIR4gUtsyNw/3kt3VDYi6k1PdJjaDcvVu5k
	/BXEC42dIIb1oBvdSpqTNwvM3qpFx/AoFFXnHow9caFe0JABC179Ep4feDY8SlrL5DnZ2xmGUKx
	3fOL+/4X9LO/ctt3O/0mb55zEUWuM44Xyc17fMKV4wvgIcm5Ofwxh4WJji8MOtMvsx8l7URAkFj
	ClSS+wgeSB7KVaQb8oaFuF3EalsHC41Af+qGpteu+jASYbvRPLKT6/svbao2MWGVaIqzh48MseG
	YPvQBGBO/6gLbpxgthVTqrzy5mxMa+Q6dOlIY
X-Google-Smtp-Source: AGHT+IF4x7OJfjNMiVwc9j83yQ4LorBXPDLvY2zIDamF8zSNc/rrOCl3FoAPtF+LGvV8DP3uYY3OsA==
X-Received: by 2002:a17:903:1a23:b0:234:e0c3:8406 with SMTP id d9443c01a7336-2366afe9893mr170309845ad.1.1750119244473;
        Mon, 16 Jun 2025 17:14:04 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com. [209.85.216.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c0b3sm68005265ad.37.2025.06.16.17.14.02
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3138e64b3fcso4623774a91.2
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsRnvBkbW5uS8NTPodemWMouYfAVfo6A4CE6cFIhnMvFUOpOh9Hyea4LwMh0F31LUd/To=@lists.linux.dev
X-Received: by 2002:a17:90a:da8f:b0:311:ae39:3dad with SMTP id
 98e67ed59e1d1-313f1d05b32mr18262369a91.30.1750119242065; Mon, 16 Jun 2025
 17:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com> <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
In-Reply-To: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:13:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
X-Gm-Features: AX0GCFs2ZyAAIENHNjz3BASVq2N7KuTDsUG8ACNS6wvc-Dx4zSZzUpIgLa-Czmw
Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
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

On Mon, Jun 9, 2025 at 8:43=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
> >
> > On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrot=
e:
> >
> > > Hi,
> > >
> > > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@bayli=
bre.com> wrote:
> > >>
> > >> The auxiliary device creation of this driver is simple enough to
> > >> use the available auxiliary device creation helper.
> > >>
> > >> Use it and remove some boilerplate code.
> > >>
> > >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > >> ---
> > >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-------------------=
-----------
> > >>  1 file changed, 7 insertions(+), 42 deletions(-)
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll snooze this for a bunch of weeks and check back to see if this
> > > can be landed in drm-misc-next every once in a while. If you notice
> > > that drm-misc-next has the necessary patches before I do then feel
> > > free to poke me and I'll commit it.
> >
> > Hi Doug,
> >
> > FYI, this is safe to take with v6.16-rc1.
> > Please let know in case you prefer a resend.
>
> Thanks for the reminder. Unfortunately, I still need to wait. This
> patch will need to land through drm-misc-next and that doesn't have
> v6.16-rc1 yet.
>
> https://cgit.freedesktop.org/drm/drm-misc/
>
> ...presumably v6.16-rc1 will get merged in before too much longer.
> I'll try to keep an eye on it.

Pushed to drm-misc-next:

[3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
      commit: 6526b02e10209608464f2645af59b2cc955b5a19
