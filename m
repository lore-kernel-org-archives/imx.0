Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77573DE452
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297258; cv=pass; b=uxumgJCHzLoa527sZCSVXDX7ccicV8rogVIh3IuaIxAk7NsdJGgg14sA/hV/LuYC65u9k/QZw47ICTbUrQ4TPFwOWON30Q7DxWWrbI+rY/zDVa89+8rdttxKNSXaf43pCpx/3bB/C79n63wgteov0orDKTbhwcTSwRWKYeLPFQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297258; c=relaxed/simple;
	bh=jtHo4zFglLi9NA2q+v0xNbZU3hxJXWVRVktvnGWVBk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RNhmiQunthMM3qdkoCZAs9p+EaBcCANvh64L1e2yhWyo8C0drtM20uKCjTDe3J2uT0DIPYkBANV+CY8irPuJ2RcLaXv08XfEvW2+kzLPH9Clg83CjM/a6NQlvkUpgED1TPt5IvO0Z7mRptwv3hLv84m+ORARMCIBNrrGjvi9pXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bS7+zAXd; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bS7+zAXd"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1273349c56bso4379715c88.0
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 13:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774297256; cv=none;
        d=google.com; s=arc-20240605;
        b=RYrVI+BMJ5wGHfXpRNgPJKNHX0ShJlaFIjffhLJGKNSznahgTDhL5PSQxqRxVktAft
         oHAMGGsN0eFJdYaYYkdVDgt4Hlxkz05QFZ9ZAzYujvrYUz33mjAYFMnlQJp2BrKyZP09
         M2+I8wa27LSjpKnaYQthKlShBchygEeaB/ANh4ZnRh0k/bbO6h0/d7bOsq3lriAcs/7T
         g2A3L9iH8LBWrkdB6F0uP1BvJXfoHV8ozCr8G+gns2H2ZKUIhjaKQeJpJsyk0Jg3PF/Y
         hsoE3rHkVZKwTdAAMySj7VUVw52Gz/+VQKAnz+BdZFjlPnrRus4JwTjETuqf4Pw9lUZK
         K62w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        fh=gT/qAT6kC7JJ567K/m09Guuo7Otd4Tyw8vGEbgMTiBo=;
        b=HFp7kqa8iAIK9QBQurzJuF5LDXlFLZ1lMYz7zysX76gN84PlSTyjy1FcTCEkz4MDtf
         MwwayaRvVXVs5MulY99eSRjZ0xRBgRslwn/xd/D56Mpht/qJJJ3LT9PMDENz4moVlAcn
         uFVIg+dz4nqbMTljpOP5t8Z6taL/yXo8iPACze59yvdjttuDzQwP27SV9HhM/ws68J6a
         dA8YZAlwGY5M9PjpyO182B0EHQqJrq2wAt5c9uZLuXtL1SH4i5AxTLoP2iexOQJrg+mG
         0YNclATnbTAoCYtl3eruv4cEB/BQzPLsb7clnUVup4xxg3SurI+nXDjQ/ej1N1+33Vgr
         3nDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774297256; x=1774902056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        b=bS7+zAXdXsoZRcg0fRNAU/IH7K/RLCich7negsHPn09A9QkP/eXihU4sbp/mJfdFqZ
         jTF2OYphIKqIoMvg/55Zvo0JHEjcxcMOupA0iDPWvW1MhChs3sD3pRjIz18RVyb/OIpp
         OUvQgjyAsS4xKOwySHls6xuoWDNIBomtfVE+PSIerxs2G9rNiVM4qfT8I+E44eJNrXLH
         CJ9XTQl3RIrsm46JehW95UNPTG/8nuLvkzdo48+bMZVHbCe8cEEWS8L+OtOt9ugjNP7N
         n71hSyFmMhhSYCGa7pDmcAucviLQSfv3djR7wH5TblFoUYzMbOA5w5gi6HcJm+aoLcZj
         vZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297256; x=1774902056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wIVEHRZaJfFWfmB4lK9YCeE4pyi2N0slcN6uptbPhEo=;
        b=piyXWmvn+4Coi87XmgGZZzwzmuyfkbsbsbwoL5xK/AxMvCV5vwamO0M8DyEYF4WkZI
         nJT3JyeaBz90GXFbJsEmVh85IzBiYEiRSTHUA5u05f4zbdGS5ZoBNv6CVYmRM+I/PNnR
         yMO1yFz/27AhtoF3qtk40gGLgV0J1KK/rnSbfvZgA567w9dcmRyZ9S4yiukBo6NaQHEp
         Lp+BmiFGpNZg2H2xBOsJbUNZ6IZZf/pp7z0IVYpdFO6rGZZPAv+zRPFpwbDCO8lYj+Xc
         x2OW42BoBdlUkOaaHcyVnJ/V8Ew2xkBTxHjm2z37mJJF1u+zw6kV48qBQ0kCcICEKHz6
         5Lvg==
