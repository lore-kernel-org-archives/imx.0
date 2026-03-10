Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15795320A0E
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155352; cv=none; b=u6MF4CBkp9o1C6ZdHwOdMabS+IPpRgdem5WLAPpnym7PMfCeNSV4ssJa8chdkT/EYdNdTAoCEpVigKoHcVPOzO3K7Ua504sfYfW1iOA/TxtSo8U9zzh+CsZvcqF1CLaVY4T3URy9d7KyeXSsd4oIQrrIvPJeCqZHOtF0jHgQNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155352; c=relaxed/simple;
	bh=QEW3lhhJANPdrCVBmAIqH1dXUDPD23689ylzZ5dnJco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5u4pZTZmUhcGSvGXkrkIAli4R/vvPDfUGdjm4/cCYh/+BYNzxrO9HgqWIGaCF02vHX+WgN7iQhKGJ3zD/MtdbbRaVy1vXTtjDtK7JNOicf7MIOd7Fp20UaiW72gqvcBIaa2mVY0pUy5enihBtaW0S4B4qAH3VjIg595ynfe9Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-508fe217a44so37684061cf.2
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 08:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155350; x=1773760150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ru18n38/qbgrYN5XhGLEd0K3IukQ/mw6D37X8x0z/qo=;
        b=fqWLltJJWCzQ7x/cqrf688TtgPXHtwBHulveRxHbBnHOhK7BIuMDmMz2keAFXllCa4
         wRbxkAZKqXDyFxkuhOCF3i63xqm6pvVw34rOBB3PN65TG15PyYb4GML3p6LBzfamgekR
         rpNXIDMLrMEe7ri5hpnIJDrrnIngCXNKN6F2ZndoMcbBl7xuF8iHek63NHqCvjZ5oWLz
         gI6DvhWqcAZEnazMjttWjMw+3uwPyQEfmhMDNDMFlIiEdafUj9yV081szSxIHjbP7sjL
         9GX5/3NxuVleEo6VYxFZQ9NlRHtdmJpyaZhMa3sCHksyKh/gi9m3KFyu9xIoChZjdogE
         25Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUqxh+Yy0W/Cm+SlaRwsSz5SjU5bff257DAGvgjezE4x7X57mMFE9unfp83jrS/n27cn9s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2Nmb52J8c1my0PDK0W3pIoRlTuDnMrTWXjl1yIxEZ7CGamu9y
	ueMzP9aTIKTd8erJ3N+iTMFsCDxvJ86uKZ2rq4EHIMCR5ivLLDQQyoodjbYY8lIN
X-Gm-Gg: ATEYQzx6jnuO5J/nHZw3yhbCqOTCzYPWPwWuXASR92nHinRy5nYpCy61JND707Tnh7c
	tmiGQmosqq/8IcoYaobp4WoK5TQ7umr4YB0CzUQp8pUf6uEsxy8a8MAnaXEPgkAsDO0J0izI3hp
	4D62cv2yYi+yn08ecdGp0AO0aMT8gAfirnqjkgie5vzGeg3aXnRn2jdbCkcGNRS3Q4pNOdMWRKu
	4MDVYqXaqE65B7BoaVRxbK7DbzB+7SRam/pRO6/Ckn+GV2JEFtadF5P7KGxGQVqcKwXcMSwjC6z
	Qpjy7b982Ew0ZsPMnqWq4lXocBYS8q/s5q9oMd7pJVd8DqM9JTZGfd4H7LI8fmiGat1yb9o53Yq
	AG1XOSicWe6JQFCvXH0+kBXKcRFi8N2FzJFMPE7wRQYMZ9tFRgP3wbUw6lsoPFKE9x54RyWtJOg
	2JdVZJUj7gf6vLhSIgdUm8DvY7L/ZQKn8iPWUcrB6pFJvoIxRRRJ1UPKK74ie0Fj5XlXYlEXoHv
	+4=
X-Received: by 2002:ac8:7f93:0:b0:509:1f59:1eb1 with SMTP id d75a77b69052e-5091f5921e3mr76127301cf.72.1773155348300;
        Tue, 10 Mar 2026 08:09:08 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57c49f23sm24848146d6.50.2026.03.10.08.09.08
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:09:08 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cd8a189f44so225036785a.0
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 08:09:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd32Ud6ZovnGcCxiNaInQSaV79dTml7zdwFEc2le+MBgPIxYyuJYpm1HupLLXlyYJEOdw=@lists.linux.dev
X-Received: by 2002:a05:6102:c8f:b0:5f1:70fe:3027 with SMTP id
 ada2fe7eead31-5ffe6121c90mr5181206137.24.1773155033187; Tue, 10 Mar 2026
 08:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com> <20260227135428.783983-3-herve.codina@bootlin.com>
In-Reply-To: <20260227135428.783983-3-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Mar 2026 16:03:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
X-Gm-Features: AaiRm53b7liJL7XJhyMA-JPl81LkjhC0Orfn04kAcG7__Cf3-wDY5cIOlphhcC4
Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
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

Hi Herv=C3=A9,

On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> wrote=
:
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
>
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=
=3DiEkKPNbNOccYmA@mail.gmail.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

FTR, one more user of get_dev_from_fwnode() appeared in commit
9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
in reset/next.

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
