Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099749363E
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 07:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396313; cv=none; b=V1VgjMc6tv9T5DV6W1O9FnSCtO8g9HTZEBIvU0WVsL9c+PMc3DsksWaqne5AAas1VW7qtbiyLtvW0A8y1aLNVaVCOlxa4n8Ena1ViYGr/wI13UnKoOjj0eS1vceXMQSVLh+NqGm196TtRyU6pt7eFZQx82w5IrIDBEnk9PcvXwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396313; c=relaxed/simple;
	bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ1MnsIJUzOTg0W0U5v6S4nOBeObEsdszEI1mGww9Nj6KRqjbeMotXa1L47CjaVp+bzKgFrGQKUX9zF2Lm/l6JhADjmxOrwHtB3WpungLx5qf+zwZAczKDs79pQX2jBc4uiLylnMJnMAdps7XxMYErlbfWynGsjvUphS7vr4RaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ph2buVqb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ph2buVqb"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso18806365e9.0
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792396304; x=1793001104; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=;
        b=Ph2buVqbWow/6pPeoc+Bud3fWxNT5Pv9uYoKzbE4svE/axGidu2p7DrGu0eex4A+0m
         eMdw0X/lMJxFcXfy2avanXEUmGnEEdsV5eUy1D6U+Y+ZljY5H9/mdRYNkVosvbzlcPNC
         iS/1skB6yuju8x0oqiClv0BBEupd2DRErik3R2tj6IFeyo1i83EqJveSgJifweNf5DS0
         wcq0aPg1mo2eTvtthh09f3K5DsFxxppXzLJ5Bt7BMDuxU80GyUhoARJYl3HyslbnaPQW
         LbhSfaBCMETU75FjaL3QRUrmoMDdMEFm6BVJGjnhdwu/jrtz5ifYusZ8jt2+UHUP6jOk
         C4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396304; x=1793001104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gmF5iz6Glgg36+UeRbaGY5yHQ6NvqJW35XDnkD5cMXA=;
        b=Y7eq1ceZU++MFT/h+vZHcxaf2ox+bTnhQeCSFX14vI7H+5EM6xtyzgoxwLjQMAgkBd
         4Dz5vDCCQpE3frkuQCu2sesJS8/K2Fy8/O15TeApynXkHoK9AwNog70jlVWCjE69ivxm
         pbldY82cnDjuCDG4kdL1ZQeRdtWKYTDYYhd1W4fMAfiapPEjb4kO+w+WZ7YgTYqa7o8i
         kbE52QC0Kh8Y3aaDinhhLOiNdF5R7MJjqzfu5JRlnk0iQnave2IOpO3jFOQNMqPAXPdT
         csUc2eGBpHVarFTLQJusY4B789q/fgiujXwLoBvvl09RGa0cJ5w+/IP/ZaKshuEtlirl
         Eeww==
X-Forwarded-Encrypted: i=1; AKwUvBynyaPcosX1HHyIAqckMJGR0rrwI9POcnd0GOxmTYFrq5M/g18XK6HpeQC4dE5nQru6/II=@lists.linux.dev
X-Gm-Message-State: AFq9FYITjxQgtIJiI20aNa9BIA6SVdhsRpMIUajj/0/dhN45bcurHgGm
	fTALZ+7YUO6VeBWlxzsBDxvBmMfN67mrW9017XdSitvU9HPA+7bwugcTofCnUwmEoXy8AOus5nL
	XD8s8kvs=
