Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F7C1F8AC8
	for <imx@lists.linux.dev>; Thu, 27 Mar 2025 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080412; cv=none; b=B74jg/n52/apS7fNWZkhKBQERo1+FZy7+buxj4ZDKDjNlqLwqCboV3oGz/vCGfQ1f6qM6xVMzfQusRoGhPVRi9txdZnllVYD2q8Q6fKp/+bwnCR/q5QSl5gNJ/ViwnDM8UwoPExmA4UihiZS1spKDIwa3oc08klDzUHw02x5+nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080412; c=relaxed/simple;
	bh=gtvYZMPr61yWIT09B80LDMBXQ/aBdz1UXra3GYTBwC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCRcKMKl7wH1MDGG/0Z3flP9GZPUxrwej55KlB1zEmKfPAbsAacPTJZnUq1R2Tng5rGbqjA8PmYLrDiUel5kmx8D6cSP0ncGp4KBInDJN4wwIE50chKTQoRClg4ivMzE+PwQIRrW/AMNG/bzwut2X6VUrfYn3aXKPDlcxcllglc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNLuImVQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNLuImVQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240b4de12bso25955835ad.2
        for <imx@lists.linux.dev>; Thu, 27 Mar 2025 06:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743080410; x=1743685210; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6b7sWVXjkhrJaD2m6/tPkXhOgFWBsjjzpPJnK8wguo=;
        b=jNLuImVQYOhtyQ3cDLRBBogpbzrv/Q9scOI1N2c+BwU6p6pMj2w//AU5oBlMkZzMcd
         WafVNMASAuzU/pVXGBKsYAcs5aqp+jknN5cQKDSpkSaYtq69RmKuAQJMrEMikYnha67R
         9YrexuOxgPHurjebtn09eFJ25qrGhUhWtX1aLpBBfbq3JOL7Cn2IRHdd9pXTcpmR+7MI
         fnkf5wmx5X5saafSUXipd4RnJBA7AQTOr/cMFw88DZAwf+GUKauuRKl5SC70UHiD18zT
         LF4k+AHxgwILY03ZVDwmLKulXnlgd+uhYlmcjZv9T6d7268Q3BtzzL+1Aj9PlwhtMU7D
         2qOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743080410; x=1743685210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6b7sWVXjkhrJaD2m6/tPkXhOgFWBsjjzpPJnK8wguo=;
        b=lpk1akRKUhnaWweKrVsDYfrphTyN1VLF2M9pkP6HHK+gJNA0MhiFdN4C798KJliqzS
         o6CIknTN8H9xEu3AwcLIAMPMVo8DYkyf61sasO+wb8+EfGU/n10zIv6u4j7J6SICZDqy
         7+gqrrvE+7xgL0tKbHREJwAhqmU1TWbFpFZdxiNpGIxEtHv4He6rmMpA9kKo5mp9i+zY
         ByBwqiRUnLjV2rXf3oYapSOGT5t6Yo9BxFOI7wdy8PTuU0rDgRYtFKwxoGZCknGT0T2b
         IcleHhyTwVmdeqLq3/LOsPEXUueJ7nix8JRVOOQb3xDRS7DHi2FEWD+X5qd3+6wv0QN6
         MEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4MtAl0jRUL8Bb4g13kgszPBIv5WK3pZ1RG6lX5pjk3b/TxAThehmhix7kouA0FYnmFxw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxicnfaUHZyKl9LV5uIUio4IvVtikQ32USdbWoyZSDCWcjMSNZr
	8M5sa9S6SIlIpMNERrevWlcGx0+MkhLMtZP5aMZz1xKnfffwTiCDqkKmuL7mIzdW5DBpMrl3I/m
	6OrX90dEPx2PnmR9ri2yKRUb7jNc=
X-Gm-Gg: ASbGncs831UUhYr1T9/DgSwsK84gsJwN+PY9sXBLdUi/I0OoSsenWfVaZHlPTBgziEH
	i2Yszw0Au7NbY1a8MyCNpBOmxBV0Rpw6WVL8+lOubP9c1nna7V0bja2Rhn72YkU2lCqx7REkMxO
	dRfkaU1b8Wz9MZWe/IA5ZuA/I=
X-Google-Smtp-Source: AGHT+IHOx1vxujfIGQkM2NnfBK5kG0HOb/N8CJ8A+AmXs1oiNNEb5E+p3ftVq1R9qljzIuPzJrCtsq9rtR73AjSqNrU=
X-Received: by 2002:a17:90b:3c0b:b0:2ff:5ed8:83d1 with SMTP id
 98e67ed59e1d1-303a8164697mr4599906a91.19.1743080410136; Thu, 27 Mar 2025
 06:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250327120857.539155-1-martyn.welch@collabora.com>
In-Reply-To: <20250327120857.539155-1-martyn.welch@collabora.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Mar 2025 15:01:37 +0200
X-Gm-Features: AQ5f1Jrb0eLYTMXk2wVS9fPQ0Qq3m1Z8Jo5KryHhA8RkTAv3fjuFXtjyUWNuMVA
Message-ID: <CAEnQRZD15J9GOHFL6MfaLtSkgaN6ksT_YL7GvG2U_St8q2+KgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus
 ENC Carrier Board
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	kernel@collabora.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +       mdio {
> +               compatible = "snps,dwmac-mdio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               ethphy0: ethernet-phy@4 {
> +                       compatible = "ethernet-phy-ieee802.3-c22";
> +                       reg = <4>;
> +                       eee-broken-1000t;
> +#if 0
> +                       interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
> +                       reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +#endif

You should not have dead code in the final submission. If it is not
used just remove it.
