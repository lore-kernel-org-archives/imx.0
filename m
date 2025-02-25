Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80B020E70B
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740515759; cv=none; b=d/xtAsg6a8QOAUTOUTImSSvNDN7D9LZjqKpeH7kH6Pfh6MoH5n3qwRdqxIYNTgblLBIEZCU7dj9dh12o6dbFIs2J+7xGIscNkLOKDw6B6K8YdVXh98brCj96D1qbmP1UjF3vr5pR+S0UfJU0Ul8C4D85AMoJ58nYoZ6Khh6UtOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740515759; c=relaxed/simple;
	bh=QMmBwMX6NbyiKavNbUAMAfaw3Yri0OGEsn2LrupgMgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpHtD/0sc/Lw88vmNC8fb8xBt9vnzZBpHztgIwbf8olQ2OejZX7Rmi/sHYsfxxKkuYL4dxz5B2t4Ig+/UGWUrLOt7CENvLcg0h2RVZBVjBs9NycYzYVM4Fb7P+PD6r2oTjP9czToBF1rXOp/hHyJ6qyt96gbtx8G6pEzHCBhTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANpeRxcJ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANpeRxcJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f31f7731fso2945910f8f.0
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 12:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740515756; x=1741120556; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yRTAn8EMHBd2hfR7Y/FJYkcHDF1vc5TPWd5vqlVAC6A=;
        b=ANpeRxcJ0Vep5QZ/dHF1p9Uaw0a2vxPNv9AQIYyNKT4hxLguJeZbcvySnk2isdKz0I
         /Y1xCuKpwOTHCOyPUxTZ2sL96yKRRhThwGF8orrOxW1yEVnSS8BF0rKwl/jzeddbdyJl
         e33zp4TushKMpyrpiDjzih58rdj+du5ZlFfUxF2KKfKokuh8eINbsOZGSNycg/ZeGN7E
         gW3fq5+czLuoZp2LC9JoVjzyjrbtXvH8iVT7S/Wp3PReEebQkmIfzCHqBs9X4Q7mgm4w
         O/HI9liGEhgcHxBaRIjkjMb7j0wOm5rgo0GAOoKiLu0n4SkCdT/A7iNRVZZACW1fO7gp
         xcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740515756; x=1741120556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRTAn8EMHBd2hfR7Y/FJYkcHDF1vc5TPWd5vqlVAC6A=;
        b=sgbtg1Wg8LwFc5FCqWx+gt7t4aGYGm+dUmh1SmmQG8It/PS+XcmpcktmdVRf2DpGMh
         IYuPHRDMEd5DxZZqZ08xZ9Xnn3/3+x8xz8KyY4GVRnjGh8T3Rw9f/2hYfEaq6gM7JCiU
         IM0LQ1V7xAMeoUOt20kawZyqSY4FtwYxqZYX5EYavYAgn44+OHGGhD9n+oG91ZTOqDVS
         /+V6Xxk7jZz3DuJPWruTFFR4JItQTdG5xxpsn6ucsSdeiIg2mv1asrhmYX89WbbKqDzL
         PUnIMKXwvG6DzBzA/Ai62TJyYISRZ9SwINUoDYHMuoJko0f0ilydoFGILYiXV0Y46TON
         15jA==
X-Forwarded-Encrypted: i=1; AJvYcCUp6n7RormfxJhYFQXxmO2YelwfQqIaNEsFIi2tmqrUmYZ+WkOAf+feTT2FTuV5El8f7UI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGQFWUXhUu+kOxN0GNdwAr/2/I9tqsm+IRIAWda5//fndkFD/+
	/OKKst3OJfjw6Lo1RzXHKg8ZfUQ85EtlCu58VFyqgXupIft1GeBa
