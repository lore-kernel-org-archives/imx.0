Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B4D212F18
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 20:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727902321; cv=none; b=u5NsS/8E3jFoblMNCGHCMoNpjyyO6zGjkxwSK8Q7HVUEZ6/c7h+aOFGX/K8p9BVnuXZvHx9kz83W8kA1QsdmQwRbpJds9qd8tGL4FtBbOSVj/E6yUiGtAWFo4Ucxm9sl5pdWb/qkNgc0/ZOBBYI92uY/5LM2YEfI0BktfiYVtB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727902321; c=relaxed/simple;
	bh=VEHAyZoQjBPuXBaQnp3bkKS9a1uzzrtwU6torraHTtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JowuC9l+HoMtUq8u0gH7e8jEUGrqEwPxUkV8GMciLV4XEIrdJlwlVPJ3vU7xYnPGM1S0JxSzEBaFNFToxc6J4CaNtQ/DOpoKTdnoJVJEWnduZFf+7pEKN0EdmIz8Fy/EatP1YtXAbtKzsrdrUWopsiy7BNnpGzilv7dfJBeaP4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNiX4SIa; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNiX4SIa"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so188420e87.3
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727902318; x=1728507118; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKTTMLpVNU1rbwFfrmI7lnoXgbZiPVbY+NtY+gwrero=;
        b=HNiX4SIasjigYiJVGQyIGw6OpzT3mkvArdPR9MKFMEpICDlFRyIyfmyL/6ArNpe/ZQ
         4cb6wYa4f0tn1TdvRW/yvXdVzNVsEFhKFvl/j2TsVwErqd9t1Y7wWn1bYCMlxspSeT9X
         g5Nx6USQTYOlv6uVvCYcyBlQmA47Jasuwnk6b+MMT6FuCHapPoiCz6+hjJeqm+Ng+jHA
         bw4I6IbebrQaUt2KpfNrpSgh9I/J1imQnS6wEGO6PC/9HuTZlArtSY6fk2DUDmL5wJbO
         Q8l/L4cAyep4ZKcV+rqhvyW23TEc+BKlOuT6ediTapEweWEIO1nJjQ1UYG2tmPF5GkW5
         lJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727902318; x=1728507118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKTTMLpVNU1rbwFfrmI7lnoXgbZiPVbY+NtY+gwrero=;
        b=NmCX57ebnhEbdLoDb/lvcPr8AQud6fvgN5Ty0AQIHPF3k0hwh3xHJVso/qt9wiSZai
         Hr8giRU4V4Jr33CfpvHbWdhMhgIV0y4FHoq4x1H4NeX87Lw/Y/AXzn7VC12KsES315/H
         Actx/2doOpmxtUUt1L+UgT/MrdflgAgoG2eidh8ZRPBnDoYFZikPhggG93pcwidvnvnc
         4YHe4A3X9OgCS9CQkrqltYrOObruJ8nsm71x62bt718CCDenJDVVk+dDc00ML5eox6Lf
         HZ4DY29bQM68/2jJZlmYrv7OGC6599FN+2xcZJ+3vgMvl0MXSn7TU9UlPOkMdxZaf2wC
         /TsA==
X-Forwarded-Encrypted: i=1; AJvYcCUsKjvSVjSYc+iOcXjoldOnJXwm72i4i2QENYU6j5F2G5Qn+EwOenrF8kfT7ZGh19+mITM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOm9T/FpAfy6n/c2pA5F9pxG1VGE5d5Rjh96h2sFpqKxMn3H9R
	ZfWvEA0Ej2UYDN45js9WwG2NVTMm4syJx/27zp4G5ReHc926wiG/Z0pSpLPOvobnokZw7Btr/em
	vsq72zilJ5TzMvL1FHIs8gs2Ribw=
X-Google-Smtp-Source: AGHT+IGkBg1h2s8kkcXTyEZggePG6zCcw11Akl1BW7tIzxgdK/KH0WZ3KEBjraWlRZDcrGpcbllxYF4a0zGGCXXfq1c=
X-Received: by 2002:a05:6512:3084:b0:537:a745:3e with SMTP id
 2adb3069b0e04-539a0795be3mr2627745e87.45.1727902317426; Wed, 02 Oct 2024
 13:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002204750.597337-1-Frank.Li@nxp.com> <20241002204750.597337-4-Frank.Li@nxp.com>
In-Reply-To: <20241002204750.597337-4-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Oct 2024 17:51:45 -0300
Message-ID: <CAOMZO5B+nGngoonBm4gzFXtKy_DR7SPNs1GQYSeOu8emcsRgyQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8qm-mek: Add PCIe and sata
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 5:48=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +&pciea{

Missing space: &pciea {

> +       phys =3D <&hsio_phy 0 PHY_TYPE_PCIE 0>;
> +       phy-names =3D "pcie-phy";
> +       pinctrl-0 =3D <&pinctrl_pciea>;
> +       pinctrl-names =3D "default";
> +       reset-gpio =3D <&lsio_gpio4 29 GPIO_ACTIVE_LOW>;
> +       vpcie-supply =3D <&reg_pciea>;
> +       status =3D "okay";
> +};
> +
> +&pcieb{

Same here.
