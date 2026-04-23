Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1848A3DC4A4
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927720; cv=none; b=eS5ti/GxTtsIe2C69em5KS+ZPYvQRFSkc/Z1hGl87mpDF7VXj2MaozJmikcGBdDYfHiBhQ3D6sLIqnkr/tQqK5SZqGIjO3uHDsYmUbcJLDekcN5vv/j4rK51PeCIcNbHw2L7N77O1qihuxwUev3BRFABx41UI49f09dYZYiNhqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927720; c=relaxed/simple;
	bh=hexwbOGW/6m/Df6+GU12KM4IKYYaGu617h9GqYfIhNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqWC8SMdk92tN0C41IZjGn7/ZCiW9aCuIRYg11442y857FiFGxxGUvyT0IMM/cbz0IyzPxMZT8t9euj7Tk/hs/Gat2g1BJoio94fkC81M6d7S9eh2VZE16NTFcpaeneYoinMmULQdlNztwqY4vMD5W8dPXjKXqBqBZPCJV/Uylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79a60975dc5so68968047b3.0
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 00:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927718; x=1777532518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FB5PTwtw54UUlBS193h15pAhGHmMjXQQ1mJTpaYMvb8=;
        b=sD5VfFW3c/Ah0Z3JMWg92wAGuyfEKVZZSZuyD07Dsfq6bExZPwDrGJMRRSOlXRqZul
         z6ryCHnxVWvLOGtZo9KsvDQ0maV7WAMO63KXbrYd1RpXNtzEuwBscWoDNUUl4s1ki971
         7bLQ5iolC2zl1A6KMXdBG/v8KvVsWE7GLnMErWWzFUXzmHpXiFhfqzYGai42uVoIo3jY
         NEbtNhlbc2SHil5PwlR6Nw8PPj8LjcTQAbhCJZcY/gx/5S9VgZYlKP8zt4FYkFFQ47aR
         ve7YY9+Ab0mvVdoh1ZeP9fgaGziPf6VdheDwsCh2dGg/p0587CHrNrZC0G5BNIFHH1db
         9WGA==
X-Forwarded-Encrypted: i=1; AFNElJ/Wzd1G4xyQv+7gx54iAtyIz0lVTMWvtBnklSFvuZsg29p0WGahnvN6kwF1aeBMhomJ4LY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmP30HNPP/d+j3eJUO9dgpEFTcbTmJqoq/ca4F+SjsjhN9gDSv
	mJy/s6EPSH/quU2Oa6EGQ3kbC0RsvC1DfPUgZNCxoAif3/e1lRGTmLgowD3IEc1v0CE=
X-Gm-Gg: AeBDieuEoScDrP8Aw8lyl2lvEZgP2r3UuLPOKeydSL0aYd2lf9gTuThIuz6HSBMOIAe
	jElbI6dMSwkjZh3XtCIZ7loGetnw844fJJq4xJwR2dtiOVzFOlKSHVXvP6pXOu1Rmj3WA72uar0
	/h0RdBg8/v2BmvNo9dlnaP94hcn7jq7+JtBM/oOfdxpe8cPD2dIuJHXam+5zbhHptV35pPEdJmL
	U30PqTCD4Y81N6TW0LvCmnZ6WFhFg9qIyM6FgM/TRP7ixfWghnd4TuHC/SZI6BiCqSgEOvLJ1Vf
	2dXp29rfzPD8OEUzZ5rcw5JAbQ2IQ9RQ5b4ZbS1P9ygkEWn0GsMCvdfttEw2H/kY47/zpDmpoVK
	mInsrTF0xTF6KMJ0qIWjSDW69LtA5BS5qRIn2m5h4TAHeBHUfZmvelo0g2nsO1MRcQ4XA1z7Rw0
	wY1jUbuQHJXIKXU3NiPmHGrCcYAZKvn5Nvza2UwXED0WZFKFEdVX9xkJ0t6Lj2D7dGdzLhuMs=
X-Received: by 2002:a05:690c:8d12:b0:7b3:f33:35e5 with SMTP id 00721157ae682-7b9ecee7f65mr212560537b3.16.1776927718278;
        Thu, 23 Apr 2026 00:01:58 -0700 (PDT)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com. [74.125.224.48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bb10ecb30bsm13848647b3.8.2026.04.23.00.01.57
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 00:01:57 -0700 (PDT)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64e87a81639so5772610d50.0
        for <imx@lists.linux.dev>; Thu, 23 Apr 2026 00:01:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/pNCzX/LSovN1gt8drC3JWBcme8x4fpL42s5LPhBjbdrqMLQ7N5qkMrq5M6Merb5DvmWc=@lists.linux.dev
X-Received: by 2002:a05:6102:441d:b0:611:6fef:905 with SMTP id
 ada2fe7eead31-616f750858emr13450072137.20.1776927225241; Wed, 22 Apr 2026
 23:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com> <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
 <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com>
 <aekg_IELc65BFrWp@ashevche-desk.local> <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
In-Reply-To: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 08:53:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDCQrQ2Z9D7-ZOKiuDznDJVf2R_b_8P9+Xhk4RiJ3vdw@mail.gmail.com>
X-Gm-Features: AQROBzAvgx3axNivzcvHu1RjLcwZ8ZssrkMMWMoOA6QWZi8LwGEf_PBN_biPlMM
Message-ID: <CAMuHMdUDCQrQ2Z9D7-ZOKiuDznDJVf2R_b_8P9+Xhk4RiJ3vdw@mail.gmail.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Doug Anderson <dianders@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

On Wed, 22 Apr 2026 at 21:40, Doug Anderson <dianders@chromium.org> wrote:
> On Wed, Apr 22, 2026 at 12:27=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Apr 22, 2026 at 11:51:36AM -0700, Doug Anderson wrote:
> > > On Wed, Apr 22, 2026 at 10:44=E2=80=AFAM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.co=
m> wrote:
> >
> > ...
> >
> > > > > +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
> > > >
> > > > After commit f72e77c33e4b5657 ("device property: Make modifications
> > > > of fwnode "flags" thread safe"), this must be changed to:
> > > >
> > > >     if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
> > > >
> > > > With this change my DT overlays are working again.
> > > >
> > > > I guess keeping the FWNODE_FLAG_* names, but changing their values
> > > > from bit masks to bit numbers was probably not such a good idea,
> > > > as it fails to catch missing conversions...
> > >
> > > Crud, I should have thought about that. :( Do you think it's worth it
> > > to do a rename at this point to catch future problems?

I am afraid it is too late (it is already in Linus' tree), and would
add only more to the confusion.  We just have to take care when this
patch (and 01/27) is backported to stable.  Fortunately the reverse
is caught, as the fwnode_*_flag() helpers did not exist before.

> > You can try locally with allyesconfig / allmodconfig and see the outcom=
e.
> > If there are missed cases, and their amount reasonably low, I won't bot=
her
> > in this case.
>
> I believe I caught all of them at the time of my CL, but the problem
> is in-flight stuff, right? I think the problem Geert is pointing out
> isn't something I missed in my original patch but rather an
> interaction between my patch and this in-flight patch.

There are no unconverted cases in upstream or linux-next
(I checked yesterday, and rechecked this morning).

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
