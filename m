Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2090C1DB124
	for <imx@lists.linux.dev>; Wed, 21 May 2025 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827657; cv=none; b=KVRgwNw5BWepKiuhb+uiwm//7NpxtvqONz9OSd/z8DQL5EzWXFK2eGdi5ug6cOG8m8EKoxbJZM+nM7wiJmn7v3PvaST9jL3d4wQQwVmAKsktduD/eB2vKuOUoz85VuxycL6BbaYXW2LD9vxwSMR+ZGHNX2xVIA7WPuPZIZCEVtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827657; c=relaxed/simple;
	bh=s/NcY3SINg1iBtbSiIAXOaPuq5jYZKVkctKM8NepVdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovhHyn8Uf+Rrl3E3jZUA7CcH499ZG4wtJwp7E1w5YyyOXKx6zQSzTDUemECY9xvX0F4TqhGfmSu/xCbYqcw/VF+Dxl2Hvq+gSmWjFp6r8GY/VxxWFRKMddFBvX+hKjRO60McfaP2FUg71nwOckBPc+lOFQ7A6Mtwv9kADrlBooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBUQAhht; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBUQAhht"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-551fe46934eso1864141e87.1
        for <imx@lists.linux.dev>; Wed, 21 May 2025 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747827654; x=1748432454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9d59y1AAUBQBeLns7WWUxwr1G+hlDyrZidnmum2/Ds=;
        b=HBUQAhhtBTGLK/1AjLw+Khqpm24cwN5qAr2cPYrd8Eua+gufYpxwx6DxpdRZZaddjm
         Rn8oha/lGGiJWUqFJ+8Jisjp7cvnJSA3fHdYsRpTbn8dHt0zYdUCx60ondxQTyBdLH8j
         VyLRtG9PrK6iSl3FSpqR+ptAdtBvISJrYfH2EsD873n99Q26cMxza+kQsgy9cJlyJafK
         JMeb8zfzEXDG14XwfnomSoey2v6H2I+QaG1cCMM0MLl3i9LW9OuKNXjvH2wKtqqAgS/k
         eIzo+MzPnGHix+AUI9IUhCM1BZ+pqMDQtZg1uCMvHP05xChlF2MhZZaLw3uoQmXVLXT4
         DBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827654; x=1748432454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9d59y1AAUBQBeLns7WWUxwr1G+hlDyrZidnmum2/Ds=;
        b=Cy6mBWcg6HFe3XflNses0hgL6rZcutMKsAVCpQCYZw2RdQheoggvZFfNFuXoHsLka/
         nmN81UUtDnXgHh0n4gomgav98qr4ljGlQXC7efzgUncxDUyLeqf/Hi04VPh7zZf+4l9c
         M3IsUg4kjGJb20s38870idF2XNtLwyGwz4nKOykp5FAKQH9PWpacMuhVQNP2Z/LoRPfj
         Pftd6fBVayW6jRrOlKD42CMaqrxx7EwxU+61wLjg6otUBcWs8uAgiMwZvu/k/8Dk8Tgq
         +IhTBQtqcOUsSnFysnK2u8DqhlMoVILkZFRlXaoZp8O/+3yaq5Lko645u521dh3rlT6/
         9+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+qwNhjwCg6mp4omRDMlJzQWhSLfdT6BKWyslbi/N45V8RY6rBe/gPE8Q5uxvtR4pBocQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVp+PSoA8VVfaf9XBS3RZ6PdIYiGNZcwjTjePcG0jINB9bqWB2
	M2alZv4Z0nulnJhC371ufURziTXN3VbxExgP9K2WQBuvS4402pMz6i88Uq5JuPNw1hN4taWNu7K
	ge6bWofurYo7WMckQoSC/cOH9YVeerZE=
X-Gm-Gg: ASbGncsXVmjuKYVzRwijZD40StUhDOajZP31/uvZTrde6bTmUnFKzmiJtPko/SyThU3
	vUHAmA8vLv3cfVPz4XmAErBlwmK/v6W0JuCgIA3vYAt5B1MDQpsUapl67kAF7Pv4tHPJ2muPLR6
	hxYKntwBRoZ7OJMzLokjHg0/hTDfNVEZp3uNbceRPAhU+v5KeemCcx3UTHFBAYVn9fWAljuCpcM
	zg=
X-Google-Smtp-Source: AGHT+IEBT7uTeEaD1M6QcMlftPN+Diu0RdjP2HkZ+bs8PtCVUYHorsV+7TdTYTFNdPAyQT5oPUXJJVDEF5pcsY0RnQI=
X-Received: by 2002:a05:6512:3c85:b0:551:ebc1:bc84 with SMTP id
 2adb3069b0e04-551ebc1bff9mr4320652e87.8.1747827653907; Wed, 21 May 2025
 04:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com> <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 May 2025 08:40:41 -0300
X-Gm-Features: AX0GCFvuahJEGWjKzRmbj_fSU5phUy4za7_-MZjI-5ppsFQyUQtxl9C1m5zGqss
Message-ID: <CAOMZO5D-d7bmBfXKe936W5QjmsukRRX3y0ge+xtizqFx0HPE8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dario,

On Wed, May 21, 2025 at 6:28=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 256 Mbytes SRAM

SRAM or DDR?

>  - LCD-TFT controller

The LCD support is not described in the dts.

> +/ {
> +       model =3D "Amarula i.MX28 rmm";
> +       compatible =3D "amarula,imx28-rmm", "fsl,imx28";
> +
> +       memory@40000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x40000000 0x08000000>;

In the commit log, you say 256 MB, but here we have 128 MB.

> +&i2c0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&i2c0_pins_a>;
> +       status =3D "okay";
> +
> +       polytouch: edt-ft5x06@38 {

Node names should be generic: touchscreen@38

> +
> +&pinctrl {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&hog_pins_a>;
> +
> +       hog_pins_a: hog-0 {
> +               reg =3D <0>;
> +               fsl,pinmux-ids =3D <
> +                       MX28_PAD_LCD_RESET__GPIO_3_30 /* LCD reset */
> +                       MX28_PAD_SSP2_SS1__GPIO_2_20  /* External power *=
/

Proper panel bindings should better describe these pins than hog pins.

Do you plan to add display support?
