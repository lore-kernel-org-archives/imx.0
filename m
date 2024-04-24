Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6C615E5D7
	for <imx@lists.linux.dev>; Wed, 24 Apr 2024 13:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713966046; cv=none; b=vCDfbF9iRnen/9g/uMDpZwkMYlc8HrJQBQyxZHLET8RaapbFyCvKJS7GoYByuCzqAa5MuKjBT8R2JRUzD/j/aE3BhR9s5AiTFeiteL8W5hbCZC/8y9cPD0cDibwV9/HbiClhMnLVf3xJc7RRNJdv9j7sHH5h8h3fDDg+JyDs5v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713966046; c=relaxed/simple;
	bh=9DK4QJ/TCi2B/QX3H6PXVhRwQNGSFim3Fn/8J5m5l5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGelje0SCpkCX5NiTWSYeykBvXI1ATn/z3zZ4rkO5oDQaveLIXLAgYJKcx8ifzdXsDzPwRhV/tpIlFh69dKuc6RgxYJsbGyJhe5pYP7X05RU7b416qANk50ss+SS9n6iNGTcmpacN6kK5qfNGxobalkc3Hkehzy4OOqn6EkDBHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so8519069e87.2
        for <imx@lists.linux.dev>; Wed, 24 Apr 2024 06:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713966040; x=1714570840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZ9CwMK3wqk6+/Yp2Zsm6M08mayo4fMD+34z+UfTXVA=;
        b=KWAOV+B/Orj5L3hGjTSuDDQVo8HKwlYtKNlqb7eo6Go97Z5KmyFDCmKz7axpunvLpu
         EOV4mjl+upD3GEl4p0q8o/kBaYfEJei2hyhRitTD7oHoAiGSnwCuu0DBts4Wis3acrb+
         7+tiUiP2ggkLmwemPpxP5qIOtAiealnUYKyjuNtCObKhOlRQC+rYRnSkguzS06jNcsNu
         D5dsakSmMP925ybDFpaFxMa67ZklM4uwHDunGFhBRbtmf4Zw8Rm81aqvSIBKDwMi6TII
         LE7VitZ1scCmhtw3DVQcWz4vTHjWXmOSXVy3dxYNlKBfGV/v73o3znS/IRSOU59OItqj
         BfyA==
X-Forwarded-Encrypted: i=1; AJvYcCWalo8UtMECy4G1LJi2qNOhcKaDYl3a0rl4jQ+F/ThPn9qLsFZPu2gaXY8v2CVp179FCZ8zO7HZEu8G//KBCT8flegO
X-Gm-Message-State: AOJu0YyW8mc8zBlYZVf1Mwywhv1TvYKmzUmfRWpnWHsNubsLEYxUCtP9
	LwohFlPumAa1EOYdZQChWp7TzBQCvyye6f83JHUlDjdPgTFsNOLL2KPjOCpcxkg=
X-Google-Smtp-Source: AGHT+IFbMtqpGuT+OWB9R0p00fN7LDDtoN611wqrZUo4hXwORed9sJVw1R/lOxvB/iQiQ8cWBQmq+Q==
X-Received: by 2002:a05:6512:4803:b0:519:1e33:9d85 with SMTP id eo3-20020a056512480300b005191e339d85mr1747542lfb.36.1713966039891;
        Wed, 24 Apr 2024 06:40:39 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id n1-20020a0565120ac100b0051aeb8ddc78sm1487046lfu.200.2024.04.24.06.40.39
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 06:40:39 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51b09c3a111so5654394e87.1
        for <imx@lists.linux.dev>; Wed, 24 Apr 2024 06:40:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV79oJ1Cl5CsS9CxaObqbhy2KNdvf4i8I/SPwj9KSx0PUqroOSmKRcI++4DL5sBEJS6Z3lXha2QkQaE3e8pJc153lNi
X-Received: by 2002:a05:6512:3253:b0:516:dd4f:d9ea with SMTP id
 c19-20020a056512325300b00516dd4fd9eamr1661058lfr.5.1713966039011; Wed, 24 Apr
 2024 06:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411235623.1260061-1-saravanak@google.com>
In-Reply-To: <20240411235623.1260061-1-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Apr 2024 15:40:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUS-YX7tTEF0216wk+DdCbWCJ0z1huSj8cjRXp8GxJ5gg@mail.gmail.com>
Message-ID: <CAMuHMdUS-YX7tTEF0216wk+DdCbWCJ0z1huSj8cjRXp8GxJ5gg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] fw_devlink overlay fix
To: Saravana Kannan <saravanak@google.com>
Cc: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	kernel-team@android.com, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Saravana,

On Fri, Apr 12, 2024 at 1:56=E2=80=AFAM Saravana Kannan <saravanak@google.c=
om> wrote:
> Overlays don't work correctly with fw_devlink. This patch series fixes
> it. This series is now ready for review and merging once Geert and Herve
> give they Tested-by.
>
> Geert and Herve,
>
> This patch series should hopefully fix both of your use cases [1][2][3].
> Can you please check to make sure the device links created to/from the
> overlay devices are to/from the right ones?

Unfortunately it doesn't, and the result is worse than v2.

After applying the first patch (the revert), the issue reported in
[1] is back, as expected.

After applying both patches, that issue is not fixed, i.e. I still
need an add/rm/add cycle to instantiate the devices from the overlay.

/sys/class/devlink shows one extra link after the first add:
platform:e6060000.pinctrl--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:e6e90000.=
spi

> [1] - https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=
=3D9F9rZ+-KzjOg@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
