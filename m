Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876799;
	b=JYPcBcGG6CrQTCm2MAnNZpRgbhd3VdSfoKchVCKy2FKc8OJDM4OIZ8pYQWkfPJu0X3hz
	 nTxyg+W8BGuE//oeSgKCYGXoiqVr6XDNpVp/J1WXp3wJAEAEUkCjIbAnNq4V+mDgBhruT
	 VjiOUZH/pUw69yzXFvad8BFWYtNJDBW7t5FsJJ3ya7quQOOHJgGQIh4tIjMJosZHxGNDQ
	 mbn7vBY2Xafj7GFCvqPDOHFtAM5R7xJ0zLxqs3yCc94pk4h/ZTUKLUMmiS2Zwz7CZBfFn
	 lD5S/HAKaNILFrJ6Q1M1GytA8p5q7hsT8OND/7wLRsKEnWvdP1i4DydIDZ/jkkOR6+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=;
	b=xx1r8u/DouMgN+scv4AtT8YYreNvbRUQQ4QEB0qq5Q1DERKWWz9yI1V6gz84E5h/70W6
	 mnz5jfngbK6s0lkBKFr2BpJZha9Hw9Hd/YB3NJc+r5/PpORbAWCvOFm4cYmN+ygOOcBtQ
	 L+TZ6gIZamqHCTbxx5zjJZfKos2x/GJ2BWBEvHBR1s9Vo8aKqxeSBwWgrc9I7OnzRA+Mx
	 ErxEXiHqlKH44cEbj+QdXlOuQQGEqFEH9uT8TB/Fct2TZSFFBWFzQj0VF76vTNFIhBsei
	 73A11inwjDYV+KeGcl8s0L+zKQulJvVIBh1JepKN+6i+OUtDAy660nU3BRcNMjfGoHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iyPCE9WJ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89468606A330
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 11:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89468606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iyPCE9WJ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e4831c028so1568044f8f.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793876796; x=1794481596; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=;
        b=iyPCE9WJtN6AxAfl7nBnUXRFwasJM+VF90yjGgWGK8w/gOoTIx90RxoLfvaLsXCZce
         grFLYmo0TcDBocAb+B//slNh8loeuCCdTNHzCS7Z3PYng4MbkTcEptWiuMXkVThfxMTn
         M80RCnKHOkkjyhn/mwE19ZTKT8hUgrLQgx44PGfKnynY730WV6DLIFOWr1FNXLdVxBtq
         amavNwFMXnKS8kO9Hk/607uCgB3YAgyZqS3KoxJu7tgYP9iuPtW1wnocK3JSQjY9OZie
         1P/AmMnOMkw0Z9YSK9VV8ySrBU+Y/xVMSzCkeDuFyZtgpbwrptkayCiTfNXVWH+qpiqi
         qfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876796; x=1794481596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=;
        b=pOiNXarhoJsLYzpIOdAnjdbyfqBwGz3ppMhi7fTFxKfDO/pbwVuVLpd83Srsufea39
         MmzThahK2LN3fNNOh/6U4auuf1+zaVSUWmI1xNX0X67pxEAC867PpoKY5gY1kL2R6fFY
         B+FdyRgs6gvilL5HtKEHRVidtIEJKx6R6WpcIf2fk94z0UacdCSpIe8U3JaYOhkUUBAN
         iMukl4y96Jsf/wcKH8EVsMehsmu35RIIJdTAhIK9Tw9rp2gV0BiQItaD/4my95MwMhqH
         EogDwg8ZmNCu67nXiZrRMxG1EOb29Lm33tj4bHBaEZHMjCR3Wmm+YWZHr0XfpeKiDsx1
         65Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzZx/0MokmhHtPXduXxDVmctyML69LsYdhI4ZftOiIgbDkeap9Uia5E440hewFiLs/bMpw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9h0PYH82uToVM0b0JsdZzOtdP7LUf6SVLdQuM/UFlsN8W8fpix
	2kC8CzunFRrO30voG3TPKcgtwMplIA+g4BTRGRfMIoptcbPZ20x7Rxy9okG/Decm8Fc=
X-Gm-Gg: AYBFou1hyOWH22Xnhq6TiRHjcdoe/DKrc8eDZ2yLBPvMSVhe6Eh8vY2xlUhtC3andU2
	bCCjR+z3PLmpFabubeV1TzkyH+IN5cOTMVPmUahgiPD+MsJr7VVgWfcMZuZHeQCuDEvD/H7Bz9F
	ty+XGL9brOGnRJBjTIxJZL+E12e3PvAkCIOYjShTNAv9sQdQG44k5icetalHYufc3SusOXSd7Ew
	yTbiIBoQlhjKP7vjfRllvIdfUsIJzc0UcubQNOLBAc8s/Vs85HcT5R64aL/jMbInLMUoxPCd0K0
	DPOVu4a8xyZD3d7auMxac3mziHzwi+dNAzdqUJZbnPu9NViVHyRdw8oeJl1DmQMJGQ+oCZI013D
	lWgXvoamPqhi4sHyRisDvN0iDBjnB0HDeLGdQqh2OAXzzFFqx4YI7lFcl4NNqW2cG1L2Opgnm+D
	pCvAc/dhtApPFUSjzoeNigROUuB8EVnUyGSq++TyH6FZdPQAPhGteqYs3XKqgpkxeCTtxiPjf3d
	YDmbtc/AQPeGBwW/H0Mg31ISMzmH/3kWq2N0BAsJ7nt9ZvPuyNdLmX6njH6cQQy0pA4FBQDJ5kk
	Rv5XhApGehyhuK2IYsYcbPPFCh9IauKTzLLFrqZi6qmhBtaEcPur1BQvvH8L4IhOz9wC0+ppOm1
	esDrVmoRzYn64DM8h
