Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A5044C4EE
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586074; cv=none; b=qcIaTM+OU1y72gEhRAa+ePHlArRVTehAlK0VDYZsDsx3P0Sl51kiHC642lk2XeHjHD/OA0pFPO1qgWevU3n2wpfODUxGsN/tP5Ac15FAjLXGB1tiA4Sn7myMuKkKzVUW7DRJm03dIL/YtZWUFDkJHrYdOWFkDHqNiFDmMpI/xC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586074; c=relaxed/simple;
	bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F84hxgQERFa8lxaK0pkxxj5do2sQqa5e7JefKTEYnSKpEFjNYFxNi+3iMzExhNg6N+rMlDAZheLNp1kiQPJhO9y1AvwBkMzUjGgMPWer9lhao/Un7BSaQZ0PucMlo7zDZc+9391vPW8EhcvGAnaEbV0yIrgouBRZf08QWtuetyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjQY9n9o; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjQY9n9o"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so20683a12.1
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 08:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787586066; x=1788190866; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
        b=RjQY9n9o4OM9GQYgbETDYPtpGfu54wM2i9qOOyMlth+U/+qZ/0iZjeXmxzfVSBUlXj
         gsa/6UaEUyqld7KUZoIvOg9VX2AWWdfr343hYFeBuEkhQ+SGXYPv87XlQKTpMdTai7xS
         /zVUNvO7m/9AqMjsLe8iSJi0uDUpW3iP9UCPo+puBjdZ/7wj74Vlp2LEhA/6dUoPtZRr
         /22g0za7CYF/qPO3H7ruRtCMnpNomR/15kfUBzT7j8iE4FAcQqeu7qT8KgMoGngAlfzr
         umet351clsSKax95DMv8NhMo27MKLpzzTKQXKYCBLSG3l1D6sQciGZ+89hW/BcGo/wer
         WdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586066; x=1788190866;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7nzi9LdeZlJGO2flzp6bpA5/lhCxsE5kF1q18AfvrOQ=;
        b=EJvLfJP0P24RyeDmcNIqsGBsaU+vywnAouM9JxOvsMGDL6Aizv9XjAWTgAeRvgkBHN
         MwcKZn7lWA8v3g6rYfu4zHQ+gheet7iZfl1RQw46KEKp2AMNTHDhMbKRssBc8FGxgZ2w
         4TmQZ+4UEfHdQ3o3Kt4+cHz2vOonQieC+HWHgABP1jZMvYlTW/pysgCaI4KLGrIFkZCQ
         UNFA3qFZpBmOL7CAzSotZx02D93tNLCHQD/X/U9/iYLz3y91ONsmFrkoD5/5Bdf1cLpZ
         GXrPYcgeCdh0RYqhxRl/g0iSc7p/TUjzSFjiyea+QooWzuHc/j5DAbRCz4ngBalH9+Z/
         4m1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+cDI1BWMD4paaG9nPD+a5DVZWaKE+WNDvWp+ENGv0f5VBQIIJ4U78b3fs4wOEgURbkKk=@lists.linux.dev
X-Gm-Message-State: AFuF++k+OrAAsozno4b2ks65PDB9XHCenLm4aCoUeSKNPWsb27eL/NC/
	wyfCK88qBaq2LRBoAYINhh6PwjKwhuyLGXJvy+0USDdslVjPxcEY6iyS
X-Gm-Gg: AR+sD13te/aSJsMCGlTvwCJ8HX1aBjai+W1Eh+9M7fWViCcGR5NSt6k1/rppLIt13ex
	9QghGa+gIvLzaJw0lE+X9Zj8Y0Ulr9YQQ9+st2/j65qzqqK42HvVfd8uxT1RDYK6WXqPtpdHkei
	sEs4If6C4lR4JzmwPxWfxAEgrMVSBfw8P0EMtdc9xWjHUquvdCcKr1bRo6OR2yh5AbdFEavB6aG
	NY1CPyH/2UWiwvuTmvrF+Zw0+oJSb7mPztOcHX1/XvKRnGmTX3zeJ1WY39OeE2v1wZgHfGMh31w
	wjx3iDDDm/yP50v77/ey+uzxutu47lrdXVlOVRqk5u7lk1Bn2FRH3BgDM6NSoPTOSVtr6cRtfIs
	JcMlu9NewI2INl6LIxTbiMW9tZiullpHiCPcx30sFs5kYJMpcBRzFsPr4ohsNFEVnRcU5KEoAhE
	3mHsLsKM7BuA+nPUSBVvdveMxAys0pLmSyxTeR3ebsjlXM7wK77NJY/lUE35OMUK3Yot1zmi0kx
	WaWJ2dKUqUUtOp1zBY8xUt4B88aOma5+54rALqJMEbH0Dc64nXgySTw5OkhYGynLdA=
X-Received: by 2002:a17:907:60cd:b0:c12:8a:7d7b with SMTP id a640c23a62f3a-c24e2aa65c6mr12519166b.1.1787586065638;
        Mon, 24 Aug 2026 08:41:05 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-208-169.net.vodafone.it. [5.90.208.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b60asm1230685366b.9.2026.08.24.08.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:41:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 17:41:02 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <aoxmDpCMITmyuHHO@GLaDOS.station>
References: <cover.1787583584.git.stefano.r@variscite.com>
 <aa8af884a709961f155f855b8a480488ef4c47d1.1787583584.git.stefano.r@variscite.com>
 <20260824153400.119F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824153400.119F61F000E9@smtp.kernel.org>

On Mon, Aug 24, 2026 at 03:33:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] The ads7846 touchscreen specifies an active-high GPIO for pendown, which conflicts with its active-low interrupt and breaks touch detection.
> - [High] The V1 hardware WiFi regulator (`reg_vmmc_wl`) lacks a `gpio` property and relies on a userspace script to enable WiFi power, breaking automatic device probing.
> - [Medium] The `wm8904` codec's `IN1L` pin is configured as a digital microphone input but is simultaneously routed to an analog 'Microphone Jack' in the DAPM topology.
> - [Low] Non-generic node names and invalid characters are used for the touchscreen, audio codec devices, and regulators.


I'm going to fix these errors.

Stefano
