Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE415181CFA
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 01:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761528676; cv=none; b=bL5VU4EwU8CaYcvR2icBXTzyl/00Tm8RMqrfirIEk5y/JMGLBnj+IzEki5KvBTwAxqlAzjSO9KI7OeZmoTgsYsaGD6jANo2Q6P61rbDDD4qjxYje/xAa0uTLTueqUw9fIBDEC6rLJ0TFha4PU4e15p04elwQeGXuY6WYSaeQGqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761528676; c=relaxed/simple;
	bh=exMzjzfU+bLztxdgo1IHB/OSEAXPNYJlP8uiWT0togw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMZhLk6700ZqbPpEaO05a+BVQPQslv3JDbEyx3RHoXGS94EBr9DF0edpTiF2ttZZy1OdgvvKF7qNT5c02l4ePpttq1nhgoQj4jT6Wwc+9O7pDHiSvlHWMgeo7Q5WOa0kQunXgBEF87hYqzyl6goWfkrHzPhMump6UAcye58oJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XePoqtMk; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XePoqtMk"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-592f3630b69so4866044e87.2
        for <imx@lists.linux.dev>; Sun, 26 Oct 2025 18:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761528673; x=1762133473; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0mq+S0SSwJZlAF16bAHUInjGI8BPuKNwrhS742qQjU=;
        b=XePoqtMkUGPycXfHo9mh2h4AKMyx3DrvQ/c26qgMd2XosBm5wDCOGr+fnvVTvf7GOW
         8qJOSnZZ9ko2bNfILabcYMCbZkVXEygyqidWROCOcm6IrDJeIqE6L86Weyj9alXgOfje
         SPEfYgZvwZv57ww0nt4JROqXgC5ZSMrdIPTaN9764+3fD74HE+bokAYdruHMuD60dBwc
         yT6yALidSibEO6O/N6EGmfZFBKo6xO1n7Zn6PEphpyryMC2CdyQzeHipGuRACvtJXh6l
         Q/xjBqxvaVQ3l77S7BlaLA7QDxHP1mdLeQsGnExcsnIk3AXfWh3ik91zSL0b62asV8Sc
         HQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761528673; x=1762133473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0mq+S0SSwJZlAF16bAHUInjGI8BPuKNwrhS742qQjU=;
        b=CgPvjbQt3KcOqXkw0knL6qcRKA1XXqiRxo6iQKZRRAqW0lg10hbwwD8V7KrtyytkEO
         85qTogxlY8pDf5924syM8N+0a5Te0DWjAL6FtMU8h1Gft5+E+BrE7R6DFGJ+hQmtEb3w
         QP1BWvvq5QxhyiZKvckNCAqMwOULyO5vScJHIagjsmSf9CZkE5/ncNI8Vxnfa3SRgbAo
         49Zy7fmQMhbB17yD2OXQ27yLFePLlxJJbTXcE7LtXSJE0cxSSviNQRfJf9pvvOIi+CjP
         RY0xsmAjZBkiLqo3hkm1dZ5H7RpgoTJLVCk8wOWU8zEp+b+4n3fBLKDez1oi6Oob+n18
         IqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnvo0F3TwMu2XVQX10KvNUBtF7WOd2RDRdxxb8hNWksGLUjoR+CYrFFglytoVbicHv1AA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2SJegyCsJgzUPU0ZmSBAXaejzrO8xMKA1xZMEXDHryhkhmBrZ
	yo+gznxIkddljzzFxx6T/M4xB7A93uhlFvLT53FzjCnbDD4VnXaoOQk+FmS58DlFBoc/pUuu9BP
	VEjsDLPVZxrpdhqsdmoimi60y5Ib20B0=
X-Gm-Gg: ASbGncvjgE7UK0WGONbD/xmxiNNrrber4aZ3+cRDjpSDUdPYTp1dLLKlCnxYzq3vBz1
	lUBsV/U/PimT6So4fptUrLlBlz1L8T0QXnHseMFbAw7g6LHQPboSfzFXc0QVbfuJnbeWC41fcCD
	QTizxWaiCivDyj1KMlzgp/f26mjj8YZwPAyhkCs1J4njFrBj0NcnxDEoTfmeStpLy6owEOPUyxy
	uM2daJgk8nZzlCU10x7fMqrxHPNaco0BYtK1bE30ho3DeGIFJgYrDSmvP+YmMuN09hGkP+J63ki
	eJ3clLz94Lsb4MP/WYPuKpmkcDE=
X-Google-Smtp-Source: AGHT+IHF8zYNH9eypIhSI26+bPKx1nLvnQNG4yomtu1EBpIHmW05juPCXzFQHtyIUt4DQWHwS9Ulh5ysegd2cmPvh6Q=
X-Received: by 2002:a05:6512:e8d:b0:57a:311:3234 with SMTP id
 2adb3069b0e04-591d856f103mr12296255e87.55.1761528672466; Sun, 26 Oct 2025
 18:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 26 Oct 2025 22:31:01 -0300
X-Gm-Features: AWmQ_bmu-eo2lHZa39sy9y-lchMDaDzmYdTAdeuJ7Cb4yBT_ijmH0CspguIjQAw
Message-ID: <CAOMZO5B3p-mpYqmj=OgH+=pWstgjVf5xJOX8SB9GGYdA3h8nHA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Andrew in case he can help with the review.

On Sun, Oct 26, 2025 at 9:29=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Energy Efficient Ethernet (EEE) is broken at least for 1000T on the EQOS
> (DWMAC) interface. When connected to an EEE-enabled peer, the ethernet
> devices produces an interrupts storm. Disable EEE support to fix it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> The exact reason for the interrupt storm is unknown, and my attempts to
> diagnose it was hindered by my lack of expertise with DWMAC. As far as I
> understand, the DWMAC implements EEE support, and so does the RTL8211E
> PHY according to its datasheet. What each side does exactly is unknown
> to me. One theory I've heard to explain the issue is that the two
> implementations conflict. There is no register in the RTL8211E PHY to
> disable EEE on the PHY side while still advertising its support to the
> peer and relying on the implementation in the DWMAC (if this even makes
> sense), so disabling EEE is the only viable option.
>
> This patch is likely a workaround, but it fixes ethernet usage on the
> board, so it's in my opinion worth being merged. If someone with better
> knowledge of EEE and DWMAC, as well as an interest in getting it working
> properly on the Debix board, wants to submit additional patches to drop
> eee-broken-1000t, I will be happy to test them.
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arc=
h/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> index 9422beee30b2..4aa47f71425b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> @@ -102,6 +102,7 @@ ethphy0: ethernet-phy@1 { /* RTL8211E */
>                         reset-gpios =3D <&gpio4 18 GPIO_ACTIVE_LOW>;
>                         reset-assert-us =3D <20>;
>                         reset-deassert-us =3D <200000>;
> +                       eee-broken-1000t;
>                 };
>         };
>  };
> --
> Regards,
>
> Laurent Pinchart
>
