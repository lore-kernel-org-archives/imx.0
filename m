Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E47F48033F
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902769; cv=none; b=SCm4vQ3lzBbmAtxYjP7ixkfchbkYN6cg4kB6RMrnrzOw9SplFmHe9ndmXtIj+TwaasbrnjsIK0NldC4jQak0duf0hrvGkg/qRBfY1bB3O/ITC6nHK1b5yc9DiPXjxlf8i+WBRjW751eIU6LfdiMDVdvRiQjQJ3lQEh2OlZZcstg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902769; c=relaxed/simple;
	bh=RFvjS155ZvdGD2YVXxfuKxFce81xapOIJy4GCdmvshg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HG8RisGwRx0Kd3aVl3z6ewBF4uS3oPTvhaLYKnRRuulNB60jMSMAVT6jRl0FGIZmjhkG5F6ZfEE+y8DKbAff5sFmA1UMWAxc/eWY//DD5aFyXNWe8paIoyMSKqF4pukuwGYH0E7y4fQVV07NCnV/0ZAiUyYXDOKCmEXGYoZ0dPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvGyEyl9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvGyEyl9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso75683485e9.2
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 14:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788902765; x=1789507565; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fo0YbEFL8wMrCYE2f1oBd51v/3oi28C2SOi3ZLEFoU0=;
        b=SvGyEyl9+zPIkI17wCaIpiXia8P3qtZIYb7p6nbT2NdD/C+Uy9KfLLX6VQ5ORZgpxq
         YQ4fuiHm7mkkExBgJI6LHYetF5sx7FahLof+4zgW2HRfTkQPjA+uWQbwqGyirQS7ibMI
         CqKuHdPJLPeCk80NG00MgxcTCorh/vtHI74Eo9I3DOOnihQmrXq/oX06hd12+D5jYQ1I
         lBxUNa3X+khhh7+EQOvRn24x6nW62FLbmIRDgX3PUPKSoJUB6yJ9ntqUfTRvZCZV+h6U
         M0KWM4B2nQebdB7R14P0eJcB/ZOOEKI/PV7NNSyNgPNgp5j+f2RqNyi/d5cZ1VuiPPXS
         gxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902765; x=1789507565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fo0YbEFL8wMrCYE2f1oBd51v/3oi28C2SOi3ZLEFoU0=;
        b=VSOtWEiooCSUHLSLwSWwz38pkhVR9CQAe2MnelKHgUg+d6wQ7jh+Wzjrpbe87RpfPW
         w93DSw++99tzFv4UsIgfnNKdtvLG66+8vf+FezMd4o2y1/V405unjcyags52DHKU0JqV
         nHVEeNjuYqhEZVqMqvjbBDUlyue4Ep0YZvPqHgV9rRrQf3HgZpvW+fSeZGe4oZcWZXjh
         Q49kZIri4oz99bVDOihccLz/Mwr6nxW8byJvVnJnIVIoJzXHgKaETEhLks1wyffXFF/I
         IcueXwM1tgcBh0iH7RrVW1YnP04vykDLPaHmOgjbwiT43UQMAMq0UIpfkda/0cd6updu
         CXGw==
X-Forwarded-Encrypted: i=1; AKwUvByc4YXafyUMbTOl5/IYRsxd06rITjcv9q/2YIq9+D5Ch+A9bP/goDqtFpmnywJhCWb5GSs=@lists.linux.dev
X-Gm-Message-State: AFuF++lxOUpTlJqCQ957hFlg3SvlsuBA/KA5Lc8IoPlImwJ5GOktbJs5
	pCF3XBRoanR3B1IyULMcpKsuuAqCu5PFsnzmGAtFr5zrBjSFLXcMv8zu
X-Gm-Gg: AYBFou0Ii9OlwZQSrT1VtGcP+P+EPl5B8SrZpxXsLl2ZnQozGQpXbp78J+1s8/OlRLB
	mJeDewlfU/Zf8o5k69AChOPmvR49ovhTIcCOZkhSka+MOhXXSMdnUYl9HSy/P0X3NykbhWkWAMs
	Ckly8LUP/eL3UrsHxim1feYYCJl5KenYAl9JhFjmcEM84UnpJCc2QvlCQWDJ5tS8rXImxH6TeD2
	UROYXOwS8St/C0kiAk4jXqrJV9ZYp4wslskbI7Tvs6C+wpHOhhuL1Pn/kZlNPcD6snHPG7GTaaN
	yvMxlOTqJTKFFiaOd1ujyRJNX+MCp1VD5UfdXxQv43cDj+eQDkFsDO518v1XSRvNeT/OKRUbq/W
	SUtjAa5iawRhFweLUkNFtkKP9P/0LBrv6WmskZvTxaE6orunnKXl8C5d+JCgR/Gfm6vUQ5wZeVj
	ZkaYdoBIbz8UCeKW34yGY2uvHHzcIOpK60NVXLL7SitM2v3bGF63ETwoQedCRwmWzS00W9UEjQh
	9eOBkBmW3HvMny8GuNx2iEhhw==
X-Received: by 2002:a05:600c:3495:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49cf8244bc5mr319923725e9.7.1788902765257;
        Tue, 08 Sep 2026 14:26:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm32433704f8f.13.2026.09.08.14.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:26:04 -0700 (PDT)
Date: Tue, 8 Sep 2026 22:26:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij
 <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, Drew Fustini
 <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo
 <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, "David
 Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
Message-ID: <20260908222602.7b2aab1f@pumpkin>
In-Reply-To: <ccd58677-5e25-1f9f-2bb4-d1770fce8ac4@fluxnic.net>
References: <20260908152808.3928630-1-arnd@kernel.org>
	<20260908152808.3928630-2-arnd@kernel.org>
	<ccd58677-5e25-1f9f-2bb4-d1770fce8ac4@fluxnic.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Sep 2026 16:36:47 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Tue, 8 Sep 2026, Arnd Bergmann wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Most sa1100 platforms were removed a few years, with the remaining
> > ones left as a starting point for a conversion to devicetree.
> > 
> > Nothing ever happened on that front, so remove the rest now,
> > including the sa1111 and locomo drivers that were once shared
> > with pxa but are already sa1100-exclusive now.  
> 
> The SA1100 was the starting point of my career. Feels strange how much 
> time has passed.
> 
> I parted with such hardware a long time ago in any case.

I failed to 'steal' a J-Slate when I left Tadpole.
(a very early 'tablet' computer with an LCD panel)
So I don't have one either.
Although that ran VxWorks and rtx-windows (after I patched bits so it worked!).

	David