X-Forwarded-Encrypted: i=1; AJvYcCUIiMsDQnaPtcQZxxsK4HH6vcrL/vvDIKWNnvV9+snPodgA+GRJ4q1yyXQhv6z+VPYPh3o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPV05dtaRJvYHEuVvgHee5vyFx1aYbtJn5W6xxG36+E5czV6YA
	x7rxoMy+oRB76JGxT4MNH5AQtBsvwJseFMIwKdKO/SMT0+lyXFJgJuchsntl5GsG5cob86MmWze
	kW6Pny/xHSbxE1B89BD7Db1JYmNvu0lc=
X-Gm-Gg: ATEYQzy2zzCe3dyeIAvhrxFIm+FJrDhQ04bMaIljD07+tvH1oyEzZD3obDgc3AHWPTQ
	FN3aSjYXtCJ9Zg1MJS/Tyby4OEBa0WGUEcmBQpOmWfaa8HEHPATzxSvvln001L7EGpjm4qgJDxe
	T375QDMx/9WrNqLcjGpPJWYU0ngZyCjdiBLgftVw3Dz84LV+gzBQQSK9CkiGKA7CghPl/Cw1EvS
	fR8tHO5PpfqPgdQAl+jLac2HtM7V5RX1nka5HRRAM3yH+2e+DOkXzCxPpyCMZEwEw4qz5KlzwFE
	OFHgRepxXMWaruOum6xwt3X7jDUXBCcyK9ax8sqvJnr/psKDeZF0UHEZgggXM+xq1UuHVFPy+a/
	RMeLF1TIAdb5p4rHmSmKnPoV/msSk2BRK
X-Received: by 2002:a05:7022:6713:b0:128:d1c9:3633 with SMTP id
 a92af1059eb24-12a7265f60dmr5589793c88.13.1774297255634; Mon, 23 Mar 2026
 13:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com> <20260323191529.GA1054724-robh@kernel.org>
In-Reply-To: <20260323191529.GA1054724-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 23 Mar 2026 22:20:42 +0200
X-Gm-Features: AaiRm51XzKk2n6IioMvqGKwYdcIMaisSl_WziBcqMgfR8j04ziwnDez8lFdfqYw
Message-ID: <CAEnQRZCbGPqBBKjQiGB_pRj_8GYMFXXXVmpfsU0_AOjo3J5cPQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce fsl,reset-vector-mask
To: Rob Herring <robh@kernel.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 9:16=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Mar 12, 2026 at 08:36:56PM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Cortex-M[7,33] processors use a fixed reset vector table format:
> >
> >   0x00  Initial SP value
> >   0x04  Reset vector
> >   0x08  NMI
> >   0x0C  ...
> >   ...
> >   IRQ[n]
> >
> > In ELF images, the corresponding layout is:
> >
> > reset_vectors:  --> hardware reset address
> >         .word __stack_end__
> >         .word Reset_Handler
> >         .word NMI_Handler
> >         .word HardFault_Handler
> >         ...
> >         .word UART_IRQHandler
> >         .word SPI_IRQHandler
> >         ...
> >
> > Reset_Handler:  --> ELF entry point address
> >         ...
> >
> > The hardware fetches the first two words from reset_vectors and populat=
es
> > SP with __stack_end__ and PC with Reset_Handler. Execution proceeds fro=
m
> > Reset_Handler.
> >
> > However, the ELF entry point does not always match the hardware reset
> > address. For example, on i.MX94 CM33S:
> >
> >   ELF entry point:           0x0ffc211d
> >   CM33S hardware reset base: 0x0ffc0000
> >
> > To derive the correct hardware reset address, the unused lower bits mus=
t
> > be masked off. The boot code should apply a SoC=E2=80=91specific mask b=
efore
> > programming the reset address registers, e.g.:
> >
> >   reset_address =3D entry & reset-vector-mask
> >
> > This reset address derivation method is also applicable to i.MX8M
> > Cortex-M7/4 cores.
> >
> > Introduces the optional DT property `fsl,reset-vector-mask` to specify =
the
> > mask used for deriving the hardware reset address from
> > the ELF entry point.
>
> Why can't you fix the ELF image to have the right address?

This is a good suggestion! Or parse the ELF file and figure out the
reset address at runtime.
>
> Or just imply the reset address from the compatible? It's fixed per SoC,
> right?

This won't work because for the same SoC depending on where you want
to boot from (e.g ITCM, DRAM)
the reset address might be different.
