Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F73CB911
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788387; cv=none; b=QyEVAcv5DX1IP3XuBZ76kPkufQ/j03aF8rJ/HLFhYERetqsPxAQS44fLcDCeWJdB7WIkyeye18jKQC3e7KC8JTNQscHMnREVHZsm7vCQsjajmC434XgekAsMZroYU59HRBXXcuKxyE3HBhkpUygHs7sqm3B1L0pViejwhTsPu4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788387; c=relaxed/simple;
	bh=sDQfXgRKI/MoYauIBPUhxS7ErHC3UJ7F2mE+sueO31E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfvYKbFVX7TDKO8U1RVU5MF8u9xw6p3btz/IQggP35dWERGPWckgD5jRdscL0ArVCaAHC+19pls4B5fARun9JueTfBbnNYzh5ZalghlfFWoXe1Vj15FlU0tws4n9l6p4fXlUx5fA7cBXFtCeHIlvViq4vK3KyVJCdxLDQ+pAFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fkQ0WhaQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fkQ0WhaQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495590ba856so2101665e9.2
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784788384; x=1785393184; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=;
        b=fkQ0WhaQxrBzsbsPoUcK7o88vLxRS+UPu6oS94/EzdE6q1GTSv8O5/Dyggo1UImUL5
         aYX1AB+KOz3T6ibmMgPEzzB3/OpHRub+UO2QDjI0VURw2XyQ6A6EUYSCepDMfvXKzgV+
         KKvxQ1qroGWJrh5b55lo3/a1pqzA7DdqXOqINfz/WlGbd9HfdBjixknDC6j2I/3rbxWY
         dt1CWT73QoWI2sjRRh7Wmcri5uWN0+4leesKJ21UB5zsCqmH9x9CYDcMFSxUTxOapCu5
         IlOcUk8IKRbo29Aq6N398dH0V4d/Q4WCmqHhXlQZ6Ie8+Tgdf0UYJiiQlYZ6vUT+40l7
         g2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788384; x=1785393184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX5OGenWV0xhnlGLLMQnc7kob7nrOP85c/FXvIqG0JY=;
        b=p1Mvn/2d8PlF5tzxY1Yb1ZOdvqH4/SsEf93TFaGO/AiqnwxllD5pjj2+c2NwBaGD1m
         fWae5LBUzjYWocw94gbG7H1aRdxoyXrXA5/5a0RaaQJ22OJ+TRX78AQtSNBqd36MMk7Y
         FyQOZ310tidS65CFpui352gTcbDBTdUI3I0QgzaV9pxvY66ZA0weMu8a9SFGesgKNOge
         OW7bBJ1Nqjje2cGOCGfCaewd6nbAf0yiT7vAvECCOFyrFXFqacLYP3fos3qWfjCDC4cZ
         9KbG17lpy6OA0zqvKMr9NzPivvusOdiL+A9oxeMDy+sQPEPEKvniBu7S3PnxrtOwO47X
         wx9w==
X-Forwarded-Encrypted: i=1; AHgh+Rray4CuRQrYMJvmxmZ7OPeSgdQhAJJEPt6iYkpc0qBfV6hQJm25FRktxo4kT+zM8sFBgbY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeiAHFQyWffAEg5TGyfChPHl+4z0SoMIow7Im35cHSd6RG49xZ
	zhRQztr43vMVbooHzVfnidRLCHySML1fIe58d+lBpsvQ0N0kuiQ2xQ4HvKhuIbpgsy4=
X-Gm-Gg: AR+sD13ShwW4H1S+PPs5mv6M9PZ90pPvtHu0WGDKcoryyYgl5REHQKseoUvhG5Sq7dy
	G6QgHDY5aSgdOeF4ADAGnKuEypqb85xX68Pj2ZlkfrEre63Fl605sWeMS02Luas4O+XMiCosLzC
	9lrBNnIXGQVyZEumh8yDp0lZ3gUqym5h/lQ8puN6KxmWJRLhJGcLyfrSJ1NKhY8/FnZWT3GsBVX
	agjwp9q6VTMHPUb9nAz0BUxfrYXT/MGTqffT+x4YPKDHJXvZP0/1ZEfJDDpcZZH+hcKE3zZv3np
	vcfuBCi6H7CBgASSu5vUyxc5I1l8gH9TflEbeACjCuB6J89oWy1fVwNm0hXozQ+o5jvU+T5erio
	PF281CosyX6f83B0zHs1lo6/F/GILKN0+PneyvaCXiYCLTDQM1IH+wHWRH8ogkv30aTg8nTEf1E
	eSNqYvJBA=
X-Received: by 2002:a05:600c:c08f:b0:495:71fc:3a64 with SMTP id 5b1f17b1804b1-49573cfd688mr15528255e9.25.1784788384211;
        Wed, 22 Jul 2026 23:33:04 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c531basm12160604f8f.19.2026.07.22.23.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:33:03 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:33:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <amG07XSER0tqQTDs@monoceros>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-5-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3tnjgjfvpvmj54rn"
Content-Disposition: inline
In-Reply-To: <20260721204704.400781-5-shenwei.wang@oss.nxp.com>


--3tnjgjfvpvmj54rn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
MIME-Version: 1.0

Hello,

On Tue, Jul 21, 2026 at 03:46:47PM -0500, Shenwei Wang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/rpmsg.h>

<linux/rpmsg.h> includes <linux/device-id/rpmsg.h> and thus provides
rpmsg_device_id already. So please drop the include for
<linux/mod_devicetable.h> which will go away soon.

> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name = CHAN_NAME_PREFIX },
> +	{ },

no trailing comma after the list terminator please.

> +};

Best regards
Uwe

--3tnjgjfvpvmj54rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphtZsACgkQj4D7WH0S
/k7/awgAj2vySxmy5vP1QwUkRZfLQnnTNKmx1EuDKoXg/nw4qRoyCtymTNF6iUvm
bSf7sZlRAqszzyqHR6g/qzf5yiGVUiAQAfxOlSYgB3SkP/7geaQXcPhlxzHxYU/8
aSWjMJ047hhilAq0C6ntgCbsBuUbHyGKC354E+EZYMESs0gKbdk1cWlNuay34k4A
Akaf2SEW/aZ/E/X1znyI/vRJyIqv1QBeI4+coopWyFigk2eNA1adyWif2iunnxtt
Z7EV690/VGZmcpQwDl/IAevcLh4cg2nhiEh2J5iIpJsvbmiDLQng0G5V7BQxJ9OO
7GNNyk0IGXtulJ1RztaEG5a7Kvc/3g==
=H5Si
-----END PGP SIGNATURE-----

--3tnjgjfvpvmj54rn--
