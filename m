Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18E421EED
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304692; cv=none; b=W3e02qIfJdAgxJpso8ofptMnlkC8Eimb937OJoWVwyW2C9Hy9K6WbX8xoHaDWFNlPvasJ3a/pBPONG1fMonkZ2ngkL65oRIYWPkbBkOzm4hbFrzxm2yhorupRTJbKaCt+4uPojdggY4NQHtP3VdKu/irU/u8zPq8ueGJZ2rXM+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304692; c=relaxed/simple;
	bh=53u9usEC+l3vwBwXF3+Mhp41VYao+L9mFhZ8lf78pks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fxg9cWxiK8rFadzufmxRq7N/+L+r5yu+wxd/NmpRwNriLqzTZYCe5qnG5PnB701Kdd07CF4oWOAHaLNN1flJg2V6bZqVvdo/LVTuBXbeJ+6bZTA/If45UtOMKtSKJqq0Jz/WCjamaYaVnFa6uEaokLMl/B3kowRROOnmIb8Ve1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfQwDQqX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfQwDQqX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so9370765e9.1
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770304691; x=1770909491; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z2JM3rR4cPCO2FOOdwxN1xqlEFiU78ZSmQj8D7T2YE=;
        b=UfQwDQqXtOYrx+8jwhmigF3kCLJWkSHTDnXzMUHxsxJ5vDgxEbQIR6iQWs/U8UImj0
         Qjux0NM1BeSNrC/9q5Eap95q3USyxXt+c7ON1hrlhebo3JR0DnOny6G5HYlO/IPDyUMB
         fUavTasd7kQ+ehoNGuTYh/XYk0YrqvskXOHN70KMkYV0bNJdhNncehsyIV/Ndbnvcuyz
         L2Sr5sZ81bPHOhS5wVuv5aOW7XV3gGYVT2qHdYTkvqBjhb0/NEhACsZL0ajvsrQTxsk7
         P+ifSue4k9gdNfD6dNjkcVzzNSlK5M6xwp4GiymDzEcD9S0RezFBK7FQj1b5JGjs25jV
         CjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770304691; x=1770909491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Z2JM3rR4cPCO2FOOdwxN1xqlEFiU78ZSmQj8D7T2YE=;
        b=ma8LZ6L6TY3P8a3Nzqfo+ncKnRJ53Mcfew9y2g9swPva15kFur/88oti+hYRF2LZ/q
         pSN3E8N9T9PMg1lLWwHUMG8ll3cv9Lc7EacNcA1MDmDSzxJUm14J7duSeP8kEZwSSvEZ
         uSgoPljN7aDEvL9JvhKFhITlUcQdxvNXefopzaEXm8WF48v2mjGzpYh0PMSG8rIdz1CS
         28ZTwhZIRmYY7HxodEc8phtMLOlHjimm7mGprDF14z/GD3ehhf6TRVDUgOl7PatMJduo
         UJZXdHOn358/2vsudmkFQf7Q6KY7+YGNdXEf3TdeS2rqQDJdTb9blw0I2yWpfPuhqMEI
         pDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUdtvun3+RH2YO0IvQbE/rLHdfaRDQPGlCIcZSP0YAaWj7uHmV0gzO3i2OvadO+GRyA2Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKINZgpwRFkMIWe2AhzA7jvnkWVivXzzmQ/JL+0Osu8Ca5vv+x
	TUSYzTqUGkyDWrBft69G3ju1UOAbqAr4FT90XeAsVaKWH98zAL9uv4TZ
X-Gm-Gg: AZuq6aIbWPvGE99riBLbfusle5UFlf9mqiJUXw20pXy3naHpjz/5m+KaZIkS8Wc5fnJ
	3zCjVptO9L8wW3PgSaj4beLMJeDhRrUTQmFHdUvbnbrghJndbmLDcHYpU39t2o/WBUYqLhT6CIh
	YnOeVIjwm4pOZBUOE+ccMjpG178/XRBuEJ23RDgKSUp/rSzImNNDSAc9PkEX6EtsZVfsMdM6mNE
	Zj4n3D/rDO6UI1Mapk6JMpNZi5jv90P+fLp7mfOwa5Jgq73bKWX1j4owZDRQlphjlp+vQHKZjA2
	hK33XyY5HtPfFR7Le4N04GDpU7uzlUAZVCYHMzrJcGNH6wpcPN5hwyUy4DvVtxG75PLRyqxG3+X
	BJ0rdoMJH0nKgzK4piENxJYjmij99nxQPlxRQv3F7pQRmwZxPRb8l+E9JSJ05/BWBjJnYVAWIRK
	Evq8OTbBMHg8EDJSL0j8AkH12oI1AleN6+kBg3jgONdFvcac61dD+cXYhYSiogQb/TQXZKzLzdQ
	m0IeX7niMT6xxOskumd1/rNjTZ0zKhcTK4=
X-Received: by 2002:a05:600c:6290:b0:47e:e91d:73c0 with SMTP id 5b1f17b1804b1-4830e9669b9mr94695125e9.19.1770304690503;
        Thu, 05 Feb 2026 07:18:10 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe6a99esm60711595e9.7.2026.02.05.07.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:18:10 -0800 (PST)
Date: Thu, 5 Feb 2026 16:18:07 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <aYS0r9jxzyh1567Z@Lord-Beerus.station>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <aYSykvmfuYrJhsR5@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYSykvmfuYrJhsR5@lizhi-Precision-Tower-5810>

On Thu, Feb 05, 2026 at 10:09:06AM -0500, Frank Li wrote:
> 
> where your v2 change log?
> 
> Frank
> >

Hi,

thanks for pointing that out, my mistake.

Would you prefer me to resend the same v2 series with an updated
v2 changelog in the cover letter, or handle it differently?

Best regards,
Stefano