X-Received: by 2002:a05:6000:40e0:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-48fbb86d828mr15698548f8f.11.1793876795617;
        Thu, 05 Nov 2026 03:06:35 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fece998absm10176189f8f.22.2026.11.05.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:06:34 -0800 (PST)
Date: Thu, 5 Nov 2026 12:06:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Michael Buesch <m@bues.ch>, William Breathitt Gray <wbg@kernel.org>, 
	Robert Richter <rric@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
Message-ID: <auxh9PxpJScFO3i2@monoceros>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
 <2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qsdpu7ny4ekdton4"
Content-Disposition: inline
In-Reply-To: <2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe>


--qsdpu7ny4ekdton4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 09:47:39AM +0100, Bartosz Golaszewski wrote:
> On Tue, Oct 27, 2026 at 11:48:37AM +0100, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> > Hello,
> >=20
> > the original motivation for this series are the patches that convert the
> > arrays to use named initializers, see
> > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylib=
re.com/
> > for the idea behind it. Looking left and right a bit while implementing
> > that, the series grew a bit.
> >=20
>=20
> Hi Uwe!
>=20
> This no longer applies, can you rebase it on top of gpio/for-next and
> resend? I'll apply it right away before any additional conflicts.

Hmm:

	$ git fetch https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git=
 gpio/for-next
	From https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
	 * branch                      gpio/for-next -> FETCH_HEAD

	$ git checkout FETCH_HEAD
	HEAD is now at d66b6b86d5a6 gpio: 74x164: add support for 74lv164 shift re=
gister variant

	$ b4 am -3 2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe
	Looking up 2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe
	Analyzing 33 messages in the thread
	Looking for additional code-review trailers on lore.kernel.org
	Analyzing 99 code-review messages
	Checking attestation on all messages, may take a moment...
	---
	  =E2=9C=93 [PATCH v4 1/23] gpio: Remove __maybe_unused annotations from a=
cpi_device_id arrays
	    + Acked-by: Frank Li <Frank.Li@nxp.com> (=E2=9C=97 DKIM/nxp1.onmicroso=
ft.com)
	    + Acked-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com> (=
=E2=9C=93 DKIM/intel.com)
	  =E2=9C=93 [PATCH v4 2/23] gpio: fxl6408: Remove __maybe_unused annotatio=
ns from of_device_id array
	[...]
	 Link: https://patch.msgid.link/cover.1793097104.git.u.kleine-koenig@bayli=
bre.com
	       git checkout -b v4_20261027_u_kleine_koenig_baylibre_com 20a33c6b6c=
be7e4805dfb6cd68816937443aa148
	       git am -3 ./v4_20261027_u_kleine_koenig_gpio_improvements_around_de=
vice_id_arrays.mbx

	$ git am -3 ./v4_20261027_u_kleine_koenig_gpio_improvements_around_device_=
id_arrays.mbx
	Applying: gpio: Remove __maybe_unused annotations from acpi_device_id arra=
ys
	Applying: gpio: fxl6408: Remove __maybe_unused annotations from of_device_=
id array
	Applying: gpio: Drop unused assignment of acpi_device_id driver data
	...
	Applying: gpio: Unify style of pci_device_id arrays
	Applying: gpio: Unify style of various *_device_id arrays

	$ echo $?
	0

Maybe you just need to add `-3` to your workflow? ISTR this should be
the default for b4, but it seems if failed to mention the -3 in the git
am cmdline.

Should I still resend?

Best regards
Uwe

--qsdpu7ny4ekdton4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsYzcACgkQj4D7WH0S
/k6COAf+I352qHa+kMUOH9ETW9KNHC8dWhUfB6E/IB+8yoRbH4tQy5C0mLg76J11
sJdUuJGD2XjvAv2tgSWACC8Cq1A+CnMvgQXXDsLtC7JuQ0aQYwSFMTIEphdECYue
42itRdsMlxubgjyK4Ku9YeDItioMv2A2EX+InXlNcO6MoK9ty5ZgCfsCY3OyHGVT
OwfU948a3DowaasJORDv1w6dhDNg/sCysegJvjnBoz2vhmoeYeyxxNHTGIzcjxt/
CWYJqu4/QDxJQ9FDuS6d2VhmXYOGL2Dl/wntyyQZjatVXHe6I2wwFBNQoOWJvPaA
BRQb0uNoTqeBvO/Bc5+AYD34/xDKkg==
=tsLa
-----END PGP SIGNATURE-----

--qsdpu7ny4ekdton4--
