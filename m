Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363703F2102
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943234; cv=none; b=tLu65pI9KbU/qGa+YS80YG3ACz5YBqaVcTSbHZGMS6VyMPhjHozdOKZbMOwBiFphQoPH2SPfGfzGA5O6pIKC9wxPs30yuLKPF4qB1b7yHa4a4WVmghTjBlyqGvROGKOm6tvE+b2cLkIbwCF7t4HzPvG9xZutC7sQPtyTsWgUs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943234; c=relaxed/simple;
	bh=1qiYzC4e4C5Osb7cyOfG+hx3gfnhgiG4CgnJdnnYqWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeDtYC+ZAhAAuaeZl/WZJcxNjXTFBYMRmXrCmPDk4pR7Gn6wzaYOKTkO0y2WyMeyXnjto+IoF1I9zQ77yzk8XE6u04OPlslhbEUqU/Y35ypaIhgl30dCKZdILuS/Lj8BJYRMiL551+JJpeUE1BUy/BcCbiP/AjNwck7Fuyzldzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gsYuxy65; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gsYuxy65"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a76ba6a78so6613531fa.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773943230; x=1774548030; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwNvoAxpSBA3F4YxfMu4dubOKf0cPSpjGd1s0V+Fdds=;
        b=gsYuxy653wvwOmqLgWIZuV2ywoxHXv77MNhUyTjWNBZh52LRJPzpsgOewCY2zeRKj/
         PXMbs6hHeC2wfXpJaPlpBYHcLd2pYQMQPnCnzG9ZFAdhTHWh1RMBK4KreV2KtNzaqWtv
         FhFGVInVumP8xamnE2JK254pVJQd0/pg1ZIu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773943230; x=1774548030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwNvoAxpSBA3F4YxfMu4dubOKf0cPSpjGd1s0V+Fdds=;
        b=HMEZY/hBuBkfg+PuSx3ULF8LC2fZY/i4j7n/e5T2v4U0hPUaDtB28acar20veAqj48
         Yy73ruee7CkPZIfS7ZpI6GY+GOKlMVi2vmKsx5OAaUox2EpYYeRLqNZ9dSXent8OYkh3
         r2YJeUf/zob6QqLGu7+CSRAPUDRksMVIX/FrCISTkS5kmT9oh0nJME1OIcp4ACgkRCLR
         kZ4AwWp7A/G9nUXFiYOrcwvVIzPcpnxyP+cvt8d/VRRe9QUzlq2tYt07irrhqevkH94u
         E1zNCixOaW8oY4C1MdCAdvMeEDwXuHAYW2vodhFbUzDqawZVHYDJcPHd4HYVQeAMzeT5
         p4rw==
X-Forwarded-Encrypted: i=1; AJvYcCWOC2PPK9mOYOWAhI8AFbKhoiAd4Y68NYA3es5k0x7YGLmNLl9ikJv3Cuq3iRanFciesWM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhsQsl5DLQWBo0Ss5XncK9TqHMse0R9rOnhNtPp+RZnR15IbJ1
	c3UyInXboGtqGq9Oti+MHmgjnjCailG4/QjfAom+1ymysadfroemuPipF2by3F68bOq3qHDzHzV
	ISr58n6FV
X-Gm-Gg: ATEYQzwizdT3W/k4NUp0cyUya7llSqq2tnIm8gOmujj9Y5bipEFU7toZKIgYfMIMzfo
	VSOlnHBHUsj1B3v4uw48HLSQUzJy/BP3tZcEX2rKo4vZsdbI19Td2uTJNR8uBuVxtaGI7MyhHqG
	5WLjzV3No4A2/yhXq3OycNLZxbwDjH+HPS8xsOGsyfTlfl0w2MljKhVUWBrJAqL978nScQ32Ejr
	j9qbJmsBlbz/qcexzUQzxw4GeC+0qsqFTORRQdWdAniHdSrWQ9+JtYE/3ZizRx39O8XrHB2bG+Q
	cUbA1nZDCHORckodxZeRG0LVgfC4oGtqV2LHyeKvBdfs1pWikuYwwdT/zRL2UPjsROgM4gT/FAR
	xnpmO7gOhS9lFd03WKcRYeEKFGoMMQHSH/QN9wvPXNpRFaKYEySjeZKR+2qrKKy7tcPjovuhRy5
	vH/Q7rTzwXDNrUkH43+laTGJJuNgSF95XkjD3tHq65SMoHNVbSsRzQYbFpGeZIL8Q8QIwA4dfd
X-Received: by 2002:a2e:be1d:0:b0:38b:f0f9:cb91 with SMTP id 38308e7fff4ca-38bf96772dcmr1437481fa.11.1773943229758;
        Thu, 19 Mar 2026 11:00:29 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf998202csm559121fa.26.2026.03.19.11.00.29
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:00:29 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so972981e87.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnU4/VYIW6iAFDayVqQ4ubIH5PBiV0VdVwnUEUy/EhH2U1cy/x4kPyXE4rNJwVyeJ5iOw=@lists.linux.dev
X-Received: by 2002:a05:6000:18a6:b0:439:beee:43b5 with SMTP id
 ffacd0b85a97d-43b6423d90bmr470716f8f.3.1773942745211; Thu, 19 Mar 2026
 10:52:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <CACRMN=euZzwDpCQupzth-J1z9qWXPenmy_bu727+R-kt97zexw@mail.gmail.com>
