Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E5C275868
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982718; cv=none; b=Ttp7Fd5+wj8ZsXBsoP8/kVns7EzqmpV7PqmIqjTPq/b0HeYFHRg3BfTQlywf5S+hxqOnwM5SrPdh/q+7steDx8qLLNV8WB9R9lEmDYweZ3IyKwQafhg5Qzx1ncuQ4ZM53CUxa8ExsNWafOLn9Y3wI9rnrctOTQLbzOdTHBVkclY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982718; c=relaxed/simple;
	bh=MuXimpFpwwqcTDObiqnJJmWYWHO19US5y6oXa8it9is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORuUoe0Lyxwqrhpov5+vDfURhniJhu1vqUsewrEw0LEmkFHUIZmGiEc3wy5M5v7p8j/lqAc/PLURDB8d4S9OGo4A/Brzhy2TmMxf6ZsOM633NgzWHEleiE5gljzJh4U1M128clHSm4QoPdW1AH+obmxCaSMfZmxgInlc6cdkqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmueQT0x; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmueQT0x"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso284711a12.0
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 06:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744982715; x=1745587515; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVpxnI/29mpkrDRARmH1s8IOVcoXlXa8dMGnnZK1EKQ=;
        b=MmueQT0xuHgM8Aoj56QGKJvny2A9S1ZgaO6/ACngP98syYUxR+WhefIVyqLMFKvS47
         ig7cr84HaYCMx5ufkktlSMBQICezjqj4TsEVsq6PUO76FYwd2TEmlnc82XzFvQHiToix
         zYtn5bk0nKS2oPInyImfSKHLodDVxYb0kWQY6U3M+XAqu6ZvX2lqj18pG1IaljE0L/x7
         64DYJSs/ZtHjp98cDsXy378n6/zTKaAv8G9ewwvJ73mo0hxXLuqAGlmPIfHL/QFvDRig
         HMZuOQVun7jfoovPcxCiH1GBw7RqgbSaMvl+cMq0fgjU3MmVTKj+/uneh8mcEEnaIm4G
         F6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982715; x=1745587515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVpxnI/29mpkrDRARmH1s8IOVcoXlXa8dMGnnZK1EKQ=;
        b=uGyu1W/VeGT1k+Ma+nBZh8tZmQzuumV6uTSKy5T2MLM7flfIDaAJA+26MY+o+CRv0C
         WzVCGB7KvShzyKfAu7AedwHQJsr1OLSZ1p1hLszpdfcgpr0CzloJrRX8VGj/sbAfO6DA
         mna8NBe368uKl6XbzESqeKfBsf/1Hmawdf9nxwy3BLQmurgI/Y46du8DR42aCsjG8gAq
         pXoBbBOsw+QRm5+3W7AtNYbUVbu52o6wOC9oVTTxPBiTSVpY97WzSlcPrdUcmt7DaSWb
         hXbWI17ByFCBx2TyJ8+H1MoMWMn4UkKgvQIs5AfjRbVx839gHgKwjm5PKOXAQEQ7yCKB
         vZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwArACCATqsXjvArJSri5FNYI5rPJLl5N3yrA2xysbv9/IOMLgDEnzGKugYRMHVniK3OU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeIzQoSYkK1v53BhuWnZX7r0h4uR2d5/R47bdZ+6W8xLYFP/Oq
	MmuQpDzjZOiRPsyd0mUtCyArHPkHK+69326Deu5nu3Gza7QlPDDK
X-Gm-Gg: ASbGnctXO9VvMCEw7Irhc2gboeik/jhI03Lp4DvuVZPGF6w/W9dof6IQVzKktKcf9zC
	bjNX79w21c3gvWdTVTZVkOruRxdSLS+ZhJnZPtm5MebP+VL7PpBbubq9xHaBwYjJdcZtfgTkMuJ
	8fmil6l0h7ciZ/FQ/h+aOpWNKwqfvTGuBxupM1sj7T9E6nlfI2wcXEVIB0TE+oVRKQFbR0qCrj/
	fhU6Zh6XmbXclLqdQgjZlfLfiTPv7IlUdZdFFvh2oG7rjPzzqH/+Y61xNEZBDL4hYk4a4OCeyZ1
	jV3Oi34zGGxBapd7NeEUH3OZAD92