X-Gm-Gg: AYBFou2JDs4GbiIgzva7z7BMtv10JlGop192kB0rqJgdpQhGMWyt0tCMtIN0LmpA1ps
	dvzcfrAPbTX/4UJq6nChBe0X7Nzs+HLewDxNdgC8WW+ekPsLrxerfzyd6SY7E62MArBCOGbBDRI
	Fs42+78B4wdNRXj3I3X5TBBzvoQkQsYTu9YW4B1JIJk3u7hA12dqvR3eEUBjM6+7pehRW3hy7Z0
	Jqb3N13bJjpC2LZqBuLE9LP64yBhbS0bGz1gOpr78urLZrgKqQTguX6II/3oQ7P1hOjCxSV/QS/
	g9GU67eOIK5dMSrD3PspQMK1YA94XoqC1BfLvDO3sFppCHOPloO+jAH4fggREf8nkSiaj0eR0GS
	npdlNT9o/7iR5ob7+yYC1vzaso7wvNtFOjZdsSCxw07/MN35wJuzWhQ1ROUkXwo3OSi8HHUN6Ts
	1QcWVGIpbK6tzuC/TND6YPN88PIxNrnX76y4Y2E7ybKuiSNWiz7xrhZHweCL8lpeJ2FoT3/y4mI
	TTWc4NK8QspHeP1q+0vzzikNPH8tvSM6+k1WKZBYi2GIzEVkL1kCU8b09tZ9g==
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr173850595e9.4.1792396304053;
        Mon, 19 Oct 2026 00:51:44 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1cc642573sm209959665e9.2.2026.10.19.00.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:51:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:51:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Message-ID: <atXLd6SdHNr0UcjI@monoceros>
References: <20261016130328.1037616-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u5tdsywsd4xqnlzl"
Content-Disposition: inline
In-Reply-To: <20261016130328.1037616-1-arnd@kernel.org>


--u5tdsywsd4xqnlzl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 02:59:47PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> hub6 support was added in linux-0.99 and the hardware was already old at
> the time, being discontinued in 1990. The code for it has always been a
> mess since it adds another dimension to the I/O addressing in the driver
> that has leaked into many individual files.
>=20
> Hugo and Uwe have attempted several times this year alone to isolate
> the hub6 handling into the 8250_hub6.c file, but I feel that none of
> this has been a real improvement over the original standalone loadable
> module support.
>=20
> Any machine that would have used this ISA card in practice is likely
> 30 to 40 years old, and with i486 support now removed, it is clearly
> safe to just kill this all off. The only bit that has to remain
> is the ioctl interface, to ensure the serial_struct field is always
> zero.
>=20
> Link: https://mirrors.nycbug.org/pub/The_Unix_Archive/Unix_Usenet/comp.un=
ix.sysv386/1990-December/007174.html
> Fixes: a300273c458c ("serial: 8250: hub6: Add cleanup code")
> Fixes: c526404a4a92 ("serial: 8250: Fix corner case for port matching")
> Fixes: 7ab80d1e7243 ("serial: 8250: fix compile error with hub6_match_por=
t() when compiled as a module")
> Fixes: da7b5fd4e17f ("serial: 8250_hub6: add missing include for hub6_mat=
ch_port()")
> Fixes: 3d406299d882 ("serial: 8250_hub6: add hub6_match_port()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Fine for me. I wonder about the amount of Fixes: lines, but don't care
enough to check.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--u5tdsywsd4xqnlzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVzAoACgkQj4D7WH0S
/k4iJQf/V9G3FkSyYROePlk1XfrPSUEEaa8TTie3oEy+xPCSy0gTbErCq+RHUo4D
GxHAkavC95XGxxdZLoXmp7zZUrmdWASZLB+8Zx/zQ4uY474FnrmRb9wWmxzzt7s/
nYDE6veRDWeoi4Lcszow8rDX0uFISAaAjrBfAd/JE1t+QpkcNrYBC/PoT2BBUz6M
q1WbGxPxjSTmmYnqV3IT1Xp83J6CnJVVBme8YP4cqXBmMC0t7JZ2TEYeu42aTSFb
40v0k3I8d5pHzBl0W5c/DRH23ygvmgBFxaqFv+7uJovkvfnGmqATfNGCKzXM0lLy
P5TeqJWAB+sq7IQV0tkv0LpgWGVN6A==
=VH96
-----END PGP SIGNATURE-----

--u5tdsywsd4xqnlzl--
