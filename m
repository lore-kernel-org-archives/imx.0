Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697373;
	b=rDHWbm6VrqfjPKc58ysdaP+WWEDmFUdEGTrLiSVjUJLkvwyqPF2VABJiCpxQZazrFbUp
	 g3gQ5IqWHokH0SGwnZes9GUh7rGDXe+ofdrTaJYt6f+PROFY+p7ZBOSroCyu7jq0fn2f3
	 QzHGbXBqghNGBWGbKZECEVfwGIa1ipOLWtAtWdhaC21iYZIvbmARlvkP948aTdugrWBI7
	 kOEGZGfCWfBDApluVY4viui1YQDhUJjtoqIH0vK/ZxEIlWQzzIqJ24tTc2OSt2dpdo8zv
	 5w8frhP8JS4nVZB7ARo3Hd7HGeZRy+kfrb2MVngb4dVzZBrI3KeCjbbuKgC7vtx0esA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
	b=Epp8TX4JcnxokTYz1WzrVwgP0mCdRIkubDS7KsSZO1+C8yHbQWHSY9A7mKcOs98kyn0e
	 smsocOMM2wAr/G6eIK/aGh25gWyXnmlTG3PyGKUjfc+47kMDuaA398PIZCAjY+zP/b4V8
	 ike/gaongF4PZpiv66HhGy1nNQwtKIEfhDIIXCMcqGka0pGoVzi2kgci0uBKXaEzuEsSL
	 nZbef+OATafjdf8isA7EnlY0UHtCYvOjpGhWt9V5aOpTzsWJgouXOwJwn8bOxgfXEATZv
	 T+smzHTv/1yc80oZ1sQm/R5vQ2jaCouwlBTIG9mmqRUNal7WDl7fO+TKrrSt2lnFT5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HxD4SDC7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C51606A32D
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 12:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C51606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HxD4SDC7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3997524f8f.1
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 04:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795697371; x=1796302171; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=HxD4SDC771eqrE7ZcNCPsLOATNKoAtCzXMeljHuofQrvr0XUC7Q+gP1nd9PC3KPC34
         pMmXzGoq/DJeJ72D0HTYJZ7U8nKnjGJRqQjUhJYNx7kXB9/aDtyj3/1X7EFSo6TtZSkE
         jrLPVDO1kEJ4PNHdHrdivvOO4zQ5q82gGOq0Rh21hnqkbPGT1vkhzBbWlfjuRY7VvDaz
         tSBaJ0toP6a+faN39MzSahLCKM69VLxiQF/cCBUUr1rebhU6y9YB/dC/xgtY3uxmR/zt
         sEkQy59ricmOfbIo8nRSS9lxdTYkJHehB2rYNoiB9G9K5HGDXcDNwaoYMzKZkR9vyIeh
         JlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697371; x=1796302171;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFgvhPWl12hpkYLquoqeQTH471RDc6o+6JugKxL60ho=;
        b=RB2UyaCwksTI3Y31e3sDuWPOiDDzRjpMX9EzObM++ou1FlkWKw5wQX6v6b1XAf7QyB
         +0aE9ohHAaFwG73gD8lgHtND3SdqkdM1KvvvXKacIArbFJmG0IGpZQvzIjsmjVGYBg1N
         YmTJ3UTNU8Q9/uGu1Hmu8scoqQvJFyyLNFmOm0LruEPW+2YR33zHWnTzN9izuyJxc+Nc
         NGoYFRHXGq1yCU1rgiVF0AYSLhotf1DIktDiI0D1iUZ9t7zQ8SocMC+GgkQAFmtH/gxw
         wKuoKPIUcZVX1SZ+ZSwEcmwn1CyUGZb9BAYsma6NzkCu9G7D91ULsR9a/bez6oTtizuQ
         4Hag==
