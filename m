Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0214E2BEC55
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202516; cv=none; b=CSZIXZ7bLXkSFymZW9x7VVjUaieV+Zsfz22Gi6o1JCyzfx7CYqGg1unbuEF585aUNnOqSqSZBOavm2lw+XhBF/LEdOUd0TMGZeRBgja2xre96cOrJp/AW/ZHWSub8NPd44hxVpQl1+I97UQVlhAeZHZQdBOBf5n8dTOpTJZw3qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202516; c=relaxed/simple;
	bh=P7cmVKMa19PXBwMszLnkcUvMTM39+KT1KleRqDn9CZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmKL0l+kRz/xBMaXQdyv9AMYhLuzStrnTx90bLsKcyqST9wgiOFifQwIw1ztJU3fCLeNK8aSKATpNVA6MUPBgsUHA41wgP52HH10ogXaF4eSpzvDcQ7A65o0QJ0Jjajzif5Y7ZL4EZ1TEagyLTUgoRolyNFi7n469Sf6/xVeu8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vXaAFCSr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vXaAFCSr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47117f92e32so3450565e9.1
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761202512; x=1761807312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7cmVKMa19PXBwMszLnkcUvMTM39+KT1KleRqDn9CZ8=;
        b=vXaAFCSrKYAYY61rhJBPqAf9d5JBMBIRa8DhS6UOyOdZSptIANcKV8tgVNo5eF9NbL
         S2aoLBFrl66ryVUpaNug7lsYCpg8JPqKSqaoCrcZDQARmUw4mrsysG/voSrFHz8mdTgo
         nZ8x8k04Kat3ke+zda4qzcTS6aNIy+lMjnTT3sXwtEdL5lGjOeMxO6uCRvT0au9F1jyL
         maqtiv7qm9KPxHxFFdKQNkElUpGxkjkjUKl09u/ZynfhV+bs6rsJ2M62+dYvc3mMw66w
         QOjhqUpskLPoBTvDalqBM6ZFuB6WrD03FphyMwHQmb4m0jNuLXOQYUbCI5E36YmZOY/z
         T1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202512; x=1761807312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7cmVKMa19PXBwMszLnkcUvMTM39+KT1KleRqDn9CZ8=;
        b=sYXJ/cNCHymPSUpeql4c6De5jXLwvlgJq4vh5fI5vLnfPoCEyvW7HP+b4vaFzM6fZB
         5GqZjH/54SjD8ePMpzxxLlJE0ZY5b5vUVNRtwtpy2ds18/f6oqo+LdakUyeETSle+3e5
         557KwgOkWOsJoLs+HP3nV1wmYIYY5+oXaQXMNdiGWgsAF2blcP41ZYaiJNHUE0ycT8Or
         ic35XC90ZTYQNrninTefAMPt8IOMVK6cLNQcOaY4hYZC14xZoyt0/Grxo5J+vVfVF10e
         h8fUBmR/moA9jOdW7Sst1ovFeR1HdLmR6An95o3HKPSYhPzGnnCSpctPPWvbOewNKdDz
         6zIA==
X-Forwarded-Encrypted: i=1; AJvYcCXhTLecQTmktTMP1Tf0eVk2taL/+E5LOi5pXa6df+0NZv90bzxgo5AzCHLhJII/tza9Zrc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUgrnVilyxx0dfLI/avDC6HXb3RrAh/xkqAgla52G7ZdrRqam5
	C3aZ4y7arN0nrxihmZgC/U7WCvD5DlJ3I8qRvHEcE6Z0CEO2X113xSJKymlHT6+fWxs=
X-Gm-Gg: ASbGncudkI2BWzW5lf5Ygtlur9M7cLjdU4G7rSxAuc/i4TOnRUIZjEgV+3N83H83TFd
	VMg8k0DvbZouKpTGM5ugTmS6K3/qR6PZ20xnvAYWf+eHgs+7lYlyVdClPJzaihlalKZzbXI4fbg
	qE+/Ivx16F9nfkqLdOL4FpVFHM1VjnEvrS9+FLpjNhK3XwrYHuvOwx/80XfYyXthDF1t4lSzrkM
	MH7bVNKggWnByPTzAbBX856pSGrjKF3Gi2KeTIjlESx5L9f95/VzSZcxRwvY9a0PZM81PhU166N
	09kRYDtZFykopXimfJjtqbDFClG7LrtEMIyuXG/Rm2ncI4Ceo7/g2bm4fEci6pJj2Ty/t/5Mlki
	86GAjzps9qnkP+r4qmTSyWJ3tCNit6vCVYmoUb1l56Misb1kPcjIFImE4yytrYhNXRkzLQjG7Sh
	ibY4B9r9APNol28gjLSFa+9j528kO/EdJeZ1FZHXA8Bn9sx+HZp46n
X-Google-Smtp-Source: AGHT+IGKHAzueYEARosceZQSUNRMYONnIXPxr3aLgyLwcX+P5PWjg4x97vF6SnwM4KLaRqLIaysbSQ==
X-Received: by 2002:a05:600c:3492:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-4711791cadfmr201702685e9.32.1761202512182;
        Wed, 22 Oct 2025 23:55:12 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c4342373sm93215405e9.12.2025.10.22.23.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:55:11 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:55:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
Message-ID: <enih2kbbrs3ngzciceekrks6gwclanmfxtzvrfg4fmeihnej5v@boap3ccfuy6o>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
 <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
 <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
 <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
 <1963351b2e50c537418293e6ab9293576a239c98.camel@ew.tq-group.com>
 <d46d07858a3b5cc9134e17509617901e2215122f.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rlgfuerx234j7yce"
Content-Disposition: inline
In-Reply-To: <d46d07858a3b5cc9134e17509617901e2215122f.camel@ew.tq-group.com>


--rlgfuerx234j7yce
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
MIME-Version: 1.0

Hello Matthias,

On Wed, Oct 22, 2025 at 03:36:51PM +0200, Matthias Schiffer wrote:
> As it seems preferable not to introduce the wrong code in the first place, I
> would propose to change the order of patches: The first one would update the
> handling of CTSC and IRTS with CRTSCTS in the absence of have_rtscts (without
> functional change, as CRTSCTS can't be set without have_rtscts), with the final
> patch of the series allowing CRTSCTS with just have_rtsgpio.

Sounds good.

Best regards
Uwe

--rlgfuerx234j7yce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj50UsACgkQj4D7WH0S
/k7wtAf/XcUFLM+wtZWzXix6dvhz+7BSQxsfdu/Y4GbDepTozo3tR+L4K4aSn4bZ
3ugNccUP7WI420z0hKS+Hfn10yomj9Ews/SGPoyysgqms0X3gU003eEbsfHAEjIW
4WdAbjFC2UVa2K5C/4TtvTEt7PKXuJDjjN7OKUX8LAS2fyBJnG1Us40nZaDGu5Fs
PuFGIzamgj0MQCFgtroBTuXmVolkOLuRXwHc7ul9EVN6nY0ki+OVIy0ZDZ580fSr
sNGh9lLSragixhuHHgzETqam2QphEW/Qqs/m4fONp0cZluZPcpc3+AtB0lObkIKw
eg7CnOkbCWjVIJXEJOVk57CbH8shCA==
=Nxbu
-----END PGP SIGNATURE-----

--rlgfuerx234j7yce--
