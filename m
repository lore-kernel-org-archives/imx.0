Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E13382EB
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770308076; cv=pass; b=gO0LnCB8q1GA/9zYtzyCl+kkzKiXyQU5cKSv9Pci0c+PHtNLADkM4jMCoCdlHI9xOgeR/Fq4wky0lkawY+9HZUyqc5bNaT+nCVSC2JrmtthEk2pOmXbrylHgVQkkK0/SgOv5TQNU/YKs4H3fMYPQuMWSJlDeyPGyx3V9b8kKKZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770308076; c=relaxed/simple;
	bh=G0AtHxYqGgkr9atHYusGCj4EPeFpWCf6+pfxHUVm8uU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhJeyr6E2gBJIQM6FEnWFPqOb/VWkFqevNmcufpaOV/Dm86ZY+4VbSs8G/Xn74lO0CgRwjX/olmvbbrta9HQ4bI8K7Ok4m72zJiSKg5dhyZrjVFGNgH+FzC/+R3XqFONM/ADPXbZxBndnTbAfHodjlEk1lzsOZk16uIYK58K08E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqWLs+a0; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqWLs+a0"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43284ed32a0so691268f8f.3
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 08:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770308075; cv=none;
        d=google.com; s=arc-20240605;
        b=VJyBsKGuhn8OEzPcuAjByfzoJmLUVYujiZB9rnK56lldalPXR2fp9LJR3V4QJ9+ZLC
         wnG5Zs7Xr6PNuTTFw//gVOgKeLaeen1VyWhO3Vz+17Wbvu5705x5B+V/WYG5Y7pBFoig
         /m632tgNfFhDaStWfaQBl05wCx0vnRRyQJG23l3O0PG+fUotzxrl3C7sRyqjBFdhS9wZ
         dUDAXLoZEL53OalHu+elJrVz7x0LC4RHT2RvI/4IeSsqEkiLd12CaquJZVrGKILgLxmq
         k0ygfAQswOpZaYP+uS95RumVwmZJ5NMJ743w8MgxVGjQyKLZ9VQbmkMlzEjFRijLznqN
         hHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TT2eQRvfgO/3XBRFae0T/CpdFBfoJ3maco9Ak5Gp/OY=;
        fh=DQbi/heGYErOfnfeDmr8Cl9DnoCllEbQsu35lHknEk4=;
        b=GPPmtuOY8sxr1E7MP46CB/dhr55oJvvVfZXVzS6M2NTHk44CZsVkG6J/8yBnYlTOPk
         ngxRw4St3HTbdybpnVivdJHGR/KpTD7Gg0I0r4LVgla2awFnM874ihr5PJch08KJITgF
         2ow8ekYUJ6xqRSBzTEGVJS/PSb9piluDPU15pjty7YIpO7eRk3Xa4GZOxPPr2S04PZZK
         gnS9HOv/qbO6UTURfzeECKp7XBKRWS6tp1YlOTibO6DDdTWPHxPdUVS4xXJBIAbQ8+aB
         jtbvhHxScDXSo1IAb+f3ZpTWEzaJWC6ZW7RLpwIeoN3WbFgBrwP2RwFIZLRaCSJbw4WY
         iU2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770308075; x=1770912875; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TT2eQRvfgO/3XBRFae0T/CpdFBfoJ3maco9Ak5Gp/OY=;
        b=SqWLs+a0lioMikq0GWiIdUhte7H+r+yObYpa1wIG08yc+VZXNjK79e/WrvvAsfVTWO
         Z30UrhnngttwO292OScZ7iMM1pnpblq5qE9X2mBiAD6wZxfqxk2+qc5rn9UkbJ9dZcQF
         MCB1i8ArxtBmkVc11NWbo4RXWqITPdhKQfQONV4vAiRJOKwj+LSJTbQzRzHw4VBlIH0p
         FtLuegUWYCbdSTMipA89DMWROaQx8YpRSh7nStyobB4LN6Oee/Qj8PKkzgvOt6XBFEEi
         f47k8R2y5/ODmG3iWnWtJGGNj4sd64QMUpTZwJRSLV1th8IhUHbpcXkb7ie8L/gQe67w
         NGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770308075; x=1770912875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TT2eQRvfgO/3XBRFae0T/CpdFBfoJ3maco9Ak5Gp/OY=;
        b=obZzs7LWYqod4NUEH2oGGUgq0sXYRuipVA+Cj4gXKo4I2LPKR1JjHvPnbxF4jPb/s6
         EwYAx4zhacisRBf46IrwU1pSDjBWhEraU/+Bf20blUsvNLZESCGNjHU1xcTzuiklPNYg
         048DMdZZr7754hIKJS866TtvGi2rubyjv5yPgV1iDBS7Z1Fx94r1EJhLgnNwCMAGMUDD
         MYV/5VZR0Enj8phiny4G6FTumlFPwyCVkVIfoI3cZG75DXIDXUjuH5Ni83UtaZAhyGzn
         26AgUAe2gJjZgDCln+04aTpsysn22N3ZERfyPFNR11ZxGmqK81r4Xr9ZQehZDW2FT4Pm
         wKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf4ip7klHzqvWmKCOCFIctARsLdkrtl4WaqAKwC6y/P4wrE2KyeFfNDSOAnE4/5dlOITA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLo99AjFDvSc6nSPhP/jE5lIzZlyQoasx4uWD6IkwfX9Gwbkj7
	RC20wrI/SP6MDknNFT0DvUArSvwMLh1ukQj/aca/+NHJmp8ghQOVAGo1BVEseFAFKgX0O3Jg4qC
	QD/MILY67vzSGnixZLvV0J9kFmYNUQsI=