X-Gm-Gg: ASbGncuFLIiew9HShSHdPev1RG2CejedT7s0A+d0NtUbjG1+BgxlOBAkzPDU5zM9Yhk
	4QWQ6pbstlJAc8JT84YtoRIbIambba1Ur04VbVJJWZRJbY35AuLAYYDBibYkXrpJcURdB0oalW1
	Z/FDcPlyvmZt8PTHDGzYeKkMvSr+2oCRMEdATRXwEeXJNHyF/HSSQ5BLKlQRNvrBD6szSyX4nbQ
	ZMPC683Iwi4g0fM/bghvp7n8OYx9u8OJwLkOdRHacgFhOwqFOUtEBQiwPJpGFvlFMg4aFfH/s5C
	VrX6mIyl2ShdDNaXnTcU3btJzifG6Y7i3bhKMU/WIckL67S3y2gQR8qCEpkohWkLxTiQ3azF8O3
	f7wjFnqJh8Hkp
X-Google-Smtp-Source: AGHT+IHo6pk8C69B1kkZHL451iXWYmac+j4FDXKYrUt1Xc82AEnjWCz9kj00St6aZ3ajRNdoQCt+Tg==
X-Received: by 2002:a05:6000:1563:b0:38f:3b41:c952 with SMTP id ffacd0b85a97d-390d4f36811mr510967f8f.4.1740515756017;
        Tue, 25 Feb 2025 12:35:56 -0800 (PST)
Received: from orome (p200300e41f187700f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f18:7700:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fcfc6sm3466016f8f.94.2025.02.25.12.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:35:54 -0800 (PST)
Date: Tue, 25 Feb 2025 21:35:52 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, Jon Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 3/7] net: stmmac: dwc-qos-eth: use generic
 stmmac_set_clk_tx_rate()
Message-ID: <qcarhmsd6u33ij4kupaiyxvyr7jxxv2uxvr6jsnhxjd3o3axkt@z4m3zvdpxogb>
References: <Z7RrnyER5ewy0f3T@shell.armlinux.org.uk>
 <E1tkLYv-004RZ7-Ot@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vvcz2h4v3lcdr4gs"
Content-Disposition: inline
In-Reply-To: <E1tkLYv-004RZ7-Ot@rmk-PC.armlinux.org.uk>


--vvcz2h4v3lcdr4gs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC net-next 3/7] net: stmmac: dwc-qos-eth: use generic
 stmmac_set_clk_tx_rate()
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 11:14:49AM +0000, Russell King (Oracle) wrote:
> Use the generic stmmac_set_clk_tx_rate() to configure the MAC transmit
> clock.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--vvcz2h4v3lcdr4gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAme+KagACgkQ3SOs138+
s6GtyhAAwRIkaF1uLIs1z5IXu/G9vXd74IqnK4JNtzGrGKi7NS+cgEqC7yfhY27w
G7nD6STOdAxZbhcGZfvkiSmrRNBmcmrs2nUBr+dM0BVtgpe/vfwOPbFRWd8Xpqt4
6LYaRSYNIsaY3nAXP4+oa3LXly0Fe4axipwapPJGjl9vCnHE30kMULHJ9MhLlbAu
VZzMketr5oN/usTXWFs1gsYk1Xw1wTabBQGENezBr0+H6Pq7BLDcuWPeEV5ie46r
xTlPD/E1rNepOCxmN6uvJSnz/1ei791h7OAK9n/OMZXKSI0XsgkMresehTC2jIFG
CwG03bepYX+Y64iJejVhCgxU2g8Ji8sv0tmTY7vsCFSa98ngzKWAQK/R6H/V6xMK
vNL83T8No6JOneia+ylM4i2ESXII8LmguwJGY9mbRqqS9dmP52HZig7eww/80MFB
g6yx6n6q4Us/vFJuLgnULe8gLcTMCMiCfAtk+MMdJUqb+eQGLPqXwxsIH5106zmF
ZyRVftW1WAa3Yc8cNF43w7IBR4RDIHm8MBUI9ESyL34P7gobx/5Z0C/DudsmnuV9
4ZJO+x5JUTs/P2yCg5VfB4ERHwfPUSf8LrYEJaVY5f4M+kchTApRjyf6v8oF9add
zMdor2E+S+g69+tn77HhPDvuJzTrOnbaIxQsoIwGEIJ1IpnOBUQ=
=aWdb
-----END PGP SIGNATURE-----

--vvcz2h4v3lcdr4gs--