X-Google-Smtp-Source: AGHT+IHY8YYl+gLe7z4XbImJlTJtfNKJ64WGJaDAJCdf8mISh7qKy9awk9jjoRAY+BWRqWp8cGMOBA==
X-Received: by 2002:a05:6402:350f:b0:5f4:5dfa:992c with SMTP id 4fb4d7f45d1cf-5f628536df7mr802836a12.3.1744982714460;
        Fri, 18 Apr 2025 06:25:14 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef45779sm118202566b.127.2025.04.18.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:25:13 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:25:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Message-ID: <20250418132511.azibvntwzh6odqvx@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>

On Fri, Apr 11, 2025 at 05:57:40PM +0800, Wei Fang wrote:
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> index 20bfdf7fb4b4..ecb571e5ea50 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> @@ -60,6 +60,45 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
>  }
>  EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
>  
> +int enetc4_setup_cbdr(struct enetc_si *si)
> +{
> +	struct ntmp_user *user = &si->ntmp_user;
> +	struct device *dev = &si->pdev->dev;
> +	struct enetc_hw *hw = &si->hw;
> +	struct netc_cbdr_regs regs;
> +
> +	user->cbdr_num = 1;
> +	user->cbdr_size = NETC_CBDR_BD_NUM;
> +	user->dev = dev;
> +	user->ring = devm_kcalloc(dev, user->cbdr_num,
> +				  sizeof(struct netc_cbdr), GFP_KERNEL);
> +	if (!user->ring)
> +		return -ENOMEM;
> +
> +	/* set CBDR cache attributes */
> +	enetc_wr(hw, ENETC_SICAR2,
> +		 ENETC_SICAR_RD_COHERENT | ENETC_SICAR_WR_COHERENT);
> +
> +	regs.pir = hw->reg + ENETC_SICBDRPIR;
> +	regs.cir = hw->reg + ENETC_SICBDRCIR;
> +	regs.mr = hw->reg + ENETC_SICBDRMR;
> +	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
> +	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
> +	regs.lenr = hw->reg + ENETC_SICBDRLENR;
> +
> +	return netc_setup_cbdr(dev, user->cbdr_size, &regs, user->ring);
> +}
> +EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
> +
> +void enetc4_teardown_cbdr(struct enetc_si *si)
> +{
> +	struct ntmp_user *user = &si->ntmp_user;
> +
> +	netc_teardown_cbdr(user->dev, user->ring);
> +	user->dev = NULL;
> +}
> +EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);

I wanted to ask why isn't netc_setup_cbdr() merged into enetc4_setup_cbdr()
(and likewise for teardown_cbdr), because they sound very similar, and
they operate on the same data - one is literally a continuation of the
other. Then I looked downstream where the netc_switch is another API
user of netc_setup_cbdr() and netc_teardown_cbdr().

Do you think you could rename netc_setup_cbdr() into something like below:

struct ntmp_user *ntmp_user_create(struct device *dev, size_t num_cbdr,
				   const struct netc_cbdr_regs *regs);
void ntmp_user_destroy(struct ntmp_user *user);

From a data encapsulation perspective, it would be great if the outside
world only worked with an opaque struct ntmp_user * pointer.

Hide NETC_CBDR_BD_NUM from include/linux/fsl/ntmp.h if API users don't
need to customize it, and let ntmp_user_create() set it.

Move even more initialization into ntmp_user_create(), like the
allocation of "user->ring", and reduce the number of arguments.

In my opinion this would be a more natural organization of the code.
