Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A5D6FBF
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 03:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713323396; cv=none; b=cWSImI0D1MgLXbPlx7wcfsDa6vR6JDTPotpkVVnzGM6+j8q6JXfLoE9lIAGJFwDq03gnOSwt0urKTbH8qApzhWVcewgy29XtnGxmr6leSMgeqtjnRIUXAcFdSEq13ZPRv9lqBzH1qx6FjkIyWFHHSVogVXfCHBo/pHnzmN1BzQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713323396; c=relaxed/simple;
	bh=ilqZuJ6ogECkzvhjA0tE68aZRZnI2Mc/Wgeelwe14/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPUn0nKFRHWN5ea8H3udCWa1vdtwUsKaDE+bWF6mss6r0FRdec0YruyHoPU/lBoOh4BjfcgxI0YnS7np2YVlGvmY8Z1Bk+zZkphCUfvLd5W1ns382zp8d3iEmAVAOfXLAKsgDvmpzaFpPlrVw1tpFV5zTBcK6BToxX1At41SUuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGp6yS0G; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGp6yS0G"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5ac970dded6so1304483eaf.0
        for <imx@lists.linux.dev>; Tue, 16 Apr 2024 20:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713323394; x=1713928194; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmF/RSeCiJgO8DT8EUwS01DU8BP0OT36dIP7pCjzgmY=;
        b=YGp6yS0GoLA3pNecfMf+sNDV5tDt6DkqBlKstjqpBKZwGsxL5o0B+P2Qhphj33ksFO
         2qvNcNOCKj54HtTVPpW8QGiw/F6k3IOZk+e2ofN/NdGC5B0Q+I1/g/Yf/a8NZ44dIjeZ
         FIUb8PCQ+3c4WXl7tV0m0+THZ0bTjP7ZIUSg78K6OESEQIOAXCXNMLArET+Cj45TFt5k
         eik084r2TsXNIz74/UHbMrykWI8WwoqfOAtoYjI1GK8ZZczvD5j9N+p0KocKuqFByfC3
         r/z6htd5/mfG/04KAeF1w+ZYSeiq0G2J8hFGnbzA9ViNPlf384xrvVEp6ScuYkz2VWqZ
         bqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713323394; x=1713928194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmF/RSeCiJgO8DT8EUwS01DU8BP0OT36dIP7pCjzgmY=;
        b=HjtnorpnVGlIgKXQo5GkQGg33ZUMtb2DAKiEJ+w5We4tK0iEssPfv0ql+4Bk1sOnL2
         VeF6HKaVrfIm0/9dm/NBLu8BTeDuepQjzF53TdKSw+d78BXCL3BUqp5chgZm55HdcreW
         6gbZLMNuyt5iRJk3XQ6+bL18v2PMHfp/glJsUvjSho6poA+y8DnpADA1uXCB58PifptJ
         RNrqAp1KwjnVi07JJVb4qU7maVRDmN2g27BdDuV4B0uRe3Rwnq42wyEGIOZ1IrzO+G9k
         lbKgjgkkIZqgvnzy59Bl6vhr6lsTuXsvHi36YC+8hVyyBLYDOuJD2LAnNsD0ZW/vsyTE
         D0eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOTcuHbZwjTDa8/mLP5ue3XGaVye3f9L1QXFXgH3sYUcwk0im26tGxTXB1a2peHNeY3djqGlmKAxSulCEGWjHlgpRR
X-Gm-Message-State: AOJu0YypgtTYhUwXnbi2/hgjyWNEmNb1L6xUoD+6zBzyTFRfQayg+q89
	+KEl+bp/k+bwSw7JiXdfSYW7uVM65mENlYBrsbe8Y7Rurt7FP2LA+s7Z6burXtsKBK/QCpmU7BZ
	E7F3kSYnExxgnuY9mTAkfKqT2L/M=
X-Google-Smtp-Source: AGHT+IHFquYN+ximwLzLvhQHpR6/Uk/1sIAf74vffhGuh/w5zl5ZlLPz3m/jczMWZ14P5znQhl9qgkYbXICI+fwIuag=
X-Received: by 2002:a05:6870:e9a9:b0:229:e46d:763a with SMTP id
 r41-20020a056870e9a900b00229e46d763amr17319691oao.0.1713323394195; Tue, 16
 Apr 2024 20:09:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240417031455.3177778-1-joy.zou@nxp.com> <20240417031455.3177778-2-joy.zou@nxp.com>
In-Reply-To: <20240417031455.3177778-2-joy.zou@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 Apr 2024 00:09:42 -0300
Message-ID: <CAOMZO5BGNcbxA4gH0r_AsoAHNVAcCAAo8JFshzxd86naOaOYhg@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: imx93-11x11-evk: add rtc PCF2131 support
To: Joy Zou <joy.zou@nxp.com>
Cc: m.felsch@pengutronix.de, frank.li@nxp.com, ping.bai@nxp.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	linux-imx@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 12:07=E2=80=AFAM Joy Zou <joy.zou@nxp.com> wrote:
>
> Support rtc PCF2131 on imx93-11x11-evk.

s/rtc/RTC

> +&lpi2c3 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       clock-frequency =3D <400000>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_lpi2c3>;
> +       pinctrl-1 =3D <&pinctrl_lpi2c3>;

Why is the pinctrl-1 still here?
