Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9FE189539
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 16:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430262; cv=none; b=Y9eA6CjHWORj4om6XOh8c64pA6a++Y9Zhd39xmS9DpIacgVz66XxdoB91R9pnEl9RYXpW2A2uDisXxpGG9ajFLmP1RWOUR1g/Sv1HcLVal3uP84JcoaDJJcLuqEx3+tdsTxf4LeMJjug2DSRtHD6pBDu7+BuWVtpY4UXZZCjxSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430262; c=relaxed/simple;
	bh=2AZcW0AMjruhAKqn0fjALEg1RIVZrHtZALPiKh483iw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCAlNU0BDvN6l/1f0LocQVVKUY/KUpMWR6Vr4x2cyNeaodYkN+ew9lKKaN82rIxtXH4rMG+CmY9FOCN59PFBt9w5oEzi2OunbCVDntjB2dJW3xaS/hMWYE1VH6Dv/S/2MoimTmKf9Od1FzpmqJ+HPgMPorp7EfKPAIVy9TQNqjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jdyx02Pv; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jdyx02Pv"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 677DB1BF209;
	Fri, 23 Aug 2024 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724430258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1vZPt/dBcDYDQ0mp2GaU66eD+tAIsEG5O9GhWlpdXI=;
	b=jdyx02Pv1cUl9X6jJRVEPrHP+O4CHcA+e2qnqfSUDKpTiM1pcOtu+gRdMjDT7Lc5KeNTy5
	QdJckxIcKreRCrjJ5uWLDyqD1iPWX6fvCUNcxiJkRRDPmxnQRdlrPmL8pkK1FnVabNmYWb
	K2mg3j2Cc+1S7jebKgxgnCY+ddyDW5ymhEr8YnOcGsbEwDNNBpDqzuAbLnHs3P28qh/8fh
	O4ovRNC1Z7Whx2saeY2D1/l+VCzMHswrKRcnMFQ1NBX3TiKs5hZAGBQPSkNM6o71Di5h0A
	30cydmV27n76AYxneoVqS9yPWyS5NQQeJdb6SRSOTTdHrqxyeCOJPTCXOSvkeg==
Date: Fri, 23 Aug 2024 18:24:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, stable@kernel.org
Subject: Re: [PATCH v3 11/11] i3c: master: svc: fix possible assignment of
 the same address to two devices
Message-ID: <20240823182416.33744666@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-11-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-11-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.Li@nxp.com wrote on Mon, 19 Aug 2024 12:02:05 -0400:

> svc_i3c_master_do_daa() {
>     ...
>     for (i =3D 0; i < dev_nb; i++) {
>         ret =3D i3c_master_add_i3c_dev_locked(m, addrs[i]);
>         if (ret)
>             goto rpm_out;
>     }
> }
>=20
> If two devices (A and B) are detected in DAA and address 0xa is assigned =
to
> device A and 0xb to device B, a failure in i3c_master_add_i3c_dev_locked()
> for device A (addr: 0xa) could prevent device B (addr: 0xb) from being
> registered on the bus. The I3C stack might still consider 0xb a free
> address. If a subsequent Hotjoin occurs, 0xb might be assigned to Device =
A,
> causing both devices A and B to use the same address 0xb, violating the I=
3C
> specification.
>=20
> The return value for i3c_master_add_i3c_dev_locked() should not be checked
> because subsequent steps will scan the entire I3C bus, independent of
> whether i3c_master_add_i3c_dev_locked() returns success.
>=20
> If device A registration fails, there is still a chance to register device
> B. i3c_master_add_i3c_dev_locked() can reset DAA if a failure occurs while
> retrieving device information.
>=20
> Cc: stable@kernel.org
> Fixes: 317bacf960a4 ("i3c: master: add enable(disable) hot join in sys en=
try")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 2010495906eb3..003565fddc261 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1042,11 +1042,8 @@ static int svc_i3c_master_do_daa(struct i3c_master=
_controller *m)
>  		goto rpm_out;
> =20
>  	/* Register all devices who participated to the core */
> -	for (i =3D 0; i < dev_nb; i++) {
> -		ret =3D i3c_master_add_i3c_dev_locked(m, addrs[i]);
> -		if (ret)
> -			goto rpm_out;
> -	}
> +	for (i =3D 0; i < dev_nb; i++)
> +		i3c_master_add_i3c_dev_locked(m, addrs[i]);

Makes sense, but please explain why don't check the return value in a
comment (your commit log is good).

> =20
>  	/* Configure IBI auto-rules */
>  	ret =3D svc_i3c_update_ibirules(master);
>=20

With the comment added,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
