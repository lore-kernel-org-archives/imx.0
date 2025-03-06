Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929BC206F22
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741301751; cv=none; b=QxfzqJ9vm8TQVUb68kh0vJ27bBV78o9MbeHqGI+j4y7bNVh9UTlJfClG6AHLB8cRV5fYvDJgDSIDrxpgbUTREiC4H60tnWNL2CIYuK7JowRE1CsAlNB16lkQQXMbUJbMlz+yZxxqxPiIADfLctwK9s7fMZkd5p+VL2zkVuvEo9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741301751; c=relaxed/simple;
	bh=a+MtALUVY91zVDdEmvlAj9f3BESzAhxgQRJBbEz3RJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6U4K26NW3VU3bJ5UfCthUD9SblbHIGEWMnP8ahghHuiTPwM3v5IBjeLXG9PYoOrnQTHyQfvYHn+JUR/BfT1HFwsZyoStz9S1MBcwMnuNPPjUYcX5hYdjwUoqwqO/VRAO3vAxd8J3C96/1q+mqjVRCcm9XzZdblZjMVqzGp+4/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUMQPb2g; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUMQPb2g"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5495078cd59so1428244e87.1
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 14:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741301748; x=1741906548; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm2qV+PayrFKZi2Qr9jDYU/KnrvQXtIuUzSZ0SYEFfA=;
        b=kUMQPb2gfFxkc++CBL7BFGAWQJJACebKWr/K9qh73GZ8MYaJ3sDlyEMifKjH8OwdXM
         LPrep0rPSAW4RqVmxs06Q1aGXifnsom8OFI6y6KuXqtIH8vIOvhWRlaAV99I7us7PSQa
         Mi7Zfj3khPq73XeZ2aeBKztoeGED46DjNkmpPDIf1hA67kmQU7a+afuofvDPHl37cz3p
         votfCndjp98nCp6HY7OVHTFpSbt2SLNQdOnrdiY35dm4njtaHsFKI65JD7wssD64Eyyz
         a+NSNjhAoUSe3eR4uV5hVhLXuUn2AeMugxMlvv2MaI9EVHNUdWBl21PQq9R5oOYD9Q8C
         YvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741301748; x=1741906548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nm2qV+PayrFKZi2Qr9jDYU/KnrvQXtIuUzSZ0SYEFfA=;
        b=Gm/ThGtwLxxAh+0ZCI+sSU/aVWqI93hAwBSfxKcrBfC6jBCykvP3OfLmN1v1MUTAfS
         oYhNddVCwHloRvdSvM5cDM48JovjqKxJk2I+ixf7N7yps3aPIPxHpV3TLz9jnai1g5rx
         GioM+UGUcwWOIcd4Au8Dr77k79kbKu1FM50sBKkL1/TwVkd1zBY6vTRRE/uBoa16UTee
         GtdqgwAcNQE2soHTOqhSql2qWbHYNw9OWQLyTc+FsHT1Y3cShSNgbzr2y+iO09+WyMwE
         +7gnjv1lM5bkdL50WEgne2A+HPoitlqMFGz3KJoUBEoktEhxJilA1O1RT+XouXjam9fv
         CYFw==
X-Forwarded-Encrypted: i=1; AJvYcCWB18JFmKc/KuTbF2m+qL86hvnnn4z5HO01cAYnZ1SomB0bJVHUJYgzsLecsEgsn45IrQE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGpkNAV1c8EmFIk4lESsXJL8K9Ow1Bi7mZP2S6/NhuTWW3bqW2
	LwQS3LFXTnwtCXrS9nJaWkOaBiCipnnnadc7nCS0+JDGBDRhROD50TERGh5YFDteXThefpuTnZO
	OXXQuyDtOaNr/rEzuDLx1OGiFjJQ=
X-Gm-Gg: ASbGnctgitRxitJEGbwmqUos64w3eOxQXeUJ+5ScfR2scKPl7AyN8tcrp4U4GArhOfi
	+aPihS/XVdzfKIa/+IvG0scauxOlYEQ8wJ0HVLaxoK/3caJk+OCB0GOSecH1/W2M0U25/S4C2MW
	Vpb0HhbLFwqeH/E/gW9G4tAz5PQfROmYDaNJ3bwy2Ol4OCXwL69W5OxD+J/g==
X-Google-Smtp-Source: AGHT+IELLnqdwKJ1evQmnO6miMjCOF6kWpjNInySnrLYVu8W39JXHce4tfrcyF/HH/vVvtpBmKUXlY5IKpjWjhg+MpM=
X-Received: by 2002:a05:6512:1112:b0:549:4d7d:b61b with SMTP id
 2adb3069b0e04-54990eab0f1mr333594e87.35.1741301747365; Thu, 06 Mar 2025
 14:55:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306222359.797855-1-Frank.Li@nxp.com>
In-Reply-To: <20250306222359.797855-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Mar 2025 19:55:36 -0300
X-Gm-Features: AQ5f1Jrc9-FFNpCeyDExi95YGo2Kn5IirxDCaG51gdscsys4mOsD1AzjUc9N6UE
Message-ID: <CAOMZO5CL-qQSHuSoCtb+f_mqNG8vu4tTVDi-ThoHq+m9SeagxA@mail.gmail.com>
Subject: Re: [PATCH] ARM64: dts: imx8mp-evk: add ecspi2 support
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

On Thu, Mar 6, 2025 at 7:24=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +&ecspi2 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       num-cs =3D <1>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +       cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> +       status =3D "okay";
> +
> +       spidev1: spi@0 {
> +               compatible =3D "rohm,dh2228fv";

That's not a correct description of the hardware.

Conor's effort was to clean up the abuses of using "rohm,dh2228fv" to
get spidev support.

Please check:

fc28d1c1fe3b3 ("spi: spidev: add correct compatible for Rohm BH2228FV")
