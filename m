Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7922A4E5
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721671; cv=none; b=aH/CuopRjYPXl5vNboaeJQ1F7EOjFyUCfvC2xAqjX94I0oNmksS/B5P9j6NuHQ62X2ADEx9nyojIArMOUWUcH/OlTUn1sOE9Znj8w9nHEq9i/8QadKhcRUTr2C68YNQYUAvNtJTaXBAZ0EM7iUvnqd4TbLKsLA13GVS9rYyv34M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721671; c=relaxed/simple;
	bh=rTU6bf46PA0oHIQhlmEaMDf7Kt1hiZXnnDSh281Ox98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBCgqInkicxlheFvG2+bRE1iowLiU0pnAMJvYVvm++Vr5xuir3per3GJ7fDoX2IrrjX5Ms3AUmX7xEUljYRzGIwI7RumVwDPNrag5WOKh3yPbc3x4DaNUAaoChQQmYFW1nPraKPGiHM7btRwQgTD9qFsv1kIYCsIk4CT9pCl28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyIHVTyT; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyIHVTyT"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23649faf69fso7145835ad.0
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749721669; x=1750326469; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xl9Kz303AHWCJmJ1utR89kK9BbAzW0U5PoVQajnmYEE=;
        b=WyIHVTyTSSIaoojcZreSNpOIfqI6HuJn5hCFKBsZu/Iy7htw5qNwjbQKbOjbyVmMxU
         12LR1C8oSDvdXfxum3pLbT4nWCc10C4jnCZWm11YUu9Fe6Xz1QWVjCP/YdYKuRqbTiV5
         zx/PRO8uTTzumKqMCzn4Fpyi4D2b2Sm1CSCj2S4Tmzp2qfjgivGlwatzGUMzGbO0uDy7
         g0eAQDCntrjGMZwU1yTozLM/wYXtpBj0RUO3ay0TcFC1jI3N3AZ8aqZeQCX/hOR5UnKV
         S8oRnkQ0w+e6zfa26OYoqHogS3pY/Qmsgj10Ws0vSv2CrevujaazLJFVfxhyAX9f3jYq
         rptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721669; x=1750326469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xl9Kz303AHWCJmJ1utR89kK9BbAzW0U5PoVQajnmYEE=;
        b=nftAfsz/+hkTx/d/OBx645ZaFH2iUbtbFP3f+UDwNBCWODNGZR4CrIfK6rc+9cuMw3
         7CZiJpFJiTp1BYH0Q54j78XHWOWsq2bN4uDKXtaHevCOlELB9Qk3NMfTY+QBVTq8BIsy
         wEjVFjb4nKSjOJropxktOnbL/uiLEuaEEl9KBZlswhr6OtASXpVS3dkblqDOJ9F/VlBq
         EINMGJ7C8AsUpiyEH1icI7tLBTZb2qUbzk4YbjvrWcp8mQNjKIe/UobJ2XMCrsaLwJxB
         nEDf4HhOWdAdDpFcUF/XtCjQbn+AOfcKS6TjmCQ97ZpNkmSOXL35R7V9RBXQmq+DyA/q
         K4WA==
X-Forwarded-Encrypted: i=1; AJvYcCVzF8nZJi8AeAv6mZvx0P41rLZE9amlRBw02+FNRjqL+BXibICc1Kx71F+O+si2jG8JjDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrcE0sb+WBlenL7XY925gPUu5V84lSKgsg9wJMs+BEMgPysggL
	eP0Q4amWXDQIg2l8JpqlejGg4lhnvXyjyh2rpinXQD45hxKztaHTOZ1t
X-Gm-Gg: ASbGncuh45Cd2HAeAfvuSHJuz9D5hKWs95aK/xi+Nmce9lpONLdsyiZaiwPEg66H459
	MPu8z5p/wjyy+whPhnHBO4NT70M0pH7HswyPrS5m/EuoUXfxZxlb0pmdFvb7yZEefIygE4DNVdf
	E6U3YhcENDIqh5BBcOROlA/ia1V0QqyJY2zag3PJsRcGNhuUuLI4j39hw9PwqnjgRTaTpJvxo+P
	HvAa8MwF7YJEO3JiSKorTzIfocY+uR0duelkf8CimvZ80eaMOPODmqPrVW4KhRcMONE9IoPeCFH
	pK8T+odYv4u0bu+NQ7Yn959UVbjTb4w3jWsQnIGt/Lbt6LRZJrC2btG4mZcaSg==
