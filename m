Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEFD2DAFBE
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 11:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767093175; cv=none; b=LzhT8Um1zr04VQWJXhZ3IVy8uw3qNMERAAdD/RbnFn7gU9hX2KpYhYEavevbFD8Y7Ryzo4HAD/emqqj/rZRRAzK98tddduFQY3TJw198t7ML1TlOzD4SwsdeooqYmMXccxMnWcUJlKbyzVLArmQOmEKKLHTgS4bksW913KYWZyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767093175; c=relaxed/simple;
	bh=JcU9GrRpSQvM7DMb6kcX9IdaSrJg/ryVTN6TW/UWbCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=At2RJIiwmley9vRYZqXp1vzU0tiEKr04WUMn7fd8LuLdSMjhFsVrlzWFR/tgdjoVCRXEGAWZZwddlrcPeRF+6oQc90mfVdNbQMptcFTSMqfqUoIEommn1SrTUkvMQ8gbvqkvXlzPyJWib8+qze1Q3Utkz13VHZE3Assbs3a8U08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFrBkeaZ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFrBkeaZ"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37b99da107cso91499831fa.1
        for <imx@lists.linux.dev>; Tue, 30 Dec 2025 03:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767093172; x=1767697972; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yNA1AV5iM1LS0NSmDZcE4cFhhXCoef1YyBUYDjkr1Y=;
        b=CFrBkeaZHvjUemi2wwQMjHFE1Xh/NwMwAy8MI19jZDraMTVEgDDFnSwtpBYENPO8sq
         OtXvMBaBh1GrZtOuiFidO866JcQNkqgGvQsoOuW5Xh50N3I6BduP1nHjAnwKf5EP6Uv9
         vZ0AM59prRxGuvhWTmNWoNhyaMSn/lpmeOCoeteL4mpFBmTYrw6PJVHa32FEBjrOoeYe
         5NK+zn+VDQ1DoogQ0GSoxrhjgjBjZqClmpLG1kRcCRWSOkxdwopGEyvVsFZVWluGiDnF
         +2tOqze+EOccIWk3z18YlIcfGJ1GgJsu0J1+KNvkmwGK08Ix+79IL2rHBYYg6IBKr3m/
         VSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767093172; x=1767697972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yNA1AV5iM1LS0NSmDZcE4cFhhXCoef1YyBUYDjkr1Y=;
        b=JYun8ZFsPUzHkmD00rsm1229hXTRYiIraBRomYLXsTFPMeIaGKVSDT9mxCGKjMWyNn
         5zFlTHlujhj6+hke+X1shumlwRzEUJy07jVSYpaqofDdSZrTJKW+BW+oCN4pZq4dhLFz
         s9yJ2g0zoSl775KT9jiYZ58+DQkDSaExAK9L7hMgTT7FVzotLsAt8IfdHiGCxzOwAP/j
         +amF+hddNhN0SihMEJqXl9EzR9uecooQuwk0es0xARpNlsmaLbx/jBjeDg8XYIGIAwif
         URF352seruyvVIrfZB+ZpKnUWtUUXkePr4fC02+jy31dNhUMAqasRmOioIRDk7oJ/4OU
         1ssw==
X-Forwarded-Encrypted: i=1; AJvYcCW5MoKIWx3ujD6BCP7+9m8G1cpadAIwlejRyfFST1p8+RvipK36Fz5zKm9xiBiHu/V3yx8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1GqDIlXOy+xX21O25QtT83qE0ZjSan+aqXCHivxieWJXYvEpL
	t6e23JyUkye99ZPYb/uXFcNVTDwxm8SjzUY/fLLyqDhG0gbAU9X6fpw7cFHjg22TVy/X2N/wUly
	BLiE+o52WVtSacroK/9ce1MJTp2YxxbY=
X-Gm-Gg: AY/fxX6g6d8JTE4BfBazNlb12FSZnMDFOTppDNGCQHn7eiFEw4wotWbY5JRWajABXZ4
	SXHSFkxpjBmEdov65Q8Q3nfjGf4kRpyYs6nMHCe4htCn9g0T5Nsw1tdBkydkpNayhZe/CjgrwCC
	6fKojcFHlvXm9Iiab9yBeHI4iEFAxOF2RY+QpVbN+T5gXOwLxKTr1f3avy/xc75liAvJJM01LGM
	3JPfmv026+DMm6B9KnbAh8dAu2YL0ej3iGB0K7n9OPKSqNm8ssfXls6ehKTF9UKhOXFJeZT/WhU
	5vViNzhs2NGtloVA56AOFebskHY=
X-Google-Smtp-Source: AGHT+IE2M4WxFZqnEfPrEAcC8SMB2vOImghddR//qgcMdMKJ1JqjQfXz0rueUs8Uu20fw0GhWjMPl3LuKHp94JXv2fI=
X-Received: by 2002:a05:651c:1508:b0:382:4ed0:2b90 with SMTP id
 38308e7fff4ca-3824ed037e2mr69073551fa.11.1767093168319; Tue, 30 Dec 2025
 03:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251229213726.79374-1-stefano.r@variscite.com> <20251229213726.79374-4-stefano.r@variscite.com>
In-Reply-To: <20251229213726.79374-4-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 30 Dec 2025 08:12:37 -0300
X-Gm-Features: AQt7F2pM6UnQwKRWIIbHFDh2-hbVrXhUaR1MhekQgxaBPsnwjGmNGu1vdJLxk04
Message-ID: <CAOMZO5CjdQiy2nJTEL-HK+xzZ9EyAE1PMhoUroP2nTZ07pJbzg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx95-var-dart: Add support for
 Variscite Sonata board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Yannic Moog <y.moog@phytec.de>, 
	Primoz Fiser <primoz.fiser@norik.com>, Markus Niebel <Markus.Niebel@tq-group.com>, 
	Josua Mayer <josua@solid-run.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 6:37=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       /* Capacitive touch controller */
> +       ft5x06_ts: ft5x06_ts@38 {

Node names should be generic: touchscreen@38

> +       /* Resistive touch controller */
> +       ads7846@0 {

touchscreen@0
