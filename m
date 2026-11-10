Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794336100;
	b=ZZeqCpPIAeiB1wepKBR6fJB/Gfmzy8O7/39nVy2SVwy2K/l6puztKM4H2f44OpZ10jJo
	 4mPlmyb4PT3mUoGVncCZLs1edLAKPMSAa9QMH+f6pErvXTGF8lq5LCuWltF93pTgaBXt7
	 RCmj432jfcIj0uQJGMQYOPMeYD2Ps8ozUGg/Gy3ZnECp8aydH9VBdDAbu+aF/mTLC9fnk
	 Z4BdHT+gveyOnIwu2Kf3vfXzFzT1xy4uA6hjjE3X2AAX+fH1FAcR8ZlwvDzfqN0r2tl40
	 qS39igj0b6EOeRoSP2yQPrJKIHJlBkMXYuWdpH1wAzjiVzEa57AhUDgAo60UKiN52qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
	b=24LMIkJbPT6HRsxWHiln2E8FZynVwu06i6jPOG15ImGqxY0EDqW+QUWGuTR7N0M8bsVi
	 oBHICSP/jz2AdqsLpxo23pb8AAChnpeoi5IyaZQwqCNVBZLWP3c0MqoNbdUxh3127cq4e
	 9w+KcFU/m5tkUh1pZ+1N/HLvPlIIFoKVMoiLOri2XBqqt63XdZoRYvaRzf0Ybg0mhIRE/
	 sMywqgmN9/EdrRGBHVKvB53ER3Tw+G6Xz/8AydhYh3EwixnctX02VxzolX47oLqlHV5ZP
	 uG/fDInWJZ5uIhnO0uhHcubE4VV8jFneJrYsuHgEaZxi6IyS0rrpNP+8iSniHYwUUhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyrTM0k3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110C606C6CF
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 18:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7110C606C6CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KyrTM0k3
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14a204305so1987759e87.3
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794336099; cv=none;
        d=google.com; s=arc-20260327;
        b=n+SkNYGVnpX9NYRXDmxmV8MrzX4dCeKtdlIRUNGzne/zp+gs6EEAYXBL9ui+Lh3WwD
         Jcsa4Al+GwmVwQe1sw9N/LzDKXseOqWjO3NdP0KhkwtR5HIpCzhoS94oyWI3YWwIOIEu
         hGRoLojuTOrR5XKmgekaknRTgOp7ywGb7KQx7cZWfpI0S/X6BSxsS5CG59MeiZuy5NA/
         PIaJ3ZCuZNBCMJsoKkDk9LKG7cGwJ0uVkY95t4JbDtddLM2ZPYj62UGwzO7EPIiAW91L
         1Alb6Hq5BeBZvVWyWR3X/kbz9+EMJdXpjyHFYX4QiBuyQnM9YWDLYAyjztnFDMPMUiZg
         r4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        fh=4js4ZgdJrmfUoahs6SjbOdAIFOI1VPkJ5XEvTr3AkSI=;
        b=S5Oz2YDEe4Arur4TBQAnCq+7AT3L6GSMXloVSIl/YpJ/4qRGipu05Y6G3F+z4LvGTM
         ad+x7BfyzboYs45XWiB5uydUFNkVk8+mmILuPcb6hrJ3/J3TlmY0SE35RjTUOtQx/M7V
         8lZj3VXoB0lzDr1hNn+PPJNKtM4mzXwDTSdij6Yu9QAZgVyy5FmMS+IH22Ix02n5GRUl
         IS2cfvIzz/6hQOSwGuIEBmEWvEGlU09gUAB71CqWcvpCt8KYFHLjP/lc6ZTJs1NBS6F/
         LX/QkVa+NmxPkgUaprCPRvrOucAYh52mmpfD3MM041O5XKAjJAU/z+nRjapqhnDE9HR7
         Z4Pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336099; x=1794940899; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        b=KyrTM0k3KhQR+VKn4/kVtv/k7Vq28qCBrV/oX+F/coqFiA1NJBGJsGP08heJiwHXCI
         xb5Kni9WFLnvHgM9fJwJ9RH9TNotxzoYSzyw+WH/ewYnME4sPERnrB/GU+raFiG9ji3m
         UV6yOH4TDtouPz0wVPbtXWcywlHC3ZMeKJ3eKWyc7H82FVBQWS7dv0nYcpC6TCNdTAhD
         ByxmKco6e4nUgivCzKezrBzfOPW4oOXqE+7dAG5+1oViLyqqExPmFLZNSsVPy+2v/dvz
         bRf41rr8+sj4mVuyFxEZm0c/ICNS/Q5kpF/BeTMSRu5fUSV3tnhAheiiVIxZRg4iaHx3
         LzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336099; x=1794940899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ii1+nM+f1eJjLbqIcC37Klii0Mrk0KJoMJUC1r8XMmY=;
        b=tm7Z95qoiYRyiBLbLRWX8LIKwlOXzvr2BO4PAeuJ+KjSEXG4rRN78ShUqggtmMEVGW
         78YWvxp6QMy9UHsLHiU7c7w+NfXSwRoJ6mbMLNIBCjosAx2G7QdAUDfO8CzT4FMhBsio
         wHgUk7qBp91UV70pyXJ4P/Jk7GWQPGZDoxFDnuEUY8k/00RfVejo0cOsL1t0O5aF3fri
         A9ETZerp8fiKvea0YPDmQF4aIjqDeVrYSaHm0loozHvpmUiLGCJX2KArgsWiT2qDJEzo
         h1Jm8TF4yoN0m6u9bT4P6JjDb/FBwJ0lxk2UFL07euXZniQIUtmu95XYEei+qX1lQY/9
         fKtA==
