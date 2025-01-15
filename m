Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4250824A7C6
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948448; cv=none; b=kg7B8ogpC6a2sREuopsDVhAh7QkMeRCI1/uYQPX0dxIeY5sDIIIJdRpbfWe+LaTlXVT0Cd3V8w8LAf36ISzhUrEJcG0XU6WJbeUZ6PLUMw+Z/eD7/Aia/0yNg3NGgx7id6LHfcl7qMOcyJ/X6C1oIpSZcDou0kUpjB5bo9G4Cts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948448; c=relaxed/simple;
	bh=ISRDE4tD8KT2AQ2Zab4eqiKfiW9C+Hfm8FDKxGol9EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNgqIs7HVTDZ+P95X0+DicJpsbRCtJOXuoNy378yy3WWjCDKkdA5vuukqV326gqJ77ebU0OkaWQD4g5uCKBC3XiC6hIpxABh3ZUvOnqVoGyC5/23BH39i8BZraDfZIdrlMMYEhe/8YHxMcDh8c8+Cundh8smWNKzxnpel3g5t2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21636268e43so159245245ad.2
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 05:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948446; x=1737553246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjRxHp95fgWw/A/HfteiujvMA9qxAfC7IB/XFcENGNQ=;
        b=dlLYKY7znU5Gonf7iYTp/yhQwIUJeUAjeWhtvcWmLo+kNjyN5RH7ZWMFe4mnq2DOl1
         EOtCiX5fgcuawRbY5M0wZkMLjKlGfMLnekBSzZlOqzPU3n76qySkIk2UDL5C8zFJASqj
         DOJjwUKCGM50HWXL8i+zLKe8QQhj9DPfvN/I2SYYLq3FooLXrGkF76Gw4qQgWfmQCTyA
         1eJxgFsXhNe5UlVLGXDMMrBlRETgSLfsZKWCNsYYNEQ5njeeerDGABtbc7sO36+ub8XL
         pRRl4hz3T+z587STrfJcrCULKGUkowN0k/oredz18pW35l8/WYrCqKG0aSKXDVg8ePxd
         Jwmw==
X-Forwarded-Encrypted: i=1; AJvYcCViA+a97LQPISRIdLfJ4TEPmZJsIEI7eP5yEX/oCtu5SBLkxkOv2VV4iLn27/KfVBiBsOk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhO1/R2vptryh9oMXpk9Sg0Ve19T0M/uFO+QkWX6RIy2a1Yu93
	BH/kR8smZZPJ+/u7yzHfDO1lSPmI2LTROgtwlMlsJiPrRxhZWL3w
X-Gm-Gg: ASbGnct+fPsX1jlmF7Wb7x63nBctYNPU5BZYPYTOrWB9gVlv3FX8P6Tb1fU0jEF25eZ
	N9X+gcQOsCKEBVprMb4wC9eAwjF7ChuI3MRT9IkTRvJRS67HRLZjXg69uGsjqDG+xAHyc0xQHaw
	3FnDp2cDG4Kgpb0H0SqyUtq0b4ViTPz+Mlj0JWfuQPPB4GGkpjL+qtNCRHqcqgKTRw5kFUqCKzI
	C0R9NDjR8T0LNahwtcBt22ZAZtiVVzOJKOkGb4oxTOTbf8q00LH0Zvw9P3bQ8nj9JmHBXLIeBbq
	kS7FZU0mNy75N2Q=
X-Google-Smtp-Source: AGHT+IFBc9u2m9CIKKe0EemdS8o4PhYCZliHYxexP/9pM9Xw1hjCmQoL6ghLKLnHjOXUvJ+g6cNyvQ==
X-Received: by 2002:a17:902:cec3:b0:211:ce91:63ea with SMTP id d9443c01a7336-21a83f56f9emr450296855ad.15.1736948446445;
        Wed, 15 Jan 2025 05:40:46 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12f919sm82767655ad.69.2025.01.15.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:40:45 -0800 (PST)
Date: Wed, 15 Jan 2025 22:40:43 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/10] A bunch of changes to refine i.MX PCIe driver
Message-ID: <20250115134043.GA1049031@rocinante>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20250115130406.GS4176564@rocinante>
 <20250115130609.GT4176564@rocinante>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115130609.GT4176564@rocinante>

Hello,

> > > A bunch of changes to refine i.MX PCIe driver.
> > > - Add ref clock gate for i.MX95 PCIe.
> > >   The changes of clock part are here [1], and had been applied by Abel.
> > >   [1] https://lkml.org/lkml/2024/10/15/390
> > > - Clean i.MX PCIe driver by removing useless codes.
> > >   Patch #3 depends on dts changes. And the dts changes had been applied
> > >   by Shawn, there is no dependecy now.
> > > - Make core reset and enable_ref_clk symmetric for i.MX PCIe driver.
> > > - Use dwc common suspend resume method, and enable i.MX8MQ, i.MX8Q and
> > >   i.MX95 PCIe PM supports.
> > 
> > Applied to controller/imx6 for v6.14, thank you!
> 
> Richard and Frank, please have a look at the code to make sure that
> everything looks fine to you.  There were some conflicts while I applied
> the series, and I want to make sure that nothing is broken.
> 
> Thank you!

I moved this series to the controller/dwc branch as we have changes there
on which this series depends.  Hopefully, this will solve the build failure
we've seen on our next.

	Krzysztof
