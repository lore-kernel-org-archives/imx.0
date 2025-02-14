Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715B266F11
	for <imx@lists.linux.dev>; Fri, 14 Feb 2025 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546779; cv=none; b=s8n8nMYSwLvEZPJhktmtOhWtdGMnGWtiG4+Vix51ccTR9Vv4RiESIBiGHl3ehcxyTMk9QYEq70zc43/U8mw/YYDDIDo5B7b5JsohbXJnKXG48fgVxDdVGsh0OBBb8K4ALLKTyoUC9VFxrWoyZqqZO38SleYJJCajIMNRxysvifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546779; c=relaxed/simple;
	bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzWVcd+/Qlwn+dG0eJ6JgaY5z/AD6LgVn13lG8JsHCwyCH/jT3aQho2aLERSjtAyublDPEsS3xNQqCPNhda+KFwZrFpbtYckRW9zuZXBYoBstlxSn2ZiBNFrX2RUaXRakPaJENFBEcwLGyHT7u4KGRYxTGy8Wz1HCYIYkrrzZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FpWa8jYE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FpWa8jYE"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54505191cdcso2111345e87.2
        for <imx@lists.linux.dev>; Fri, 14 Feb 2025 07:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739546773; x=1740151573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=FpWa8jYEkVQ6PAgDaVI/iqoFb32AgrHqLalSSvvTE1YurJHamNuT83QP1GVLF8U8VT
         9zNVvmx/2PBy9vtRnyoxQ7mea2KLwjQWXGcHzkrwrsJAezs6zIiw9yYsM2A7aJDnfVsl
         4mUl2j+l6Fw1FJ5sMQOZAbS9MJULV8vMkSpgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546773; x=1740151573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHqSVsarbr9/GNSKcHw7mFlABcvHBZA79lxaZw7Ee7Y=;
        b=C/zt6EQJiVEmk4oGV31Mx6uFrEG6ShLGJlxTTvVvCT+mJOHhmuxGWe6S7Xf1swRBBb
         vJkE8JVVAfKrtI223iSr4j/cyKrXtYrGzkGYJHFbs2opo5sFQfX2atVEYQwqWSRv6yLy
         ZatNetI4HtK2zuv31asTAccsqPJ6LjOGaHTzoGnvkBOIIVq3FHweIcyEdnUR09BE2g9w
         GkOBBHGcW21AEvSfw2ef1AUQp79A2x9jiHWAmTwob0H9nJKRjk1Ue67mndLupCDh9cu+
         ugLWzqGl8C/v8rwB8HQ3HMZM80wb2+VagJKZLcC7fMBUAA5PmL2t1WBHAx+lSSUeOIlB
         2/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUyVhYUuKO6viRLxxKwl7m5+vIMi7ud+4d8j5PRo4oOiiS/2AOydBXOaFv8jL8ZbQunRkk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq/mzXyIpYbhuxoyA5vG//KB7/H5GFvhpJVlHyhz4HiVhhNoWL
	jIqHL5QxKmDs3Aa5k8mXYvILCn6oahX5QRwZwYo184YZvdHJK6GO0JANG2WoGOfQf4+zTRcDu5t
	SEw==
X-Gm-Gg: ASbGnctTvY1Xq9/BjQmR9GL4ufLJ68hslk1mjnEZG60wH9odjEoy6kF5/s1Dmr8alW0
	fZOAd2SdmGW04L9uPTBIcSaHKg2bDD5eTfNC8ULKZwLiieaHi1VLBE8LMYWtH0ilp18HrTIPXrx
	IGb+IdeG79FHOdLGqIcqeJzNANSioF8fCG/kT1Xv831XOYsBaPV+PuqlH2dSeq3bdUzjEpidknx
	r8h0+L37FUHD0jfJZyHEZ/d6kAkwgy5r8sWEieGkUhcHmma6FufzOtgGnDyayEC+VgUXMf6A24V
	Ug+d+974Bq1o4a0m9IfvdJuTZmy8qAXBfbPNeaWE/goW0sxO/vEf+Zt+O94=
X-Google-Smtp-Source: AGHT+IEkpJfRJD/UAd2ZmxwZqqd6sqNoM9iPiMuyAd4/la0+lOkUJis8l5YWYcZk+o7j/iRZWmJQTA==
X-Received: by 2002:ac2:4c47:0:b0:545:1049:eb54 with SMTP id 2adb3069b0e04-5451dd84c4emr2198279e87.9.1739546773118;
        Fri, 14 Feb 2025 07:26:13 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452e4b0a13sm117435e87.176.2025.02.14.07.26.10
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 07:26:12 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30613802a6bso22931581fa.1
        for <imx@lists.linux.dev>; Fri, 14 Feb 2025 07:26:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnvYmxTdegiglnWVoN0k7TDTuNmaIJ8rWGWwpbLeRQ0nIklL7KyRSQU4LS2M1L5U9Z1H4=@lists.linux.dev
X-Received: by 2002:a2e:8a97:0:b0:308:eb58:6581 with SMTP id
 38308e7fff4ca-30914801891mr14311001fa.0.1739546770563; Fri, 14 Feb 2025
 07:26:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
 <20250213-crown-clustered-81c6434c892b@spud> <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Feb 2025 07:25:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
X-Gm-Features: AWEUYZn5Dl35ky148QOOCnARP_86rg2vhIKgVTUOs7s9KbdYhXOWWeRWr_r9yF0
Message-ID: <CAD=FV=VeSrZktEbxNXXTgD80QGTpW5b-WiXUFko+a8FUzmN+fQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

On Fri, Feb 14, 2025 at 12:59=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> > One think that's always felt a bit meh to me is this id number stuff,
> > I just threw in 666 for meme value.
>
> :)
>
> > The whole thing seems super
> > arbitrary, do any of the users of this helper actually put meaningful
> > values into the id parameter?
>
> In example changes I've sent, no.
>
> In other simple usages (those using container_of()) of the auxiliary
> bus, I think there are a few that uses 0 and 1 for 2 instances.
>
> I guess your question is "do we really need this parameter here ?"
>
> We could remove it and still address 90% of the original target.
>
> Keeping it leaves the door open in case the figure above does not hold
> and it is pretty cheap to do. It could also enable drivers requiring an
> IDA to use the helper, possibly.

FWIW, once you resolve the conflicts in drm-misc with ti-sn65dsi86
you'll need the ID value. ;-)

There was a big-ol' discussion here:

https://lore.kernel.org/r/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.17291804=
70.git.geert+renesas@glider.be

I eventually pushed v2 of the patch:

https://lore.kernel.org/r/7a68a0e3f927e26edca6040067fb653eb06efb79.17338400=
89.git.geert+renesas@glider.be


-Doug
