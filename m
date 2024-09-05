Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59469BA49
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 01:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725500314; cv=none; b=bb2NUOnBCrU8wKCvDI5be+PwHtYVNvVXu2F700i97XBPUc9BiJ1Of03Hk2hPNypi6KSUuH+svg2I0Dspy7Mlczl4hnd/6KhqAPu8Dgi1FnfgUSo/YpW5UDAnVl77znPhfkMsj+pBUg8VxTwhbHFm6z6wYb3u3jtuyQ3SY79G3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725500314; c=relaxed/simple;
	bh=P7+//3f0uxXgRToZ3WeE9Im5WHZAxsHHLJVN6juhPBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrcDnoFBOKxVhg9us98TrcfXEsoKmFstShR8zLappRIawlZYhD/3OK+MgDMGWC7sY6ZrkTXiM+ljnPRWxkFebn3rdqm/tduNO/+63siybF8D7lMmehPiikj9DCrcJcPoPlWwXGNQxJkAFoL13mpnS+jkyeVc2tagUU71GlRrWMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AONsbHsG; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AONsbHsG"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f64cc05564so2151431fa.2
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 18:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725500310; x=1726105110; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AO648791FxZjc0pfPzn6rezwo34BHpIRDyZ0dfaieMg=;
        b=AONsbHsGWdLfGR5UpxsxolxgRWlfI4MhcsEjJ9E0Oz9GomO1XaMWhxP6L+MMjn1hMH
         ROPWMN+kPJrs6xcW4+/rqLFwgcO09iK3wDOflFisFvYwkrodHHQoEf97cmrxPvjenZl8
         yE1aag5Xa3zW/FoSTuJE0MI2BTAiIE51aOzFTzfZx8kfxZrp31KMjgKkQV6+9itRCxGa
         9lLOPVSABHKvN/6/p2XvrkwZuZ68bzWDJqrWHYZneR7ldlLxrTtO1ztSQ8mVVaEzKNGo
         VlMYakpZv+UEYQ/dij0s3m2QveFybTD/iK4aZaEqivIj5CR+Vq4/9ahsTmjWRcIYiT31
         9Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725500310; x=1726105110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AO648791FxZjc0pfPzn6rezwo34BHpIRDyZ0dfaieMg=;
        b=pMzJBIhXXDbRGky4wOjljfhDZkSCtZoPY8jAEyVr50hVqc1I5RSdZGdYaBfq2rFjnK
         zz2NeBeHB1G5R9rBqtYVXCI78Xoh5Jwu0ByTQwNSN4OV64x99FNLDYRmbhgOKtvGIIKv
         BXtyRM15nUw0fk9diJBRo5ZI6A2RIzMTbRryUcEFOXZk/Xt+pGX9iDIvT/uBdZ9bxhyn
         oRiN62KZH/ufDrbl/Mvn1+InH/HR06PkBa4THoqBfDFZ0B/cMomIRtRD9ckJSg1C+rAs
         nNQ9Lvgj+z8wS1xYBDTHKu96IVmhq5vyCfxKSsL0mLzz6RiE3hr/QhPh50oW0N0UjaZr
         J5ug==
X-Forwarded-Encrypted: i=1; AJvYcCV/dU05FUZ+R1uzMf4miHHX4iJIq0TT9oz8csMHwUqGmXXwgPai3gfMxxgZ2ofN5ohs98U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlWMw6aPUgFoq+1cAnukNk5rp/HyEfDvxCyEBJB5nN/P3ubXax
	gdcf1iWMejC8SGLgizwImuzuq9c6QkElHmXdPmyRgdCCdd1gyvZJ+sP3FjwXFI5iMQQGNTexlY1
	35DpBh0R2GIShBx9xM9RzeMVBh+4=
X-Google-Smtp-Source: AGHT+IEgRQ5E1daIzkoTZjA3SBI5LKy8bNnez+U77us3K03z38F2bspDE0V1pv/8qaBSchrXdvakf6XD4sPmM245Ask=
X-Received: by 2002:a2e:bc22:0:b0:2ef:1784:a20 with SMTP id
 38308e7fff4ca-2f64d53e658mr39075801fa.38.1725500309909; Wed, 04 Sep 2024
 18:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905012617.1864997-1-haibo.chen@nxp.com> <20240905012617.1864997-3-haibo.chen@nxp.com>
In-Reply-To: <20240905012617.1864997-3-haibo.chen@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 4 Sep 2024 22:38:18 -0300
Message-ID: <CAOMZO5ALKfz-w3taJBwCLu+pAnrcGaa-9=EtLH6FFJWBkq=t2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] spi: fspi: add support for imx8ulp
To: haibo.chen@nxp.com
Cc: han.xu@nxp.com, yogeshgaur.83@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, singh.kuldeep87k@gmail.com, 
	hs@denx.de, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haibo,

On Wed, Sep 4, 2024 at 10:26=E2=80=AFPM <haibo.chen@nxp.com> wrote:

> @@ -373,6 +367,16 @@ static struct nxp_fspi_devtype_data imx8dxl_data =3D=
 {
>         .txfifo =3D SZ_1K,        /* (128 * 64 bits)  */
>         .ahb_buf_size =3D SZ_2K,  /* (256 * 64 bits)  */
>         .quirks =3D FSPI_QUIRK_USE_IP_ONLY,
> +       .lut_num =3D 32,
> +       .little_endian =3D true,  /* little-endian    */

The addition of little_endian to imx8dl should be a separate patch.

The comment is pointless too.
