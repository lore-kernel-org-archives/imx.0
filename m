Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C921B3F27
	for <imx@lists.linux.dev>; Thu, 29 Aug 2024 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724949548; cv=none; b=TbYC1+gG99R5JpQ9iuCcgD0/uUrDmDW+KbgU9Neitxy1FHCb0483UeiU6dnpnw+xWntMDTAeAD8KijAajlgGXs50F0dqZxPOoXct5FuuP0oyW15MD+dxWBNfIHSB+nU52dbMeV0pQirpiEHF3ZVw3QG7KCPVUC2xcpd8tSfN91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724949548; c=relaxed/simple;
	bh=p/MuDISQmgVrxGfczwyazNQDiiRp5BTIgmrM2HMq2Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vosb3L3xORwZKYeS1m9bgw/d35I+1NXkmX+0vMujy+EI2vCK52gP21Gb5ON/rcdKLeSjID9YLxNndB9C4hIrjnYQj3f6zHplr1jyH8KjymiMKtaAh2fF0SIOG72LtgSKdnZDOdQDpnk4YSrcyhOTnZQe+aGamTMvMgmtyZ0NJjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+MyWUAF; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+MyWUAF"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53349ee42a9so1154475e87.3
        for <imx@lists.linux.dev>; Thu, 29 Aug 2024 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724949545; x=1725554345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=am9JYfAtBTZRvIgguTGLzH/4z6K1mHGNhjXagP0jAwE=;
        b=h+MyWUAF0dJl/cOdQlJKfUX9GQUoO+/b7s8G2TgwGbxOoLbXWA0uhZWMm+5pUX1hkd
         OTYomBe6f2kJWSIXaGLIRAZohQpgjtSPU0VISoA8PuVgUEM2VLusGUHHL7fzMvrqMstJ
         UbZZY4zDeeYzyBXJHnpac6YzVDbhoWMNk1LzKEBJqI/40xbyykjZ8UtCA6wbTxtulNJS
         fI/3qQmHW1SEFK72qx7MY+Ffmio0/qXk+gw83o+FbdlRACoCV4ssYUTpdmgNiPg3VXMW
         4HXHZGS4AanG3+mHk2f23Pj5SdxTNnfS8dEwfDcEFy3xO7mcZT/neNWYZZeWmMYO4nFP
         tV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724949545; x=1725554345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=am9JYfAtBTZRvIgguTGLzH/4z6K1mHGNhjXagP0jAwE=;
        b=ruvH78osvzMZ5ZiuqcWIqQN6o4biPZXc9gxoNoq2z40JQMvMhkzky3/z6Ds4dFAt64
         aPR/C4vMNI3PJwt7zw2ngbU7/6JY2PXWYCCMFuJ7WhvPC4eSLeR7BdzCp5LXxAN/jVjZ
         rwgafZJyILtipyHzNU8GGhFxREhL1Sm/8OqleLsOTN2G2qipSk5fdHS/j8tCuHO39lJX
         /LLcj3JVH+g1aEOWKsbEUJ74LryM0uPi82uAmf6uG4436BR4khdSkAaALq3tlEmCy1dG
         mMnDFuB87kIInPmd6XAFvVVaJS4Hh0wHDNHibTRBoNRmDe0yCjXBBFt56/ctdjlvfYhq
         5ZDw==
X-Forwarded-Encrypted: i=1; AJvYcCXQv5FyxvkMcerKEFoOClHeLwlaPq1RVgGuruw6N3tTSzQ7H8MCVzdZ5v5ekxe8Lwz6zr0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwBbb0frmtaR1B+aQVdL7K+VzxKIbaqroStSaBD2q/opGGyFYc
	CTt4YSrWed18CCbuAgZmyWLQ/PbIManhJMvzja64QeeY3NmGNghMl0s4mlpckB0YYBi8LSomTje
	dLDvH2tsuE36TSW3gXJPEX4fggHY=
X-Google-Smtp-Source: AGHT+IFE/5/KDpyzUQTV7CiVgFJUIUX+eqIGNLIUl29XTUsb2eZQus5h7BLWylCbBfkY/R+2DdT4ctWZGk97fzMi6sY=
X-Received: by 2002:a05:6512:1285:b0:533:4642:9e06 with SMTP id
 2adb3069b0e04-5353e574657mr2045541e87.34.1724949544342; Thu, 29 Aug 2024
 09:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240829104436.3134551-1-lukma@denx.de>
In-Reply-To: <20240829104436.3134551-1-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 29 Aug 2024 13:38:52 -0300
Message-ID: <CAOMZO5CwfWX+xkPSyjafJo=LwMUNx4MfH3qNydbchk8YQ40XkQ@mail.gmail.com>
Subject: Re: [PATCH v2] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Thu, Aug 29, 2024 at 7:44=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

>  dtb-$(CONFIG_ARCH_MXS) +=3D \
> +       imx28-btt3-0.dtb \
> +       imx28-btt3-1.dtb \
> +       imx28-btt3-2.dtb \
>         imx23-evk.dtb \

Please keep it in alphabetical order.
