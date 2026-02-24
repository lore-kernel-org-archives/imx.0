Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536C376BF4
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771928842; cv=pass; b=ub1lNXdtOtYKC8IdVHsB98kqXvK/50JJh08uNrFWuyr2gFLHAIuMxQYL6+wMXEvnqF5x/6uPKpGFxud1g4sNXSiLXsRGChCEHIk/Qfhd0iNALwAZ9wxPk6qdzbbyPASCTAGv9MYMaES5C2jipzMcIG1lQ5RBxJM12eYTYp6LfLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771928842; c=relaxed/simple;
	bh=jjCLqNjogYinR3bEtF7xiisXRhPEOHqegIpE6AxI+GU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyL6o7BwhQSCGmpKHOTKzdvkrcyHW2q2MgDW0yW4YkWbptCP0vn6JhDuqfD6ChPaLXs9CgAQHi6q6DQQRqC3UfqOKmnhGb5SiMh8HVcUjgqN2WwSfhKXmY7gIP3mrsrcC8YlA/ZAxg9oMJcnjf11aqNcc5L1Mo1XeS46tQYLPKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhuJGjDT; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhuJGjDT"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59dea72099eso5411810e87.0
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 02:27:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771928839; cv=none;
        d=google.com; s=arc-20240605;
        b=WJMiRImHQCNWqFo9XhGNRbM+6fKmbreDdX3PSvV/13sBdJqCuujCgPtHThYmAyAWvQ
         fVljZZBYHT5Fi05UdMf6njsdE7epKuhVgXKLOeZUP/SVMW1ixLqZZrkUuJp8wISdTJkV
         6a6qGsiSn6AVOvunAqjCvt7HbCTTOrhytKPKHVefcUwcZF6KSS1GZKCCSI2851SFDWrk
         Iz6T+gizGg90ckq6aVcWJ6exONL1h8mPfbfvMyBUer3QkVlhHTsTmFZQ/V2cKC5gOkaS
         iVwE1/M4Y240lPZubHiNES+Mdf5fq/sAL7gq/hft3hIebHltHfYlQJSfBf5lQdLXj8Tu
         YQ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p6zyw58AOxXSub8QGwmMM/bb4H+WWArpgg93Ti+4E3I=;
        fh=qt+XkVItR6HEsDNSCkyjCk3QWvRuYaMe7yS/rIHlQyk=;
        b=fNNu0SlzYXguNW8p5zkY8tNAa3Wv9/B/F9RwSDEmFI+pvMObtapdicci/MNyakq0bL
         N5pcYNxvH2pkqtz8I1D0anbiw0clftQYdSjPcFB55wO2uHXk9bvk0D1qJMVeqbmYM17o
         VEjLNacnGplnqdQ/oYzBn6HA8Qo/LTMx3xFzQ0tPBk6rKub2d4oQiM7bcyrTvU6c+lOQ
         00vNlTdwpXWtw1Bh6Xmv92PLBs919TQGvBOsxtllFWOXPnLqwf4n90mViNj0Xr7aJ2Hq
         DdIK8j3g9v5+InTqmrXLC9KOn5hlPrxF+lh+PWSIXmHQi3MFv6dJPsHL9PSU4SgjeuAc
         8mvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771928839; x=1772533639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6zyw58AOxXSub8QGwmMM/bb4H+WWArpgg93Ti+4E3I=;
        b=jhuJGjDTiiBU5Iyn0alr4cBRje7x8uVySbVhgCGKDpwULpwWjtFeSXhbluYgomtwWS
         kylpz1h7/8LM6SjFkC01r2DVjxnPNXfMgj/pZkLOvhhkunjMzdZ5x4uP36ZA8q5E1FJw
         +VCtOppA3dH30j4zGQbgYf5eBUv0UIw8yG5yPR882PSXVSEC2beoPT9iI5xRY/wylVco
         B6WKdT2pTtogVJoZhLio5h9yXraTd8UkdzKZMeTXnVDXbRKP0dxx5hR8rGuAxzdiiyBS
         IQvjwNUiRvhEcu8EN0nebre8r8ois+i4gIhsx4+b8AVBXRAdIdQV/r0B18cypxp6B1rE
         wiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928839; x=1772533639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p6zyw58AOxXSub8QGwmMM/bb4H+WWArpgg93Ti+4E3I=;
        b=xBZ5QoY8pa+HtMdH91dIEv5mDW6GW9sWlTKDlMglZ1KcDmOmqbvnDEh/8y4iSv9iOW
         dhd+ThTDBQszlibJG6vxCc7vvdFPMI1dm4FznkHor0Z/5Z7vovKlrUUZR7e/a8ZQpXaT
         97YVxSmDW7zq7IlYo65BxBFAF253GFUf0BurRuMl1NEjfIb1x665gNJHkTNgCCy9nrta
         UAFs9z9Fgw69y1iMmoWD1dIT36reJQCOqjnHzb5a/nG9L5AaYmyRUrg6waZ9QcCaRIxK
         MzUDRJL0kroBO4x1/cxhkkyPsie4hE1FY98QyYNPvFI1VvZAxYSGEZmrbXOBDU/ua1pC
         +uXw==