X-Forwarded-Encrypted: i=1; AL+hErEC6QzZ2oNleejRtrbWOInAXjur8lF9jnz6UxOKSr0obBjHP941k+7tOXrsr/9IFriLwC0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+lydcaB/zAZoSrjWFG5V8Ox3J9orcbOcFusIN94RbU7I8oMAim
	EmRH7YXpvcMY93jePir7RSg1bhSFMWxlj7q20gb/b3lqsqEvASKIEChQJu0pvcx13IE=
X-Gm-Gg: AZFdTZf+8lYedlEDne3OGF5Yfp38m8dKAK3nzgm7G+aa5HUiX6ZaC6kJaNKvH+PWNC4
	gkMDPxu+dboE0gu8ri71XuALqkO8Zsn4LjqgGyafjrMXWdL3Qrrvrfq+b8yE00Dz/3EilPzaou7
	39jLfFKkduj15Pp3vLbFnDMyca/pZLA5g0LC2F9P825tphNZ61sM/9bPRN3n0v/q1M61uf6A9Oo
	yB5AYvRHC0AEmkIknRMjqAy88O6xnc8Dt2O/SCbktAw9ARTYBJGLfzBq9khgkhO3ltmo5aKxf3p
	r7nhS2KcAwv0hKjyE0P5pfetOnzxDCQ26w8v9pUbZf00fu13mZaO/Sp6k3elh/GcvaTy7TDNnEP
	qQFsqtn58AIYurYhczypfrk1TXX/kTGs/WNgKimrn3R56sm2h6fhIakn7qe/gFM4uIPuvmS1kBB
	9NHDNF/MBC3zFTx6JdSgDcsEKzSJIeP6H/LoEfSyqSV2z8vLiKXZoD5PRlGsruxQ7jgXO8BC5oP
	SOOuPtGgUQ+dCLIxmcB2m5D33YqBpJLvq3coOLNqy+9g01vdOMRmZ6Kj3zsDY5Kf2koTeCooB3t
	iMYPb+X5LBw6n6cSJNG3s0ICnFdSNRQPXQ==
X-Received: by 2002:a5d:4452:0:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-4abb5bcd524mr32707915f8f.53.1795697371481;
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm38969506f8f.36.2026.11.26.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:49:31 -0800 (PST)
Message-ID: <b1d73b2f842c8827e6a2a0ed6dcb1d0b979265b9.camel@linaro.org>
Subject: Re: [PATCH 3/3] usb: dwc3: Allow glue drivers to override all
 dwc3_properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Frank Li <Frank.Li@nxp.com>, Sven Peter
	 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Peter Griffin
	 <peter.griffin@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Tejas Narendra Joglekar <Tejas.Joglekar@synopsys.com>, 
 "linux-usb@vger.kernel.org"	 <linux-usb@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org"	 <linux-arm-msm@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org"	 <linux-samsung-soc@vger.kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Neal Gompa <neal@gompa.dev>,
 "asahi@lists.linux.dev"	 <asahi@lists.linux.dev>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Nov 2026 12:49:47 +0000
In-Reply-To: <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
References: <cover.1795559405.git.Thinh.Nguyen@synopsys.com>
	 <b0b118ce86d1046d73fdbe297117f993df38cf20.1795559405.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 22:59 +0000, Thinh Nguyen wrote:
> struct dwc3_properties holds all glue-overridable properties, but glue
> drivers can only set needs_full_reinit and gsbuscfg0_reqinfo.
>=20
> Replace the properties value in struct dwc3_probe_data with a
> fixup_properties() hook. The core calls it after reading the DT
> properties, so glue drivers can set properties that DT does not
> provide, or override DT values, including clearing them, to correct
> broken SoC settings. Convert imx and ls1028a to the hook.
>=20
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> =C2=A0drivers/usb/dwc3/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 18 +++++-------------
> =C2=A0drivers/usb/dwc3/dwc3-apple.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-generic-plat.c | 19 +++++++++++--------
> =C2=A0drivers/usb/dwc3/dwc3-google.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/dwc3-imx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
> =C2=A0drivers/usb/dwc3/dwc3-qcom.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 -
> =C2=A0drivers/usb/dwc3/glue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++------
> =C2=A07 files changed, 27 insertions(+), 32 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
