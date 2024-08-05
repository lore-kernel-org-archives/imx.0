Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0C42C6BD
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 13:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722865211; cv=none; b=hNmuW34igpu1CGVkHUhtrWnH6uYWlY/B3GLW3T3O0cQDEFK+hfaxvnsce4w0/H+ONrFUWZnwlKIcnikuFfWBrxQOf7/RNYECK7FxRC9tZmUA48e5STHZgUFW8+W1bJADYZk9pUK+C5xkrkceYhPNHgM0v2bmzAGsOgIK082kzw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722865211; c=relaxed/simple;
	bh=ruk6mOOD/J6EGS1DmhBnxOfoM7b7J30uZ5JPOGJ6aDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPBrEG4cxZV7ppKtbOJK2xghbKQy5E6feS0whx8vtLQRwzPovNMYbPIc2hRA4w4YzppsK5fySxUQQLri/w+7VAoLjuqbO4cfdQQnLfMm/LL7/Eak6jJIrFjtRUcQQQx01QVIglEffsL3AN6zMG34DlYp9WqHdACUiAx9cTz/QKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6d5sKrN; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6d5sKrN"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef260c4467so20803041fa.0
        for <imx@lists.linux.dev>; Mon, 05 Aug 2024 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722865208; x=1723470008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b46iJ32H/7QhFKQjeBDvVn66a9XBRt1jPCCUgibPNOY=;
        b=Z6d5sKrNgY10w5RufRc0fVgnYLjT+kAzH0uhhTG/WAwYbrKwwr2tSdiLKfcjVjTagd
         NfnxEXowbfP7SMPTh4vanBHbs4M+TRM5F79BzCAYDknmLpqBA98MNRFtNLoorn6ozDG5
         uEyyD5p+xFQGuBFTzjhL2+r3gZotv61RdO5NXJE4FUwML1oFWdZrKxHu3lBy3VeRCtye
         JKTP4FtJecO+yo1aRQe6W4tvbofuOcc9ukHgK8yUAvZ1Q7THLxETwIsPnwa9gfGooXNX
         0++rBrf+hQksHWs3JpLC5qI3inORxQL3Epebq2Q5M8I9kdz0rZGL7FhaNPxSPuK90o5o
         WDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722865208; x=1723470008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b46iJ32H/7QhFKQjeBDvVn66a9XBRt1jPCCUgibPNOY=;
        b=rCNHZKG+gm+RvpTScqt6Bs8XBp1MkCKjbFjm3L4qczH9Jxk7AexJBfYOO9ersynzT5
         ujtrgpJ8oL7gKCy3TJPRerf80w2QjyBP7jlmysrpGcoF83kawgT+bJEYp/jSuvQzMSh3
         XewPSLMlU7SrKsq0diAP8NNkv6/kPkzxMFIrTO+DFecmTjV0ia3dihAFkrZNv9waoOF+
         d++lpZu7r38zwNifti3c6d894V27p1K14OpimHHwFtOZ35T9Oa0Wy6WiOydV+DlvelBk
         FEihv8VeeozsW8/wbCJTyZS/EMXBh6jWS2UcLJW56Iq0BGyjE88DEL15QcLkpdAL2JR3
         1nHg==
X-Forwarded-Encrypted: i=1; AJvYcCVCxeZ2H7mWEBu8ORsVsllNMm+faJh5bwKwOLuUthngQegtI1rgWG41jymTdr6OO2a7xuM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwX6eSiokHcl+qBaCVDRnqcjwwusdHoAkNG8UNV5YMOGi23uMof
	X/+4PFoc7fs56p4BVfZ2ItLnDAsPIaF8iuiLl4qncS8wfBn0F6AkvBlawYMjShF2fcKc2kweGRg
	iHxb3P02vhmIOA+nMyar40JBthSA=
X-Google-Smtp-Source: AGHT+IET0zibODSKGLqBpAyFlOzXNn5BGpAezMR6EMww3A49Me0AsCpIlHGcaMhKnEUXB8jG1dP1asr/bLudntWRt98=
X-Received: by 2002:a05:6512:1307:b0:52e:ccf5:7c3e with SMTP id
 2adb3069b0e04-530bb3bd143mr4066577e87.7.1722865207262; Mon, 05 Aug 2024
 06:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240805-imx8mp-tpm-v1-1-1e89f0268999@phytec.de>
In-Reply-To: <20240805-imx8mp-tpm-v1-1-1e89f0268999@phytec.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 5 Aug 2024 10:39:56 -0300
Message-ID: <CAOMZO5DzH1Ldfg1rr7ET+2Y138Sv+G9HV6iRiTPOaOUgJ+asHQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx8mp-phyboard-pollux: Add and
 enable TPM
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Teresa Remmet <t.remmet@phytec.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Mon, Aug 5, 2024 at 10:33=E2=80=AFAM Benjamin Hahn <B.Hahn@phytec.de> wr=
ote:

> +/* TPM */
> +&ecspi1 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       cs-gpios =3D <&gpio5 9 GPIO_ACTIVE_LOW>;
> +       num-cs =3D <1>;

num-cs is not needed.

The number of chip selects can be retrieved from cs-gpios.

> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
> +       status =3D "okay";
> +
> +       tpm: tpm_tis@0 {

Node names should be generic.

Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml suggests 'tpm', =
so:

tpm: tmp@0 {

>  &iomuxc {
> +       pinctrl_ecspi1: ecspi1grp {
> +               fsl,pins =3D <
> +                       MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO   0x80
> +                       MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI   0x80
> +                       MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK   0x80
> +               >;
> +       };
> +
> +       pinctrl_ecspi1_cs: ecspi1csgrp {
> +               fsl,pins =3D <
> +                       MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09     0x00

Maybe simpler to put MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09 as part of
pinctrl_ecspi1.
