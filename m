Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18CE329382
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901151; cv=none; b=BT47gimf7JEdMO7n3aiz/gDnglvslP0AJp9m5GHMGe4qYYng685tDSBfnEj1OSywIvqEkI0fiiusaO1CyXfyCng9RN+5KWh2VjeDnge2MAGrHO5NB+dbj5WishZh9mFcVTRPP4JWbggThG+cjMg0RVCRf40416zKazaPp2P7qBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901151; c=relaxed/simple;
	bh=NYbl8HJcgb3R5SVJ9GXGI/Jq2+mOIag8w0HzHBPHPoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgPvjyXps7MV28qhr4RJYqHcZVytZrJqfOsppI/EQHr+w4bLRkqnPMS+LQL8veFB9hjezQUlJxsb3XLlBDSSaMpxowNNosId3NULSL2Kc0999Gp0f9TIiwSlWNlrQkOJ+TLWcOsv3bDc+ct0dNIS7+Z1kL0opvnDhBYybnvUcuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4e896e91368so24305221cf.0
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 01:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901148; x=1762505948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQVVX5c2GB+a2QgL3UYe6DKU+bmVaydohzEFkpxq/1c=;
        b=rjvNRvuVgTBo3dwL+ywUc16CRqzbiX2IDq+A8cziNcGV3kyOlmPCN/CBJbL2rjD4Qm
         +YAAIVVgrAmLF1PoT0zxtdp96q6uHQSXpC9XtBcbBAI8vPYxx+3/+1Rpa8ICFxnxEdyw
         VPVDXKWERw8vqK0jW7k6flEDd4taY1esv6bjlgnKmgw4fZVh8k4w5pKpib1bdiHJ9ydT
         gbSK3d5blZDrJKZtuR3O3zpuk9BpmhdNyfte1w6QlUfQG7AHdzvXKObtwFYbxWiqFghN
         0n8162VOTa+xspVpCWpQMWz5jjr1zlH9PukgpsdkH01CI0k1xwbJKc9HLbVkQVgUGriQ
         lMWg==
X-Forwarded-Encrypted: i=1; AJvYcCWFYYW1jElcmx4OBm3zmXT7F3opBdRTCsZZGV5UuyiJB8xWsl5p/I5uBg/nwQgQt5An6TM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz+oRJI2xtkZe+ZmWB7eZOSLJVj4tNP7XcjBbExCSDDvn1EA3D
	E9YbIdR+evT5ISJWoJJJjea5nWf5RmRSlB677Kbi+UmD5dN8/Ky46tbuQsaPNK97
X-Gm-Gg: ASbGncs9E5kDamDd/7Yx3gh2AnXH08PScFGnJZcTfvw+GGPhUgTSvJHoUsGwsSda45q
	AI+tTevOkAMjhysJDqud9kRj+mPLgPMgnHZvOOQYcAbnDNMfKgRcn7OyqXO2nyqFoj+5QbFEFCB
	86zZ5B+WYTZY5Kpfguc6v5PQ//lN2fNCCbcUjAgzQ3VlgQEuzvpZ+PXjFwLBDeoLrigzUyvnbu1
	u3ALyqcqreQCKbc5Bo9tOoxPPA2ExcGJGygL5LiBc/dmuCB4kslfOOz1PnNsEpLE23Ul6xiHbc3
	4fbfVXTzr3r6+ZVNq2dGpwyfwtyp3qtOP3QrFwFdU1OvhhGI0MChV0SEYGKvxzmugFXJjNB3FDv
	XbZExjoJEsoyQ9tT2hWc8TGYIh/5rd4LKB3TsU9DBHT+3QEOnAqUVOWj9kPwdP37ZQKO7E2i8Tx
	/05qZuArKR96XvZGiRIJpDWNJXDcZm8ywpzufio8ZB5w==
X-Google-Smtp-Source: AGHT+IFuHqrlmeAj0pecP5Y91Wfs6xkCevFZ37FW6l5h0miY6fCMQaPGDF6W4OzGr392jmxSPBaCtQ==
X-Received: by 2002:a05:622a:4d8c:b0:4ec:f8c7:228e with SMTP id d75a77b69052e-4ed30dccf73mr32911421cf.20.1761901148431;
        Fri, 31 Oct 2025 01:59:08 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac00c85680sm75240385a.17.2025.10.31.01.59.08
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:59:08 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8a84ba42abbso225265685a.3
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 01:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDkdM9ACv9inajVzS3p54US+wOKtODKPrvHCOJytl+sdVjTpl7YNSbNT6+CLbhk31lGDo=@lists.linux.dev
X-Received: by 2002:a05:6102:c13:b0:5d5:f6ae:38c6 with SMTP id
 ada2fe7eead31-5dbb136ecc7mr717064137.37.1761900747573; Fri, 31 Oct 2025
 01:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015071420.1173068-1-herve.codina@bootlin.com> <20251015071420.1173068-6-herve.codina@bootlin.com>
In-Reply-To: <20251015071420.1173068-6-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 09:52:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
X-Gm-Features: AWmQ_bm5vGlc5XXZic8RvnXrZNNcCRnf0-7M9Km7uh4sqx0Aign1FjKoX2MZmow
Message-ID: <CAMuHMdVnsWMB24BTFKwggEXKOtqJ96GWZh2Xz+ogocQHM+=+6Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/29] dt-bindings: bus: Add simple-platform-bus
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Wed, 15 Oct 2025 at 09:17, Herve Codina <herve.codina@bootlin.com> wrote=
:
> A Simple Platform Bus is a transparent bus that doesn't need a specific
> driver to perform operations at bus level.
>
> Similar to simple-bus, a Simple Platform Bus allows to automatically
> instantiate devices connected to this bus.
>
> Those devices are instantiated only by the Simple Platform Bus probe
> function itself.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/simple-platform-bus.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/simple-platform-bus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple Platform Bus
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  A Simple Platform Bus is a transparent bus that doesn't need a specifi=
c
> +  driver to perform operations at bus level.
> +
> +  Similar to simple-bus, a Simple Platform Bus allows to automatically
> +  instantiate devices connected to this bus. Those devices are instantia=
ted
> +  only by the Simple Platform Bus probe function itself.

So what are the differences with simple-bus? That its children are
instantiated "only by the Simple Platform Bus probe function itself"?
If that is the case, in which other places are simple-bus children
instantiated?

Do we need properties related to power-management (clocks, power-domains),
or will we need a "simple-pm-platform-bus" later? ;-)

FTR, I still think we wouldn't have needed the distinction between
"simple-bus" and "simple-pm-bus"...

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
