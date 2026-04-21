Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ACC3D8106
	for <imx@lists.linux.dev>; Tue, 21 Apr 2026 14:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782280; cv=none; b=qU2laEeZJ9wZgjmNoIOjVlKq5yVIDWSEexkq7mvVTAj8oPkLBCAi2ujq3p9D1aFSkRenxe674drikauT42AVb674M35UGZW/vCOsZp1WWYg2DWiA+Du5TG26gk6FZw70rwSVZz940cZ7pLFk8wFT6zA3yX+oLUljF8DIXAuqCVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782280; c=relaxed/simple;
	bh=AHJgGnpeX5LVzY/GceNPIBAEzVpq45DA7bIyL1jAogY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4alfwG+RmD33WvRTJ4YyXItan7QZBwwp3AqDYyRwYbEBtJyemSnXeDLtUHsumk1WNlPaRBzIClpAeA99FNhpN2zSDiyu3dtKAB1xG33Wbe11xYRjtAfsBFztF+NMMj5BGUtBSPpdrzDe7HCtxwMChi99GDz5rEuaL5Prz5YDDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BN/Dlwu4; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BN/Dlwu4"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50e5b55062fso19956041cf.2
        for <imx@lists.linux.dev>; Tue, 21 Apr 2026 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776782277; x=1777387077; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=47UOho7cFXU9Cx0PBlLkPD/xoymRf95gp8yIK25T/BY=;
        b=BN/Dlwu4IuJvlUGsXoQCO3aeyXNxCku6GSHuxoa6hGhG0FGz1wmOeo6KOVKdqgSIWm
         Lj94Etn4HBNEGu87cEhwQj93UuogGJmiT/Ugbop5w1gTcj8LoP+v1y6+dznpzdsEjAGi
         HtTUsb7xpXaV4UNe3ML/oxaaw+xVZjgDNdDX9DYWcYDeZOC4Uj4DPF6jkxBUy8l1hIpf
         +2zRjVriK874XcFsV1TfYP7cFou5NLxYMXZb1QxijQgxi9+Rxai3JUN1yS9vysdCH3xM
         Lsoe2GGVkioGzREc1+TZKQHMvHIAQjeMqVUf3pco+nY2YY+WpAm7GtIAYtiQrSXTV7Nz
         GLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776782277; x=1777387077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47UOho7cFXU9Cx0PBlLkPD/xoymRf95gp8yIK25T/BY=;
        b=qhGwYplchr9bdargu5lMnicUQ0GXlGHDoHmoomtAs2gvjbrUDqmfwaGxiAqloMKMOp
         TB1n909I0HTWkooZoj5fHqf70iYjW9Hn70v7E/10/DGsRk2QaBNM0BvO7HV+prWproyT
         COoNT7zpVlIojxFaTxdMfkk7oKHNeTlEKNIDJ3yq7u3iT1MLS75XpMAITRDjWNse9/pU
         hhuSx0HCc9PWaIy82A3EYNcJtJOqgrXkTP2uv5sVjWD1S163fcw7TOpyRHQCUIBSAsBa
         AckA6FiHILkH48Bj0UpmNjhS2vf/lryirsrdXxQMxEkDkzttBnYdncD+QOZz6bFIttLG
         77pQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ElNO+Suddyez+YT1sk1XhTFvwX1SYErt7MovX64wi1vvGFj2D5TmPV5xP0YTd/F6qeW0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP2rJV6W+IjbeFoqM1vGv2Ji64Z2wR3fwGZGh1gg6BPYRjkHII
	URoYtGYBC2QIwDQ4hK4emO1JAlreNnh3ab1LgI8frERiNJ9VgMmVjr4i2HQEeu8d7g==
X-Gm-Gg: AeBDiesaF2vd150r9yhCnIgCna1KPjJ6qoWJozr7eS93RiQ7EA6+5zLTrpfWa9GCDDa
	/+gcFqzSeCLUZhsuMohtAvEjGQLupZHz38OL9H2Nnblbzq0wu0ycX4Uk3ERHraXoLlF5ZN0NOFc
	I7WIXW9GMDl5qOlnSPQrlhrvGReSamib0PANEV6mWX+Bhz+EPt1TflAWTviL59mQHeCCTH/pN1O
	LyLVspkXinSaTrKYqRS2d0U7BUJwNI8sKXpO2xd8ZLrSZ8pgT5kODIvQnLiW86flK5aSvepAbun
	QbHk2uDH9rFiia6IWyIeSB7HVeHM4OixC+LzCVTgELsR4q0HDlJkJ01zv8zNZ1xJobSbnbSUkuF
	Ce0gwfPYkcCtqdnMo5ECMKGSraZffRslUTvOaWgrNO1Cuh1uwUQEymlZJLVFJg8FSoc6qcr/82Y
	LTrxUoR5mSabWqBap4N/cQ5NJHPAk8Ki1Cht+mjWriu3aR8A==
X-Received: by 2002:ac8:7f0f:0:b0:50d:6557:5c83 with SMTP id d75a77b69052e-50e36c1165emr233206841cf.25.1776782276532;
        Tue, 21 Apr 2026 07:37:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e5d5ecffdsm53553121cf.29.2026.04.21.07.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 07:37:56 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:37:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, khtsai@google.com,
	kexinsun@smail.nju.edu.cn, hhhuuu@google.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: udc: skip pullup() if already connected
Message-ID: <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
References: <20260421082050.1260823-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421082050.1260823-1-xu.yang_2@nxp.com>

On Tue, Apr 21, 2026 at 04:20:50PM +0800, Xu Yang wrote:
> The device controller may update vbus status via usb_udc_vbus_handler(),
> which tries to connect the gadget even though gadget_bind_driver() has
> already called usb_udc_connect_control_locked(). This causes pullup() to
> be called twice. Avoid this by checking if gadget->connected is true.

This patch is wrong.  To see why, read the comments just below the end 
of the patch and see also usb_gadget_activate().

(Also, is there really anything wrong with calling pullup() twice in a 
row?)

Alan Stern

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/gadget/udc/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index e8861eaad907..be29daa7ad3c 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -712,6 +712,9 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
>  		goto out;
>  	}
>  
> +	if (gadget->connected)
> +		goto out;
> +
>  	if (gadget->deactivated || !gadget->udc->allow_connect || !gadget->udc->started) {
>  		/*
>  		 * If the gadget isn't usable (because it is deactivated,
> -- 
> 2.34.1
> 
> 
