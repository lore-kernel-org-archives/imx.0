Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC972F49E0
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620292; cv=none; b=BpSbSBJi34+aIvkEw4+0dQ77eRwc4DECZzBQMYz8o5drvdx9DmF8fJIW/oubSig1TKlsH52vHYre6tqKVvNnMTLT9mr9lGz3FQrnQjkrLdcVtrZ89u/OudbfKhcsFxMXJFsaj6M0etM+lfymZ1L+qg5xL0R0r8PCJVxhrkY6dOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620292; c=relaxed/simple;
	bh=U/K6TYBPGbFygsv68xo28nwKyHeVOgVII1meYzdMuSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFXpdx7fnllvxMadXgHJKHbV1gWWSI50kL5qS/LNs8QbePN+QzuuUEOcX22I5kEFhFFoWhxxUMJ7vZVMZtACOEYnvFikSRaOzEIUUeTU+CIFtBRyuoOEjTzDsEUdqu6+XCFyrViaJR/0vkXIZvYdtmWxmDReW0+//a8FtgEDTik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fatkUajM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fatkUajM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453398e90e9so4263325e9.1
        for <imx@lists.linux.dev>; Fri, 04 Jul 2025 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620289; x=1752225089; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BxPSNuI1K+0U+zGcMRGFuPmBq+1SIMVgn3s+fjE3jI=;
        b=fatkUajMbOltfKgTt6nZwL2cCSZRU1aB7rYhfo7Gz8wXlUeDXsMx0AIux8N0K00Bec
         cTtUOcWFCF2IHn2Ot2Td0O5Kt+aVCxd+cjliZEFjWjA3n2jv/L21zqiCQvWJ+LbBvsg8
         9TvDm2PSKQ3mhKZ+zGP1PipF1bLw3Av3PKobufrDR0undmOtb36eZL6wxM/x17vQvjF4
         XFX4kUo5aYLaLxe9a6Sca+Y1gTW4pYqnpitJJFhovJPfUeNjfh97+e5eTIqnRcZxWeXJ
         bWEWYV8PaIdf1gR7+0BEdnLKZSWVR6wFM8M1jpOoDwFJ4VFSsev1Mt/2kwBUJhArapQx
         M40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620289; x=1752225089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BxPSNuI1K+0U+zGcMRGFuPmBq+1SIMVgn3s+fjE3jI=;
        b=e2iCpaquYKE73NeqCnFHXAOO/94I/8R7c+FcsgWFvb8PF6w1cvGdfoSTotDjOG8KjN
         crHe+wCJz7aqYAx5qHddGjzHemgIefjOEN58msTp6O4vQju/wu04mL2mH0G7yrwPsmk2
         afuE4OPXN5BVE9MBD2nw23jLz0lL8pIrI4di3XwHB+XU/bJ4of5A3RIsAckkvoF5FGbL
         Z8S2dH/+Is49+QOGwGPRA9XJ7Ms897XqQR9sTveGQalnrbbG8CMaZx2g46MhxG4o6CIt
         n8pxp4k9NDhlOmHdVE+i62h20lxop+7CVn/lqN4rGJwpoBZ+MoNSxOQKle2HTe0YlNRU
         x69A==
X-Forwarded-Encrypted: i=1; AJvYcCWq4NtGX0CMw2miX35dT2sOlVRXB88XmYlnXMDzEDDIDxuR72AbmPe4UNpaFWelwMdDAXk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBn5GjCbs+7tRB6l2VQiycEboiKBanTDlQdszpp16+TzUF8NTU
	9XcuSkeEYCVlhRyhSJFowyjkLE0+9l1A7/TszKE1iHob8fgIB1E4pCJt
