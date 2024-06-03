Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A52110A
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717377683; cv=none; b=vBl0s4ISm9qiJI+KPU+yzL/Tdy0CNloGHUd3z98eFhJp0Ggw8vglh1F69DI1/aeCoEvln6JM36WLrG3tgbVzsjdgduIGTt/a6VMeP6tE0778ojxrAO09FDhFSd1JUuC+Lz6+2unrblCSCBVBoomXiuWkbM/vTVYmiUqsKddZCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717377683; c=relaxed/simple;
	bh=RB/1U5likLlZjGcsFz7Qbp0mPYupPUtUbQd1IKDqaCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=el2rW+iDvW/2qHasQco76UUPbJqLL0g9kf8quz+X/GixFkcqaIfPqhmtVk2d4Qo4/AGbAWTT97riv8xAsdERLchwxmRwryvAQjG8UrqEO3VdzMe3FfvOHxyfLFEIoD/IolNH/S/HWjzr462/sm7OF/6smfxo4pQh9w7VRomGuBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E152nhrb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E152nhrb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c1b91de580so450188a91.3
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 18:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717377681; x=1717982481; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RB/1U5likLlZjGcsFz7Qbp0mPYupPUtUbQd1IKDqaCc=;
        b=E152nhrbbnfTOiZghU4B2t/5zwOOEGrR4DoinxlciodgyB7wKgKZHD7RvDqPg3WjPG
         iir2oM3/gabd94ZBh0uFR6f80dOGksa53U0fbe/BsLxeOv/24xTUibHKXHVNWcFMxfRH
         s4jsVSZO83qvnMIkeCyCWCA3SzFd1eKF20YqZFswhDqx6EPNyhPAHjSyA4MXu2O3286a
         LCVc6rd6GUHmA2DZjDh8v0/c8gGpDPeii58uwGW1ptYqv9B4cvP4tTNa0Q0DNzeh0rHi
         U4ibviV34Qq/HU7rwre+RC/sod/BJo6vDPChpV11sVOAyd5v2XO1GEN6V2hr1kxSRzgn
         fsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717377681; x=1717982481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB/1U5likLlZjGcsFz7Qbp0mPYupPUtUbQd1IKDqaCc=;
        b=UDvx4VqU9jtoRnPgT0QfL+u99IVte+a4xSF9UMj16mqB+F+UcyCn2WTf7aK7q3QIqb
         R6QuOOwWfi2o4c+gjry9x7qAJcPWNZ3fPg1nxRw6k4c0xrdaS1zn/eJ7230ZSX1HR4N2
         QyCE0HLCzj48Q5B36z2UoR5JUGKEh5hf5xcxecWWuXdXm9+TSbCWClf0wOuodBqLJ40q
         puqFzoF5ZutpzMEVD8TcC4e+Mi6SnRksMe7mMT14dzgy36sfrGTJIAUmhlTv7IWafXXQ
         9iS95jiHfDJQmwVthhlWLoGjMFkMVobQVbLV76r7XYvLBirf9IcXGLC8MkxxewjMW5As
         Njtw==
X-Forwarded-Encrypted: i=1; AJvYcCW/MgFTckPCctpqrpXMvM6T8kjmrZsl7q08GZq5TFKH983yISUL6XDkQyzGAbHOvjadYfJpMVJJyDIxa1IKf6fcChn9
X-Gm-Message-State: AOJu0YwF8I2oQFYSMhtHlrs6CYLPoyChIrbMgq+a7EhNTSdRF+OX9jr/
	QCuRGCa3VXgKQ5BrCgVLVf+L2OzhDUA0+EGTYpD8OWYbprHoN0DeeFN3jbq8pQYd2Hy97jvNE8O
	ICVHGj8DSGezps28gC0aC44q8AhU=
X-Google-Smtp-Source: AGHT+IEQ4+gCYZIxRVWNCVYikIHZG2pVsK+cvUdVg3at5qIdoRKL0iaJ+Kmr2owcl9LUQ1cw6e48s4phWMuKRNK7xmc=
X-Received: by 2002:a17:90a:5984:b0:2bf:eddc:590b with SMTP id
 98e67ed59e1d1-2c1dc5608d0mr6801201a91.1.1717377680705; Sun, 02 Jun 2024
 18:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240603-imx-sii902x-defconfig-v2-1-a39e442011ae@linaro.org>
In-Reply-To: <20240603-imx-sii902x-defconfig-v2-1-a39e442011ae@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 2 Jun 2024 22:21:09 -0300
Message-ID: <CAOMZO5BSPzeZ-uY5bnkf4DV6YZvdm+jgwWQS9AESgx3Jx9dhyw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx_v6_v7_defconfig: enable DRM_SII902X and DRM_DISPLAY_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 6:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Enable the LVDS-to-HDMI bridge and the HDMI display connector drivers
> used on the iMX53 QSB and QSRB boards with the HDMI mezzanine.
>
> Cc: Chris Healy <cphealy@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Fix subject and commit message (Fabio)
> - Link to v1: https://lore.kernel.org/r/20240602-imx-sii902x-defconfig-v1=
-1-71a6c382b422@linaro.org

Reviewed-by: Fabio Estevam <festevam@gmail.com>
