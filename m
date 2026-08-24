Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C550416841
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574156; cv=none; b=mqIt/99lMsYjMNCeHpOLZaqQN0xYl7I+srPmZTSHO7u+9TpZDsg7XD0C8GJr+9w7ZjOgrtwIx75Z5L4FugIXD2YexrKaPMe77Urkz23YxtVZosICJ50uS44HlDxZAnXfg+qtwRbdL5s9+lO3NR/91kO5HOlTfFu1hQgQm4rqJNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574156; c=relaxed/simple;
	bh=t62Zykvs+8NdpMy0PpJs95Iv6bI1meByLMw4pOoPMnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjG8ABlg0Do+eWpUJoQPmb9LGiU3eNs6XQBYHikMZ2sgi7ka64dvuWk18tKGMKarzI2rIri8hvLKB3mK7TpVDQCXmDZoQweCXWtVl4NkE1OcdHm5bARYY/yKhGlQp6NTsIRCzdFW+JlOMKWm6HBPukyH1Jt2SXijP35Zwh72eew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hfTdEBZn; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hfTdEBZn"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so5891232a12.0
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787574151; x=1788178951; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=;
        b=hfTdEBZnTfCJ0guszhIhIOtE6YCTnja0Ftg+51b+rmSKXdXAgbCsS2cu+F0+bFCbUF
         rSGcj3BfPLecWJFX9KubQ1HMVeaHyOXZAz+HupQYZUr9k5f+6fsTx1tD6oljovGk47n2
         ONeCONYPMiTA55oKiMR8EHGRTQhQXUc3BQWbhC3hItpfeXQLKxORvDfoiqKfCNu5B/aj
         ODdhoTv4q2giXfhJEiegFbn2EHiJTjfghVncQqKBRfNvwEbxMXn7NFvh1IlhBY24/i3L
         fUyOMxXLOruA7ftwZ1MJZORMIUUmjqNFo+EI5UT+rex8lA+tj4HQL34dDWhX0oqNMvmF
         /1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574151; x=1788178951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=;
        b=CheTNLZJBARVDGW6Jia4qJ4RktoqE+yUx0hquaRy2M4a6AlnaMydbA1v56Xc9vQlvp
         J/vIob+ak8aXaRFjdWZtPrHZK6g003jmnGTBfy3j3DKEW8usJOOerfmpD9+fCyws7G6h
         SZq7Y6fq74NQOneAj4th4NDuPMlBs9QzKvWMOvvWyvBnq69M38YcjM5/ss9Zz8sxBO0I
         NdhgGntdPk2OEJiThtt852gbAXvX32M4F8LEPjnR2ypZJjSd453xnm2cgdorRpFiEOOE
         okISCogyJ3b9xHkUgRgwbyiPQ27nus54J3n7arGUhukRZauPz78cySx4uYDVogrgJiXB
         W7Yg==
X-Forwarded-Encrypted: i=1; AHgh+RrTeBYvTfDwSAqDJsURirjIgDnmKyEp8doFrNhw71RX001a/dNhtsqlKlIJ1i7UrGRy9C0=@lists.linux.dev
X-Gm-Message-State: AFuF++mzeMh8s0VKHRCVW0CIGjh7oRDyuQObVWr+5hpkZ86X9tsTF+E7
	9nhR19WM/1IgtrCVYUwRLalIRHAKmkz+mS01rGr5gVZhvPZxym/vEoAW8rcc02l+uUM=
