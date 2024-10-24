Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CFC1F9ED1
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790807; cv=none; b=q6pD229dDbyKO/wkXF50mvq2kXa/81Y4GPO7tlBVVnJGeF6sU6aY1MP08fv1MB+OXsOLRJUM+41o1BezQsL/Hr06A6WQV5Iuxv38Xu11PT1p3CX5YOwCh4R8bDQvNTGkf+bsEplMT+NG10lDzdyq1aN1mxJD60/EjbV3r3tuDlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790807; c=relaxed/simple;
	bh=y3x/Yzqr5rOkV6VpVIRWrECyDD+bnzjGWzKCC9ld0xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UaDC3Cb6lP0zxK7COh3b8Xvq2MpKIMGvHYax/GG/A62deFnP8cUri4jPf1pbCVRFLLGnO19ffCEuC1608lHF5elqnULKNaywx58gVzUdwZeq2btqKyYjUhY8PdS/+e55apY39siYEhGPA2t6YOOdQTKWpeBMmAOkuDRBUdjuyBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgT58sxs; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgT58sxs"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so1521318e87.1
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790803; x=1730395603; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3x/Yzqr5rOkV6VpVIRWrECyDD+bnzjGWzKCC9ld0xY=;
        b=WgT58sxsTN40eZjRY9vlDHpoeGeLEZZOzRoQ3W51MmVLNu7z+M4tE1f3eKVmg2ebLT
         QwisPEkthgz065/NUqK/TQO10G6iSvoFXjPW3fPguiVwmv5bW4BWzy4PhuIFHdOwJpGy
         d7nIwwe23ldgX2g9cGf/iHSnQCz5U48px8C8XttqS0xR202inlvZjfNK93J0OfbBrI8D
         RVIwVnUTy/rivvY+bG2RPH24r6LqFWiUnLtoVPUsArHqh0gROvi8wOvI/Me2NOm/vS8p
         GKME8D2zl6S6PxOVHyXCxhH+lsauFVhOwZ8ZQG1Qc1GKP8gbRSHnOPWDd7Q5emayoYIC
         jz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790803; x=1730395603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3x/Yzqr5rOkV6VpVIRWrECyDD+bnzjGWzKCC9ld0xY=;
        b=XrjftEh4yzmv5hhtilsIBa2/QywiPMlgnTPT1EE0D/i8YopTckfKBT6OHcXUAepR28
         bafa2H6D9XIVktddipYFeKhVeLLBgNvalLkSn20m57SwqLcfwxCekizkZytzmAqwti9l
         mOMx8TH1ARhrMnePfj4zbjRcFiuidX+FtYrPKmw7qM1d3OJp7rk74aKsGTEkUlvg93od
         7uYAI//Mve4K1GPrsxfwOoZn8IE1gyy1PE4V+ktbasYNoD5fBvWKzC7pBZTNixJvvQ+H
         Zuap91wK3NrkYSPJdXJ6e8eI2K55CwGd3dMszKUQ85e1oZxU86SRolPaNDU1lOFNeB6h
         CgyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGUGkIzz++3Trcv9HDZPuaKliBHTVAuFf4rXKAQRXVU/KgloRc3s/+h/Bzy3GeHvGz0wI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHQB347RkxAbrtQPn5jcOmIKbkueiNoizBHWt4egu35eJlBwvl
	Z5HGKxhqZhjIP0eMukjWXikMCG7RrjZlNvby0ssHRvPHtgKxH/z++h4ssTzOYmJndVdh6sT+pp6
	YupPDpAyvLl77QYV6zUzOSVYufj4=
X-Google-Smtp-Source: AGHT+IGRxl832jNWkv4G/j5EbOky9Qs4+WgynnzzESmftSbrAVOpsaZoETsc+U+/YcqbVeYhcE4fW5L3Lrc4zeMjs1g=
X-Received: by 2002:a05:6512:10d4:b0:539:ebe5:2986 with SMTP id
 2adb3069b0e04-53b1a2fe4f1mr4269898e87.12.1729790803049; Thu, 24 Oct 2024
 10:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io> <172978739819.623555.106741073057492931.robh@kernel.org>
In-Reply-To: <172978739819.623555.106741073057492931.robh@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 24 Oct 2024 14:26:31 -0300
Message-ID: <CAOMZO5A7Erks3CHh97AN-XP=Aj2QBUcikAT0ijxkGEchqMfWVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add support Boundary Device Nitrogen8MP Universal
 SMARC Carrier Board
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bhavin Sharma <bhavin.sharma@siliconsignals.io>, 
	Hiago De Franco <hiago.franco@toradex.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Michael Walle <mwalle@kernel.org>, Tim Harvey <tharvey@gateworks.com>, 
	Parthiban Nallathambi <parthiban@linumiz.com>, Max Merchel <Max.Merchel@ew.tq-group.com>, 
	Conor Dooley <conor+dt@kernel.org>, shawnguo@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Joao Paulo Goncalves <joao.goncalves@toradex.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Gregor Herburger <gregor.herburger@ew.tq-group.com>, imx@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>, Mathieu Othacehe <m.othacehe@gmail.com>, linux-kernel@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bhavin,

On Thu, Oct 24, 2024 at 1:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> New warnings running 'make CHECK_DTBS=3Dy freescale/imx8mp-nitrogen-smarc=
-universal-board.dtb' for 20241023091231.10050-1-bhavin.sharma@siliconsigna=
ls.io:
>
> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: =
/soc@0/bus@30800000/i2c@30ae0000/gpio@20: failed to match any schema with c=
ompatible: ['microchip,mcp23018']

Please convert Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.t=
xt
to yaml.

Thanks
