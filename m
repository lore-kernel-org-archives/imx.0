Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56934EEEA
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555617; cv=none; b=TkZNOrAb9D0pffUag5ijjJ73ZEGnPplnH+SEOEAoJatvzyU3b5cgMw35pzv5Pinl3lnCIlrOat1Bk330v2UhrODBR0SgRmnnxbseiQ5j++T6F1sd6frsZEHa+gGqAfZIv+LsbeD6gIoEardACjU2gkTvWLcW8Uesh4t4E+Ob2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555617; c=relaxed/simple;
	bh=w5nXkknwo+0TmPQcwS99jRHRtVkofZG2b6gSRD8S0lE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKvxKj5Jac7/KRqdWzropfZMIBZYrNq8tjOprbFuLCgBLBkfNFHwvOiWT44PtZrJlqOIWmXkMNWbqPLmre7gY4zrVKa6QSpnqEMglIbO7CJG9pymnU0in6f4VJwVVUgeNb0BhBayv95KnKK9QDYsahHfaBVaF1qwBa/k7fCs8Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6tDnEfW; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6tDnEfW"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12331482b8fso5945919c88.1
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 01:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768555615; x=1769160415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5nXkknwo+0TmPQcwS99jRHRtVkofZG2b6gSRD8S0lE=;
        b=P6tDnEfWQu6UPMcsW7I4+z8N1qLUnFvAZrIU8Yu/Ra3ebWEZXY/X77a1zEVwd2Xnoi
         EnvPSRMD7Rki+2naJgL0FciUoY2+dtpWX3LyOw4+EOsHJiW5ZyQBMiWCSGks5IQs9bMl
         vvLNfjnZNbwki85B0qrlpbQLoLYAr2B5aZjZlgr65Cmj3yWvYzv5hrkDxzDr6TsuvXTf
         o5liuUiNWBvUTE8VV1xrP9CpXXCT+yfoIw3P5aGb8Y9qOFZnsouuswoFdI2jG+sIKWNH
         qZTwPQRBm3YHvNUhGcxdwsqVti37Xx2i1C1ysrbEcO2GHM9UuJrm49725xPBP1fyOt6z
         Gb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555615; x=1769160415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5nXkknwo+0TmPQcwS99jRHRtVkofZG2b6gSRD8S0lE=;
        b=BlP4l0YJ86wuGXlSYyb3+88yHXHE37kB6UQfXyi23ioATYV0EllJZvozw6UiYSuG8p
         weUWopqc6dP6cUUGTVi1LWOeOBwN3IDgC+3Rk7RipZUGndmwrsHiP7VgbDktfWYaBOJ0
         z5NJcJhhaC6ijUO0JLbey+DWyNnr3g6WSB3MOA/Rfw3r5h7O5coZZi7z9xTIpAJ9fiGA
         bfWNL86RB7BWjyeHKoXGHK2bTkNUtDXnuWlzHKRQHjlXjOLggjMNkl67t5rTA+HRRex/
         uZ+Nr4H6MFZGJI6vgYjePWQzo6wBfPfk+GuT9n9V44+ACJPJc4T6ONZjLN29FNh05xEV
         IvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVWHjtbltbdS8t6K05DT3rey1YdMlBDamR4Qt48DkL7Oqc871P4LC3mQt0lBTsywOpL28=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEroYJAJZkABPRG28a0kw7HhINOcDp2kgo+0HY+4JLZ9S2hkZ5
	EshwY5wpXUDj+v+x3WJuvs4YFojFLSXV9GnxJs8av9I8vrxDPbuVdFPfUDOOJvoALkxxBIwE2la
	SSg6h8KC8QNLarYqkKYsH2w6o2L7k8gg=
X-Gm-Gg: AY/fxX5LSUnqNH/dP8T4UGU4fVOgfICoK7q80nkVRdyBRfzrYWw/NV3Dr421oOxM84b
	FEK5BUIhzoLISfmCj2kEo0beNw95UvgLKIVNkwVejTC1UFqTEs4DlJ41vS5GVviIyMISvqF7Wdr
	KQhG8Hsw4dBsa5TpNtgVY3f9CiOtKKmifvitoNgSYEORQzSkANS/m3203QBRpxTfy8bHWu1JnZp
	d5USUUJAzxHzch56MACybA+GXXRhUYEl0sExBntKh3/348L7uqkGEfd63tr1zpiE3cTqa8qMZiG
	yr/gr3xnNHidwmHBYemUh/Mvlwuq8cYeZsdnVel17BEeaRjiH2ifEWR71DgWjeuWA+P9TOJVeAj
	AH+SV+bEXMQ==
X-Received: by 2002:a05:7022:b8d:b0:11a:3734:3db3 with SMTP id
 a92af1059eb24-1244a769e03mr2330673c88.32.1768555615390; Fri, 16 Jan 2026
 01:26:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116-imx91s-frdm-v3-0-98671de64925@nxp.com> <20260116-imx91s-frdm-v3-1-98671de64925@nxp.com>
In-Reply-To: <20260116-imx91s-frdm-v3-1-98671de64925@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:29:37 +0200
X-Gm-Features: AZwV_QifTzULMtGjkjSS3S8CC5_mhR_1WSH4xBiT1nAYE-It9I2PKynf_0a8WPk
Message-ID: <CAEnQRZA0TsOdttpZA3DGb7xrDXuEJp8PQTC3d1tXFQGqdY3SJQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com, 
	justin.jiang@nxp.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 5:46=E2=80=AFAM Yanan Yang <yanan.yang@nxp.com> wro=
te:
>
> Add DT compatible string for NXP FRDM-IMX91S board
>
> The FRDM-IMX91S is a low-cost, compact development board based on the
> i.MX91 applications processor. It is a cost-optimized variant of the
> FRDM-IMX91 board, with notable hardware differences requiring a separate
> DTS:
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yanan Yang <yanan.yang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
