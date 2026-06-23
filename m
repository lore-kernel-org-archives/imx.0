Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9DC3921D0
	for <imx@lists.linux.dev>; Tue, 23 Jun 2026 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225236; cv=none; b=BC7zl672EyA3UFRA1ApTCXGRf1RZdD4yNqYb6uo4aaMabFsBAta5N2wxHfbN4y2dEzmnz+7K1CALhXm199qJbbtXh6KPsftC0Dq5JqnYmHVXmn4SxjCvwExiDnzLvH7iTSEjE05u5+Xx2mbBThz1eDKWbbKdN3dSEJxn6Xlb76k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225236; c=relaxed/simple;
	bh=5+TOpsKzvupi/mwWV+131twca2L9YoaTsj7iR29VTgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvVe8QEVZ6fUKrtutM57/rmntSkycpLhc1vZV1HOkOdkwHCbw8FIpBq3zxTcx8PkpN2TF0hbye0iWqh+2q8CAqn0FdQvQrKFf5Xpa40O2a7GyZedT0haAnsCAdvCMTzEardwIiAI9pFjX+b6E9CfnmI6JBF2t03jKiRPLR56iLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aN8VAedR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aN8VAedR"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-462ebd5d37dso5529513f8f.1
        for <imx@lists.linux.dev>; Tue, 23 Jun 2026 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782225232; x=1782830032; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YEPW2+diZhljtgmo2ebKz0clEahHBJjRKWMmy6eAjTI=;
        b=aN8VAedRpaiE4eCPIp5XuENAc0ud8jxBLo4saMDTydur1MJnAiClamOiMok6jLyB03
         lqzJpd4nfKhvbKxLYBIwoZY90Bz9DCyDnvq7ptIJOkirf1TuTp0x1Y8HkgEJ1RSBKfWg
         g737tw4E8AKVGYV5ThKW9z+GSl7MR5+4dFsgMYPTIazujCXtThvgth9p3PxrzXuan72O
         gVGyyuONZeWZGn0wNaKU69CNeFd1E5MkJkoBKkr5kXmClo2PMVadvz67u8GFuksZOOsi
         QKz5f75jgvg0+OjFChiqbfg5VGX3Ip6m0y1G+1h5t/pWvcXl7VDbGLQu2YYKJ5svOOHB
         gZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225232; x=1782830032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEPW2+diZhljtgmo2ebKz0clEahHBJjRKWMmy6eAjTI=;
        b=nN90emVnwxW2clhSGzvEju7NGbLr3Bgec+C9wKMTCQ05XFvaO/HtxMSjx1e+i80hHn
         hFvyjBJgUVjl5d6CNaecbgpoTabfXEiGdioFYDaH4WBvLAP+Xr0AIeRNvT8oMzXhQv8h
         lAQeFlhAW8SuelYvn3AecmgxuXvo5wXGwuInhDVYivl0BgWAnio3FoJ5zi3BGtPe8RgX
         jfr4wxBhSbWNNUaFGuZ9LZoTG82pZpIjePX3mztdCYtZYa2SGEqbAvBYFLbI1ZAHCsG0
         TRr4MBZyVsDsq8rRbF/Wymlv795xeNhrogvjuV6fKKaHunwQhT63T9onEzAh492u0b58
         Vd9g==
X-Forwarded-Encrypted: i=1; AHgh+RpTu41Do3tavEuO9uzr0Et4OI5hRZHYOZL4glBbEI1zG725p1F/UXiZ4acu59aVUEEr+3A=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzm09B3T7M21wq8xMvM1WYjkTbHFurHs3aNAraGHcJMl9yKBOg
	KKbcj5Lykk1C9wHJqoYdvoxVbuS9xTXxOPm2QSy1MqpEflv7LiKT29dpFrOBJujny7E=