In-Reply-To: <CACRMN=euZzwDpCQupzth-J1z9qWXPenmy_bu727+R-kt97zexw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Mar 2026 10:52:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
X-Gm-Features: AaiRm51jE-pJGKyYKekSNJEdkSVtbmzl88hjmcc-VHWIT0EUhGVU2WYljuGhtW4
Message-ID: <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
Subject: Re: [PATCH v2] device property: Make modifications of fwnode "flags"
 thread safe
To: Saravana Kannan <saravanak@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Lunn <andrew@lunn.ch>, 
	Daniel Scally <djrscally@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 19, 2026 at 10:25=E2=80=AFAM Saravana Kannan <saravanak@kernel.=
org> wrote:
>
> On Tue, Mar 17, 2026 at 9:04=E2=80=AFAM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > In various places in the kernel, we modify the fwnode "flags" member
> > by doing either:
> >   fwnode->flags |=3D SOME_FLAG;
> >   fwnode->flags &=3D ~SOME_FLAG;
> >
> > This type of modification is not thread-safe. If two threads are both
> > mucking with the flags at the same time then one can clobber the
> > other.
> >
> > While flags are often modified while under the "fwnode_link_lock",
> > this is not universally true.
> >
> > Create some accessor functions for setting, clearing, and testing the
> > FWNODE flags and move all users to these accessor functions. New
> > accessor functions use set_bit() and clear_bit(), which are
> > thread-safe.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c2c724c868c4 ("driver core: Add fw_devlink_parse_fwtree()")
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Acked-by: Mark Brown <broonie@kernel.org>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > While this patch is not known for sure to fix any specific issues, it
> > seems possible that it could fix some rare problems. I'm currently
> > trying to track down a hard-to-reproduce heisenbug and one (currently
> > unproven) theory I had was that the fwnode flags could be getting
> > messed up like this. Even if turns out not to fix my heisenbug,
> > though, this seems like a worthwhile change to take.
>
> Reviewed-by: Saravana Kannan <saravanak@kernel.org>

Thanks for the review!


> Thanks Doug. Hope this isn't the cause of the hisenbug. If you report
> it here, I might be able to take a look at it too (no promises).

I don't _think_ it fixes my bug, but I'm still not 100% sure because
the bug can take a day or so to reproduce and it appears to only
reproduce on official kernels built by the builder. :( This makes it
hard to say anything for certain and also hard for me to inject extra
debug logic.

I did finally capture a ramdump of a device in the bad state and
managed to inspect the state of all the fwnode and fwnode_link
objects.

The problem (simplified) is that I have a pinctrl device:

  max77779_pinctrl {
    pin1: pin1 {
      ...;
    };
    pin2: pin2 {
      ...;
    };
  };

...and then a client of the pinctrl device:

  client1 {
    pinctrl-0 =3D <&pin1>;
    ...
  };

  client2 {
    pinctrl-0 =3D <&pin2>;
    ...
  };

At parse time, we get a link between the "client1" node and the "pin1"
node (and "client2" and "pin2").

In a normal boot (where the bug doesn't reproduce), when
max77779_pinctrl finishes probing, all of the links to its children
(which don't have a "dev" associated with them) get moved to point to
"max77779_pinctrl" (__fw_devlink_pickup_dangling_consumers).

When I detect the bug, the max77779_pinctrl device clearly has
finished probing, but the client devices still point to the child
nodes.

In the debugger, I can inspect things. I can see:
* The fwnodes for "pin1" and "pin2" clearly don't have a "dev" node.
They also don't have "FWNODE_FLAG_NOT_DEVICE" set.
* The fwnode for "max77779_pinctrl" clearly has a dev node (and a bus).
* The fwnodes for "pin1" and "pin2" show zero consumers.
* The fwnodes for "client1" and "client2" _do_ still show suppliers.
* When I look at the fwnode_link between the clients and the pins, the
"supplier" points to the node for the pin.
* When I look at the fwnode_link between the clients and the pins, the
"c_hook" is non-empty.
* When I look at the fwnode_link between the clients and the pins, the
"consumer" points to the node for the client.
* When I look at the fwnode_link between the clients and the pins, the
"s_hook" is an empty list (next =3D=3D prev).

It's a bit baffling because everything looks nice and consistent with
half the link being severed, which doesn't seem possible when looking
at the code. The code seems to always add to a consumer list and
supplier list at the same time and remove at the same time.

I've started to run out of ideas on how it could possibly get into
this state. If you have any, or want me to look at any other data
structures in the ramdump let me know.

-Doug
