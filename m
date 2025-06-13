Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4FD1FECBD
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830204; cv=none; b=jWnIyv6DWrc32imvn2o6xfvDg8KWVdGVQGlkRJgLln7Jk+vO/Zplb9cxgNOEH0k8hbzQ8rzhOoBixL4pIB6TE5162vlh/0WZN6NpifixC2u59VBcpz7D1v+CdAUvmRkmVysB4ne9dhQ0ni5eVhRA8rOa2WB/2/FNmDTXUAynSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830204; c=relaxed/simple;
	bh=OwWwJMJMz1gVCx/M2Des8/aF3uScnadX1L2LxSc73zo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lia9isCdDn+IcmhDXLd2Q8vDRPSTI5AXPs4EZgDLbgPuPCZmBc+U41vrVvEqoPkdRbW/hKVcuiyBIkBcgVot/CkH7BeuPse1QyWWeXYqNBHAS8GPZnGI8H+1tvE0RTMl0aAT8DNWQaWgEigtIu+g9DagAb8GSOV9hLwnNOYdVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APNttakw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APNttakw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1455328f8f.2
        for <imx@lists.linux.dev>; Fri, 13 Jun 2025 08:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830201; x=1750435001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPo6H/9j3Ay9teefhcqMxpNsx0jvAC7MjlPzeeLu5rE=;
        b=APNttakw40d0mzxaUbKlzPCP6i5mHOqIQOIFF7PMXAgsrLfbaRI8tliDrHNDV0Uxza
         2c5kIcbLlVUvy/giECxy4eeGF5RhDXBmL6aYvXGUx1HDPR7KOHOga1HLoq3Fx7n+upEB
         nc7htfjonVARWgl21o2+UPq5kdJICHQ3wxLl5Myd7yg0zu5VbgSPz0TlsIMlCWg9e8Zl
         MJD+GV2tjJVWOwZAh6hE39Nv5rLbzHqwULy5jSgFCU1zW4KEOarxfyrs+5NLXfKmLxrK
         gHtXVCEhdAPyEL5/BNce7TR/dtBkrPbBURiWrfqkYkKxBBCYZj2zODp8DWkWn9pmCCCE
         9T7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830201; x=1750435001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPo6H/9j3Ay9teefhcqMxpNsx0jvAC7MjlPzeeLu5rE=;
        b=kzkSDmsS+UXO8O9G+Zw+IWhiFeqpdug4jyZgoVUMZpSYu2CelI5M5xtIwQ0r0mF/0K
         M5q4PSSH9jm6P9p4T8YHSlBefcY9pH1gN9+G91wd2VVmV1/bQbCzrP0/7zrW9tI5HgBb
         mIO81UQ+1ZhB1zk+UawV/kbeVgJueKIzNA34gDEOw0ZhnfUUF8UWp315UvAzLeShOiwL
         AWEt3+hHULXDThWnV/whtG93gIZ9YsDUKn/x0dL5mp3sSeai5jAf9K18bC90xbOmbYNA
         WMTIAp1JNaaFLQ+RZGDDA4Yd4BaOoHy8IZKtv0aHWjb3BrGjawPyNNgD4abc/ZNMWtBT
         UOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI7QNyuZxzpmfyYtMU40GJBTMdFHSqTN5RdfIffa16FhLT8PozAvw/+AmZ8iYWiNSkByc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGNBH83yAecgYlzZmVtvQqi1fMB4ByZpf8mtQXW5ppJ7DD3R33
	P7M6OYJoMofFmnAeg7j7GYbeviKfY/gLxMNFtBMTVFXHMYWFSK5Wu+Ge
X-Gm-Gg: ASbGncvtpr2jRGpXrsNSlsPZDdj5nRmomiloINoT0+kIuLL3vCuGXevNBbDZnYcLgma
	whcJZSidw1U6kj/nhKBU7FUyaNAvz/c80wPUnBV/UwXVXJ/3jb/zhnvrgELKlGHy+W/LBgsJE3Y
	1VRoXkf3jT6NvdE7rquFi/rLbdV81maUwoCrf9v3qvexfjzOl/Z7hR/27pdcpUIXaLsOfpxYDeZ
	eTFv1msfOUyvXmCq0TLfzGzQl33+UdFVslzvWxkgAf+yusl8I61kF2gq529LlVlqmIU/iSIe8Ht
	Fi3oVs5sKkgCdk/OHzfv6TuJPf28Dcv+7x7Ky0Z/V9EMoPonDZGBhLaR6MUgPTEQ7Xw5zFWbqnh
	oixqd4TzEokLprR2pkO5LegWv
X-Google-Smtp-Source: AGHT+IEek+xBG8qH6etYMJhHA/6eRULw+qWjFJ15S/9q/UV/dFart736CLdrph6JJHU+y3p0PfPeMA==
X-Received: by 2002:a05:6000:4284:b0:3a4:da87:3a73 with SMTP id ffacd0b85a97d-3a572e8cd82mr226657f8f.42.1749830200407;
        Fri, 13 Jun 2025 08:56:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54b7asm2782895f8f.16.2025.06.13.08.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:56:40 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:56:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Frank Li <Frank.li@nxp.com>, Vladimir Oltean <olteanv@gmail.com>, Mark
 Brown <broonie@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
Message-ID: <20250613165638.5d8ed000@pumpkin>
In-Reply-To: <d364667f-e0b1-4f1b-9034-2fadfd5d457b@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
	<20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
	<aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
	<d364667f-e0b1-4f1b-9034-2fadfd5d457b@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 16:46:36 +0100
James Clark <james.clark@linaro.org> wrote:

> On 10/06/2025 4:15 pm, Frank Li wrote:
> > On Mon, Jun 09, 2025 at 04:32:39PM +0100, James Clark wrote:  
> >> Using coherent memory here isn't functionally necessary.
> >> Because the
> >> change to use non-coherent memory isn't overly complex and only a few
> >> synchronization points are required, we might as well do it while fixing
> >> up some other DMA issues.  
> > 
> > Any beanfit by use on-coherent memory here?
> > 
> > Frank
> >   
> 
> Presumably less cache maintenance traffic?

I bet it only helps when cache-coherent memory has to be uncached.
Otherwise the software cache operations are pretty much guaranteed
to be more expensive than the hardware ones.

	David
