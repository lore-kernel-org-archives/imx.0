Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5DA3D
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 21:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719525225; cv=none; b=C8yawJ4JyljzbdoAlt7wxwIQT22Iq7wK51R6lqnKCzhqg/uPCLhZNZdGDc0YRTsTZoA/lzt8bMbke2YlejhnkZbWRwZgSgMEzI7S6rRqsfx49PWKT4ix4QjPzVgeut4MZ9Q57V6OitJBR32qX9ThJEc0/dFND9D7VY0FjHhL7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719525225; c=relaxed/simple;
	bh=U7A8clRBR8yY3OiIGAJIPF3Dri5hzryL27vRbcT/Nds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqjO2QB35zhJOo/sc6YLQ9wswNqzyEZ5RHtQu0HA9e0l0usLtM0SgXx30O23smxB5/GbwOYamgz5ojKyRedk8fzGcw183FDW3vmCfn3Iq0Yr6nbK7+LJxhat2wXTON6dVRWe5qSAH2PPPHwACloal/E96FVZYOpkRXGjEXEbWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJfmz/5O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJfmz/5O"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso28607135e9.1
        for <imx@lists.linux.dev>; Thu, 27 Jun 2024 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719525222; x=1720130022; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QiC8OyZo5GtQNpDjXs/Yb176j6rjJFHOHOaqhOxIjOY=;
        b=XJfmz/5OF7Rk6NO1BWfQqXLF6qnkJ1QtK0PEW1a7++RMlOuMCSkFeQ0MLavcYN0PUY
         yrXcOnrdpbmG0sV+FZrACtYejirzY1Uld8+59oYPAKFsLicuqXa/LUIkPutHSQukuEy5
         MbDXKdTLcduYVm+vIRb/AV3MiJdc1SL/pAAnqp6LF0pYWmZT2MfLHtgFOmWHQdmYnXk+
         t6wdFsVy6sDGG4zhmcudrwx24qvBBTHPKlGpV6Odpa5vYA48XHhO37/Dh1635zC5PZW0
         MkKXc2qhOxXLdUocYgfZXu8F5B/PEsh4XVB3nvNGtMO5IvTFBgwQ0MUobtn6tQjzg5/J
         e3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719525222; x=1720130022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiC8OyZo5GtQNpDjXs/Yb176j6rjJFHOHOaqhOxIjOY=;
        b=vNU4x7/y3mwdFpN29JAborxyFArfbrJ2Wt3FJpMa8GY3FC6p2FVfxehklYFeF6yTYG
         Qg/zVFahgXxGitdj6ZEbpelNbeoHGOGXYIbgxK6v3eL6Q3F8jy/SGmje6vNYAdl2AyZn
         kc3frvpYmBTW30E2+vGvfe+2Px3x5Q8u2DGJ2vFjIvmX//mLamN+1rdT8t4/Xb3EGPmK
         982gL9X+mvTldR4weTkMoVf/bHv5wcgY88g9W+4R6p9rNTrFnUsCMH72A5STPc3uml+B
         SSdvpn1y8FLvBwpsmearE4LetKDnb0oTbN1hbuB0o2vxM0rVEycbQwv6gEs8dIOdACMf
         5Yhg==
X-Forwarded-Encrypted: i=1; AJvYcCVMwNMVW6ZfTngdEO3XO1eYYc5ipEAtFI5B1z7F3J38bauaHVSIrqFMZwDbZpaehQ98lF6qdiuhOjYnflEN/ZdUHptX
X-Gm-Message-State: AOJu0YyRr+gVC1MHz0vF5YcBelxtoZMttP73hjO3VU1Ud81clmKGMs/P
	ZR89NvfDlvYrW11Lu28jaHUZ3Qo7jDsz3jbA7Qaf5iRLQtPmh6cX
X-Google-Smtp-Source: AGHT+IFPuvuGJJ94i4NKhFeIfuJoJov7wY5cyHstcVN1Fc9I1AyuZ6EBpfOPhEwan6qRgjLBbTwknA==
X-Received: by 2002:a05:600c:3042:b0:424:aa40:88ae with SMTP id 5b1f17b1804b1-424aa40890amr67416705e9.3.1719525221682;
        Thu, 27 Jun 2024 14:53:41 -0700 (PDT)
Received: from skbuf ([79.115.210.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5ba67sm8712375e9.19.2024.06.27.14.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 14:53:40 -0700 (PDT)
Date: Fri, 28 Jun 2024 00:53:38 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE DSPI DRIVER" <linux-spi@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] spi: dt-bindings: fsl-dspi: add dmas and dma-names
 properties
Message-ID: <20240627215338.qrry6zpkusw5nazw@skbuf>
References: <20240627203308.476437-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627203308.476437-1-Frank.Li@nxp.com>

On Thu, Jun 27, 2024 at 04:33:08PM -0400, Frank Li wrote:
> Add dmas and dma-names properties because dspi support dma transfer.
> Fix below warnings:
> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: spi@2120000: Unevaluated properties are not allowed ('dma-names', 'dmas', 'little-endian' were unexpected)
>         from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

For the contents:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

and FWIW, I noticed this as well, but didn't want to put yet another
roadblock in the conversion of a binding which was way overdue.
I was planning to send a patch as well, once the binding was merged.

But... to whose tree is this targeted? I only got a notification
from Shawn for patch 3/3 (the device tree change), but none for the
acceptance of the other 2 patches.