X-Gm-Gg: ASbGncty5++DSYT4zMaK49d/o93KF7xdjFdpQaYQiiIZlNs8cJldbbTknhJUcL+MDDc
	MPXMIeiGvb/sjbRcaHbtSApmNACw3EfecKkvHcNNIiWF9KUwIqBNXY3wQOXQFRDg2iAXPJANO70
	CNqSm45NHO7xjwoTTgSeVN+7xfGhH+GH9xAI9FeaTn/ZL5raBIf50+H0eMUur/N2YdbbnS0q1Fe
	0uQH1y9/1qRuPDw1RweEGS4NO8gX4jEcflsQMp4hvbP4S0mQOGVcvffPhUh+4OOYORxdXzTl3KK
	2PXnxEJmt2SMWRifW+hKAmhLbG1AVWTgvHXbh68J+lkVRU6uUOm1vEBkEeYkZhdV18R4AgAgHmV
	lSVs27krD695xUom010OBbb5ksGo44vRg0sCD1uUnq8JjI0OG
X-Google-Smtp-Source: AGHT+IEifZ9+Qoefw6C59P68ghxiOjv/mmB7vnLxOoNgNMQhGBq65x9dlLFXIorvyQQpoQF/016xrw==
X-Received: by 2002:a05:6000:2f83:b0:3a5:8934:493a with SMTP id ffacd0b85a97d-3b4964e56c8mr1521328f8f.44.1751620288471;
        Fri, 04 Jul 2025 02:11:28 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcececsm49889865e9.23.2025.07.04.02.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:11:27 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:11:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bastien Nocera <hadess@hadess.net>, Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
Message-ID: <ycajp5zwm65aauacebivz5773qhe2tmhcn7wqhorjybarfs5qq@su6kxog6t66k>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dd3rsrobpe5enhed"
Content-Disposition: inline
In-Reply-To: <20250704075453.3222311-1-sakari.ailus@linux.intel.com>


--dd3rsrobpe5enhed
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 10:54:53AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[...]
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 0c7af44d4dae..554b03e3ae92 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1394,7 +1394,6 @@ static void tegra_xhci_id_work(struct work_struct *=
work)
>  		}
> =20
>  		tegra_xhci_set_port_power(tegra, true, true);
> -		pm_runtime_mark_last_busy(tegra->dev);
> =20
>  	} else {
>  		if (tegra->otg_usb3_port >=3D 0)

pm_runtime_mark_last_busy() was previously called conditionally only for
host mode, but not for peripheral mode. That said, since that call was
now moved into the pm_runtime_put_autosuspend(), any issues would
already have been introduced by the series that this depends on, so
we'll see if there's any fallout.

Acked-by: Thierry Reding <treding@nvidia.com>

--dd3rsrobpe5enhed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmr0ACgkQ3SOs138+
s6FhWRAAmqKDqeofJQ11k5izwUxvfuUGMikCMaAXOhGyv2+Tokqg6xbVpQ/LTy3A
jW7wNUyH5ZjWFprk7RPURsZpkc8ruTDl3bmWdSdp+DlV5VNfEYs1fqreyNsOF1k/
a++KWAlrXA7VRbSlFdMj6W6SjudMMjWby6Pm2K7I8pDuJQdOwSuBf0bWgN95JEiu
MEf7+WORXLjgJToa1eiPE9aPSMqS+vOMhkrhJLfrsCmwqoG5CUnIJXf6wnaN5hqq
QGKPnHXbDocqwAaMFkzX1/nSahQOIl4A882n8JB885SajqJ81BnjWVaUFnS2RDfS
aPDiHDlZ+xs/Ix8ISxgpY6MPoMalnKlf3pkQ3FWrgS/NyTNryLm9bBT/SbhJVddC
kAShqX2e8jXSn1MbNhLryWBJYdQ7jWagl5HwL2/R1w6BzY69iwUKHK/1Pi3SHFY9
ryW8wlQGR2/ukqPqFPZVfXMmcX00Zuu+JIaiSscFM/Q5I3n47JIYmsFSWsertbI6
DTkF9fKh5n1npEGFeUCilrG9b1bsYM+BJIrwqZ+7qfpgKb1uxC6yjdIlDLwkOLjy
gc0ZORc30ulN3X2p+KUzVnte27Q3llclgZoISLYfv0+wkWvQcNYuBCBSvpajeqMe
dC9Twi/Dm657HYa4TfqcD3EMTgt//GUiOVxKCHqOlQhXpEvQMuM=
=lUG1
-----END PGP SIGNATURE-----

--dd3rsrobpe5enhed--
