Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0E43BBEC
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 22:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711666522; cv=none; b=ZZ2Eb5uLNsITyZhWwlLnTmU+hYOsqRjuCAnt+MKLdDA84/NBQFTzhPZqfXFhR5IAnuM8ZbEmCatIu56pG0VCfgaMhrZINlawVsHmPYVusWKJGD7w9cQJbrmWE/1wH7COR38rC9DFEJpV7fLB4zINAORv6zIte4jFAEdkQyplxEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711666522; c=relaxed/simple;
	bh=a6BhrS87z3pko3toIAAUOX3mE9FhwdlWfA9c7yQ+vjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPTjYpL6VqERwseC0H6aB5kwTULnJe7K0FLmg3fVF76nBqJIhSy5NGazqgf7/ucXnI9El7bQIBxmQYUnPPMnWcYZux44/6B26DRMfUZ0h4/DhfQY7VTjMd3O5A8YRI+aSvfhkSzi29Hh/3jTf4q/pkXoxQFGKVBvvz/ZdNKuQKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PD1ga41h; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PD1ga41h"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29f66c9ffa5so292280a91.0
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 15:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711666520; x=1712271320; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5nq4+R8+Nhyb9idDvKsWt+ny8JkXRRmqWQXDfRxdxZ4=;
        b=PD1ga41h1heLM8oOC0taHpjdkMlitG9QNXWCcBdWienUsXrMlhO2VrA0VdpK0BbDpG
         Br5dT9FCjkTLyxqrAD6m49zVL6sOa90J3xeJGbmXDfSQ4tzbOEqbyUqY4/H2p5NBBAme
         SibT5a+zyUiDEP2iUAZz3pGLlRzXkZU3S4iLmVp6MEzs27Rge9Z+VQXO56fNF3FhcpLx
         MPSVCDdPUcXKxD2SocUDDJexdIDSiakPHqns0meB2av2lCZhuUEcSqzLf6HlPZ4oM+5e
         xFBF/bIKo2YzYvT4nrDnpoNpZUNPYxM37+9S7V/MCK1utm0JnmVB4etpe0oBicaT19Zp
         yAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711666520; x=1712271320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nq4+R8+Nhyb9idDvKsWt+ny8JkXRRmqWQXDfRxdxZ4=;
        b=dGZ1KZN7EbspK2yDiTF8R8nNbD4Aq2tBvbswElA/UN0tFZbACrM5TXjxR14lAJWKtS
         qirriWlkCmYQecrTs/gp6d/IJ46F1MdmJm/gXByPQSbm+7JJ5mjiRhiDpmv7Bj3GavnS
         vmJC2v5gUY9FEYd7D7FgA5DLADeyzQFTiulIV81UnSRmnbhph9//1oXXWFLDCRXxEXFs
         9NVtB6/0EcNRVSbDTuxfZVu9LJbiYFgtkFK7jtnuFNqyq2wexYn9cXG4JdRTDwsSOG0u
         Qmh88fnyxNGaTkWqt1X9KcHEktjI6KKnSmb4goT+h9S1nckzaZfdudlZorJoIuelALgW
         CMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBZEy2j93OLfalomxETd7m0DWHmwGMZD5f13aXeWFOWroltO9XENT0m7iUdRShkjO5ezIRQjnH9UIpaYdl0SpBvxCr
X-Gm-Message-State: AOJu0Yw+LfQt7yr070oxOCw+0a+glI/69mBSM9AWJsbWKG7P6FQCzZ3p
	uAlTeEs4jfG2Hhjfn5SvQA9JtkRo41Fnnh1a1zpcueSK+YxddV/h4YauK3HWxLplKbLgVreysn1
	WW+174ssc8v7fZ4IHUnKatyVVTJg=
X-Google-Smtp-Source: AGHT+IHa2EEFf+ie1eVHL+gVjuuYVi07LYMkuv7wkDhnss2E3v6sB+pmWDJIrUJ26p+DRfMCtkU3FphvfAu0WDWhNNE=
X-Received: by 2002:a17:90a:bd8b:b0:29f:718b:16b2 with SMTP id
 z11-20020a17090abd8b00b0029f718b16b2mr929263pjr.0.1711666520377; Thu, 28 Mar
 2024 15:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328202320.187596-1-gilles.talis@gmail.com> <20240328202320.187596-4-gilles.talis@gmail.com>
In-Reply-To: <20240328202320.187596-4-gilles.talis@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 28 Mar 2024 19:55:08 -0300
Message-ID: <CAOMZO5D7QG3sbtCe_Y3h1i0b1VaLXCftLSCkjSuXcso+dKij9Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: freescale: Add device tree for Emcraft
 Systems NavQ+ Kit
To: Gilles Talis <gilles.talis@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, shawnguo@kernel.org, 
	alex@voxelbotics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 5:23=E2=80=AFPM Gilles Talis <gilles.talis@gmail.co=
m> wrote:

> +       pinctrl_i2c6: i2c6grp {
> +               fsl,pins =3D <
> +                       MX8MP_IOMUXC_UART4_RXD__I2C6_SCL                 =
               0x400001c3
> +                       MX8MP_IOMUXC_UART4_TXD__I2C6_SDA                 =
               0x400001c3

If i2c6 is not used, you can drop its pinctrl entry.