X-Gm-Gg: AR+sD11QX+SzlIdyx2Pcz2Z1/heaXMVZ0aEEB4ituzQUWRLi1dm1a6gf5lBu54O4tCT
	p0YdUO0SrX5gY8mS546/eYUUp+slApxnh5lnV5PJgEP6/X116G1Cxhn5AmdAs5/6fC+w1QK6M7/
	8zLRtri+oh6y7WjPDCfzLV+mQ4H5/su86GdKmM9VxSNTez/aJ4pchGL2GmoH223TiXtIwVUtD+D
	fXbGMGY3c0nWJTVeqWqBR2ojN5Ge4qbsZcl047fm4QnbBFlGBseX+lR2LnEeuH3pBHgq14MWlox
	p98Zyv7PaRzaBFa25etomkVnYscctFl5eti98tIcUDVZ+PWGyMcz96hkttSX0L/s/ErCVIALe8M
	hLaljcWzUtw/CBU6iaizFdNHRgFJxrWLEnVUIn92KRtFvuZOh5+n+lxx/sYnR59oXvzTgm4diFt
	zkBk10jALvc1E3mbFD1erUnmuppNn4nIOY3/VrSA/+t7zdTJWkNXSzVmdgHAn4PzMsK/GxvtEz+
	lXLERCaVlS3wirKtKIT2MZj3zsFnm5580jqpIWW2sZ6T7JiH9HM
X-Received: by 2002:a17:907:845:b0:c20:fed2:898b with SMTP id a640c23a62f3a-c2492782dbemr1724856766b.23.1787574151309;
        Mon, 24 Aug 2026 05:22:31 -0700 (PDT)
Received: from localhost (p200300f65f19a904efa8a94b704adaa2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:efa8:a94b:704a:daa2])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c24962a3c13sm1308598466b.26.2026.08.24.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:22:30 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:22:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
Message-ID: <aow2GFAfy84k-N2B@monoceros>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2tfcczky2nyuuvxm"
Content-Disposition: inline
In-Reply-To: <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>


--2tfcczky2nyuuvxm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
MIME-Version: 1.0

Hello,

I just replied to v2 and only then found out there is a v3 already.
There is something wrong with my mail filtering, sorry.

I'm forwarding my review comments to here (the part that still applies).

On Thu, Aug 20, 2026 at 09:48:48PM +0200, Hans de Goede wrote:
> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> new file mode 100644
> index 000000000000..4150481524d4
> --- /dev/null
> +++ b/include/linux/device-id/scmi.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef LINUX_DEVICE_ID_SCMI_H
> +#define LINUX_DEVICE_ID_SCMI_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +typedef unsigned long kernel_ulong_t;
> +#endif
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;

Please use

	union {
		kernel_ulong_t driver_data;
		const void *driver_data_ptr;
	};

here instead of the plain driver_data member (or don't add driver_data
at all if not needed). This yields better type-safety, see e.g.
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com
for an extended explanation.

> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index a397213bedac..d241421c36aa 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -49,6 +49,7 @@
>  #include "device-id/pnp.h"
>  #include "device-id/rio.h"
>  #include "device-id/rpmsg.h"
> +#include "device-id/scmi.h"

Please don't add new includes to mod_devicetable.h. That header is ugly
and each include makes it worse. Just add <linux/device-id/scmi.h> to
the modpost source.

>  #include "device-id/sdio.h"
>  #include "device-id/sdw.h"
>  #include "device-id/serio.h"

Thanks
Uwe

--2tfcczky2nyuuvxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqMN4MACgkQj4D7WH0S
/k4yMwf+N+KJ5sPPSlOgLDa7K8R0+3z3wNZSXpKG1mfo73lwlNuUQ0o9mdIVnCSh
HjOljqygnPT1KDnD0tyk4aBt8VyDQ7dC93v2tUbPE2EFoHWT9BR9lAcDJY3TqVqz
tjL9DZtz1eAcw4OY5tm7FW6fBRLJTlGAgyzkcgBHxrB/6dIPZ2BaHa+eoJFUN6xU
dBhVHRKQFKBn79sVAVD5tTw46v3SHrs1nbvdIsEtAeVZ+RE+fI+LWfjIknQiSaZ3
4Nlmi2JnGiX9tgfeDp4HEArbnCzrtXLfmr4z8sEMjKzmk6yTKI5AxNXgwRVyD7Eu
UpZzkHPe9Uo1jawnTLk7PSsbMrZ2/g==
=yxWM
-----END PGP SIGNATURE-----

--2tfcczky2nyuuvxm--
