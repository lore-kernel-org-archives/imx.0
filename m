Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BB32DC338
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 20:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767041946; cv=none; b=cHfCwmW7HUDWRE2pt9dnkkUqZVNSJe/+/Gqn6a5wdpsWap2LCjU+pGG9sH8fUM0vXi7BpZyfIlYt45Yv9zMAu8YboMXrUMVZmiHv7Cxi0ch+lpjpBmDQVSAeFOYFXxr+Sm+kqBLum9yIaeNQWaxymEbt0Kre7GPjiKqjHd9V8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767041946; c=relaxed/simple;
	bh=GSEUxsESE1/8GTMWfz0hBGHd90EMa8Seyja17ObPhrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9ia2lg61vpilxAR0KWIQAwqChsIMsLomNSXhM2rVhDAonnMVX7K2UTFxhGoFNF4TAWnbL4F7Ub8WJA6KEoKNd9L8lXtdiYfFJ5S558kS7b57kmqKAL/seWhU2pBqF+Zr3e1vd3FmxPAIdtwgXCS4Rx6b45QM8ivFefqyaOKb6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJrNIeUp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJrNIeUp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so4693492f8f.0
        for <imx@lists.linux.dev>; Mon, 29 Dec 2025 12:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767041942; x=1767646742; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mT72sLXnNV3V/jTjLvqc6CW9rW/yO+T8uURGolooNUk=;
        b=cJrNIeUp7ndbNjqC1RS1WQdMj5RyWnAYXwT4lDh0tFlKlkvjz12nP9TFthTJJ7NNKc
         ZNrOXHXkY1q9NkTs3F7EcK3SOSpf6DoHQmjI10xgkcvJv7Fa3d3H1SQFMfcSYLu0SMRg
         wKOJ/ICAVW3fO7QttYoGCOfT9IhcdpqKIQQfpUGjlZWr5M1JtLVe80yDTX+EDXqCMbz6
         2SQmSYox1jlpTcSZ3uruyE5+AHw+CMujNFPRN6uR9BAKg0BMLahanKJqEKxm9sOANbSe
         9KEM88HiqqvSyGvrOge6VbBaE7R+td5bKMw0Qy9aXJr7GJdhwmhYdw16MPG9KfiWlWhr
         3DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767041942; x=1767646742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mT72sLXnNV3V/jTjLvqc6CW9rW/yO+T8uURGolooNUk=;
        b=VxL7K+cETR6bMNAXlLivmG2f8StJ8vpiuIZ+sYe3S0lh5vYC5ehc6XSS+ypXLonFVm
         PoGApmMuspUmM695CLeCIgOG54XYbZZUogjWtCk89QaDBL/2n7V4Zw7Ms37bNSaIsdeI
         H2H3VRpFHn3Gw1bqSdhdb93pYXcj8IP4HShFxGb2+Qlmi72bXe7v2wf6R9+Ez3s2y0f4
         VQ0IOQl8BXZm6584TifnhupytdGdRbW04tyIMG1B8BRmZ1pDspepOlkMzaU2Z5efbrnj
         TcYlWKfXQKbzpSxpZ6LtYhZx8LC4zez2eYd5PxkfpHX2kQYjd3YcmvT8ijRqdD+Hw9qe
         xcNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQfR9DBbhPM+Tw8cWkFxJCVHp25qW2Y6HGtqdWq70LG0Kr3ZudLkyLH0kc4HbrG1pbX10=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOHxJ0HaIrY+iojBfrAUYD38s+PL+zBxZ08tdw4RZtjC8cB6gX
	+AgJ1wOUy1mdEdqpE2KB9UQIhZ8vy3PmG5vrRnvuhhKfo96ROZ9TwZXQ
X-Gm-Gg: AY/fxX4tQqgD51BQ7Iax90L5RwBMcPs+5i4TQDVmtJv2rm4CS4d8bq9tBzyqlUvCMB0
	fS+gnqX6i0mnd63A5ubxDK5Mjbv1vRRl91boQ452YiAPu+D0LHUg+dj8b27o8L2d2PiCrrjBt0L
	2NYgybsgLixeJW11bSH6LNP9HUVP3OEFI++GxDdI5WekihgOLLxp1KXh1TfY6jZ5jBnWN4tVAih
	HeKrfI/kCQCd5X3U4CIUp8C2AL89SEWU2dXv+G07+p0aYPfpwG6ha+/TlKwEUE4iTpY9Xa0q3mx
	2vnFfByR5b9Rmn+9cEnQ3oiXJNEHijPjhgbQr1oLMPrHPINuydGr7QUiPWQ3lYhiJVLOO4udshD
	QsVYWKTiNqgNYIGzzMucCKUPWnSlxHtGeidt43EYYxrG2g8hDAaKd/IUY8qecc5fq9iiLrJT/q1
	6MtT6aeV8zen+PJ7/pCyHFw5QjdBjADZvvAxEh5hjAp7ALON3G7bKZ/sG5wtEzRTxa8qU2Q/HfU
	f089n5sw+Iiw94PW2DuRb+X5n0=
X-Google-Smtp-Source: AGHT+IF+6dfGz8jAW2jy8V3d7wl/tvhBrzoFF1KjAPTCU32EzmQO5hO9Wctj+4CVYLo8hx4OP+5hSg==
X-Received: by 2002:a05:6000:186e:b0:432:4c01:db00 with SMTP id ffacd0b85a97d-4324e4cff0dmr41189328f8f.27.1767041941354;
        Mon, 29 Dec 2025 12:59:01 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm53784810f8f.21.2025.12.29.12.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 12:59:00 -0800 (PST)
Date: Mon, 29 Dec 2025 21:58:58 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
Message-ID: <aVLrkqgjrsX7jfYw@Lord-Beerus.station>
References: <20251229150421.57616-1-stefano.r@variscite.com>
 <20251229150421.57616-4-stefano.r@variscite.com>
 <0afc0945-af65-410d-8556-1d09792981cb@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0afc0945-af65-410d-8556-1d09792981cb@lunn.ch>

On Mon, Dec 29, 2025 at 07:24:50PM +0100, Andrew Lunn wrote:
> 
> What is this ethernet connected to? In the commit message you mention
> an SFP? So i would expect a phandle pointing to the SFP cage node,
> which follows:
> 
> Documentation/devicetree/bindings/net/sff,sfp.yam
> 
> 	Andrew

Hi Andrew,

You're absolutely right, thanks for pointing that out!

I mistakenly thought fixed-link alone was sufficient, but after reading
the sff,sfp.yaml binding I understand the sfp node is needed to properly
handle the SFP+ cage and transceiver module detection via I2C.

I've updated the patch to include the sfp node with i2c-bus and
los-gpios properties.

Sending v2 shortly.

Thanks,
Stefano
