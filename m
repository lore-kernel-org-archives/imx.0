Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B722777FD
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 21:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835005; cv=none; b=k3f7gL7dHoRpT5aEl7Q/i0U9D2nk5dhRnSEAGkgo968+1TiLsGF16TU+F0bmvFC+i677FHlYmkY4FHJ0TYl4jRLKe2L4OcdLVS8Pp5zsTj3cvZfyUrWLFPZ6OXsu2F3fCtmR/Lvqzr1S5hbtCTwEaFh3lOxCOjPWWw3X8VkME5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835005; c=relaxed/simple;
	bh=SEKTPGDsWg0VrkaRrZsVcoh0RsDKUEs5dmSe955jVFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvdJ2Os1i2ewe4ZMVyhcJ/WAlVM/oMZshBX8bcgRLp5ZyEQn/e2A7Jpqf9ioC8nY/vE+FRGx0buNC58FtdBmG+7MFDZ3NDlHFjJBM1kdJZySizzlT4kVpbpTnSVh14Awo5LELH+jlJ2ToEfAwHhMDtJZTX+oDRMje5FmXsCWDCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPcJ7SvQ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPcJ7SvQ"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-581b92e680bso2545835e87.0
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758835001; x=1759439801; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xp46yIJcbHRJcWjVDLrWyTZCidnv7xkJHZZNxJgNolE=;
        b=QPcJ7SvQ7BpmLfIP4kaduj8zFUzFv9xlE+QqrSSNL7Ioym19iLfDa7Z+U3MROJNsl5
         Iw6NKKx1ZGsgHMEkoVv5zwGEwYdaxYt5A0mC5tu8bOXmBXK2TzcpOv8CkaHa7wh0+wb4
         OwnKf7tKTEIxHh+hNubF4wM26ykbYEOsy7n1rtXXnKQZPXbyH54RWdP632rxeg34d2Zw
         hxT3c1M2qHxS4+TCyrkSpzKN1JlFqkcRT76ZqPwyArgyhGQojlX2asv1poDogGWtLjpQ
         hIuAFsOITi7Obj1FmiYW2r28pOgQ0tKUmE0vMY5dGHYiH2SUdN7IzRf7G/Ki8rGnDQF0
         wglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758835001; x=1759439801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xp46yIJcbHRJcWjVDLrWyTZCidnv7xkJHZZNxJgNolE=;
        b=MAPqrJjJ3KSEWTM0lYoPr+9d7EY0ClxGRVnl4LffKX4VAQc9vk7DUgR0/zioJkT5A9
         89R09PJz+Y/MD5UKQEVE3SM6TQkW5GLeH6N28GytCaMHn+PkaG+tZ5uroXqeSS4CfgIA
         VCWdiP/JfcgK9hNkhisMXjJOVdv/BN1uFU3LrYZGqMteXnybywt0tAFfELw23OEvBzkO
         8kyO5hh7hV9vrdKJHuk46P55877QJIaBU0Xbs/U9/uHMEuRfOMTQGxJy0LBbrP0Ksmya
         FFU05uwFNvOdnEtSl+ezakYqVLDVky9kddxrDwfle3eLKyagcrVP2sUPWkJHmmciZZE5
         YLPA==
X-Forwarded-Encrypted: i=1; AJvYcCWJrnWyjc5eJpwsczT6rJxiVKTgL/P94h3hjkXnN7imFWOmyIQKBYf2vqI4pwK2M52iTN8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Wt02i6IkMgCtccw2cVOKcWiWxpY17Mri4mMsiXK6WpqAGOXM
	3FF5US2fkIsGdygG9ybaM9BWqkL4KDFt1sLRjKII+7AkxKUoX57Ommqx/7ofDs/rLeXWJHtbmQ1
	CNZqW6h4PtKHfESQQRb05EOJvZeNsfFw=
X-Gm-Gg: ASbGncv6as57sf8r20QUXATKeKjPL9XoXGd89wsUBCcfTWnBv9O2vWZk8tfaY+xDhz6
	zGZ72joPxnft8suM4AeBaAWSjfjSm71PAbkpaHdunPW4h2NoLs9Wc6lvrzseAr0Kbk1SBMs1/UJ
	vESLRghwX1aE5W+LXLWf3AhMFgemcpuWNUbULZlMT8zAbEw/idUeb6bP9nn4aKE4duCKdjBWZxL
	Zkv2rlmaawQqW/sAjPw2vWfa24EJfw5xJZ8Cts=
X-Google-Smtp-Source: AGHT+IF/R4h8pdyoRhIuFrnmhFqzj4YND2cqkoN6aHQ0ZxIGheJEKMprkxFrhvzl4kOccS6Aw2A/43bT62WxKEVS/6w=
X-Received: by 2002:a05:6512:2345:b0:55f:5c1d:6cd8 with SMTP id
 2adb3069b0e04-58304fa84d1mr1231774e87.2.1758835001303; Thu, 25 Sep 2025
 14:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250925-imx6_dts_cleanup-v1-0-748380dd0d22@nxp.com> <20250925-imx6_dts_cleanup-v1-5-748380dd0d22@nxp.com>
In-Reply-To: <20250925-imx6_dts_cleanup-v1-5-748380dd0d22@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 25 Sep 2025 18:16:30 -0300
X-Gm-Features: AS18NWCZCROPwL8d5eWS_txyBP3E590ZB-alom2X8buKGCuzjFOmQJoNNEiM6KQ
Message-ID: <CAOMZO5BNBp-sgeMvisvXjvrQpkznGkCY-8h_vwp46p0izwYqEw@mail.gmail.com>
Subject: Re: [PATCH 05/11] ARM: dts: imx6: remove gpio suffix for regulator
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 6:14=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> -       reg_pcie_power_on_gpio: regulator-pcie-power-on-gpio {
> +       reg_pcie_power_on_gpio: regulator-pcie-power-on {

What about removing _gpio from the label as well for consistency?
