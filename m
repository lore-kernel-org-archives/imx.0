Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECEB78F5D
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738565851; cv=none; b=QPuML6oNMNuUkqcU7BxIZp5PVuTYVlGQYqA/4Hi52A98zmXHeSZmwlASJOBUslE1yFGvDYBAIv+ZDdaoT88cIdFXPtMbhSnwSwPEfvTBrOVUP5mQqhok8obKuYPQLp8goQ9VUujsAfk/u9dUVgfqu07lBKmVuQCnlDvr7JKotG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738565851; c=relaxed/simple;
	bh=Dnm7Dq1UIHp6/LaIVBzQmOcnhfi7C5T3vPn99EjoNL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NS4P5Pk/qZyB+L4mr/EGh4eLlRLHQafaY/VT5xr0YO08rKtz3tfncQBg95OMQ+/zwh+ssTvJ3+EmFzmMETsgXKqfYIRcpVmJcp85muer8eQGlhW9uvY55mB27pjw25r1TlUGySkA+wCtQus8CrRUWoLtzLZzVHYxKY9XEV2H4q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=JH42Up5Z; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="JH42Up5Z"
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=JH42Up5Z;
	dkim-atps=neutral
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 986F292C
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 15:57:28 +0900 (JST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef728e36d5so7822650a91.3
        for <imx@lists.linux.dev>; Sun, 02 Feb 2025 22:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738565847; x=1739170647; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=;
        b=JH42Up5ZBWvfVL1fwGBHDtXTA5gFdhV9lVJc/kP2hIpAoIhBg5HoX8QwRmQroR8wsA
         IkdG1OHYX0WWJIe26FvgBkvHGoLCL8xwgiCa8Xl8118+ZTz+Mec/4PPUvpGw5fcLDWnK
         999lnuZ0a5bjDcUGHMzDxjtQfwqg/OZ+LgtfWBJ1AzjxqnI6Zmdn5K4RsUIZbM7uMhPY
         rSjcd//poWgNvVm8JB1ZeAs5DXm1IuIylyqLbN0MS1rgw/PVH07voRo1CiEUZuYJsXc8
         VTmfVSI1Up1bL0XD2pWmuwmdW2YWzjphA71vzDIgUlKj4Wsj0BuHAnJs1urrjPrDyH1m
         hQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565847; x=1739170647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBpu38zoJhnbBuVt7xq5HkK4w7WkM2eVS3E6Ag+EQIY=;
        b=n9vaZDyw5ZiaQzm1QHbWlWkQBBuYnnOgiNJuIRKt6YugnscWF3GMAAK7xxOIwRl7ww
         w0AKT41hNe0Uz2PgkEH93jSiIOukHjGeuXwQnlh6qcYnCWXcf9CC1JLctl789jSNTLHM
         YLo12E5A1fx8m6518XDOJ+3Ki+qRI1GkIczaDw5ed9efGAd2hDc7MiZC54xFFiqyo43T
         1E2WvqXU2fEuJE71ND0Yd44IVRPAQollg0v1s9O5Hw6A2dHaPuD2cTtDS/+mUBJqNV4c
         Iyjq0ECQhlJP7WuPzgzwG+rYr+j/s1Ynh7yPAjcXIEn5o7T+RLGlzqay+hmE5xBZuyJc
         toBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzAJIYsXb8yQVXqIlFKEVQ+Zks+mlvItgp4rrSPRf5TGimjR+6FCBOIHsA6c7Hgsh8B/I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBOEBj9t31HlOgF7qYSDumx3wPOtZN0PFf9e1IWcjilMxap1Vg
	N/xLm05oH42a6QuSN7cxCzdLQwEsGcH6mTfuI0xbBF2j0WFTEG/+K8hwX++2zgBvqCXBoYZrLQM
	CyaM864DQoQoPKC8S0RQ8yH+n2NdxT+dOgxiOJNIGyzZ6wCS2tmA=
X-Gm-Gg: ASbGncs3NlT3q1vULh/eEHYUkhtBvYR/HYj9uQHnu8Sv4zkKZBv4qzbuG/WPKstbr3L
	XTaa8FCkFW8L9n5yNDUP9YNA4q0Qec1m/TrtyiCyZLqWirjssqBsujlHuZ0IE1OWjB6mcGBxJXR
	pDb9yygOMy4jCQ39J5DM9msSF+3HgvGMd7VTaMIlLtV/hYUfxZVkIrBIY/HCCTakjfQhV+N4Fmi
	2qym/f+8SJtt0JY3LjtQ7Okdba19UHe2LRPtR1hT0YcwRTM+VrZrZYAr28Nf8CKRgIar1xy/TG5
	OAHUTiKbO9aFzQZY6uolw88oZb+JDiv4D+ExsrhsMOeponyba8T1KN9O+dhG8Gji
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr26047449a91.26.1738565847617;
        Sun, 02 Feb 2025 22:57:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeQG0nwmZr51/0vcXCzKKQK+KfHdJ43jCCy1lp4o7bkMpfm/h39HEEtpxsyBUKAvfYNo9pgA==
X-Received: by 2002:a17:90b:2c84:b0:2ee:b2e6:4275 with SMTP id 98e67ed59e1d1-2f83ac65958mr26047432a91.26.1738565847216;
        Sun, 02 Feb 2025 22:57:27 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31efbcbsm68878385ad.30.2025.02.02.22.57.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:57:26 -0800 (PST)
Date: Mon, 3 Feb 2025 15:57:15 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: phy: mxs: silence EPROBE_DEFER error on boot
Message-ID: <Z6BoyybpbaLet6jf@atmark-techno.com>
References: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>

Dominique Martinet wrote on Mon, Feb 03, 2025 at 03:32:05PM +0900:
> Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
> [    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517
> 
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> Changes in v2:
> - removed redundant error message and now useless braces, thank you for
>   the quick feedback!
> - adjusted message alignment (that was also bugging me...)
> - Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
> ---
>  drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..39b75199d11c6f9ec21174c20d0465cb79c133fb 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -769,11 +769,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(clk)) {
> -		dev_err(&pdev->dev,
> -			"can't get the clock, err=%ld", PTR_ERR(clk));
> -		return PTR_ERR(clk);
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
> +				     "can't get the clock");

Looking at the usb251xb patch also made me notice this is missing a
trailing newline, but I'm surprised because it "worked fine" (I don't
see garbage at the end of the line in my dmesg with the old 517 error)

There's no other missing \n in this file though so I guess I'll just
send a v3 in doubt, but I'm now curious if it really is needed and
couldn't find anything about that.

Anyway, sorry for the spam, and thanks for the quick review earlier!
-- 
Dominique
