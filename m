Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6472798F6
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700072; cv=none; b=VGIpa9/FAZ91kyS21PlV/0G6TKnQp3LuGf/85VqPniE11YxrrkT2C3CnngtuRr70ZQHTYR2U1NJpfTHKtbBQNruhJlc1oZBKNhelaw7XHOX+K7nrGA4VLiGKM5To4rHKZDWmM0Fz2HA/83S2OBNTrBbrrXfQ8jkVnPtLxcg7LoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700072; c=relaxed/simple;
	bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7vC1tpuXvA6XO3XZjEA9MJ9X/iX5rmUX14qlyhfPIr5R21hj3zr6uZq6YEgR9x5KAVl4eHb+4LmKt4lGcuR/CiBIpCG5/9NMJdYtrrCkkg8jXqvsZ2DksUsPoduYlVadU67j88ETfg8TBo2JhYg+ILHa8kmB6kxPM54ytme1Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdw3vbyb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdw3vbyb"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af28bc68846so4615666a12.1
        for <imx@lists.linux.dev>; Mon, 14 Apr 2025 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744700068; x=1745304868; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=;
        b=gdw3vbybFRhhj2LUUiFud+4BTkBaD+NO+/rd2lO5EJCjAPkn/Ss6Sud7o1luy5dHew
         FasopLXPo8uvxY7tqbR3y5MzTc3stdR4BimRHm9HwrwBn/+jbmn4xof7i/LsaIHkTMIo
         90I+14Ho+nBGBx6jfo6J+VtFC3hkMaUraQVNoJkvZ7TxVuvL0RJHPi1C+R7E+1Lkyh0f
         9GpFhM6fdPJqgojLApQ4BYZviWy9mZIDADeFdaQoTtWziD6eaiBNVEplOhWR5tsaIP2K
         Uiq2SaYQlADvOIHR6I/4JJn13Jh88S0oeEGccVrRXFRFPqV5FOdxnpxINLK1BqgBOBbF
         kdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700068; x=1745304868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9OqEDY3JEcssGMHTHMMKW2DIA2hSwtYUS+Auc8BG6o=;
        b=bMT4NXXKSiUMtGHvrF4msul4NX3L04W9ac/al9dn+PVlekZUGzvGzbplFqyms+URgd
         R9OKyhcJeB/W5N3lx6V0vKana9yowMmy0BkbJAhdrojQZnsn6CnhPRWUbCPzjWidLTun
         E5IN0O6O/9bB6derhX1ItdEqHni3fHmEIGRvxExvn0lJBpmFh029cHb8K/FPd/68S1Cg
         6EBbg0S7xIGlX0FiJfD6/jrztSG3DJL2KmCRXkgEX2BySBrlvYtwIrJkwv1U1kddJzPK
         x5nko6SyFO1YsRRT5CZ3uInbaFT2nZ8reWSXrIzih+dCVUcOPfXWnoMp6jDK1I8fmCan
         CNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0jJazFen4RRbOZY14fQn+Erd7b/XzDTHD5TUb01vG6tUDwmcJGVpwgvXrNol2hnslHlE=@lists.linux.dev
X-Gm-Message-State: AOJu0YznZxGhFTITiZH525xmTJ1O9bEqq9q2aY0vfMhU10jGEO6q1tqA
	tyKfalFus+6extiwRSwf7C0MrDN95j0Io10t+cx8mV00Ogafm5IVBOV0Z5H7GTxX9X2oBTRxZ2z
	YNGs48G3a64qZt+zzH6JOvKmNXmQ=
X-Gm-Gg: ASbGncte+bVlh0chOFZ9N1egGDurjCGEllqxtbIeoc2+BbxK90OSsR43LVxDXLCgql5
	GqEiKCCuparxOWz+xzvHnA+JXEUQEliokb5QkXHLz2+qBccXk0Rze66lI9HZL9/0cjvtCSHbVXs
	qSeeV2DLRtq0UJqTpH/w==
X-Google-Smtp-Source: AGHT+IGsWWhYe9e4mWSJsic/j7kKIeW7DfXwjL4Jb4i7m9zXmuDIJPuuX3HEnkVvhnsbqUdqK2dIfJphOjrZOmuAgmI=
X-Received: by 2002:a17:90b:2811:b0:2ee:c291:765a with SMTP id
 98e67ed59e1d1-30823639c94mr21764256a91.8.1744700068456; Mon, 14 Apr 2025
 23:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250414123827.428339-1-ivitro@gmail.com> <20250414123827.428339-3-ivitro@gmail.com>
In-Reply-To: <20250414123827.428339-3-ivitro@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 09:56:14 +0300
X-Gm-Features: ATxdqUGxqJNdcd-JZaoJQzqSGgpBMKry2SLqzTD77e0YfcWpcDRWqQ9RF6-oALY
Message-ID: <CAEnQRZBt7mgi2ep8j5U=8DWA+KfO_nGfczXrSxAy_HaSeGNTMA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add Toradex SMARC iMX8MP
To: Vitor Soares <ivitro@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vitor Soares <vitor.soares@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 3:39=E2=80=AFPM Vitor Soares <ivitro@gmail.com> wro=
te:
>
> From: Vitor Soares <vitor.soares@toradex.com>
>
> Add DT support for Toradex SMARC iMX8MP SoM and Toradex SMARC Development
> carrier board.
>
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x-8m-plus
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Co-developed-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Audio part looks good to me.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
