Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EFF2E3385
	for <imx@lists.linux.dev>; Thu,  3 Apr 2025 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684565; cv=none; b=pEpnYXUdwa04K9csAXOn21D3b5oQcTK+0wc7IBvCF+2Bmfjl4OrWBgIbaOBJHB0PTRxMOwJa3ksP5iEWJ45EvL/dqQHTeZqxugdj+60AvRBLfMjw9YyKxoU+i/iOMh2qcKqCUmTFcMzaEQXS5wR3r+GvIVLw6sM/1wb8VAphRWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684565; c=relaxed/simple;
	bh=RxMLz6M+rqNa78DbwQakLvxhMZ+1yEief3w4mMeOKag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGSk7qcBPYOB/a3qIrLUrvKQlTsugxjQYSkUaTk7maWdCW4Mb11UWbhXw5cPL1GW62yk2HARz8GUywnCHHb5YJseHQ/XalZ/pfT6J4luC9yz8GvS0NSEYS3K0QEBK4SgkWpDYekd+Jb5LK0FEXKtfpayfI+EvuIDCbF4Ytzx+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJt6bAnG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJt6bAnG"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3015001f862so568745a91.3
        for <imx@lists.linux.dev>; Thu, 03 Apr 2025 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743684563; x=1744289363; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br0qzftHCKz3sbr3SzuiqhOwZoMQzE2LZ4g8CLoOd0Y=;
        b=aJt6bAnG+MvDKHN8wzpFJ0+uEzUN5Fx+UNu85sN2bELQ2pmCuTvnuCyzmZW5LIkt+p
         tDkeYLJrGYOMtbNYqOIAtw4TpCz9NbkfPpgjU9vWL4fLF5mUpc5drN+3nDqf+SzlGEvA
         jQA5YdBENFk8NsUGWE3KZc7UDCo8O0PFiCAqSq5gdF63U27W0eKEAorsmt0HgFoDQwKn
         sGfcvmEIUqWsUHHv4aQo5O58CIBAxWgUX3l+pxZR3gw+V4wQhJ7jlJQ/iiVWvUFAIC16
         C3wtvMpTOCPuUQ7qCRR7w4Bxh8f5talZ5pKKhzlgQocYSWTWn1W+vktST/95LgM6TB0L
         13ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684563; x=1744289363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=br0qzftHCKz3sbr3SzuiqhOwZoMQzE2LZ4g8CLoOd0Y=;
        b=rbTj7Fb+KRCSLfbdSiMJmBdD+Ab4e7CymMMjU9A7UWDvpMvOb2cnsd1ejp+iTT1h9B
         8lpsCRNa/MgIpI3XQlpGCxMYvopceTIEfWgV3XYHbIlRAkuamEhS5CsGPh0AwtLPe9mg
         hPtoGAU+fHxnenvP51Tcry+9ikuInx1yMmtfHEiY6S0xIZChjU3GxxX+t/3IjIg/OueA
         9DaIBNgfVykGNPnEb1CzhysI+prpsUV0nTnPn8yOUfmXPNRH0zqZiCx/rHgwELuydwbc
         w1BNuzNSO0u9O+9reUlaMJMR3b5o8H5TrYjhqVrxKKugtqXsgc3vEKT0CACtXl5uC1Ec
         nsxw==
X-Forwarded-Encrypted: i=1; AJvYcCXNHWqrAUgyBAiFt7Ma+PlUcBkxCpXo0QB7243hM2EFlLpIRAaUIq+G4Rjtb7lCo1aXqpc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjtQY845nl7TDAzJuGd3XjK9kUq7aMkJnzvFpPnNIHOlHQdCVM
	eXoXadwh/NGyqRaPhPqjV4nP/sXkLTG9wLS4PEjIvVzr2QpVTTxPHH2b65CGaJjMIogaxwk3NXW
	SyigR7rrB4Zzd/VIYCpGgkpQ4PM4=
X-Gm-Gg: ASbGnctYhfkfAF591HDpfMhsXjdlJv/1EqKrq7F9E9ER0DdzJPJJ7kUSJH+y4IGPJYE
	IQR8/2Z84tbC8+eoRykDm+NI77SvecizGfTgiDsKs7DQHKzOdh8B4QiKPit7avmnF2qjLLml6AF
	WOB+8i6/EswH8Z2gqPpGHUQIA=
X-Google-Smtp-Source: AGHT+IFYW9MnslIX+WD/W4yqFkahfmkMt3j4de0kYP5osy79qxqlNhQHimSlJ+WSDyjW98VqmFgbjK1vYEjgozBE86s=
X-Received: by 2002:a17:90b:2644:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-3056ee3148fmr8807692a91.10.1743684563426; Thu, 03 Apr 2025
 05:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402-initial_display-v4-0-9f898838a864@gocontroll.com>
 <20250402-initial_display-v4-3-9f898838a864@gocontroll.com> <f75fb67a-91ac-4e3d-8ce7-5e0c6c2bb2cb@kernel.org>
In-Reply-To: <f75fb67a-91ac-4e3d-8ce7-5e0c6c2bb2cb@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 3 Apr 2025 15:50:47 +0300
X-Gm-Features: AQ5f1JpOn26KtD3CJ794gf42_16EcVqDVeshPu-zxnT2qzP-_yIum74GI60JHY4
Message-ID: <CAEnQRZC9Exfb5FL+gpMuwU6jLP8vO9hjrxm1+OHQBeLy0J1Wsg@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 02/04/2025 09:07, Maud Spierings via B4 Relay wrote:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
> > module bindings.
> >
> > This support is not officially done by Ka-Ro electronics, if they at
> > some point will supporting mainline, this should be changed to them.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 322ee00547f6e494a96d2495092f72148da22bd0..4b3864a9852f9fca2be4898=
7d383c0671e668336 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12752,6 +12752,13 @@ S:   Maintained
> >  F:   Documentation/hwmon/k8temp.rst
> >  F:   drivers/hwmon/k8temp.c
> >
> > +KA-RO TX8P COM MODULE
> > +M:   Maud Spierings <maudspierings@gocontroll.com>
> > +L:   devicetree@vger.kernel.org
>
> Drop
>
> > +L:   imx@lists.linux.dev
>
> I would say this as well, but not my subsystem to worry.

We don't actually mind to gather all i.MX based boards development on
this mailinglist.
