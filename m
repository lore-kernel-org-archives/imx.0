Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAAC32FA2C
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616967; cv=none; b=MOfGLv1vKTYW/BQm8kLPFy9tQkbKQyqL2OkQ+V6kJF8KPTZzDQe4PnTFFvg7J1IXPGzPXkw3FozbK89kZgDZ911smPlMoQnr1sytYIQ77Ylt8lljNCsCcIRePIAGdl0eJBonvYaC41xNF1oOuUaaL30RFWo6wnnmrPnNKOaxP8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616967; c=relaxed/simple;
	bh=LZWEskBsU8lieDU1+oZ44DvMo4dcwO7j0DMpykCV7Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWXHV+b24c22L08+SpF/COnqoYnCNueS2Tqfer85kyx8hCWXsw10TPxJmLQyhQRrsO1cQSklb6tn84Zocok4gAWwJ8DBtgcSg4fL75ONylC7kbXbQQ/1T96FD1Alr0eUW9tu+TjakPFNarDhy+EA5DaqYsT5w7IsfrwoCNNp2J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EljxPJkr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EljxPJkr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so141778505e9.1
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 04:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767616962; x=1768221762; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6FWi4UMmKWtBKBjWiuhONQOF6ehNZanQAGIzU2PCLHY=;
        b=EljxPJkrFRyQFGcY9kGCz6/E1nGEfxlKHNYzWb9yHhShEQZYRPY5qR7ppWofnd15dy
         9H0FQ/H7GW+42B8UI1Sg6qQmw0HfHnflwDoDoWN/XuSCBKzYzVzpKqxPFbcwV7QLV87A
         cpks6gmZ6Bb5/ZaMEs/MiodPIRv/F4CcLYC0vupOTYC9KNMZmzLS2QIq/h9/0ZNRwtfD
         KxH26cO7GZAzmfKp2nixmwTgCv12iF5KdpF6Omk4YayEBBhWydzqTKr6wn4r9l+uUyro
         AYSVZ5GXnkH0aCdK0lKoN8E0s7nGL/jqNtS5lXytC8+UNeVM+pHIR1ZjUe2xXs/1rfHQ
         n54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616962; x=1768221762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FWi4UMmKWtBKBjWiuhONQOF6ehNZanQAGIzU2PCLHY=;
        b=JKv0ecgjS6Wj8ya0R7ShrUE6/LcNurZXDV1u2STxl0sK4od7FFp60P6HzXhyLDwJ37
         iL8jwbYLWdYRMQdhiZSy2uu2lR9rWDs+rzW/7iKhmhAeWh/LBpxOfOsBwJUywJmR8CmE
         zlBbTkd8B8BkqN4SSDNKcYqUdlAq6txkoLpQ3Xct8R3BvDxjJfxn5H5xAgSenfE18uiq
         GBJWl7MJe0h6fqOv2Cb5+67gG5ML+M2+77oZud6WAcOcHVJ4EHA5LIRryS5R/O5L8ZXS
         9V/a+WfRAug2eJ1bbSfGagR9wdAa3aWX1irlveZfT7743Y8MtcMczXLnGHHvgWW7EbKt
         7/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCULd8dAv3E3RLaUDbtSWe3ZsUcN9fcV5uh8dyGh5VEP8OzsXFJUGZAzhJdBuyAY12AK7i4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwRI3EgIeK8Wr/DCqd60C7zIgjUqvzCW5Gy5nKre4uPTOA6LVV
	59nZnU464I+YuiZFYOlrJQ+yC4uihRYhSA8RttU0YXNg6l4o2nFpQXtl
X-Gm-Gg: AY/fxX5etiTQMi+dp28kR2RJYe2agEyX3Bpc0y7Ld+4ObUur6ukHaHC/LiEwFwyo3GH
	OfOFpM3FEj+qre/bwLYDpLw497kQ6m7q1bQLS4RO4Octori10PX/tR2XjjCsB7TJDHdIoyFsy66
	h3zgdKWDits9o4pkw/TuPb3yzUY1INmbKUlSVBRn0tiO3P9azWm50OXkDKztk2R9bdiDzOVocea
	ACx8INyfS6miUlhv/e2QwO1oFciXtS8pE98cXtwGl5fq5ERu7FVmuBvUJ2EwvahVJnzKE/yWhUL
	35LbA7lcboCKqm6XqdwvV+VcdiuD7Jy3mqu3IsIUkrSClwg4T116MC0siAp+aQl/TrgGfrPui5A
	+SotWKyecC36+1l9RD3jFYNWq7cwEo3LT/3L9kOZBVxpWWd53wuTYuJooiqKjdtbdRd0gu+Z5dN
	jYdUReViMR/sc=
X-Google-Smtp-Source: AGHT+IHtGtvg4uT3cboCMh8iga2sewapNAHrP9JvUocRuk9xAXBp5Q/b/VJsN4JJTeNeQfvMRiCunw==
X-Received: by 2002:a05:600c:8287:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47d1955578bmr717393225e9.16.1767616961956;
        Mon, 05 Jan 2026 04:42:41 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2721sm100277452f8f.39.2026.01.05.04.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:42:41 -0800 (PST)
Date: Mon, 5 Jan 2026 13:42:39 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aVuxv3Pox-y5Dzln@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>

Hi Maxime,

On Mon, Jan 05, 2026 at 01:23:46PM +0100, Maxime Chevallier wrote:
> Hi Stefan,
> 
> On 05/01/2026 11:02, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Add a fixup to the stmmac driver to keep the preamble before the SFD
> > (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> > used on an NXP i.MX8MP SoC.
> > 
> > This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> > states:
> > ENET_QOS: MAC incorrectly discards the received packets when Preamble
> > Byte does not precede SFD or SMD.
> > 
> > The bit which disables this feature is not documented in the datasheet
> > from Micrel, but has been found by NXP and Micrel following this
> > discussion:
> > https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> > 
> > It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> > 10MBit. Without bit 2 being set in the remote loopback register, no
> > packets are received. With the bit set, reception works fine.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> I've also faced this issue, however I'm wondering wether this is the
> correct approach to fix this. It seems that all Micrel / Microchip PHYs
> have this behaviour of discaring the preamble at 10Mbps.
> 
> Some of these phys have accessible control registers to re-enable it,
> however this register/bit changes depending on the PHY model. For
> example, on KSZ8041, this is register 0x14 bit 6.
> 
> We may end-up with many many more fixups for this, basically for every
> micrel/microchip PHY.
> 
> Wouldn't it be safer to just always enable preamble at 10M for these
> PHYs, regardless of the MAC that's connected to it ? Is there any risk
> always having the preamble there ?

This is what Rob also suggested:
https://lore.kernel.org/all/20251215140330.GA2360845-robh@kernel.org/

Unfortunately, I'm afraid of breaking something on the platforms that
are already working, as this is an Ethernet controller issue. As I
understand it, the PHY works according to the standard. Since the bit is
undocumented, it seemed safer to only apply it to the i.MX8MP.

However, if this is preferred, I am also happy to always enable the
preamble. In theory, I don't see any reason why it should break
anything.

Regards,
Stefan
