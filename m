Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59453659FF
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 09:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773395055; cv=pass; b=bOb/KrV/gFp12NvXXZ60ZlObw2XLkcYgy3okVhJAmAeya3JX3Gisvt5nAoE8vfa0DA+Vy8H7FrDw3g/BJzIBx1H1P6nYel/0ko4cpfO4rZPqChwzgOpi3oslTSNaq6BM3BemlW6f9cgwSjGs/EiIPgSdBNeHJ3DOhQinZDTHyBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773395055; c=relaxed/simple;
	bh=a4PkyDJIX7KyCPscZwhkhXLXTwGONJMI97/AnswuOLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNhCfYu0te5rT3smnSILya2p9pwPy3GU5pH4Ig+dcchzUVoe3+9YFF0n5bnpzrX9fdLLTbhhZwUCxU3LowfDL4288M9pgNkk/E7BsS1yptsPn8gqra6kmYKFKvqtFiGdqrLLXc8wBOQzqvBkb10ETtKPAl2wl+BeLe2xNH/xEFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPrH9R0r; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPrH9R0r"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a107b387a5so2608502e87.2
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 02:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773395051; cv=none;
        d=google.com; s=arc-20240605;
        b=Fn7btlXu14Q1lM/4mm+kmhIwkUwEbbhivMLXoefx7OfNevUaYj8ohC4gh+D8YlJrEF
         PMhTOEJgqFFdGbdWSb5rdv0aK9YTpV+52T5AahtaOeB3s/gpEgdw0W3t/WZi5Bwc3Yri
         07Atab93lbfjs4U4iRPxDS+3JmYhAZQyn7rY8NDwydH83cfLoKJMCP4XiTFi0IqJ9DEh
         3tGUWdtJO0B8TH4yiywXyzi3dBCTnbSobxj2INpC7kygPvoXw9BF6coBhu4ixP18RaCN
         lqsfp2CzFQPriHsEMDlmpglFsiPnn41HitpxoccylRRwIZx7b7vurRsRuZIIVYh8aK+W
         zhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        fh=UnggbH+tqInrTZoaA2GankQy/2OHZ/WSfIB0YJ4o4o4=;
        b=YsfWzy9hg4c9keQtLggjyWyHH4il3P1cWDCUI8EwoIqyKg+tl73I/DrQKMUkbioX2s
         WvOJn+leIsCeGbR5iWvAhrdROdcOFr9XTLBCa1PSSpSwmIKNUBN7JRHORWzQxxzL8/sU
         XDs4D1wM0qEAAdXW3haRgacuVI70E9o+YcrfiBUnjjucsX/9ziZpp+h0GS6um0wDNjaq
         6dBTMZ5CyB2VMmrbgvREON/T9quVi/5j7IECtKOTXKpWacSnQitmOxj+IgF3E50hJXA7
         rqilj2SYfpz5v7XWVUQN5A2o2vYE1KDvysCpX8hm5ME2CPTDlpz6S53qywvFWNM9BSo+
         BZ+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773395051; x=1773999851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        b=MPrH9R0rTarkeTS41hDrvBBOBlUOe+MSFkk0SFfGac7+ipvlf2XImMBgHsDaDVMyuP
         S43GdnwIVndq/Mo7pTC0LmNnmrXIzyYjTgIGy78gtSH51DYfA0kdVWBGHXMEZmy5TTU2
         CwJ1GMvR7mSM7jnXmikkU6xkZ26oq+WyeqTre/A6xZC9q5Ubixbk+Bw5j9XxiefhlYFX
         2QRU5rg5qa3dKowp53N/G7ezxFYbzWO1BHwlxhh4K/ie/E+uMXF88SpG2mYTivHyHoZn
         sd+AsY95/ZaluaSRECbHHowGZdCSZB3m3futyK95DiiHcNMb1B+o9UNqhHCm/tTmWZ9y
         u+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773395051; x=1773999851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zhNoTkJIeGg7k6SX7++UNulbkoe8PKd3t4WsYSulIm0=;
        b=cOaEzivwe5w5z/i5RNuAhyckXaVs97z4blYpIOn8MQggZbevp+qGeAMFue/ye6R/ye
         41Cj81uoYrTRiJdghymTFbuGVZC+cOlPwZFgr5jg9lY0t+2u6IeuMLPaSaS0N2PJ0p7k
         1wxt7Dl7zlj2kO7YOJf1M3Vv51N+FfiWwHV1ioIz0chjIE23BmmhHUnFO2F3yCedQn9Q
         ft8IEdIBXdwWDS1tyxdygvh9p/t7caRfbeLri0dk/QvITdWx+I2lGWRy2f/W3d6TBO5y
         t/mc1BzYZhqyyH95oF101inLPmu47M3MAeHf0ASoBqekj/BD8652Rs6n0ggGbiHUpueu
         Ks2g==
