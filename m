Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D462222CB
	for <imx@lists.linux.dev>; Fri, 13 Feb 2026 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967630; cv=none; b=TyVX5FNO1wQrT08zoFjluMkxZhlYLzESnlKTZymEbfw94Kpl69MqqqdZ8mQ22h3o1wAX1q4XHuZybaIXGa/FoA174Uls+vVNeh+EEyXRx8oW62Cli+uin1MevMnliQU0lIKN1BX7Azy9oa05pDEwszVLqR+ryrWveziSyDHYKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967630; c=relaxed/simple;
	bh=vmpfu15x4cjEqpcqUE1ZCLtIDbwYueAHkh3Brfua/3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMMi6Mrq3SLbYgritHt15BYT3g+w1QwbQOichiOuyy0bl1dcz2EmyobZG+iP5aR94AeZHlaahozSfCCgxyGZRUbKfyQ30U0jUM8fXnj+9HtitqqCv0e+PGxFS/YKBjL/pq+eZpPGqA7Ygkkbn3kp/PzSrKpO0n7FHkfNvqondFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pya/tY9J; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pya/tY9J"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483703e4b08so4219465e9.1
        for <imx@lists.linux.dev>; Thu, 12 Feb 2026 23:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770967627; x=1771572427; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T5o+WgGfW/lBoBXgg51mLpZKPQ9oP0YY1GV2iyeVDY=;
        b=pya/tY9J5o9xJEpoBPPQmpsy10m6ojF1BDvq/YuA7NBSz49tKDZKVzCXkBiulFGfgm
         yGu5iKP5NE9YoZlQS0vKxZB3TUWSveTXSFl3U1XJZLKwwK3zVQFaiRf5pd8v1Tl9fjFX
         u/ZuSwMlLpAOMZwlgV7JLl/4UcMAzqXIk9yKL8k54IgnTA7JyuZwIFVzzKUuSQUGKzZu
         xj222Z4PfUQvrukg7K3MS7Aj0bYBwPFoL+4QDwW0lP+KKcE3IvL48niK/P4CkkmOsjl/
         k36flZav9w+SOdpaBB4jQ3kAUYp0jkMYdb1LC+cs4nEiccKeTJrvRhXk9oacsuYj4rgd
         0GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967627; x=1771572427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T5o+WgGfW/lBoBXgg51mLpZKPQ9oP0YY1GV2iyeVDY=;
        b=GDiBEZ2eJ3QbmkxRypv2uAIvjmPSoRwRQEY6kl1Bq1us259tXyoBdKmUi9TP/iLZFj
         o376YKWka3hXN1ZtGCfQbQJqz5mtC0+1JkCjbZxZAtuDD6noaz0SuWXaLsXhabgMd4fv
         P5kFi2Y2zqM6XQS6/U/869ZPZNR/i9YM8P7nuq0423r6rMEUD3ZL8e0B//5a/s1WWswo
         UAOkFlETSshydWvNkCwatWs64cz0gyefQywSBoCZvOJddqCJ8HPoFclEXeVSWm7ML3fF
         UD9t8LY1LLtNWd6TIUI/QYqtXHwlNu/laEB5DQJPyVHUzQOlMmS8V2f0B2h+2GjxKnmw
         b1RA==
X-Forwarded-Encrypted: i=1; AJvYcCWNOz2cwRgsvGr74NWn0/4L4ukuEY5Ib7sFoBFuBT0Ky0+Cab5UBoLkx5zBpugg+FST+F8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzduSdzrybYEWkh6WPnir6boat6drXjfdqGoh+RvPPfFm4jN3Ff
	U8jnvjJWHN/qWmioelABHycJmqqe+f2mmMYilzBlVduqT25aTsPcohH4biKF6IZauyg=
X-Gm-Gg: AZuq6aKhg4NEq2NkLT11+vGuhi55U6iWVqlfFncBHnjvLrH5rKgoFHZtaWNerlLdBcG
	+0p9cG/Is7gbIgHmou9BnYs+pJXNsT4GyP23p0sgT+NP4Z1LoIc05usF+URGtleBlFbMd/ecSG+
	on1DlgZc1lloEDXX/h+y19aYtmt5jOO9UsWhgipOfwWd0lXrH+UshLLWTMv4vjqsCT1W6xvV07r
	DDwgCaUluB8Na5SrATZ5dckIIhVUBHBwNTmGEN2KtvT+Vko/FTipsNSJdN/mdy2YMLrEMJvmnmW
	BXOtqEFkHNPmfEuhiRJSDc6n2jGqINpEN8vctdqtQAcio+cpojKW59b25b9i9ydsw26cv5W3evF
	gMDnjHKkk/UwaxUFoflL4XxL7m7bpNltAW9yc58CBgHWzUDZPDqS3/NvPX2ijlrJz1g0Z44VQOc
	rqoAhTkJ3wUq8/Bg58JrGtKzKkLO+JMUNGjexpdmCP8sDJ9AEHQi6KjJZIePpZFktWrrCWRkhQ9
	w2QZ+CQamdgC4k=
X-Received: by 2002:a05:600c:34c1:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-48372fd3c43mr11757265e9.13.1770967626654;
        Thu, 12 Feb 2026 23:27:06 -0800 (PST)
Received: from localhost (p200300f65f20eb04101188b09ed9186a.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:1011:88b0:9ed9:186a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48371a10cacsm17260195e9.4.2026.02.12.23.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:27:06 -0800 (PST)
Date: Fri, 13 Feb 2026 08:27:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
Message-ID: <aY7SFS3LUC6rFwSB@monoceros>
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
 <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suzgqi3scqpas5au"
Content-Disposition: inline
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>


--suzgqi3scqpas5au
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
MIME-Version: 1.0

On Wed, Feb 11, 2026 at 04:19:40PM -0500, Frank Li wrote:
> Set #size-cells to 0 to align with nand-controller.yaml. Remove the
> redundant empty clock-names property from the NFC node.
>=20
> Fix below CHECK_DTBS warning:
> arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (=
fsl,imx25-nand): #size-cells: 0 was expected
>         from schema $id: http://devicetree.org/schemas/mtd/nand-controlle=
r.yam
                                                                           =
     ^
Missing 'l' I guess -------------------------------------------------------=
-----'

Best regards
Uwe

--suzgqi3scqpas5au
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmO0kYACgkQj4D7WH0S
/k5AVgf/QsQPSAIdM1RxlXudv1+osYGz6GEEo592KE57oRkdUvtyYxJXlqICexVq
CcrktfuQdhxHkTa+TGp6zt0D5ud0nzXjBYtGZVIhE6iKYiav5EiFArQ3wPcvnDQP
3x1upQR/8SgvfyApCIlLo47oipzbM/RDXrq7oKBgQQlvfjTdDJWeEn/+DAMULR//
7/32JHfGYcuRTzcn5CRi8QotO47K9uUcx3Hp96n78OcP2CgahlMpdlQTU3k4YDMZ
Yn1AJ+Ip34Pnhwi6RKW3AtyTLTsSmsgtogie1n20MHuTG7FGGLFze6oP6AWaxmDl
Ed8LGzeR90IPomEYk2RYoB/o4eurFg==
=y1p4
-----END PGP SIGNATURE-----

--suzgqi3scqpas5au--