X-Forwarded-Encrypted: i=1; AJvYcCWjot/nsrUDbYQdYKzkZj5vSeCJHQkEvN7sqoDqDjbf6R4j3cKm1+QGnSyzB0zHhDb6ENE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1pUlfk9GOQua09xytO5UpT7pgiJxkCeyIm/EOdZ9HV38hkSby
	edTBNH/86LN+9SHwAcwqVYuFxurV7QeBa0JupSi9wN6QUg61tm8qmzYMabSes+mGw0vEEQBEClQ
	JQ7q+/s7Ovo+guvWt70DRr93Zs8I7pLI=
X-Gm-Gg: ATEYQzxbCofay993UHraH8oYK0D7eqhtUZ8GOin8vTY53ztjfd0Hnz+ZhfMUigjd0nQ
	wLggfi0U4uT9rH1eJ0YXHBGX/xp1x/eGsGTM/sPcBx5UFN76Rr5WHBqPIfbVLifc2MYTHtCoPZb
	0/FCSjWoYfX9fmP6UgDndR+6X0Znln2a+oLqDsBO4ueZR/fSjm4UwLNoLGUf61e/vWv+EwVn7YC
	mcJiQm5G1r1D75wx1Wm+UKz3nq70RNWoubymRA+pet2i1Sa6l12tsWxRXr/XDhhgS+I1qWNSzXZ
	pVPcHmhMmSqrY8qrxwswWJWHvujA+epqptkUvA==
X-Received: by 2002:a05:6512:2244:b0:59f:71c2:6a06 with SMTP id
 2adb3069b0e04-5a0ed87a0e3mr3947109e87.1.1771928838810; Tue, 24 Feb 2026
 02:27:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224094527.169215-1-shengjiu.wang@nxp.com> <20260224094527.169215-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260224094527.169215-3-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Feb 2026 07:27:07 -0300
X-Gm-Features: AaiRm52LfC9-UsCut8Tth636xjKLVR0axNCtj7qY01_2UMRqth2SAkou2H1hRPo
Message-ID: <CAOMZO5DW5Yo3A3kPOe+NdQNwTATzzWguCGBDyK2UFjCrHtwFeg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP audio board
 (version 2)
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, daniel.baluta@nxp.com, 
	dario.binacchi@amarulasolutions.com, alexander.stein@ew.tq-group.com, 
	Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, y.moog@phytec.de, 
	josua@solid-run.com, francesco.dolcini@toradex.com, primoz.fiser@norik.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 6:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:

> +&ecspi2 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> +       pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +       pinctrl-names =3D "default";
> +       status =3D "okay";
> +
> +       spidev1: spi@0 {
> +               compatible =3D "rohm,dh2228fv";

I bet you don't have such a device populated on this board.
