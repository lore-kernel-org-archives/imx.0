Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3B406826
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555168; cv=none; b=bIjitqmNOh8zjm1Q1BKwLN2EzPw4IwTIXM4REAFNmvuh2duF1/rp0nYg2d4xwqAH1sA1qOR9vnffI6rfDJ9AX040Bhr3CBVTjVbPvJmDW23+pup1iTJdWNrDBrxSb3yx8p3SCNa2489tkNtAf98KZUBEXGIh/zw3HGt1jfP8KUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555168; c=relaxed/simple;
	bh=uXaikVFR1mtKR6RmfSvw2mwrSxVg6nZ6Dfz59NmUYms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQHpeL6Sq3MPiTseoudqFBew/7+JOzStuXy69Wh3oqXrS5V1Peg59q13OsqRwcHxdoxSf+hW6UtJ/KkHQhUJbdwBTvR7zRpkPSXPnsnlyx9rQCTaaKz66hyqw8ZuUBgkV/oEP95HfupcvAVT6uKiml+Ufx3heQhLVV7zrMzd9Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=kt/5APa6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="kt/5APa6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3071604b3a.1
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784555165; x=1785159965; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CiqM6HQnEYGFM1tqwPiFklMvqyJPy7ipNoK3CEVhAc8=;
        b=kt/5APa6s7POXJIbEkhQbtRW8B9wR+CxJHaLCSw+6M3A3rYBmbMnEfWLGFlUPQtaE+
         5OTBW+dGIrMfTUsSX/mDzPQtiaS0ZqKzsGHBSZcEta0ec54EeCmc85RvgfFf4lEsUzFc
         5jT0cU1ZcMz3QBkNz+Wyt9UtqWe8XwmebY4WaOxpv5G1W656djL8e8PIhsw8HSJAClIp
         IW5Uk9i2DmLwGBr5gfkyuGO0Fq6wkNskuocXa1D2QgU98EpBDfHa3XZg2aIEY8eNf8v5
         xbUHA/pAlf/Ds0bDVC/ChNXEgl8k9HEyaPBI/XoIWJQiYop/0t0mRbRbrAjVLj1EP4rB
         KA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784555165; x=1785159965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CiqM6HQnEYGFM1tqwPiFklMvqyJPy7ipNoK3CEVhAc8=;
        b=PupLD+ge4sTt6vf/uIzVJ9487EFZC/9NYCCV2FZ/GsSMFTFYYRQ0NAXkyVYIxpsXTH
         sT9q6hbAWRqAif9uLaLMFVp1bNjuzv932YvyPizSYMf0uc0BAJSL1MI+0RdSx7gc/1b4
         ZAyqzWixJnTJAxBBOzaBMgyUnEtvz46y+Q+Yqzxoyf3zlwPqU6SEr52JJTh9h7cgC99F
         SMDk7hcSP9gC/rjLQTLPMcz+AcIb5TNiOWsy4kSNsakLJb7Tl4zhsqWrg42kaA3wPbF2
         YHj8cpb+GRjO7JFQsKg00mIT8yEHoAqUoRB5VczK03XpGDDvCxrUca9YZnkOlFc9n/jN
         DKng==
X-Forwarded-Encrypted: i=1; AHgh+RqLX3ZSM0KMJIWqnFIncHoFUxcfb10RrKsZ/RU+qJJuKi+9QKAXfDjmb5ZW2QadPkplL+w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTzE9RMSCcZkdLh4ouOzA21kiWRuZMIAfw/sYuQApDuzln/tpy
	fYMZUxk3pMfcJoLR9GuGLQvBu9yFHAxAJfQR7RcxLQZ11TYbd6MwdSusJi+bHpx7pUilW0Sh/6E
	AI4vLk1rQR+kl
X-Gm-Gg: AfdE7cnwnC1zqJCH0Ep4RyC+PPSXFUyUXdfOQt6s4a311ZWRpxqmrbB/PvR3qCJjJ5p
	/OqCuwBEuquQaS4bn5wY3KXpFAJLaGz7QGp5JL8p6az+eUoKjsKLv4HPTAwaEOe6EsDBeFlQLc1
	2fW9WVxKDnxjdjAJHxhQ958skfX2L3W4ywX83vCHdDdTPCHs86MhtcxnHrKOv0PggVJ4xtm5VvZ
	u0aHxonA3bz7+kZiLsG573cP+oysDJxAlcVoVBVvpMwGeMGzDL584WJe81E90tXcoj65KLPNruM
	PrgWUAWI3ebOIYNQWBRM8pCYyvdTqkXbv+BREti0mM8X4C8WOHIRwPFh7KlepptypwPgO4dHFbh
	HCAWoDyy+W8dfx/kZuLmBTeG4Esi6ETCjikTaSQQkS5MFRkWfgBYKfbeRcMFlhjqmZ+4MNA==
X-Received: by 2002:a05:6a00:1390:b0:848:2f58:e1e9 with SMTP id d2e1a72fcca58-84beb54b717mr19266604b3a.36.1784555165506;
        Mon, 20 Jul 2026 06:46:05 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2e68e7b8sm5439737b3a.35.2026.07.20.06.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:46:04 -0700 (PDT)
Date: Mon, 20 Jul 2026 06:46:04 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 05/14] net: enetc: use PCI device name
 for debugfs directory
Message-ID: <al4mnM58+65TQnfI@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-6-wei.fang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-6-wei.fang@oss.nxp.com>

On Mon, Jul 20, 2026 at 09:43:07AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> enetc_create_debugfs() is called right after register_netdev(), at which
> point ndev->name still holds the format "eth%d" (e.g., eth0) rather than
> the final assigned name (e.g., via udev rules).
> 
> Use pci_name() instead of netdev_name() to name the debugfs directory.
> The PCI device name is unique, stable, and available from the start,
> making it a more reliable identifier for the debugfs entry. Therefore,
> the observable debugfs path from something like
> /sys/kernel/debug/eth0/mac_filter to a PCI BDF-style path such as
> /sys/kernel/debug/0002:00:00.0/mac_filter.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> index 4a769d9e5679..be378bf8f74d 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> @@ -81,10 +81,9 @@ DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);
>  
>  void enetc_create_debugfs(struct enetc_si *si)
>  {
> -	struct net_device *ndev = si->ndev;
>  	struct dentry *root;
>  
> -	root = debugfs_create_dir(netdev_name(ndev), NULL);
> +	root = debugfs_create_dir(pci_name(si->pdev), NULL);
>  	if (IS_ERR(root))
>  		return;
>  

Reviewed-by: Joe Damato <joe@dama.to>
