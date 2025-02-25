Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F53185B73
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490824; cv=none; b=lOIFLwSOWuUB2lw4TasfA0CZc6RHL1Em9HNc/zfZ3A+v8hndb+Nebr5BXuM4mET3Pc0tRdBhKGc0VMamVR4ctld3BxrjkVagpyEnQOXJrvqn3lehNgLDvY0+KZw2+9oQrxaBYF0hlVNLx7ijfk9Z+ixKUlOvgIwVuFqwyJggdqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490824; c=relaxed/simple;
	bh=ZHfwPlIcEqwwyokGZO5UWjLSpzt2Pib8HNJGFAPJi3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJl6hefw3ufbAB7oj5end05MdhcTy0dQENBNUUIZQen9eyOSbKbWCoh5BlIPFzSwe09hxtsdNQEUG6jSjmNrsEhteB4Ea+R+Zg0feAEiRWoZkxIY636gKzfRQkla/C/BQVdBElnmAy/p9WXrVgJbmT7Q7ae7DsJSAcVFiJG2cv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhwU8eq0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhwU8eq0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-222e8d07dc6so38560115ad.1
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 05:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740490822; x=1741095622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btIzpaiXBm39xMpzgFyr6PPx6n79OgifTZ30SVyZSrU=;
        b=PhwU8eq03hwBbzsFq1oBDPRsEK0stoY+iSRpZ6/2Ec+d874td1vD8HCm6h6Qr5pJu1
         Y0Gr+JGtQHhIvmxzEDbyijZfDCLs8DLcR5w+bA1z6ebsiVFybGVnqxDaZQQ1tX2ZgC2U
         psSopvGX4a/wvY+lwjmyyl+v5HjcgFlCzWAEWHi8UrkldW+e9cfUUtS5cRFD/OA6p6tu
         FdqTaElw6tGP2sEmf5wJ8D//9wKe2UM5TEpeQEgRw20nnsREg+XWt9vFIEFz7sObhtOK
         6wvGGUrsrkYCeJ1C7h0eHkcIOLQgo+R4kX3taXxXN1eX6SBkxtEX/lhgysm/0jBMtokt
         ly+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740490822; x=1741095622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btIzpaiXBm39xMpzgFyr6PPx6n79OgifTZ30SVyZSrU=;
        b=tA6bR0wDPgOTQpQlzEl4uMStYI0BLFXjJsBJSTgbWz3JG9C2PZUjgkCvduX9ZCfaG/
         34YZBaMx/CjoelNU4HDOIi7okBB/ZVLRP5gV8qSWcNIPorGFidxq9sufT+uXQkGg9Op1
         hbHueMvKQEFyqetr2BceHG5kp1QVBgNEX2vQ/6hQyEphCWH2kssonT+qQWnRlyglSLSf
         r/zaHei6G+j/ABwAQZqin83OvwRfDKbqEo1tQ01nf13k4/sMpBwMHUWbx35I4mKKDUZa
         i8nlsFbBHEGOlYdE7p2ErteSVqsH5aTegc9VcrVp3iBN7owulh6mOo5SdNGFu5thdJ0+
         Ab4A==
X-Forwarded-Encrypted: i=1; AJvYcCUhPtn4qgsaBQLzXvtnyxQppKs9fypD84564DKWmqttRvpxSduCpFDXq49guKBBCoFEJjY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTQcNVlx+ME2F+efJsp4cyun6qV/egbaYypOf3z20EMVpyBveq
	7EGYFlAlMypKn3VXmo2ZUWSQsllcM7sN4URO+Z5AWe0Ba/Tab2Gq2o54td7BoAwBtXq65I6YHSd
	6quSA1E0UFy+IvAjhGwW9Fzrbo+A=
X-Gm-Gg: ASbGncuO76x19d3gXj1VjhvWDu5nUxCfHhHJHFYxxkU8wNrYg/bnulz/SY+59SvKzrx
	22TJSdY+RBFUG01nuJNiYFGzNmuTcQ3vLaM4WPln6Thmnb7uwJlKWqGBTb4+iE2yeFJMy2ePkco
	cRQt6c
X-Google-Smtp-Source: AGHT+IEqvx+vLUoWU+bH7g7MTRR7upTwyq8plc/LIRpW15G1pS1TD1Y8exEPj6fQZzzsjKBHvHSHg/l/PmukuoidDeo=
X-Received: by 2002:a17:902:d4cf:b0:21f:6546:9adc with SMTP id
 d9443c01a7336-2218c3f4333mr351935475ad.13.1740490822321; Tue, 25 Feb 2025
 05:40:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
 <20250225102005.408773-3-daniel.baluta@nxp.com> <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
In-Reply-To: <78e60d723c27b7fa0f03bc6a74f6ad37d6508734.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Feb 2025 15:41:58 +0200
X-Gm-Features: AWEUYZkKeH8Ee9X0dKf1ks0eIJRo2-c4LR6sVRs9-5VD4M6vPScOpUqA3j5lyUI
Message-ID: <CAEnQRZBL+r2-CRDszK54SD_8E9=1QRKRj3_YDHsM7YetKMcs_w@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	shawnguo@kernel.org, mathieu.poirier@linaro.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	andersson@kernel.org, Frank.Li@nxp.com, peng.fan@nxp.com, 
	laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Philipp,

Thanks for your comments!

> The DAP core reset is mentioned in the commit message. Why is it
> missing here? After reading the discussion in [1], I'd expect both the
> stall and the (core) reset signal to be documented, something like:

There is no reset controller driver for DAP area yet. We manipulate
the bits directly by
remapping the DAP address space inside remoteproc driver.

See for example: drivers/remoteproc/imx_dsp_rproc.c

/* Reset function for DSP on i.MX8MP */
static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
{
=C2=BB       void __iomem *dap =3D ioremap_wc(IMX8M_DAP_DEBUG,
IMX8M_DAP_DEBUG_SIZE);
=C2=BB       int pwrctl;

=C2=BB       /* Put DSP into reset and stall */
=C2=BB       pwrctl =3D readl(dap + IMX8M_DAP_PWRCTL);
=C2=BB       pwrctl |=3D IMX8M_PWRCTL_CORERESET;
=C2=BB       writel(pwrctl, dap + IMX8M_DAP_PWRCTL);


If we agree that this is the right way to go, the next step would be
to create a new reset
controller driver for DAP area.

I want to keep this as a follow up patch in order to not compilate
this patch series even more.

<snip>

> >        memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> >                        <&dsp_vdev0vring1>, <&dsp_reserved>;
> > -      fsl,dsp-ctrl =3D <&audio_blk_ctrl>;
>
> Is there nothing else in this range that will have to be controlled by
> the DSP driver in the future, such as the IMPWIRE register or the
> XOCDMODE[OCDHALTONRESET] bit?

We are internally running SOF for couple of years now and we didn't
need any of these bits.
