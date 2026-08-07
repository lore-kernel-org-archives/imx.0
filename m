Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC8E353EC0
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120880; cv=pass; b=C0CDjJJ/Rcn14XtlRy1E9L+/VVgsy6xSynlUmPGHgEXUhGyT9jx0PlHulrQaakkaIKL8BScqLHE+QmTtYAH0PQv+7TUXGmqXaQOfzdH0gtoBHxdaRopF0zP0if1WcJubuTbI+m0KFZaDTL/yIXeoADWXj4nL4h+dKn9q3N2Ta/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120880; c=relaxed/simple;
	bh=H4YOFrL1KfBu3NDle8YUdni3Mk4BFwaMFq6LZ90tQgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObUu2ltHh3UZN32lWeinwFJIF9JnAXy3uWVGxHZ1uUPWwzxm25zUqx/oCeppI3BKiEOmj6j5q5YaxkTwhPIYEJAmb5pjolNjJ7x5KEYpCJg79We6HKmRLqfJLDmdXmPwuEUmJNt/ZXtOndFmayD7tdG4ECfusbqv5dmGYdWMT2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRsMWIlq; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRsMWIlq"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-969524c1a63so2517568241.0
        for <imx@lists.linux.dev>; Fri, 07 Aug 2026 09:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120878; cv=none;
        d=google.com; s=arc-20260327;
        b=XxgD5ZCt0zlTjJfv21a5ftOiAbgilNGs4FZ9fwucYvHCkDPm3eY64qs8VVFl6Th5dJ
         9m72BZ977lVxi/jgeLh4pOruf3/zj7ZgZHEkefWsN2mk16goCJmrQZNHCKZPKK6xHH9f
         Hmi9PIhZmVfr5rrRWoQa69FoyXmwvM8YvrBJhD0z837HY6MZIkFriUUZqHrvI9MVi2T3
         2qyoNSfd7xDi11sA7qT2BbFW3d7nIdSyDk/NhwCcZ4aXj32NjGOGbXqqXVcW69/JJayq
         mJQhjBPwPmARGoRL17Jb8gPLGaYUD1AlnBt39Co4ttrKKjaruUj55WOP98L0VgKTDUZV
         droQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VbYKBFSni/MXYcTbspULgZDCuPfk5qG+Byfv7cl+Zzg=;
        fh=0r5RdGfe0zc9aSrgX2st5gG2ZH6GOmp6dikETm1x6TU=;
        b=jiWY1qe4egdtsLGrftMe39cII7CnluCC2rmnQqVOCbY2vE+RYA7TGo6JQQ/jiQVH2a
         Qv5U0rn2SkliKI95AlvNgLuYHm/l8tCYC3H9xawm/V0CFd3g5dI63cCqUrp6UHIcTsCk
         jeT2JbM6rH1IOl2D9i+b3AlEgCFmztjqb/oLD/sSE92D3S7ofc0L2B7osuCtsN+Q+arQ
         oYrQvd4H3Rt5ZnbS1zuXVQi+BxFzuRvSrojBeGrW5qq02FH436uJHxiYlfzKuGxMqAbd
         h7hLPqhAqdLBw3EehO+l4nD64KORQz5O0H6jRyjrRY8eQfkVhXJ2bRwm55e+lt94WbWG
         RyCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786120878; x=1786725678; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VbYKBFSni/MXYcTbspULgZDCuPfk5qG+Byfv7cl+Zzg=;
        b=JRsMWIlqOdRAZNZJ+ObBSLLKMQEICmN7Mh8CCZ/0NIcRjE9EJYUAYE73BsOXh49Q+T
         dFJkjPcexYAJmaFSnD0r1gLFuLUaArTu4l6UtWC1Zy/M12RDoKKrotY+aa06SRV7aHLF
         95FKQiSEUNUW13j2d6HQSKmcL4/Vaws3ogtzgwxFvZIocfv0tjPt9EaZb8UC7EcJhg0w
         +yvxfTQ/C0hDAoJB4cfVdMgOU/GEKMFoWrm2vFYqG14DAtjr1rUYW/1UroSgrTfvjG7z
         yv4b0h+tkjkkmu15VxaSirES4eBPJylk6PI/aVo8Tb285TDZ3hJDxhV7VWZZwuW0wsgb
         x5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120878; x=1786725678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbYKBFSni/MXYcTbspULgZDCuPfk5qG+Byfv7cl+Zzg=;
        b=JPvgUOquPZ4W12scb5puoUJOz7fGNsS4YVyiRTCLe25XHlGBlHVNHya18aMvov86cv
         WOptmHuTaHMRyjhe7TVcAQ/3FPNqKU/xgpJD8yhAqw8PgzE3V+VyJIA0S+OmAdhZZoXQ
         oWP4va7v9h3zKpts7BJ0kQ8V+ZQ9ToScEhxknFQ3gbSze3cD6b7SSOV9SnRV/1cMAp9G
         OI2U2Vn5CzZbkF3DXQBSpP7ma0mAM8r3gGEXoiW5pnmudasOHjX4/zFSi9nW+Lk/oydm
         d6Jey7RJi7tFnv8zl2757begGu9HfplQjVcqtukN/o16a3c/q9RXs9mSB7b/aLNnF5ax
         fj4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrsPhoU5A2b720wOiS5bOGUv4phiv6TxOwcDTH6ma70rHj9By2hukmq/ClpTuxdqAWMrNg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8mEnzS7d7rKTKg/73+gAojI/cFVf6NjO5IcxxeC65WOPlMzog
	a3qHMzHzBTOoP9t/oYkH3+dF2KLVernnoglYqjClIHdxc21G8+/PXt+lb0jjL0bmK//wzLET4dg
	DTDCPrgjfisd7N0wOs0GRcS9BItQTWpw=
