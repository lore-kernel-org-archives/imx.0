Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7840A372673
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780368; cv=pass; b=M1GoFCHngrq8XC1T0ExdX5qWIYcsC/80AVT3co5YRgGl4AoyaQ+CV11ftRVAQhTY3OHO06ky8DfG3DKZwS+kXqsZmcePhBUQtM4LNMKqoy8peoCgCZlV5Xn2mY59VQimJh3CrRTAgDrpgRM1953pndSIV/EivgnmTFa0EEsqLwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780368; c=relaxed/simple;
	bh=H8A2pb3bWTY3QTDNwQYcwQRlfG4CWWzDSz/uhrkZqUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mkm523P/UbQSA7E30AtujcPCzGChImtwbtKo2a5CzUdXeklAPwg7/8kCeKhgIygAY2260IxXZsL8pqqOYmO/s8jJT2/wMDbXQGnD367SDATLB27jyahzcxVU+gqPWkEt+rFsXlVZ2upg81CoXRdK0KtiViU72+Jd3EleDOqRmeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YicpEMv8; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YicpEMv8"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9381e78a31so1160739266b.2
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 22:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780366; cv=none;
        d=google.com; s=arc-20240605;
        b=aQFqmIkEh+B7ECWPUoBJyMC2dGMhwQRAH8z0rGr+jR0hwCKMCKy08SBlaWX2C6sLGp
         8fsi+TIRcMvYSLviVGBQpcDefSNQcM1eMZ12UFIPyf6PrxWuOvtSQG7iFUSexUu+7Wl7
         urnpF7ArrQUxIL3bt/GM/iQm9XRJtMqbvWsfdWjuJsP2q7jxJ3q2cGDKsgV41KLMJq4d
         sLyKqu/iJA276coET4jr6PMR9OHvmKjCJcuYBKcH0Cu3RcQHHXPCDDIWuni+S7XyiCor
         hlnvz5Y8fq6T3u9NEZrHW+bpYmd7239j+VvYh20BfxRyTJXHn+CODYvK5qPgxTlvun+G
         qwvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        fh=PmzXEo5C5nAAqe+yPXJkpPq2dU4C64GKAr411c5EIGo=;
        b=IyMRcg4VVBk1gUxjxrGx1l+cu8kNDW90FGZ6dSTObsmsriLNFmBOKOVyp9i4bvSEKh
         qTb7qW1CVFz8dKtvXdBBcSgtgfZbnPTxO38Ey51BiJMymFTJghhxeSMs8LwD4jigavOK
         JEF7B/oEDgb2/nBWTOGRCxUoJkRVssALEnl8s0g4yEtYsgWSxFh7GbAM6l9TTOd0j+zk
         /lMBN45XZ+y186ZgQpkrv4Zse1O8cbQ7tU0gxfODVwAWuhXpgnYetzKAhIM9TXbvj8Vd
         3OgcSP4p6ur9jdaR/71Jm48IaQrS7O//B5e36yJpsMvhQXjTk1xrWvqk35GnqLMR8fy2
         gqHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772780366; x=1773385166; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        b=YicpEMv8Cg8Ur6maoRbY0WPhAUjewoqQuj3+pqStkbKR1HIFWV2WwnxYjEY6EUGcMg
         GVNMmP1VnMt2pNFG+Mon4B+ZBOyF1S5LI/VEXvy3piE3hEG0edvlqwxGfh/paKWa4Fo1
         1ORSYt6E91VqesqOBwO15UTeLfizBx4fcuBuXspbooNzAecsR1uqCEN58BGkxjApJUQ9
         y0saFUiK2ojURj08PO8IMFMSB2f7UqEu6DahvR4FdYMgHHpzFGQwoMUDtFJWJqUFK7V1
         2S44/JX2NswLHf5QfHDmv+d/SmcnHgTpB3sqCxEYcLUNelnatVGD1QJv3FfEFFaLJsVK
         KtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780366; x=1773385166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVlhqHe7CkV4fZT/h0SneJI3zUiLhQDfGLpZ4oeyULo=;
        b=AZ3j4MPiy4a8gjJtoJ4pKf3tYJLqUK6pdxs+hMeY5nsMVWlByBaPdQxmLwsQQdsYLE
         YVY07vQnDdCP9FEGdaz/uzEDthmptTRR8+NkBrU+DfxVffWOSJ/e+tJdCcmoHTpxkb69
         HZkSxKs7QPtAYV6ce1+eDJ7D6+eYUHkipubHqzaa0Ogago+4GaSKTSM2mMhNe7LCddgz
         tvtNeYhvyVdmamIMbLNIQcc9yo169Q8UTiumYfPtLQaHn4xgPdxVr1aeehPGLAQevgkO
         HX7Dg9vrSHNbPAoPqp5XBJP1pcUENa0yOWHBcUJTpjLMCEAlU9lOI834cIJBesCC/VSl
         guxw==
X-Forwarded-Encrypted: i=1; AJvYcCVkisgcngV65qzs3Ad11XhLJ676t/EXSzC0KQEmFkdCmh0FzmkCssgbOvsu1p/FirTGcf8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmO4p7N1kbF2BRUS1I3DPhuOCskyR1OSnvRSOljOxw+p0X9sFB
	dtjxuBYRJb+1WCPZY9ewi0+uKE9jBR0iGsVg8XcMZMq+t4sE9CGXi8ieauUGG2PKbs/pwoFBwmr
	Fds+LHGNjj/4Fs/83FSDbOt98hn+xp2r/PXYb
X-Gm-Gg: ATEYQzxZJrXXrzQcdySlBeZoYeLnjXqvY7FN1Wqxy7Sh+qvmUqKUxR+tWaaBYxLZeia
	rR3+xLc2nzNhcxM3GcRnPsyr5T7V1grOUdsWeDttFuds0WUx0vz4v5FPYteu6/k4LecD9zrboOy
	oT31n0INDzOoBGH/jAoWCzB2a6+PTjVHEXu939QWYfHho629y++RG0HWfxxsNm05LeZehKrCfbX
	LNRKwnciJWZLeIDZ+ePjroCwgLcm67csyAZ5nN8yYcaRmqXbxKgRBDu0EIaG9qhCBOPtGhSJ3Nh
	2QtYyqnG5V3NBWIBdxGQxlCp+EMlD/bScwaQr4c7oILmbpd1JfomjsDnej3/cgfFlBtWmd+d8dq
	Zzj6Mwg==
X-Received: by 2002:a17:907:3f07:b0:b90:ba21:62c4 with SMTP id
 a640c23a62f3a-b942dfe566cmr55999266b.54.1772780365567; Thu, 05 Mar 2026
 22:59:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260306-handsome-quixotic-catfish-705bde-mkl@pengutronix.de>
In-Reply-To: <20260306-handsome-quixotic-catfish-705bde-mkl@pengutronix.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 5 Mar 2026 22:59:13 -0800
X-Gm-Features: AaiRm50vB-zSPWaBk9wa73JDVss8keXDl3ZA1Vf7DNaa1ZQu4Laz-oBPUltxeOs
Message-ID: <CAKxU2N9szBV0C95=v7_HxJOBgOhFv1J=k9XPE1Lm-w3zQMQWdg@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-media@vger.kernel.org, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, gustavoars@kernel.org, 
	open list <linux-kernel@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 10:56=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 05.03.2026 20:45:36, Rosen Penev wrote:
> > Use a flexible arraay member to combine allocations.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
>
> It's a devm_kzalloc(), which means it's automatically free()ed after the
> remove callback.
Yes but pipes does not use devm.
>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
