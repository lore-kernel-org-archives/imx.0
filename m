Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B1F24887C
	for <imx@lists.linux.dev>; Tue,  5 Aug 2025 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754380192; cv=none; b=QNnKsdwTnXN4t+PkzpD+Vbomawb7L1m5nGVelv4FB1/FXw9aVztOFR9LdnEn0l8qhswtO8t7OJ1d+TWcx2VuMQgfqV3Yegu3HCHPd2omTTqGpg3QjWQ8fcYvyqmcJNlOsAN8HjlcA0CVSKMfEZf7ABxWARlXnNotCnuLD66xVFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754380192; c=relaxed/simple;
	bh=nWNH5eCqyP/FjxukcloV1DRoOBCv8QarpVQi1BOYK0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvYXLeaM40q6qMO9PYx/+xWQkCBD0GZ17l8RdvJui1p9jz9eL9s03UcWEOVWegp0l73IBReMPJNwvQtBzwRQdHg89BcxUdPMPb/cl5/1YadMAcc6WEMSyR36sHVyW68ZwBYyOdg41iG9yg8IKo6YlxZSsunW+KZd8r4P8m2dB6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMUQHOAf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMUQHOAf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32117db952aso2413827a91.0
        for <imx@lists.linux.dev>; Tue, 05 Aug 2025 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754380191; x=1754984991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWNH5eCqyP/FjxukcloV1DRoOBCv8QarpVQi1BOYK0s=;
        b=VMUQHOAfJIFSi4IaRWMtQHPSHEntmULEx27HbXlP8wMbTOqYs+nQlXGhuXmg0fIKH4
         zR1dxdP7HO/6yseUNbfyyH+w9y39Z4YMef/7SiTt9AjQsqIk2hwE7IzqvgHKWS35rPQ/
         7/E6bmsUDIDpiVe8bc15+YEk7DJ4BWy6QAbElc2VjCam/HAAQmjv5zGqsKMYpwYIXLPl
         jUuu8JdNGd9gctZQYmCyn3drAka4p9rxZj2eTYgT/rMAVSrX1j5HBYjSZZNnxOt+/NAW
         wJmxIzKDOlXGy4duWpGEX9kfcqFC57RwUZoQpYzr6YbljS7XSoe718dKljwVRQRm9jMx
         wq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754380191; x=1754984991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWNH5eCqyP/FjxukcloV1DRoOBCv8QarpVQi1BOYK0s=;
        b=THhvIgDXwj6mJtOiDKHT057FeFCMRu49GoXlzRVesPJHoIIMz6wBnIB1sr1uKgutch
         WGwQfcO5KtC7iR7RmwJL2FT6YUhCMHlLGhiVpMvOlG8JkWwcFoVNtIIyrwSRPubnUu8S
         uQS2FzAoCgZVg0AhmgZnLdSVS5HOzEP73voanNYllkoGhroX4wPn6O4f6v9cOFDruGW1
         OYt6PuE1WMKmMkJlaNIctlLnMY1K+dAN4MDGjinZUXHf4co/RbIuQlIbnB26H8h0IHiX
         i3HFM6N/lTni7O1DHWVubTn2FYLjJmTW3JujeP0quo/AuXHIP1WiLPCnVCf/mNqbUQ80
         wlKA==
X-Forwarded-Encrypted: i=1; AJvYcCV/KGcrLNGhw/9xhpbUVPYF+s4BKMB+eqX40PhzVM7VFZYocFVOLGwRRM+iyZTGaGiJKr8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3uFpot8eqytokXe7sFqHyFsGjKnP4ahB8njDIGROft5aEjVeo
	2VHWdkTUMnLbSE0H8Xvfwfk3Vb5kxLP7WnoznOpFe8TlvDXeO1WNRGxCoZQ2MDj3l8/kKxZ8YkJ
	oH4I5RC71PBUWV1TjTXSOtWYtWTx91Fc=
X-Gm-Gg: ASbGncuYKnTMI25U3rjfPGeC10dgVAWf0psqCIjR/cuivfv7m9Y6fr33uhMMgAH1gHB
	gsWQaEsgBwAH/xowoqRWKiIs2BXCqxLbjmSfHg4jqn6pw8K2qiV268FU94IjonmiE+JnZspq3bW
	IMjVbYkqh/TatuowsY65crpB7DNIy1Ao2Yz64xdSGoYdql+sCcsJ6rXfvxOVsP+73Ud+vzpMuTd
	UFc
X-Google-Smtp-Source: AGHT+IGzN/lG60iP8C5y42/6GZHUdwFTfQPnirMANk8NvV5b0No4/sTpu/QFLlH7OULW0Qi45yw+Mon+tegHBGVKjCQ=
X-Received: by 2002:a17:90b:3e84:b0:321:1df6:97d3 with SMTP id
 98e67ed59e1d1-3211df698c4mr12468336a91.4.1754380190738; Tue, 05 Aug 2025
 00:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com> <20250804155407.285353-6-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250804155407.285353-6-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 5 Aug 2025 10:51:56 +0300
X-Gm-Features: Ac12FXz_yTxmGlhhGe-fi7WMSXizT1iAGAYfFnkICkWhi-5XkkI01xGLjDZkakI
Message-ID: <CAEnQRZAAwmivz-uu2Z88Ky71eJ=5oRjdSJqqSQ2S4JT2cwQpOA@mail.gmail.com>
Subject: Re: [PATCH 5/7] reset: imx8mp-audiomix: Extend the driver usage
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 6:57=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
> which allow users to control the assertion and de-assertion of the
> reset lines tied to some peripherals present in said subsystems. Some
> examples of such SoCs include i.MX8MP with AUDIOMIX block control and
> i.MX8ULP with SIM LPAV.
>
> Some of the aformentioned block control IPs exhibit a common pattern with
> respect to the assertion and de-assertion of the reset lines. Namely, the
> user is able to control the state of the reset line by toggling a bit fro=
m
> one of the IP's registers.
>
> Linux can take advantage of this pattern and, instead of having one drive=
r
> for each block control IP, a single, more generic driver could be used.
>
> To allow this to happen, the previous approach, in which a single reset
> map is used, is replaced by a per-driver approach, in which each auxiliar=
y
> device driver holds a reference to a certain reset map.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