X-Gm-Gg: AR+sD131rYWs2buX5g161K7KyZxJcT3oQhYmaTzqYIo6XyA+N0XdmCEgS7wFKH4QfZb
	esDgceLaXo0y9EZlyKiCos6XwkratseZ24dEKFJbEyoZ82NxncbPwUA6Nmh8QTF0X67pmhbALjF
	yu1DI0GqvzHVLmowj0ZogfKsC7bw55hKSX471RktTXcdJNk9hiWAmWiOH+yruJl/25BsdjoAUkQ
	Gghxmbw2NhRh6rzM4Bu9JRvH8k40u7znTLe4JZaNk61hn0RkWZopbQSp7R4lYmcYXroHZGVW9Zx
	nIiuql6aU/ATPoMt7PYA77lqWyMUWXXgrrAPSp5bCAucfRvxVOhg5Ly3fGDj/xwb/EsOGT1OG4t
	mkFPK3t5C0UIHvlFZvdln3fKdUxlEA4rey5fC+1dqMMg5I1Ro83TKsOWtzNz+Rv4F8xgJjWbo9A
	QlidXLgR+c0Cy/GpaLKAYITsnCbeSzt6kDhxnA
X-Received: by 2002:a05:6102:578b:b0:737:5c42:858b with SMTP id
 ada2fe7eead31-764e72c3a27mr698784137.11.1786120877713; Fri, 07 Aug 2026
 09:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch> <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
 <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch>
In-Reply-To: <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 10:41:06 -0600
X-Gm-Features: AUfX_mwLDixIRmddCRIK4ioEeGf1D4LRV-vMQxIFETRbvqYEEeJik4zuAKwk_IU
Message-ID: <CADvTj4qxGVw+PW2LeF-a3h1XfmirQZGfJA9-6Czt72XASbVLBQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 9:10=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Aug 07, 2026 at 08:59:47AM -0600, James Hilliard wrote:
> > On Fri, Aug 7, 2026 at 7:16=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Thu, Aug 06, 2026 at 09:54:19PM -0600, James Hilliard wrote:
> > > > MDIO buses enumerate firmware children only when the bus is registe=
red. A
> > > > later devicetree overlay or status transition is ignored, unlike on=
 I2C and
> > > > SPI buses. Supporting live reconfiguration also means that populati=
on and
> > > > removal can race address scanning, PHY attachment and bus teardown.
> > >
> > > Please make the bootloader work around the issues, and drop this
> > > patchset.
> >
> > This is just fixing OF_DYNAMIC for mdio now, it's no longer used
> > by the AC200/AC300 PHY patches anymore.
>
> Meaning it has no users?

I think OF_OVERLAY depends on OF_DYNAMIC?

I guess it can also be used like this for live dt modification:
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/t=
ree/Documentation/devicetree/configfs-overlays.txt?h=3Dtopic/overlays

> We don't add code unless it has a user. To do so pointlessly adds
> Maintenance burden.

AFAIU the patches other than the last one are still relevant regardless
since they are fixing a bunch of generic mdio safety issues in code that
has users since MDIO maps already change at runtime through non-OF
paths(i.e. SFP insertion/removal).

>
>    Andrew
