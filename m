Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2AB1DE8B2
	for <imx@lists.linux.dev>; Mon, 28 Apr 2025 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842831; cv=none; b=EGq6okmnEkChvHOFV1PmEtaC/xWV/xUDCY82LZFlgn+VhWphvblmCm3LrRxPF8bFVOFeAzGa6o/3VHtdXBAfTmFmvnUVP521bTCQPNlzyUPNA1mVhJ0FQ3CAtbVmdFHF31PxDyUh/gGcVih5VKkp7zAHdcvDhwHA4g0+jWe4s0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842831; c=relaxed/simple;
	bh=5LJVD7EEo2QIoCV1sD+YeaR74gXBmkqhDW5rQm+7VG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CM+fUbCx1u8eKrBOE/atWK7QKxknc50Wwofz1N6AffsJ8bZkJcpXS8123J1rkkI99hgotO1pQxkmj0VU/TI9k4QqdV7QJXiZaBZ/b8ny6b8jo1OPBYvoVDmzXAvnAMWqxMn/b3wCkaYOAzXScRYkPyOdg73Rh6Ppo13b50y7qWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoUxAecb; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoUxAecb"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so39061521fa.2
        for <imx@lists.linux.dev>; Mon, 28 Apr 2025 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745842827; x=1746447627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWpWmVQh5LkKQ38Ckz6b68wz7ZGK8S3wIAjuRScvxvk=;
        b=KoUxAecbqTMGzZEZyXvnDF55WP+K1lzMIyBKJyTJmDd4lgp9Q8J5WsvqlfW5brm8uF
         p/6F8pE/bMOo1hdggweER0Rll13oYgi1KQlbLWjzgdc17zLn+KmGf1po2H0y3h3uRCDT
         ugtC82xx0JHbQfcWiWsTFFfSMkNspN4J+rkZjSQ4rDXCV2E8h2zitp7zbfam6gS/ZPga
         HTm5g+uYNTZEuheaosb62PbT7X0dJyuDv8n/gD//y+CVuFvUlkj6YckFUu74GAELdt1i
         JYOV+HfKQdSkShPxcPesjPfNVEpFREPpSU4CDafWymeIKipc2fCefvQAbGugU5i1ROny
         pknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745842827; x=1746447627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWpWmVQh5LkKQ38Ckz6b68wz7ZGK8S3wIAjuRScvxvk=;
        b=qzVO5L6Eq3ko2KGeR+OZkrVLZJO1LjqPYugZ9o+Zmq+2oYe+vr92G98ydWwmzjKs9L
         ptXxGUrm2pQXKjOWeSW64UyTTPU8nFWXT7hJlx02zhAIakhyJrLFeXJC46YKdPMbfhis
         TKRpfg7r+eA1MMC/5O7Nn9jDZ4Dlnp3mH1MnY3/96GuBsWwUD8dy/guGoFI0hghv84ZH
         rz3V5rm3vQgQc8a5xbnz3rJTdBZ+iWIjwvwPLZmjopCgPPL/RI6qp4g0xh4PVYoVSBiQ
         teDItJSpNQ6m8yPrc0stEfaspSmzpOtASbPNC5RNId0nvXZxTdtpT3d4Fu/CmBfMUb4o
         cwcA==
X-Forwarded-Encrypted: i=1; AJvYcCVtphbm9HS6TBm9j55NrbjyXjkuiO8mopmvt7FsaXg+pS5agXCoyIl49pxfNC4CM8rgtT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjotgD+azXED9+rirUjMNxJsq1aUTXYDb2mqM4XioZo5/zRJej
	TNYUpSqx49ZBPuIRPM3Jo/jEWa8PcOGiAYCs1fUrTW5fJq9aExf4sgz6oX7eyv+M/52Dg3ekQw1
	QSg6MhezfqyzbJfpWtc1yo7k0laY=
X-Gm-Gg: ASbGncsOcYLQ9vmJxok+KvDhaRx4q50M6UUAhb/FYsEIGSH9rBgW3L3LYnow6FtMb4n
	hYMQ7nFcnwpbO0HUsV2MgB0kxPbbAopn+Qk8FpGfkqaszcRaEFij9YYZXnRGiBr1+LG8qL1tpGg
	92nG3s5TzB1wG4ZFc+GeXC/1XNtH9K60XC0o0d3/r2ez2zqcCWt6mRJyzOUsMlsze0
X-Google-Smtp-Source: AGHT+IEH7MzW5oALwsc/C1WmzilPjbYvu0ys4k1ey8nO0994HXLEhmlKcG8IDGOmdq5NvefT7TwCpG/T3Y0sA3Y96g4=
X-Received: by 2002:a2e:8048:0:b0:31a:56a5:8454 with SMTP id
 38308e7fff4ca-31a56a58783mr13285171fa.15.1745842827247; Mon, 28 Apr 2025
 05:20:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250428074424.3311978-1-lukma@denx.de> <20250428074424.3311978-2-lukma@denx.de>
In-Reply-To: <20250428074424.3311978-2-lukma@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 28 Apr 2025 09:20:15 -0300
X-Gm-Features: ATxdqUF9vhWUQdAh6ucd_rpBTSQD6jiO0FGzDnLrY9eVB0nzIxQ7MHR_oHtFiUs
Message-ID: <CAOMZO5CYq8YKZBM6nk2pk8W0005MBBPdVqS_qe-O4-ZzkUG0bA@mail.gmail.com>
Subject: Re: [net-next v8 1/7] dt-bindings: net: Add MTIP L2 switch description
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Stefan Wahren <wahrenst@gmx.net>, 
	Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Mon, Apr 28, 2025 at 4:44=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> +            reset-gpios =3D <&gpio2 13 0>;

The zero here means active high.

I assume active low is more common, and you even used active low in
the XEA board.

I suggest using

 reset-gpios =3D <&gpio2 13 GPIO_ACTIVE_LOW>; in the dt-binding example.
