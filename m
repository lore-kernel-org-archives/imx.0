Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B172E7651
	for <imx@lists.linux.dev>; Mon,  8 Sep 2025 23:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757375019; cv=none; b=bZmndOvEDvialomww9rZwQ/hnFCisS9488ZTcI//fzxfkRcLrLUUcJshikzEfakpi1Md5IMNfAY01hloEetdQYMhP3hR5TTLTtal+X7S+MzA6Wdl3XZ+NRen/SUFt4Y+7pqYO2RPgWBCx6XTBdLB0h665xTji9QsZsTD7ZfCE4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757375019; c=relaxed/simple;
	bh=Xf+o5luAHatCq/dTDCApLoFgBaeG3YyqdSkFJuMacwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HN5NsvngkO4/K8ZBJlFnb2yDFm9u48x9Hs/74yhArSM/7Ez0B+vLKfdBRsRNvUi8fDa1d3K3cgj7ICUWKQW904OodoRKpCFdDBRCcqxRDnhXS7cezs/iDX9oC/jviX/2066V6xecAuTsbQmOK7b5g9ys3m4Thds3Azc8AeGs3tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=cS6h2waY; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="cS6h2waY"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-746dae5ff93so3901595a34.0
        for <imx@lists.linux.dev>; Mon, 08 Sep 2025 16:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1757375016; x=1757979816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZ31nFbpBywr5LWV7R5R4cpzaC/84WhWlclxZ1iDl8w=;
        b=cS6h2waY2PAKIG0XyKYP8ApOfG6f9FIg9QQHWz6vzcEngGVdyEGejL04c0msX0yTno
         UwvE1yvvf+BaTy9aPd9y0djBeJjFPqCQYLOSCehsUY+SvvfflvdrKny0saeVjZiT6lNu
         4io8kL0hILFsnfIwBvsXtHFFcWdgiO6cxsGnb8nRVJjzhvGg8E/r5MnD3y6eBpNEqCxW
         O9klsPtdLN5QIuBwfcD4RN8y8cyu0AOyqoBeQCR/HkqhQL3JODRZpnkE0Z+2ioNwItZS
         JvfKArsvr9SI2jtNULdz8Drm1OaE5VVctoMKLRk1denVSCFK/Yw5tK+K4iMlAAYFdiTT
         L/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757375016; x=1757979816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZ31nFbpBywr5LWV7R5R4cpzaC/84WhWlclxZ1iDl8w=;
        b=KVmGFLMDPyr1IFV59aVf4aNUzqoCHyKUaHwQyLE1lCWsqeJ/bgVY3zju/num5HegZJ
         yGKJNJXUWtDq0uLEpQys1pob2N+cP/+k7G/yFYlFwmT09ZlO1yhUi0k4HCdynKZ7rx96
         n4XmlBJ7t8EMuXvA9oTQ6uZZ2LhNywdE+WzyCQNeQAXNQG/q64UX6GgMUT5xIQ0IqJFx
         +UUxg8IIY9w5TCJRzIDPWzWuBYRXfrLaWgGMTDgyvOlFwdQ4b0U4B+2vMG1VcVbRYaSD
         skCb7kXWEA79q0K8pzlLXl75Mo1nlpMqoqJWN/TxolHioOtTxp5Q7kIfg0yem2A1o22V
         MN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoRTfstUWfEuEb9ZTkYDApJ54DqBPcvS2GhlLCW3GgNOctKywmBF0KhKMPPFsEstONdTM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoBpbvGU0aq8n3kkjbBgqd/eI26uyh41wI5CkqUqmMa/NPgM/j
	nOB0bUWeLDvpCeAIfJXzzx53xV9qKujaFQqUqnFOmOQDbIy95SPM3B7pzE6FpMkMXD2Xw2P7srp
	dicyISKwrcyCP7DglvjPObiVmBTODTg3KXjYTxPDzXg==
X-Gm-Gg: ASbGncuF9+ilI0D0CpZGUT1pnVvJb4sKoNktDU0lolcBmCU5vjaSSDX2mJJ14dlRSR4
	ba7Mtwz/z0kNnipe4A9n1rAZN0u6B/qqmQx+q5Oi+qwfrQJ5RJJ9tgjkFJlrzsQIxufm+QNFHs0
	e38rD8rkym9LRzE6uBvxv/el/OuWM7yYd7fYDlRfR/t/OzQa1qaanG41Glxo5WpoIIhYlJspYgM
	sHsYvXslw3qrs0aoA==
X-Google-Smtp-Source: AGHT+IFz9G3l1NgBkuI646j9EnzDEEYlshmM1HaRnKUWjXTHPYCEEDbgvsYhJH8t3TMOXGnJoUgXdZIdCebMwUfCQhE=
X-Received: by 2002:a05:6830:4885:b0:745:52d3:947c with SMTP id
 46e09a7af769-74c71eff9demr5731156a34.11.1757375016543; Mon, 08 Sep 2025
 16:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com> <20250815-imx9-dts-v1-8-e609eb4e3105@nxp.com>
In-Reply-To: <20250815-imx9-dts-v1-8-e609eb4e3105@nxp.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 8 Sep 2025 16:43:25 -0700
X-Gm-Features: Ac12FXzVP_2vJkdlY1v1O3gS6w0Yd5KqydILTTKyUiWG6S13pVl8pRj4kS7eaz0
Message-ID: <CAJ+vNU2hro_ZoRvmQ9yowKsX25AnrgZdGMn2D-RCkyJA02CEhA@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: imx95-19x19-evk: Add phy supply for netc
To: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 4:50=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add phy supply for netc emdio on board.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 20 +++++++++++++++++=
+++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm=
64/boot/dts/freescale/imx95-19x19-evk.dts
> index 39815b21d235d2f8cfa49720d3be49d056ea039a..feee6da65d37cae7413b09216=
014d6fe2b76b032 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -226,6 +226,25 @@ sound-wm8962 {
>                                 "IN3R", "AMIC",
>                                 "IN1R", "AMIC";
>         };
> +
> +       reg_aqr_stby: regulator-aqr-stby {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "aqr-stby";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               gpio =3D <&i2c5_pcal6408 1 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
> +       reg_aqr_en: regulator-aqr-en {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "aqr-en";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               vin-supply =3D <&reg_aqr_stby>;
> +               gpio =3D <&i2c5_pcal6408 0 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
>  };
>
>  &adc1 {
> @@ -502,6 +521,7 @@ &netc_blk_ctrl {
>  &netc_emdio {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_emdio>;
> +       phy-supply =3D <&reg_aqr_en>;
>         status =3D "okay";
>
>         ethphy0: ethernet-phy@1 {
>
> --
> 2.37.1
>
>

Hi Peng,

I'm not sure where you are with regards to this patch but it indicates
to me that you may have the enetc_port2 10G port with the AQR113 PHY
working on the imx95-19x19-evk with upstream Linux. If so I would be
interested in knowing what other patches you have for that. I'm seeing
the interface fail to register with:
nxp_enetc4 0002:00:10.0 eth2: PHY has no common interfaces

I'm wondering if there is some support missing from enetc or the
aquantia phy required to work with 10gbase-r.

Best Regards,

Tim
