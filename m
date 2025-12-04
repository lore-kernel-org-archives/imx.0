Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2050336ECA
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 10:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764845754; cv=none; b=ZvrADqBBdu0Ere8bJe2/HLC1XTGpTlat+dBDDAPjnPTa+Fe5JEadmhOrU0xgZE6eyx5ajxIHgt47kdZE44uUB16tkxuXv1ZgmZwUapWBO303YgT7j9xebu3QcKQQjLnZ+y+X0LY0XTfIAjAmpi2wTrVP/J7vDV0nkoCf6wbDFrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764845754; c=relaxed/simple;
	bh=6slcK3EQrAXupPVJr9jM3Pcmh+QTUwh+iVFWsaKxXWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sc3sYGDrOIZ1x/Fkiy7zggZGErcdZn1V07Zx6oEA2dlFvr58O4tiyM7rlkDZoaDl0yKw83K7Wn1ktELNfk9WBp0QZ2E2hhHRmBca/AwALvTn1SG0y7MwuOVGP8s190Wzcnx1ZMlBya1i91VNjT1XslGtoWp17l7ZMa+2K/VrfLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3438d4ae152so713257a91.1
        for <imx@lists.linux.dev>; Thu, 04 Dec 2025 02:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764845747; x=1765450547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gfnzYJnOAkS7SHNqKKzIeFzoFbDZmoEYIAPmuyxm7j4=;
        b=f14OQKSwaomuB2MAFl6Hg+inqJH64Y8GZLM+kGLFjkOZ5hq7COC2d9VNj2oJajEyQ4
         QNcy1/asfpoi+g8rA8WvfakKja5jm1ESYklKhDd1oycCohofXIeUCCUxQbR5e5zN/BBu
         NHSrEbsOpoazrQdmIf1vcX4urF6M6TcISiT/6W+JnuGk4RcdXvKunr9YVVeN5U1xOm43
         OMMT2huaeE0BExqZ83aWq1dnnFxhZDti6IIhJe9CSVk3MJ6dLLzzJmUzic9A3i5eDk5G
         NaiZwZv10/bF3d2cqxGg9LOyGWcqbVt6xRbAhSNA7btbKyT/cLQWmkp0RXYavL1hjKzS
         P0OA==
X-Forwarded-Encrypted: i=1; AJvYcCWqWilCi1DrrmS10/V0p7u5UQT+1y46OunUOZdvGFKX+LX0lnM7rOFVVVh0u5O9aYhXUxs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEvdb9EH3WsL8iYGOpkrPh8foRaQY23rhqwM3jq5mbIpdaOTpR
	YI2IgpLoFroNPFsfJCo8Rsp39Xaxx6ZlXiwpZp9BnCX0JT+o6ArKFs3rl7d/3/q9
X-Gm-Gg: ASbGncuJmwNEJAjOcFu+yclg9/pulCsAvqG3sag81MTQB6f5q8Cr0dsikc4JEe4+fd/
	wm0D45GlyxTKdjanN1OPA3T6/num4c0Fwcp/dbIUQTM+Ohrohfki8faZOh4qD2A2YKaR++5eEq8
	CzSTZr+L118AudUPaM1On+O4dvzrf+nODADM0le1cvnISHX1gvKMUk2kppdxCKdAz98PmiC3aSp
	hbIG6FtHMy7IFPRPnLyRDxPYAZP8k7kOvkLYIaN/P3ej2pMdUX8vA2hNZj0eGtMt3ydfbKOKGkW
	pdQeIyNizJnPHqa43rxb6mRCFnWErsPXptTyykE8M2CPQCUxxYwFAFh52mvFFKZI/znTVkj2L3H
	I4AtBAxUtlHTSxbJiLGCRJ03GGlOyh5NWEF4YcTe3E56BEoWD+JH9WGYkfBL+CK2fXP1DvGKl+t
	mymKr3ymWwOuhAh3KMiv39fPUt00LTAopkgb5r5tApqHrYnUzC7klY