X-Gm-Gg: AfdE7cm+1hBQ20qkYOI9aRo52CfvoaVP2FS5VOp23uZN7BG3j/Nf8Vhk4T5ph+ITAOQ
	EjrlMWplljpJdH3ztVO1M/j5HqPgVUP1R09N4i5fTB1x8NDcuGUZYbpI4H1AOTehJCs4rD7InZO
	32yL0JXfS/HCNUkIDGRU6bMDmxIjhoYdoNkmMrbal6b+8dCLNQx6Q7+R4micpWbQnI4VOywQHE7
	ptAI8Y0a0OtZFxD7K7c8Jjmxf7LFPGiVMkWypK/ESHRA5i0e+0tGDyo5cy2BjJqvqQ4vQR0A5eW
	cMFXRSh+YSB2wNwNVSTAMBfcnE/3RXa971WZzp1TGbXM41r5LiVzO9goCnyYq/c8JF2ZXLdnLB7
	pMSEgz8yruqI85z7Ssbn9U9gOcfbrewqdA1QD/H6mp6JfIvW3K1lTNioiyf3cHP86fwYR1oOt9k
	8gMrqDOSYNzWtuFyjgdaBK5kG9JxsfHKw58NsDMCWXNZhKkCHm9bWV0p/c8R9HDUeagdetNM4RD
	WQ=
X-Received: by 2002:a05:6000:46c4:b0:43d:69ff:6898 with SMTP id ffacd0b85a97d-46adb0b627cmr3442205f8f.9.1782225232172;
        Tue, 23 Jun 2026 07:33:52 -0700 (PDT)
Received: from localhost (p200300f65f47db0493d7da2f3a2c0dc4.dip0.t-ipconnect.de. [2003:f6:5f47:db04:93d7:da2f:3a2c:dc4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-466667882f7sm36693330f8f.21.2026.06.23.07.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:33:51 -0700 (PDT)
Date: Tue, 23 Jun 2026 16:33:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Message-ID: <ajqZIBDVccYSGoIY@monoceros>
References: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
 <ajqFGWp3XKqDhPpE@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aupps37cqxgxelmw"
Content-Disposition: inline
In-Reply-To: <ajqFGWp3XKqDhPpE@SMW015318>


--aupps37cqxgxelmw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
MIME-Version: 1.0

On Tue, Jun 23, 2026 at 08:07:37AM -0500, Frank Li wrote:
> On Tue, Jun 23, 2026 at 12:45:57PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
> > 4b563a066611 ("ARM: imx: Remove imx21 support")).
> >
> > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).
> >
> > And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
> > ("ARM: imx: Remove imx device directory")).
> >
> > The last user of imx1_reset_init() is gone since v4.9-rc1 (commit
> > e1291cffcc50 ("ARM: i.MX: Remove i.MX1 non-DT support")).
> >
> > Drop declaration of enum mxc_cpu_pwr_mode, the actual definition follows
> > later in common.h without a usage in-between.
> >
> > All users of of_device_id also include <linux/of.h>,
> > <linux/of_address.h> or <linux/of_platform.h> which is enough to not
> > need the forward declaration.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
> > ---
> > [...]
> >  void mx31_map_io(void);
> >  void mx35_map_io(void);
> > -void imx21_init_early(void);
> >  void imx31_init_early(void);
> >  void imx35_init_early(void);
> > -void mx31_init_irq(void);
> > -void mx35_init_irq(void);
>=20
> which commit remove above two functions?

These are covered by:

> > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).

Best regards
Uwe

--aupps37cqxgxelmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo6mUwACgkQj4D7WH0S
/k7ohQf/UicBdj6bBdSXzM4BEoWXLLOHVx/FAZkISFVDzWN/VB6iWbXDBXnImi5p
+FNwS2SGTNFFyQB/bUViIvrpdeKs6tbr/GHfNUwomTgZ7a51JQP/VATZLtcUL5uQ
u1SL0hI6AVAIruiNEMeeLiJuWb7lbUcmf/tCRn0645UwwqzM4v6R+teLTXoCRHgj
Fl1QN77UY2Ml2J81sSLbO5u9ND+/LXC74JavIeQ7DSPIrypxQjcu3UAsk9MLECSO
m0tJ3R2xib0cgaGQF/cIwDLS5uT4mgGm9Tk+Z/8pXqfD3Z7/DFWVla9XiY60jBRd
O4XUrDFyAFxcDNWMnrMgqK3l5/vfIg==
=nscW
-----END PGP SIGNATURE-----

--aupps37cqxgxelmw--