X-Google-Smtp-Source: AGHT+IHhLvngJtDRD+nYjK9Btm6MhDv0YP4D2zr7z7HuxF1XD76CH+/kMW6iFysL+jWx2aXWWVzh5w==
X-Received: by 2002:a17:902:f612:b0:235:f55d:99cc with SMTP id d9443c01a7336-2364d62da39mr36075835ad.2.1749721668549;
        Thu, 12 Jun 2025 02:47:48 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd613d81dsm966545a12.25.2025.06.12.02.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:47:47 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B44D44241817; Thu, 12 Jun 2025 16:47:44 +0700 (WIB)
Date: Thu, 12 Jun 2025 16:47:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Message-ID: <aEqiQEMpbekiG6Hn@archie.me>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oH2YG5RUiU+HONaV"
Content-Disposition: inline
In-Reply-To: <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>


--oH2YG5RUiU+HONaV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 26, 2025 at 12:31:32AM +0530, Pankaj Gupta wrote:
> +Each 'se-if' comprise of twp layers:
> +- (C_DEV Layer) User-Space software-access interface.
> +- (Service Layer) OS-level software-access interface.
> +
> +   +--------------------------------------------+
> +   |            Character Device(C_DEV)         |
> +   |                                            |
> +   |   +---------+ +---------+     +---------+  |
> +   |   | misc #1 | | misc #2 | ... | misc #n |  |
> +   |   |  dev    | |  dev    |     | dev     |  |
> +   |   +---------+ +---------+     +---------+  |
> +   |        +-------------------------+         |
> +   |        | Misc. Dev Synchr. Logic |         |
> +   |        +-------------------------+         |
> +   |                                            |
> +   +--------------------------------------------+
> +
> +   +--------------------------------------------+
> +   |               Service Layer                |
> +   |                                            |
> +   |      +-----------------------------+       |
> +   |      | Message Serialization Logic |       |
> +   |      +-----------------------------+       |
> +   |          +---------------+                 |
> +   |          |  imx-mailbox  |                 |
> +   |          |   mailbox.c   |                 |
> +   |          +---------------+                 |
> +   |                                            |
> +   +--------------------------------------------+
> +
> <snipped>
> +
> +  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
> +
> +                                Non-Secure               +   Secure
> +                                                         |
> +                                                         |
> +                  +---------+      +-------------+       |
> +                  | se_fw.c +<---->+imx-mailbox.c|       |
> +                  |         |      |  mailbox.c  +<-->+------+    +-----=
-+
> +                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
> +                      |                               +------+    +-----=
-+
> +                      +----------------+                 |
> +                      |                |                 |
> +                      v                v                 |
> +                  logical           logical              |
> +                  receiver          waiter               |
> +                     +                 +                 |
> +                     |                 |                 |
> +                     |                 |                 |
> +                     |            +----+------+          |
> +                     |            |           |          |
> +                     |            |           |          |
> +              device_ctx     device_ctx     device_ctx   |
> +                                                         |
> +                User 0        User 1       User Y        |
> +                +------+      +------+     +------+      |
> +                |misc.c|      |misc.c|     |misc.c|      |
> + kernel space   +------+      +------+     +------+      |
> +                                                         |
> + +------------------------------------------------------ |
> +                    |             |           |          |
> + userspace     /dev/ele_muXch0    |           |          |
> +                          /dev/ele_muXch1     |          |
> +                                        /dev/ele_muXchY  |
> +                                                         |
> +

Wrap both diagrams above in literal code block (use double-colon).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--oH2YG5RUiU+HONaV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEqiOAAKCRD2uYlJVVFO
ozyXAP0aBRO1KFa+AGM5cBvWcVeY8OuEyqTxzHKI/v6k+zKsNQEAvGxANofk/mBi
s+wj3u05E/Xgxa9C5b23RBYacSQLLAE=
=SdFq
-----END PGP SIGNATURE-----

--oH2YG5RUiU+HONaV--
