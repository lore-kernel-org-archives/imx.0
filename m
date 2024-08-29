Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F2434CE5
	for <imx@lists.linux.dev>; Thu, 29 Aug 2024 21:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724965438; cv=none; b=bdoAsQB5z9wXhbG+0ewgC74liFGsg6C8n/0dTQv92KrQM0KaRtlNwNKHNrAJUdRWVASYD7HwQusiiIH7s1YOc7yQo58vBDjHIjt7HmZeFiTEwNL8wMcr2JvOKmhBgUKcV4TGs0dLqGPVYyEfSnbwbh+obaVprHen4gcFlCbOGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724965438; c=relaxed/simple;
	bh=f/3CcU9kx1DRhP2xmjnK+4VqbvzJS+x+R4np2vRoChc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FvOk6TLshgnWYgZpXzl3WTwbDnGnCoR3GqfXvKvwTfDYklRD95S5lt/wQDqQ3pGk+B8/ixrDNkKqFybn6MR4L6VSNq8Eiz22icmFiPlc0qXZ7UZ/aZGgzK+JcOaHUb0PecZqs6PaNeDjva4AHgl6fLqQsRMxXZmsHJhX55isdBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A62Y5I6V; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A62Y5I6V"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-70b2421471aso626818a12.0
        for <imx@lists.linux.dev>; Thu, 29 Aug 2024 14:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724965436; x=1725570236; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+eq633davczny4idsI+dtvpXGHNdvyYd6tkYsOl3+o=;
        b=A62Y5I6VpHhBMBVxoeiI7SZHvoUs4a1fvV7ehy+pnYndIVaeNyvKySqI31rtrjEHJ7
         3S6f+/++xXgnoHjTPtnp5JeqoiTtIcIpq5SAl8iowEcvDx35JN2uA2ZtzWJeGteRchwa
         ZgAEKWljYO5OjcIsq3aaI1GH+RFY0RsEQGrLHFtIzDFKj2m924wwg7jBjXfjB5jjB8kX
         aQLQc/a3O+SJZ/S6ONzNvvtJkFqmrKQDU4yr6GgdQFy5WKeRVZ9Mkmg3J8HVtIUhwuAZ
         W+VIX70IgqpJ8/9RYxIa27oiSHQKuUjrFufadEJFNSRHg3s6xN5YaWtzJ8YkMLP8YKB3
         beQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724965436; x=1725570236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+eq633davczny4idsI+dtvpXGHNdvyYd6tkYsOl3+o=;
        b=YTuQPfPxL+EDbADnGBH8IRN68U2Juo6bZlCZQuTdKC9wdT85e4BJ6xZ8o9+og8yMCn
         COxkcgK6JpccEq/h+FFHu5tjab1N4mTUEtrPlJ2T6GYShjU9e8Y0aLG0mSLZQXyTh3Zo
         cfBAGzPikGojaeEq180/UYt4+EgBkKyxBi6TPO81V9PQgZzmseeJnu/k2DPHZbkGIesD
         /WPFRiiiTxMZBTXnD8YlkmQIl36XpJCqOeJldnG5mATnDtjOrLVCDPEQVusQpTjktQ1l
         JGTJWpwuTonjnACPcw8gzGF9VgcC2Mepugrb+SXrIFHx0HWWh9cxAlH6p2zP6qB6ETAO
         UKgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+UQkUdoup7UL9emOU6YbJLnnfKZYPK9+aG3CYIoMEj2gHKuEHj61NTKS4NasxZ1LKQPc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHjBQpYGP520fAkkiCybFV7oRJNvrL1X9mAolbAvBqVg7WW8Xy
	Hknjx9PNfZStdiGdjqcyNbKeqRl6Ov590UYomPjkaqQ6t2+sPKJw
X-Google-Smtp-Source: AGHT+IHtH7SEWGs7imBa/ucRnk9MchQGT6ba/XQus7juUQ0mHiwRjP4hPIgaHURQQuI3486uKczqPA==
X-Received: by 2002:a17:90a:ec06:b0:2d3:c675:41e7 with SMTP id 98e67ed59e1d1-2d85618a52emr4335212a91.7.1724965436485;
        Thu, 29 Aug 2024 14:03:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b119b9csm2203357a91.15.2024.08.29.14.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 14:03:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 29 Aug 2024 14:03:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jdelvare@suse.com, krzk+dt@kernel.org,
	lgirdwood@gmail.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v5 1/1] dt-bindings: hwmon: Convert ltc2978.txt to yaml
Message-ID: <1bde904b-7b17-4406-84aa-97742c8a02a3@roeck-us.net>
References: <20240829150641.1307906-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829150641.1307906-1-Frank.Li@nxp.com>

On Thu, Aug 29, 2024 at 11:06:41AM -0400, Frank Li wrote:
> Convert binding doc ltc2978.txt to yaml format.
> Additional change:
> - add i2c node.
> - basic it is regulator according to example, move it under regulator.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb: /soc/i2c@2000000/i2c-mux@77/i2c@2/regulator@5c:
> 	failed to match any schema with compatible: ['lltc,ltc3882']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied, after dropping "move it under regulator".

Thanks,
Guenter