X-Forwarded-Encrypted: i=1; AL+hErE/FtXG4/9fKbKbwdw1rWBckF3PRQwpe6TTRbPBaMJPS0XarSRZThvpC8eVMsxOgfe/d0s=@lists.linux.dev
X-Gm-Message-State: APuU4Z8jZeZRZjKCn5L1f/1QjbTMLtBVFU1udpoHO6xxBimS53tkGdrU
	1hEWINp166R0Po6bbh8PzWs7U/NE1pODkMhtS1E9wgAQ6miBrYhu7kcldwMqHaKq4R+9dnPxSBM
	uqAY7kFlH7Ljji2PYJI/NyHBSgmdOj3w=
X-Gm-Gg: AYBFou0XgkKJFCUG685bLjIzyGLDw8AKHd8v5SR23oWbTuEthftZVHVWtKacQa6a7OM
	z92rGG2YTey6KA8hXdB1DoefJ+++XiprPn7e1x/RT8Dn6eL/gQh45brILbOJ5bSP/P55D05VAse
	RJG8Ws8ied3DaV59t8coHgsOAz7I2G59JI4ucPZHtYb7Dn6xqqNcCiXNA0JPRjv+4WOkR+sm7UA
	+ma9CTQS9Zds8Dmapu5tTh9BGwQGdhg7weiQT91qT4pqSKI72wpSbjLphMJJvx2X+3aTGugRoZa
	GeqR3Ek0Ko5p4OaWnZBaQwdMxibFGXiMy7Lz8QpltdSMhRkZS5cwFAwQk3BoVptWvRTTCi9NjD9
	7s275oWXrc1/i2QOWX+eF7pm4q4sANBUd1BJw9Vay0T5aDq4Q2sPUP3lUxrJTKD1Q/vp5WvD6tW
	ZL4YeY8K3kmZRuqsaAtuja9iDFLg==
X-Received: by 2002:a05:6512:2506:b0:5c1:5b62:8bc8 with SMTP id
 2adb3069b0e04-5c15b628e54mr429046e87.35.1794336098639; Tue, 10 Nov 2026
 10:41:38 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110150546.1535950-1-lukma@nabladev.com>
In-Reply-To: <20261110150546.1535950-1-lukma@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 10 Nov 2026 15:41:27 -0300
X-Gm-Features: AclHuK-B10Ha5eqEFsmLjifrfjCOeHNDcssKsSt9aMG-Ic6xnxgK7qKCRscUdio
Message-ID: <CAOMZO5D0Eq0FDJq00x1aitQe1HoSzXk+DEfMo2Qv=nJB=Njdkg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: Add device tree definition for
 Cloos CBASE with i.MX8MM
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Tue, Nov 10, 2026 at 12:06=E2=80=AFPM Lukasz Majewski <lukma@nabladev.co=
m> wrote:
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQM=
L
> module.
>
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
>  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 577 ++++++++++++++++++

You also need to document the board in
Documentation/devicetree/bindings/arm/fsl.yaml

Make sure you run 'make dtbs_check' and that your patch does not
introduce any warnings.
