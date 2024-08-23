Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4182184550
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724424171; cv=none; b=G/5/F2m9I3DwicGqztUmVBKj5cNhpWHMxJZPc7boEoUaRokBNWf2XwG2Q4EC73R5hcZVHlDrSf/8ZnSpcPwbLPns3po0k+nN7XHdObHj0VZtoZi6FiX9P6gA0qLW/DMatFEGzet6HZEWYVCwJGuWgyjC49BU5+XsFgS7wnEbMlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724424171; c=relaxed/simple;
	bh=/qfHppgrQzACRGTSJ/t3noBs4cqe1n90vsQH7YIsqSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krII01QwD1r+XqJb/QePly7kETMiKrsu9FcLc4DOLz5463IcT0BOwf4N2zOiACUqlEBc1pj5jUrO/Ig4PiYfHYBo6B/V4gktvjy62jxog4Z5eipgpZIPjbGxLOCSIzHDV5pYdh8H9PiRx2P+4L89b4kdjNR05GxSOtfc2O5+kcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/5S5RJI; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/5S5RJI"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so2930476a12.0
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 07:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724424167; x=1725028967; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LV5pX2MG/y9Od0ZypEKmss4zCvIjkPOalHMBZaJ1+Ug=;
        b=e/5S5RJIebeP6He+yac/6R470SJ+kU9wkQXIO5ZG7q6vPOyh6fC0F5cmLUzu44Zg1v
         t4vLhg99PWDH1khzeMGtahnMCQHlZWHfV/pfnHEHOE4sOVGNe8oiiX6dJNx/9Kxgj2Ey
         da8wR+8ye0dWr/2hOhFhBx0NEnFp0VgbaKQ/ucRH8QLnPO1j7wPMNu5Vdcbqdo8ojROM
         /fue9NFXF8b9UtvCekRH5SaX6YM1MhQHOqXr/Kx+azLoWw+C5YP7D/gBwAUOiAp7il3r
         7QkwOLiQ5Z6P8Yh6kyfZq94biv3e4jbyH1p+umf6IkGJuv0srpRBaQoTY9qWdDP+uTcy
         0EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724424167; x=1725028967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV5pX2MG/y9Od0ZypEKmss4zCvIjkPOalHMBZaJ1+Ug=;
        b=Dsvd5uOb/z0XeHpFQXMzebhHYJsYcYuwYUEqKWtiHbCzYyQ+1XZLmtDsArxtYGxyB1
         p+1VFlrAuBlJCu7CaiGVqxIsWe66P6HH+PqnucdKHZ7i+I8rSNb2E/4iDO8gVsuJryXo
         iMluW+0Aip5CKbJ5cZXbbkbV+eLVcFKdoJ2LhiWZBdM3VjAdNL36hKlcZPuacj179oiE
         VAB3yEQnOsOE+DGhhuTXbZb5sBVXrVsVLk2YLNYaBjKlCsSzuixv3vknsayd0m1H7cdw
         W7DHJE68SkUknVIvG4wh+hVQ/zCxc0gZ5VFJDccsDE4d9UznJxgjeHMtFnIb+IBXunk5
         Yulw==
X-Forwarded-Encrypted: i=1; AJvYcCXjsphsEpsvhgF1ENHz9CHyOATNH8e6RgRJOJduy4SR846yeU95yODAlAaQiGru/HCy3eY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0wUh1zUJXjz4gNYlSFbHhNl4qLuZFxXTeVXmcTllc0co61/r5
	V5wpmeNvRHcfxuAf+DML/COzfCUyuMSVYhFH7kqTj6Sy05k23N5z
X-Google-Smtp-Source: AGHT+IGwetwCqXvv36+SgUec6tmmzyF7k13urczzdeBDsGK/FPZM9wWzm9eMTCI/L76tBdldq1w91w==
X-Received: by 2002:a05:6402:278e:b0:5bf:257f:9ee5 with SMTP id 4fb4d7f45d1cf-5c0891a97f4mr1705242a12.34.1724424166808;
        Fri, 23 Aug 2024 07:42:46 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:48ba:80d8:cf77:1f49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a4c6ce9sm2169541a12.72.2024.08.23.07.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 07:42:46 -0700 (PDT)
Date: Fri, 23 Aug 2024 16:42:44 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <Zsif5NYIu4NR5ZfI@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
 <ZscNO2PKNlK3ru_7@pengutronix.de>
 <2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3>
 <ZsiTMITWF0Tj3o8Q@eichest-laptop>
 <ZsiXCqNOs0dHF379@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsiXCqNOs0dHF379@pengutronix.de>

Hi Oleksij,

On Fri, Aug 23, 2024 at 04:04:58PM +0200, Oleksij Rempel wrote:
> On Fri, Aug 23, 2024 at 03:48:32PM +0200, Stefan Eichenberger wrote:
> > Hi Andi,
> > 
> > On Fri, Aug 23, 2024 at 02:35:54AM +0200, Andi Shyti wrote:
> > > Hi,
> > > 
> > > On Thu, Aug 22, 2024 at 12:04:43PM GMT, Oleksij Rempel wrote:
> > > > On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> > > > > Hi Andi,
> > > > > 
> > > > > On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > > > > > Hi Stefan,
> > > > > > 
> > > > > > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > > > > >  		goto rpm_disable;
> > > > > > >  	}
> > > > > > >  
> > > > > > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > > > > > +
> > > > > > 
> > > > > > you might also want to add the multi-master boolean property in
> > > > > > the binding.
> > > > > 
> > > > > We discussed this internally and weren't sure when it was required
> > > > > because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> > > > > bindings. Is it still required if it is part of the dt-schema?
> > > > > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> > > > 
> > > > The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
> > > > every thing not in this yaml
> > > > 
> > > > > If so, I will add it in the next version.
> > > > 
> > > > Yes, please.
> > > 
> > > sorry for the confusion, please don't add it. I had a chat with
> > > Krzysztof and I will quote him: "this is a core property, coming
> > > with dtschema, so they dont need to update bindings".
> > > 
> > > He also sent a cleanup to remove the only binding using it.
> > 
> > No problem, thanks for the clarification. 
> > 
> > Should I still separate the multi-master patch from the rest of the
> > series, even though it doesn't seem to fix the problem Fabio sees? I did
> > some more testing today and the workarounds he found do not solve the
> > problem I see, so they are definitely not the same.
> 
> I'll try to review your DMA patches next week.

Perfect, thank you, no need to hurry.

Regards,
Stefan
