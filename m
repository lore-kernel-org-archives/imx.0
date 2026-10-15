Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A994D957C
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062768; cv=none; b=CvVTeVuFfhM0lTvmWsAwHpQvbr6dQc2Tx5HQ1p3bkIFvGw6u542pAbmcyzQQwRw4zuvTNcPwpv53IcInyXflUiIJtYKv6OlSfZXSugFEmvQBJ94UiugYJtGy7x+xo3V0thM9cEXwmrHcmQSyEkP6WQR5RUsGuGuFWdr+wHQUH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062768; c=relaxed/simple;
	bh=VREGc/jXj0Z0SXjsh8IXf33tikwFMJzZfA+YaVWVO10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu3KTi7OPRhAAqSqH1a2GDcX1NVbs0g6oQmMqvrSRV6qYE116youLHhIpLu13zcVEaBZpeX1yrj818QCgq2PTqCIEgAmsSU/N+UkOZ7SnCVhYqT9mb9ZddrptyT6bv4iJlN++sA4bc2hxKnte/pxFgNtI1KMRC/5bxfyRGPYLW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grqw1sCv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grqw1sCv"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso3249769f8f.0
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062765; x=1792667565; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=;
        b=grqw1sCvQB96NVj9CrjU05hBC+X2+LmRWO1Fw/0XmVuL3BNz/n8lcKOwMAkV/xQdhI
         igA30WOkBxhEnQf3CEoEKnMAxnuRMh5M/FFmigVF82SJ0loL2NG7FJn5493szSDZukEX
         XB+RvGB1odLJZ7I1fLDS8Nv8YVIO7mz17OgZjoM0zY86mL37V/NXwBccbRYvaGOIxcxj
         O4fBOKT7mmNxjcahC7iMlldd/XxsXjZmfXStv5eyOcbh3r46WKHH2heDDCvcdfXbqFL9
         NrTBFaukAlY7NDNpa7LikPM68dkhK8zg028bN7S3n0JMk6+xw2aaoei86o6DFl08tvsT
         k2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062765; x=1792667565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUqBmWmM5axrFUhnR3iwkhZ6bc0BaajgOPvb6M4hJIo=;
        b=SVjGjrBTnwpsxn94xmu0vUuMO8XOvTRdLu3yxcZ8i9PG+tpJFdf4sOB3OwJCXsDN7D
         aiRW9PL8yVZLgqALVwFmIo2SDo475XzSwM6D4crdQD9uAFDvM1FkrT4wVCTpythQyBVt
         uPXx7RCutFd+nR4JykU2AEWP7dZk2WjvPd2gcX44H+edIU1CYgUwF+0qi8K8qQKQooI4
         drCvMLo1vmswIn9qX39VUCOysxXtf8KWnY46VKvU/epWa6naLrIUQcf6wJtqVdBF3kgA
         OrGZOucWhlV4zmDwzb9cTXXCzkSApdbzWhuRSbvGaagnadqDa2GNJ3+uwJ+kb2pThbzm
         /vJg==
X-Forwarded-Encrypted: i=1; AKwUvBwcmpR7ef3yyARtCfOVcmfojn4Glz6FblZwNecD7pt9HptLAIw1PP9CUUhoECX06lHDwac=@lists.linux.dev
X-Gm-Message-State: AFq9FYKsyMWjdoMB876Nf3FjYYsR46R5+BFhxhg8M7odxFOhX9umtrs4
	za26eWoP4KdBHiMioHADhRb7/iZ8xXgnpzv2jgqjjnvgGCkO881qjr3V
X-Gm-Gg: AYBFou0VZhkzd8TdfhP6PI5rOqUQ/hmn/lc8KejB18CtE6PYzXyL+i0r6VqnSTN7xqL
	EApSXZJWwiJisycj7J2vFbQKscXGs6lxJfkqBNUEMjZouBipUUoYZgjEpdIQyB9zlcQ7VzCnKFn
	IosR50k+Gn1/pZQ01cIM09qiyvlxWHKwvkfURzDcYglj2qyXIcDmnyN+cZDGH90VqjrRvIcpnpD
	qYhxsCfIz58YbaNJpeKSXM0r54hNn5OAacheUWWmJOmWgOslaMR0jYBTzq+AGHJb90kBB1uE50A
	pFgSX9UcKEU6pL3kfLMgUJPWv5cys03/KlL+GmqwzrfoUFQTsTmJx9RpKpawMsNnzwCQo6v1L8h
	LP9jRVqhBD5JlC7ZSa+YohegcPCqjKYDVwXY3AZVBMO+ePwM7pnBU87jsB6tR7QgQ148YfXU3KZ
	A9O49d9bisY+xA58yDJC89y2PiQaiIYocOLjOpVKhzqoK6fqHGF4GgbMKQEYmNdfZdo8rlY3jxG
	E4t8uO065GzbWfQhbLkbL6tSQTuynIMZO0+Aix6heQx7ldx+24/sSOt0USH2mWAmXWIXKdk090O
	45o/cFgCn/H0BzEYE1JJIVuDSXPP
X-Received: by 2002:a05:6000:987:b0:488:7787:469d with SMTP id ffacd0b85a97d-48df14ed887mr6757337f8f.25.1792062764555;
        Thu, 15 Oct 2026 04:12:44 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc50e0sm24262249f8f.49.2026.10.15.04.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:12:43 -0700 (PDT)
Date: Thu, 15 Oct 2026 13:12:40 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atC1KAbaRwnrn-mR@Lord-Beerus.station>
References: <20261015081149.5919-1-stefano.r@variscite.com>
 <atCy2Li2wrPHhW8K@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atCy2Li2wrPHhW8K@shlinux89>

On Thu, Oct 15, 2026 at 07:02:48PM +0800, Peng Fan wrote:
> On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
> >From: Stefano Radaelli <stefano.r@variscite.com>
> >
> >scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
> >following run-time warning is seen:
> >
> >gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
> >
> >Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> >---
> > arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >index 3e590afa4fab..036afa0f6990 100644
> >--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
> >@@ -287,8 +287,8 @@ &i2c3 {
> > 	pinctrl-names = "default", "gpio";
> > 	pinctrl-0 = <&pinctrl_i2c3>;
> > 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> >-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
> >-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
> >+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> >+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> 
> I think ODE should be configured for pinctrl_i2c3_gpio.
> 
> Regards
> Peng

Hi Peng,

I followed the same approach used in commit
2b1d5d054d29e08926f05cfa30e34d149644585e, as well as in the other i.MX
DTS files that use GPIO_OPEN_DRAIN for I2C bus recovery.

Even in imx8mn-evk.dtsi itself, I2C2 uses the same configuration,
with GPIO_OPEN_DRAIN specified in the GPIO properties and without
ODE enabled in the pinctrl.

Wouldn't introducing a different configuration for I2C3 create some
inconsistency and potentially cause confusion?

If enabling ODE in the pinctrl is the preferred approach, wouldn't it
make more sense to address this in a separate follow-up patch, updating
the existing I2C recovery pinctrl configurations consistently across the
affected DTS files?

What do you think?

Best Regards,
Stefano
