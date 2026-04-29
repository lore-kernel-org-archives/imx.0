Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D48723183B
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777426687; cv=pass; b=P+Eg40jnBxGyf8Y4Kfg6E6N3Dx5RTlEaSAdY5ZOFK9y9wi4G9yK/fpAJJQlccEkz/ObajOodCZ4TbHc0T0LPz4M5nkbG5IfdsvTv3PM8YD6DPRybVVvLDar9fJeS8uLKym2szpZzjyMhOks27f+8BV3Am3kZMf1oHkBvZYMxh2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777426687; c=relaxed/simple;
	bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfPdJye6CXkWR6NrRXMhYO8M13bP4pHo/At9/817Mb6sasIAKVdHmgb0yvAN3oYJLfP2dbqJ8m27z1DzqbCrZr53JFuf22psz+dCiIdAaRybCvrK2UwM1R7vQYrDyQ/CAkqmNHD/Mxr9f5Rh0B7/vrY4Jx+2rrmUht7vpsLENo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2eSr0gJ; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2eSr0gJ"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38dd575bca3so3928461fa.1
        for <imx@lists.linux.dev>; Tue, 28 Apr 2026 18:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777426684; cv=none;
        d=google.com; s=arc-20240605;
        b=KlPaIBfsHX+oKtuwWsibM7cTYKsYBtkDdG7ORu2Nm+/rbbV1+QC5rFgrxd5a09fqrB
         daiPMZlGyQxkQuTzJXFEQnBQBi9PUu7MRBkWYFWqOfCh09t5LIl0dzYCyiXHtXC8FNS9
         FCUEnI6Dl+1S6j9AyegwZ+z0FGxfzM5/xXwDtEtNnI1XX460dFE1VhbMYh4DUPeh/pta
         /fWXX+37Gtn2N6MhFVx73UEUZ9cGtzMujkNtZ9vsXKXDvS2xLMaf0PINF3IBFT4oihdj
         igFfKDBxuevde2yhabEUpXiYQO8vWVngCKT6xZa6qs3sGnCdPrjQBxsl9bokUEYRY7kw
         NKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        fh=nPFnGxlr3fesVZkOwcyqFJF6y5aSmE6BWITRQ0CC0NY=;
        b=dOwkPuIQM/uvoP38pIU8nZchIHFM0O19jEZCYwUHDjk45zbLfALWODgzghp7eQqivg
         X7VULsuAeo/Tlu1pHGJDfe44Y6cpKnNj76X/U50R6k7u+Ga29yL7QyilzOg3tg8CVH5F
         UBL6GQPymyxSOEAJAD85xdjN3zspEMuWWnTaq5eTxza+gzfWb7R/Rw+GvuA7us19VzQ9
         YbApHHAhuN5Ses9ZgApUrzPBS/fcFXYs0pmuu3k80VrhAPA07TYDdpt95cCdnxdb6aZ8
         d95prWn8YuzIgqFEdT3q2jJ5gakPyMCOssyTtqM7483XwpgAjQhEOuk8bfqgOR20vFtY
         zrig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777426684; x=1778031484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        b=A2eSr0gJSc9xL1C/lsvKHX3OEw+0sTctwAqYNxbyG45JLC4B+zuu6MTpKz3WV2zZ/N
         oa5KObV8KzRG6nLBoIH+ai6/XPje/m1wMiKYk6sR/Gg2f+jYOmZTPMmSBBVQoXOmtq++
         8uYfgJ7PLifHArU4GuWnNJTjuhymra4vurwkivhOEarz3IuHdVZ5Ikh7PQBzBtZm1LTi
         YxngVCwUB0M1NYrOVw2OP2+xaPc/jPgYftcjUyTmmp9VSTZFAES/loJDgzdqYxiI+6/p
         rFHdGwilH0OpEE/dAAQ2Iz0VW9zBgoB5lAXKLmsHg8O5qhwSuwgZbC7yOWXsdHeuotud
         JHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777426684; x=1778031484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TL2tkeFOgMZcOO+5OqeSu09okkedmEhoLbRE8Fw/jV4=;
        b=MP5yngHBNcxf/Xp+iQjlTxB+W+DIe1mV6RzyE/nfT3AIt9h/lPZXf4kf/Rn+uPhd/q
         qF2XQ8ZKhG3+qCz9enlXHQe/K1YEtXjzg04tzzuGi8wLCz0gYR1I9dIr6qR+iwQLIf+D
         Ve6U/HV45ZvQ1v9+g7QsO5tfF3Idj8mndIiWjb6F1HFNEsnSJIIxAcDwl/zagoHLZwBz
         2TR26J36sclIAd2RrJ7yvruqDCV646fQc7dQnRIR4E0AlJocRsJmHxKw6nK9KshlP1t8
         hI/5SswVkGpMXsVXvKeCyhkHXuVy3QUorKblxe4iZ/lRh0Vo1RxI4z0HJ2WsGJdQIthc
         /ZDA==
X-Forwarded-Encrypted: i=1; AFNElJ+Yp7VPZbg7Lf6qOOTuYUad9idIuUPZ8sS9/9yadVidX2TvZCNg0f41jWd4+ZeD3hpJIEY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmBkRU+zcy2feqXxVvJDjrYQeSXjHGYYs3+TMpQCGfO4VRbXO9
	Ivy3hwzw/xV3stx0mxaRgJqoTZGwNtMzdR1lcdVogM+v2WxtymjapihXPXu/UMMBaylsanUvrl/
	NPXFt4ZAWVOV96HSZjC3ZGaPV9uVng6Y=
X-Gm-Gg: AeBDieu47Efg0l62E2bOZOmirAAyfPqmLdLF35UEr4jZ1IYuG7b0oFZ5N+LpCNSdPSi
	YbFg3CD+7IUOc0wB7HyCX5q/XPhO8kv92bjIdXphJjL3ZloOfPok4ItMsKdd/rKgi0c2KCga4UV
	rwJ8iiQ7twZ2KwHYvpxu0HRKgPrg8dKvZpjt0vrOALn6VipE0pLKdf5LsRkq4sanGD21LkFvdKR
	L0ytisEJitfx9etEUbIwhAHCnkhbPbLB/qtOOhMpCRjwGRV6QWJUefpaxNQ7rm6fv/7aURMl/Yf
	Ly/kJ1/Jk6iy695/BTD4bbK0R5WUvC3GnycYAip6BkkIgzsAohg4dc/ijMAtLX3nY7JAy/wwbXr
	NUl0ckQ==
X-Received: by 2002:a05:6512:15a3:b0:5a2:a70a:a9e with SMTP id
 2adb3069b0e04-5a749fb8b0amr382100e87.3.1777426684004; Tue, 28 Apr 2026
 18:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com> <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
In-Reply-To: <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 28 Apr 2026 22:37:52 -0300
X-Gm-Features: AVHnY4KSxb_H5o4trd0JTtQb0bsTzoHjYoluGAlKyA5vbmz4I0-kLq2-xvoMmcw
Message-ID: <CAOMZO5DV4Nnc+7DfAZT-VYDqxniz=ROR4-DnH3x9NbU4E8d9mQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com, 
	qijian.guo@oss.nxp.com, justin.jiang@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 5:03=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> wro=
te:
>
> NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive
> expansion capabilities based on the i.MX95 19x19 SoC.

It would be good to explain the difference between the i.MX95 FRDM PRO
and i.MX95 FRDM.

Also, does it make sense to share common nodes in a dtsi that can be
used by the two variants?
