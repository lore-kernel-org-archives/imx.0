Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329E34D4C4
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768555882; cv=none; b=T+kbdVW9S5qS1DHa7jw38iTFOP8Nt8dsZbLzZoSypuK9A64WLIoTpzTTIe/OUi3jPRpS2SysHrmNzby3pn2d4uwVrj8TYoWVLt4JvUkHBy5j4vUIhZ9Oo7vxx7v7ZytHgjp7m1m57NCiaG66kQT2arKWYC39fKgP0qH/df7vmnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768555882; c=relaxed/simple;
	bh=vDwziWtkQVPoVaREHacSSM1aN/WzACohKb157keq24s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ivh1Y0zuNR/rYmo82yvd0YxCJOTXx2ZEh7V/hcSiNHSRj/7Evmgqzm876z6MPWHGKzGiQx0OfJyRe0r6s5wpc2xprha0GMAJxG2VPdCQ/lVo4O/VzZFablWMYhjcJKqBMndjiiCmnZ9lTBVSiIfOub7SMikMAJbMoaJxvZJ6eHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1+JNyei; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1+JNyei"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6bf6adc65so200837eec.0
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 01:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768555880; x=1769160680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE97FQFptYMK9vhs3k1ZWJYJHvuV6FL1bLt8wQQXeXk=;
        b=a1+JNyeiMdzgE30lt3vuhCA5LZdLUQ+XevglZ5+yuhueCvGOL8oAGBHQaGzRX4CvT1
         7Z5YeiVz9ic/cpVO39Im4gb33uLlc8davTXFrzVW/c4OyZmxa4R7ru8HTguXqMEw5EE2
         0D9JLW5N25OOpXKR9leoqfp2M/tFiTB0XeC191m2u/sO1/4HGXuXuXrDZ+J+flR4BamX
         ER/7LqZpjrWsvlKPEd61rTZ7rDG5B1zVsD0RHVPtcOnk/zZwyJ96avBGW3Z4XYMlQPOq
         D3B7s/WrXiSyALbk9pFQp4ac7gTSizQDw/NKUw8eRV7+MMhZnOS4eqiCk72v1cKypWWL
         EgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555880; x=1769160680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kE97FQFptYMK9vhs3k1ZWJYJHvuV6FL1bLt8wQQXeXk=;
        b=L0R8+QwCMtZF0Zrt1pVrK/PfOsDrBL9JiO8gnbz0JVu6B3ta4thWxb3fB+Wqquv0Ci
         OUtiliLPj55xJG+/PcB82abvS7a2zTy5bue59CYBk4XasH6YF/6vGay5ouxt3ZtwDWBE
         9gGQHjFVua4+JiQwdZIWTXbnxw/RDrlcCCbI6VQWtaD2tmuz6zWGbuU0Nn5X0zc2Uf0f
         YyM0sELYXgrrU0xdSZac3kZc8FhdugTiWHKVoBrjDH5TB/pIhXZKInvxLGbzwLe/6dfV
         uMbyJXvjhzQu5pL7U0V2zn2/K9X8QVdqJ10GhfVREshi1RzazV1MaNJO0STqdQUnsK/w
         efdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9BP2JqWhGGN000RJbAFBYEZ5/xIAveExe3cjF9o4POGJJTOXUY3MMrMekhWPOzWkVDDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAOh//KaikvcuLIHKdfaWGOgefHalIRbeBcYdDpq83jHXuBwed
	IGOC+mRPSluq9tfgFkjc1fALZUMJPWWW3HeUm4fu7uv5JNN3ZqYB8+pFtui+SxTrTMnYZ6YasbC
	3M/uvACeHtM/NFSPSKTf50qqteuaeLFU=
X-Gm-Gg: AY/fxX7LEkLgCoOthMnJ5G4nocnTDf55bgWv58oJQv6qxtdMRz8D1ciU4QIU5GCNBzl
	OrhYrytjG9eSPz2XCtaBBs0HfOdpszWu7Na+nEexR3UjA/MHTTgZYRPwHqeyeHr882E3z49xzji
	6m4IFu8XQEVgokk/aHTctdB54oyqOb+nY+sh5FQLur3vM5kUyGNNZjp0NX5zLV4R3PXb/VBSW2g
	z0u6572BNMqGfL5lR33zCVrsLyALVb3kb/LJQGp5b83M6VJHgLevjrn57Nk602jqRVKQ6V7JQ4K
	hVtK/9uk/XXA7keG2+kqDiQLsdUjcQCQSRBHi/RPY7s609/M/4CG2c9C/tJg1XJ1fvWnWWUrYWj
	Mtzrfh1QAwrMZaO60El6q
X-Received: by 2002:a05:7022:1e01:b0:11b:d6f2:a6d6 with SMTP id
 a92af1059eb24-1244b36efefmr2110118c88.34.1768555879884; Fri, 16 Jan 2026
 01:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116-imx91s-frdm-v3-0-98671de64925@nxp.com> <20260116-imx91s-frdm-v3-2-98671de64925@nxp.com>
In-Reply-To: <20260116-imx91s-frdm-v3-2-98671de64925@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:33:59 +0200
X-Gm-Features: AZwV_QjLNUqqgYctbRDffJUiJuH_tW04Q23rVvRNxKu0gJcAkwrTYmAk7h08eJ8
Message-ID: <CAEnQRZDtE+0gDxAnu9vWGhj3rYEv6CmMNjQLWnKu=ud9Yo9XcQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board support
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com, 
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 5:45=E2=80=AFAM Yanan Yang <yanan.yang@nxp.com> wro=
te:
>
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
>
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>

<snip>


> +       sound-mqs {
> +               compatible =3D "fsl,imx6sx-sdb-mqs", "fsl,imx-audio-mqs";

There is little sense to have compatible =3D ""fsl,imx6sx-sdb-mqs". Just
use

compatible =3D "fsl,imx-audio-mqs";

Move model property after compatible as per already existing code practice.
