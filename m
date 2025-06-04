Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037ED2101A0
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057878; cv=none; b=YdyvcnrRQsV3NYnfUiEEX6qPDkHq5LdyHELIalzYSr5TWmmmj2ikMYuIa8kG/ZOgzM3oaXVg8q7wOyJbYwMPC1MlPosuoviPHo9h3S6oeXSUjUpOoiXqHVP6LD77G4wKYe0wixapWU7tlkokrptGFpvOhhQMOeeXDjoZTv/8Bpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057878; c=relaxed/simple;
	bh=4T2Xhltii2sdundiNV4DDC+vFusCJPHnJZUONFyp2cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKNx9b2WqmJVhYcvyrnVexAJsSm/pKrFmAHTsmqDWJICis7RZa2rnuzTgQy9HNG6lLjYwWkD2vMoo0XU0CjyTogKNvYjsI/ISRnEf9rQk7ZI1KGb7Gz7g942Vth7nvr6gL+I6o6RsiPfvZbGWQb+qHRLxYF83pdKYG3Xm88NbB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjlCVoDP; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjlCVoDP"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e812fc35985so152622276.0
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749057876; x=1749662676; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nANItJ3n9rHzK0lPnEVgoGoN0BgH3bisoRcHmb6FsOY=;
        b=UjlCVoDPXgyTMkM+OTOej7VyO00yNNaMwcauQl1cYIaiG/k/i9P+jLR2VtSA9z6bcr
         3lxQrh1Me7kfvytE0i9JCnUP7fGWfxhCtIIvcv6NF9YIIA8NX0V9c8JIr3aQqyL+KpeW
         QhagvyMfYj5EJYMGHmE8Oc325jVQoL1nRFOsUGVMBT1KYks4v6xsRLEmo1oUGomGc7Zj
         xMtbxst3xb0oxQx9QdV2AT4XdSx/zc1n6QcLyhim3BjgEbwXdBDp4+5EBhNk1yXkdVHV
         htKv2fVhzb2JzLszk/7VLwHJXg4viUlXDDkxyNhSjfo5Vo+95XmjQArW7aEXpp5ByWyu
         FQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057876; x=1749662676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nANItJ3n9rHzK0lPnEVgoGoN0BgH3bisoRcHmb6FsOY=;
        b=CypYFa4YzLv+r4RJ8b5dFxURix9Dh+4QPACHDOMqEYzlLyGpkCwkod5bigafPnIddz
         LvWOPTeSwW+bcfP0fkTlViOMt2NwkCPdmgYRdifmoFFIe916RReHIzh31uXLIQvSg3ul
         TduyPj8C9kV70t/5kOXvI0vUt/NXIpZIetDM/dzIaD8bxawoHhNlhbiPT2KqeIQUYK3s
         tVFX/mlRDkL8sb0KUXD/FKW/++sgy/UjSCq8PW5GoTpkGV/dHAOs2t3PzeDwntVInk3B
         2ttITviCKPDAf3YE/ZRjvUY17x0evVuqQL0LzsvJqxMyT5d0pJXf2a8tno8AAmi6yjsi
         +qcA==
X-Forwarded-Encrypted: i=1; AJvYcCXIHHjQp5r8O4gOhEa2YYVNE+eopYncVEZQ7ZZkOoT3SLGnH5t2sUJxmH9ci9uDcZPYmkk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMJ9LgmDTCVF3t4otjlst8aHe1+4Vz5B6F3Xny2HXW0s6g9NZa
	ur5BQDJI3ZOyhewe5xxxrfy7HUmMaX9iM+17te07NzpE9W12ygZwadYe/0Q4ZhImhLIsXMO+uIN
	nYESfKWVaHmzGKFPlg3nxZg9PyV4aax7NkRvbd9s=
X-Gm-Gg: ASbGncuBqcqQQk6yYIqPGmkXk8ekXPy+ReQetLmq96k/lrsYqsM+DU1pb1TJ2UaZuOI
	uiazB6wFs9zj++mD2fnhiU5CmDqD7YBHo0XjR3t9xGyLLrIjU4Usir+jS1Wg0xJRzyW0v1HFnCa
	vWeo9AfBSt1RaMrUPoGRgW0hxJb37REjNAisixjzSXNA==
X-Google-Smtp-Source: AGHT+IFqkrIQksf+ZagsLNKprT5D9Gkx/ZIPUPXWNL3tQVC5N49QOKwKG+17ubQNHdTkJZuEZwnE8mYB9j3MltCsOrE=
X-Received: by 2002:a05:690c:4988:b0:70f:87c5:5270 with SMTP id
 00721157ae682-710d9afc82cmr54862237b3.19.1749057875817; Wed, 04 Jun 2025
 10:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604153510.55689-1-stefano.radaelli21@gmail.com> <92e4de77-07da-4583-bf0f-46891101c327@lunn.ch>
In-Reply-To: <92e4de77-07da-4583-bf0f-46891101c327@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 19:24:19 +0200
X-Gm-Features: AX0GCFsi-0DPQCLx4D-kw5G9NJPOyVhmZhQWfWIPFkfSiLFQtS5JLkD2hBDD0uQ
Message-ID: <CAK+owogo4+R+DM9rM_-ZqKRPX1wV6Vhdjrh6KWM71pqjQpYNuQ@mail.gmail.com>
Subject: Re: [v2] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, othacehe@gnu.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Thank you Andrew,

would it be ok to add your Reviewed-by tag in v3 after applying also
the corrections suggested by Fabio Estevam?

Best,
Stefano

Il giorno mer 4 giu 2025 alle ore 19:16 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> >  &eqos {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&pinctrl_eqos>;
> > +     /*
> > +      * The required RGMII TX and RX 2ns delays are implemented directly
> > +      * in hardware via passive delay elements on the SOM PCB.
> > +      * No delay configuration is needed in software via PHY driver.
> > +      */
> >       phy-mode = "rgmii";
>
> For this part only:
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>     Andrew
