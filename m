Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3130ACEC
	for <imx@lists.linux.dev>; Wed,  3 Sep 2025 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756918721; cv=none; b=gMh8Lf3OTrtDzHy3AioEeCp8r+HRYzLY1C+XDGTgWKFgIJXIO1mzP9wkxjy1yyuvjfbG2cpEMa7HxjsWaFqunl1O/ks49vOea1WII6Fj2CjG4OSowlwd4qP50QBuSd8Yfq6bEkSt2GBtXOJNtpTYU0eTlo4npiEQmOJ1j8P4PSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756918721; c=relaxed/simple;
	bh=TkGs/Q16BHI7DXoTIkX+6RznNkMj6Sb+IRZ1Ac9kGLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTmR6MTTFuFlCKzPEERxBsS0JkTu+sn552mrqd/WcJ0KyVrXexrwnSZVkEeYAi600Z/tdmNux62u0LFVXSi+rP++JDWBztfu8MoDWAeBz95UrOYp+pPld40tBdgdxvqpjZ9scXhiQ5EVGbCLFPCIl9knkO/649RKn49Y3c3OB0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Z6X8RKVj; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Z6X8RKVj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DE6C5C8EC77;
	Wed,  3 Sep 2025 16:58:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D04EC606C3;
	Wed,  3 Sep 2025 16:58:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45EB81C22C5D3;
	Wed,  3 Sep 2025 18:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756918715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=X8JKXxFGLFr1lg34extIQMyHHx91XLEaQpJaFFUz6L8=;
	b=Z6X8RKVjWC+125qn1KtGHRMQS1AgU+NL9bIKmwjGCm+oN5U+isOyk5qopp2gn2htYY14Cq
	7mWo3hrwN6UnEEH0+e9bnaUuiUQBtPid5QepXe2/aR55dubqvZLPNKprg1+8+1XYFwjN5C
	rOqde+3Ic04NkjBbATS7KG3YSN6orEfhNuYqvt8xWuhn2rFxP8vr44SK1YOCkXpn3Hojrn
	hCMMyofyqKjClO7rSEsB+6maSb4JNdtivsY7SFZ9kE6iKTMEQH0JzgHGeoke9quMEC8xa2
	WC4y0E+olAYx9RkSaFt4WpQZUsZ+Lx2YN3Nm2hFMOrr+ph96SZTaT9oc3IKg1A==
Date: Wed, 3 Sep 2025 18:58:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: pcf2127: add compatible string
 nxp,rtc-pcf2123
Message-ID: <202509031658298690ab12@mail.local>
References: <20250903165536.431586-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903165536.431586-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On 03/09/2025 12:55:36-0400, Frank Li wrote:
> Add compatible string nxp,rtc-pcf2123, which style is not consistent with
> existed compatible string because existed driver and dts use
> nxp,rtc-pcf2123.
> 
> Fix below CHECK_DTBS warning:
> arch/arm/boot/dts/nxp/imx/imx6q-evi.dtb: /soc/bus@2000000/spba-bus@2000000/spi@2018000/rtc@3: failed to match any schema with compatible: ['nxp,rtc-pcf2123']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> index 11fcf0ca1ae07..595c20df6a411 100644
> --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> @@ -20,6 +20,7 @@ properties:
>        - nxp,pcf2127
>        - nxp,pcf2129
>        - nxp,pcf2131
> +      - nxp,rtc-pcf2123

Nope, you need to fix the devicetree.

>  
>    reg:
>      maxItems: 1
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