X-Gm-Gg: AZuq6aLpxCXImDZj3TmvlVpCPcREH7H6yWs9KUMbATz//NHXl5k4eu/haRd7+Z+RdbB
	FnKMhtkAt4wSjNDbLBzogY+dsMWYY+HC/Qx0JM2yu7PxMx91IQ2XjUI8OI4Auoook9mgjkv1SqE
	2MBFB3hiGjNPxaCAhZfIWvLhsml9VqXtn7CqC9VJtfoOQaKvlzlf9x2WLco3HrnAzhBNpQUgEB/
	6cYs5G3E/Qj3YdFQGwZJ5OYzy+YQX1gjqSFH+Amtv8n96Y4ZLsUEjDoVJlo/CGQiyds2HaX
X-Received: by 2002:a05:6000:4008:b0:435:e436:7fb with SMTP id
 ffacd0b85a97d-43618059612mr11097375f8f.50.1770308074748; Thu, 05 Feb 2026
 08:14:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129022910.3942028-1-onlywig@gmail.com> <20260129022910.3942028-2-onlywig@gmail.com>
 <aXsdyzZEUaVzC34W@shlinux89>
In-Reply-To: <aXsdyzZEUaVzC34W@shlinux89>
From: Wig Cheng <onlywig@gmail.com>
Date: Fri, 6 Feb 2026 00:14:21 +0800
X-Gm-Features: AZwV_QhAb-x2AIC9FZ_A0KiIYxUwdfCa-Lm4hiLKANWs8oWf_rB0v7ryvoRkqvg
Message-ID: <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"

>
> On Thu, Jan 29, 2026 at 10:29:10AM +0800, Wig Cheng wrote:
> >Add device tree overlay to support the MayQueen PixPaper e-paper display
> >on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
> >interface and uses GPIO pins for reset, busy and DC control.
> >
> >The overlay configures:
> >    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
> >    - PixPaper display device with proper GPIO assignments
> >    - SPI frequency set to 5MHz for stable operation
> >
> >Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
> >
> >Signed-off-by: Wig Cheng <onlywig@gmail.com>
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Hi reviewers,

Thanks to Peng for the review.

Just a gentle ping on this patch.
Please let me know if any further reviews or changes are needed.

Thanks,
Wig