X-Google-Smtp-Source: AGHT+IF/tbbQZ0WVqJSqRhj5XOC0RzIXJcw4jbZxX7X6C2AFGIE/I7kj9niXig20YGa2HYYiYBB5UQ==
X-Received: by 2002:a17:90b:17c1:b0:343:5f43:9359 with SMTP id 98e67ed59e1d1-349126f87b2mr7053623a91.31.1764845747283;
        Thu, 04 Dec 2025 02:55:47 -0800 (PST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494f5a814esm1485684a91.14.2025.12.04.02.55.46
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 02:55:47 -0800 (PST)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so797851b3a.0
        for <imx@lists.linux.dev>; Thu, 04 Dec 2025 02:55:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWozzha7ycrHzdcq97yHkR2dvjWVlwJL8vMPXgctFZqCHWBFaNQyIxyJw5KYPQ2cVZSYqo=@lists.linux.dev
X-Received: by 2002:a05:6102:6889:b0:5dd:b69a:cdce with SMTP id
 ada2fe7eead31-5e48e28ea62mr1665640137.1.1764845364523; Thu, 04 Dec 2025
 02:49:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com> <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
 <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
 <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com> <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com> <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com> <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com> <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com> <20251204083839.4fb8a4b1@bootlin.com>
In-Reply-To: <20251204083839.4fb8a4b1@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Dec 2025 11:49:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
X-Gm-Features: AWmQ_blMXTXWTKLb__jRgM2vj510G0Mh23mSqsI1Cojt34ffki3w4wmdXTg_pQg
Message-ID: <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT overlays"
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Thu, 4 Dec 2025 at 08:39, Herve Codina <herve.codina@bootlin.com> wrote:
> Indeed, Kalle, Geert, I don't have your hardware, your related overlay or
> a similar one that could be used for test and also I don't have your out =
of
> tree code used to handle this overlay.
>
> I know overlays and fw_devlink have issues. Links created by fw_devlink
> when an overlay is applied were not correct on my side.
>
> Can you check your <supplier>--<consumer> links with 'ls /sys/class/devli=
nks'
>
> On my side, without my patches some links were not correct.
> They linked to the parent of the supplier instead of the supplier itself.
> The consequence is a kernel crash, use after free, refcounting failure, .=
..
> when the supplier device is removed.
>
> Indeed, with wrong links consumers were not removed before suppliers they
> used.
>
> Looking at Geert traces:
> --- 8< ---
> rcar_sound ec500000.sound: Failed to create device link (0x180) with
> supplier soc for /soc/sound@ec500000/rcar_sound,src/src-0
> rcar_sound ec500000.sound: Failed to create device link (0x180) with
> supplier soc for /soc/sound@ec500000/rcar_sound,src/src-1
> [...]
> --- 8< ---
>
> Even if it is not correct, why the soc device cannot be a provider?
> I don't have the answer to this question yet.

I have no idea. These failures (sound) are also not related to the
device I am adding through the overlay (SPI EEPROM).
Note that these failures appear only with your suggested fix, and are
not seen with just the patch in the subject of this email thread.

> Without having the exact tree structure of the base device-tree, the over=
lay
> and the way it is applied, and so without been able to reproduce the issu=
e
> on my side, investigating the issue is going to be difficult.
>
> I hope to find some help to move forward and fix the issue.

Base DTS is [1], overlay DTS is [2].
Applying and removing the overlay is done using OF_CONFIGFS[3],
and "overlay [add|rm] 25lc040"[4].

I assume you can reproduce the issue on any board that has an SPI
EEPROM, after moving the SPI bus enablement and SPI EEPROM node to an
overlay. Probably even with an I2C EEPROM instead.  Or even without
an actual EEPROM connected, as even the SPI bus fails to appear.

> Saravana's email (Saravana Kannan <saravanak@google.com>) seems incorrect=
.
> Got emails delivery failure with this email address.

Yeah, he moved company.
He is still alive, I met him in the LPC Training Session yesterday ;-)

Thanks!

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git/tree/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git/tree/arch/arm64/boot/dts/renesas/r8a77990-ebisu-cn41-msiof0-25lc040.=
dtso?h=3Dtopic/renesas-overlays-v6.17-rc1
[3] https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git/log/?h=3Dtopic/overlays-v6.17-rc1
[4] https://elinux.org/R-Car/DT-Overlays#Helper_Script
[5] https://lore.kernel.org/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=3D9F9rZ+=
-KzjOg@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