X-Forwarded-Encrypted: i=1; AJvYcCW6pc6W+pjVZKzPmW2X6ubBuA1ZlrIaNfdGuAjD75SqGWqqvSbYfrgw0wMFH7uMzFHmIkA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxrc4T2JgVrteIZ9RHHerF7PEVJXzzdRD7sJAUKAB0rs1jz6TbQ
	RkYeGUkcXQ+ck0EoP6T65Z6vZQW3hb853NWZCYEGMIpSnHzJCORC3cRHkKLVbax26cj1hyTFQoI
	U62uOhbdUOFWUP3MSdfzZ2JolBOseDMTlEs4sl7qznA==
X-Gm-Gg: ATEYQzznSA/UpKGFPPA1yfiIr6Z7GHBXKjTpN5zexhnqNiZtnidL3aUSAWpTJaALKHj
	tcLlRAUzoSeC8CAThgjWyfJayfCfzjViHo4/VXz3qWbX1nboouWIWWZtswo4/4XXkSz7eDxTpBR
	DL23QGw+hnEMHPlarPX+AR+DX2fY8B66ZSQorN9uJ3mHu9Bf8oeG8hj6cIjkBF5v0y/X3yS2kUD
	p/pmZyf2xEO8iYLNA44j/wZPN03JozcO2786IPh3HvS1drKj1Dom6VPcvZJePRHUqawytuqVZsf
	G4yRo0f9
X-Received: by 2002:a05:6512:1589:b0:5a1:381b:fae2 with SMTP id
 2adb3069b0e04-5a162b0d32fmr863539e87.33.1773395050576; Fri, 13 Mar 2026
 02:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-3-herve.codina@bootlin.com> <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
 <2026031242-debug-aviation-19b8@gregkh>
In-Reply-To: <2026031242-debug-aviation-19b8@gregkh>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Mar 2026 10:43:33 +0100
X-Gm-Features: AaiRm535RzzFrlMRqNsLHd1XM8yzn674dd-38MKB2CsmserIvJfHsK0fUYGtRYw
Message-ID: <CAPDyKFpX3A3r4s72PNjBz5QaZUsq1xaGhn5vXwegue7Tyh_Zew@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Mar 2026 at 16:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 10, 2026 at 04:03:42PM +0100, Geert Uytterhoeven wrote:
> > Hi Herv=C3=A9,
> >
> > On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> w=
rote:
> > > get_dev_from_fwnode() calls get_device() and so it acquires a referen=
ce
> > > on the device returned.
> > >
> > > In order to be more obvious that this wrapper is a get_device() varia=
nt,
> > > rename it to get_device_from_fwnode().
> > >
> > > Suggested-by: Mark Brown <broonie@kernel.org>
> > > Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aY=
SV=3DiEkKPNbNOccYmA@mail.gmail.com/
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Reviewed-by: Saravana Kannan <saravanak@google.com>
> > > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > FTR, one more user of get_dev_from_fwnode() appeared in commit
> > 9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
> > in reset/next.
>
> Ick, that's going to make this hard to land anywhere.  This is a rough
> series, perhaps it should be split up to make it easier somehow?
>
> thanks,
>
> greg k-h

I fully agree with the above. Renaming the function isn't necessary
for the $subject series.

I suggest we simply drop this patch from the series - and if the
renaming really makes sense in the end, we can deal with that
separately later on.

So withdrawing my ack from this one.

Kind regards
Uffe
