Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16511215F72
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 16:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485004; cv=none; b=E3CGUkvDXJTCHvugEmnDKKTfw8PJRGI6Zc824+nZLBtvxm6qG9y/HgPRUPNZw5MvRKxwRnvQg72nxJhqgR/GjtdOR1qxKk2BuMkijcD4wUQn8XdnVMJrcS5RH5kJmexovN1T9aUfIvdEK5Gw06Ac1mCY7wgZQCCJwql3YRGmjZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485004; c=relaxed/simple;
	bh=gV9OvN7Z/m7lwoJ68cb0bTusXwgD5lGYRItsGb9vMb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTgm5Mdl+BYo656R/wLAbW3N8c7N1g9y/IiiimCOY/CkqalGERpjjBp8nUFKnMaFB+ml/K2ZhLWYj4ICnJtJUCNJBuFbkZJPzL6CfYt0+G5CfVwCyI+L6Fpkdpx007Vn4SQ7gxDe6UYzTUJLvINOEwpDI2B6MG9DkFRPjK+bCu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7UPyfFF; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7UPyfFF"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e81ec95d944so382621276.1
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 09:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749485002; x=1750089802; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JLWa8pfmRBA0MCYaPm56slHNdbjbr5WNg/DtpiVizww=;
        b=i7UPyfFF6bViRcqJmUEuE8WC8ddBqd5O3jARCATIv6CYNBGYUiEn4VMwb7p+OryPQe
         RME90DTQvNuJqN07yIJZxLG38Pq1b2ZRMmgCt/G5uJ74j69ZpcczbWU+oe7rEJ4pefwU
         hd8hXyyn9b0QsqHlnBNPedX6HXgOOubJX4Li37Qix/JDc2PAOdWIQUQb7Mxs3wXVHH5f
         hYry0Eqk+0G67I1EsZ3Cb9uccdCr9xytdafJOA3oxhuE2gVpVbNR1a4G4Ob8gNcmRCL3
         ObLxxDnedDq4VlBsXcZhBa0lk6mtXrkkbOJ9KZOQt0thjF9vxbLNJOmpJJ96N+ZBcYsy
         dUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485002; x=1750089802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLWa8pfmRBA0MCYaPm56slHNdbjbr5WNg/DtpiVizww=;
        b=jUFlA2BYJa//Cl9N7pvCMCxcfZCVL/PS9hbT+JR13UTHD8O9jqhtp7U62KiZg0J9RE
         C75hs8HL60EGvTlPTXMi7g+ljzHWCjWw79ivSHJLQQ7KmYi+PZiTEKcnDeL7iLDfj6FK
         0bmibyYa8u6qBUPQuyLwiYR8sPXMVkLFlO420EVoPBTS8E04ovMm1pjM1bHgPood+VDl
         YcCMjJmz/UKETeMwpviId9ekG3AC/tZvFlb30FOZAOgzCoZycFs/kh7sialXvDm2lxCd
         njoLuadQiA76NAj51VgxPSVHTEcYBnB3ASDOowpL90S+vZoVpgPR/SWdAcYY177atEfa
         cDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF3liUQeV5JvHUTnu5RhGZdCXQY9NcM/oxkMDxVdsu1SrTE0QmK+U/OcU/4nMLyJuGpB0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyRjjSH1dKMh65Aendo4FHjynwEBajyn8qbsfg2i/4nFQMeHWf
	BiZHp5eNkbQEXVsn8UhwU7Sq6UmjJe6PVQc7Yek+nrLm6VRvOzZ5O225bLZlP3jGQ27zFlidHyQ
	MF97zXb6l8EKKTVQABZUA4lhmpzCOSmQ=
X-Gm-Gg: ASbGncuvRJo8DZXXLcsw56iwortQlZror9u5MtBLGFABDu52iQRgChvVQlKDWGjxMSG
	SvAV+6MrNGJQRw7rk8PjoM9dY+FWavi+Wtxgn9jkeCdkh9YITnWUd4/GgFyGVFpbassAAy3m2rO
	XyjcM2n9iWkT3sWHWYlIlhLKnz9Pg1UP0=
X-Google-Smtp-Source: AGHT+IF8YB2n9mCmYPR48pr+o1aUFiaTFY5AD9mJhNaEKQ1/FqOU/CjUow2q+WRwE9E4U1hY1d1vM5OnXCj2EM4U9jY=
X-Received: by 2002:a05:6902:1005:b0:e81:d2c6:814e with SMTP id
 3f1490d57ef6-e81f077a159mr173187276.8.1749485001629; Mon, 09 Jun 2025
 09:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250609140643.26270-1-stefano.radaelli21@gmail.com> <ca71a8b8-88b8-4d81-a17d-1b46e10e55a9@lunn.ch>
In-Reply-To: <ca71a8b8-88b8-4d81-a17d-1b46e10e55a9@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Mon, 9 Jun 2025 18:03:04 +0200
X-Gm-Features: AX0GCFuCh9zaVJsj5GtkuGSyeDwmhGTIAn0kUEeZIZink-bLJ3BuuR0gMcCu7GA
Message-ID: <CAK+owog8_f=s24NCbasLiNZw_zErqNpozU8uQvKdYbi=FKcVTA@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-var-som: Add EQoS
 support with MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

> +                     at803x,eee-disabled;
> +                     eee-broken-1000t;
> The commit message says it is a Maxlinear. So at803x vendor properties
> are not relevant here.

You're absolutely correct.
The at803x,eee-disabled property is specific to other PHYs and has no meaning
for the Maxlinear MXL86110.
I mistakenly copied this from another configuration without considering the
vendor-specific nature of the property.

Thanks for pointing this out!

Il giorno lun 9 giu 2025 alle ore 17:17 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> On Mon, Jun 09, 2025 at 04:06:42PM +0200, Stefano Radaelli wrote:
> > Enable the EQoS Ethernet controller on the i.MX8MP VAR-SOM with the
> > integrated Maxlinear MXL86110 PHY. The PHY is connected to the EQOS
> > MDIO bus at address 4.
>
> > +             ethphy0: ethernet-phy@4 {
> > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > +                     reg = <4>;
> > +                     at803x,eee-disabled;
> > +                     eee-broken-1000t;
>
> The commit message says it is a Maxlinear. So at803x vendor properties
> are not relevant here.
>
>     Andrew
