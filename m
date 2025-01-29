Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAD1E0E11;
	Wed, 29 Jan 2025 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738176215; cv=none; b=H8A2Mwr86Yr3aF9QNBr0cx8kIEpRbg9zaCEdav5kyv8FbJoetKyvlrnzpR2Lx8reAltUQbhg8g4MgTyFdDexEgiMsTeM4Q9s2/1fDUdH3PIRf2aN8fErUlN+FB7xX5RIzkYlQv/B/VwJS/UaEFQy8b0ik2Sd6WwjfNOSbARkLjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738176215; c=relaxed/simple;
	bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UzeQFvqEeFKZf83tfVqqGrntm0mxrFX7hxixGg4+UQDNkNswtrzhLjfIFDbhrRfJobwX7qizxOlGEwy+PNt6vTdH9Ed3+qp7908FjquPJMHAXYD5DOnHuMJhVLQpB74Fvm9qdiiubaT4BpeplRGevebe/oACxvkcSF20AeGKjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5BJggaG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5BJggaG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43626213fffso7411985e9.1;
        Wed, 29 Jan 2025 10:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738176212; x=1738781012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=;
        b=O5BJggaGv5awCF98uyhMN5bcVw2talY008HqJOM+PZ1gFviTlSuY9Df2Yx5dku8Pl3
         xENoHD46gFvugOqexgKMVsVqMuIBnGHXvWYaji/85RG6JiuJ4z0fVELblIsnHazV5Uu6
         hNiTciL+VNUP3Ol7om6FfSv3BXQ2FY0U6tR3ZDgiN0HqgUVnqufVLTJsKRB/zs+oPIyT
         vG3aSKCw2tb5kaA5KJ7I813U67OXEZBikOs43fg/RrLqO+eNEKxVz2NJfc8P1p76mXiB
         Iig96n56JcZ6XJ8dIGwDIi+93s8BOuJPgmemmSLnhjBjr3pz2sqLiYkyeET4cRvlLftV
         cseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738176212; x=1738781012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpLtJQJSXibrZpozKG1QF6LlfcAJa9vamGSJco/f5II=;
        b=vXmfYiss6XBiEMcvFnLGO4odnubj6pU4d0syXTjEcDZ7o1URmXmycpzUEKRW2km+N3
         Fm+/lKbf66OPODZJz+BVjcdUWMRK2UR7ujXN7znfEFlFxfzDd3KX8EXMJrpN8xpN094n
         5v+oq8krF7x2wyhCFy3eNIN39YmVWQBrpQ5gUHFc/AMfUwxhRY7e2rL9Ezu4/YigMNAv
         JD2B6cV3hIbw0EKyfYUEOqVR1QRuoed7r07M9Picm+ntVS5uLtY8lKdcjBH0oRwUJEUZ
         ugmgwGiwRxRZXxPZXTnZvT1zMqxpPBiIkYKOsFCMP6UvZBUBvGrOlD4VHSJa1wUdSaTY
         JxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoeWqjf7B8iJEFetbdJWddxTQ22dAUAx+pS5I5SjxSEZODsJr/zR7/t+RRtGhojwbLJ2fRbidyyyo16YA=@lists.linux.dev, AJvYcCX+XnvFy6+/luGXG9VXGRLR6R75sPgK7Fqddi80UO66iQw3BYCZFb7XIIa+0/9q1oJtXUg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFMKd7nBNtk5FuM/E+iD9gxuohBt33aQClodTtglLIwbTW+4sZ
	BuQwhvX3PHBvoCyFVnNplt/yRY4t7CSCmd1pRho9bCglgPqqCJ29jZ7nQA==
X-Gm-Gg: ASbGncszIVYsytdSFWDtKAE8zkpuY/IO90Od4Ed0UU+kFxByOdg7QZCrf7ZRF/NorBL
	0Fpc8ZDKR7VRMcyC1GcsOfZAS8al4l5bCmStZfFYzr0qIrPtwjmncLl7rRdSnSp78qxPS70MnvT
	qtev5Oeo6rqYJuZi22e1F37N9ZeMjRufMLf3aH5j+IwFURxUCbCDxzSmSDfCbB8+wr0Gu99wIso
	rpvG+VEl6Emkwx16p4u+o/ZxvcMW3MrpIT29fXGCjcqpmzi+UCPyzxLHZM3mkSAqoqwaI4sUuYu
	yPDy5iRm8CcK3wBci2bg5Td8sHrjBAPoO+auuJbEbHS3y5t6OfIPbSeuTJ2owHEdKOE=
X-Google-Smtp-Source: AGHT+IEPFrQXMJ4B9NwKJTHyw+XoKc8K85X25SwaFjwRXkdgX7SF83b7AlrXrbk9HgCflphZbgeZng==
X-Received: by 2002:a05:600c:3d8c:b0:438:9280:61d5 with SMTP id 5b1f17b1804b1-438e15db9f6mr3330685e9.5.1738176211643;
        Wed, 29 Jan 2025 10:43:31 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc80e61sm32258705e9.34.2025.01.29.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:43:31 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
Subject:
 Re: [PATCH RFC 10/14] ahci: sunxi: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
Date: Wed, 29 Jan 2025 19:43:29 +0100
Message-ID: <2765029.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250127-pm_ata-v1-10-f8f50c821a2a@gmail.com>
References:
 <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
 <20250127-pm_ata-v1-10-f8f50c821a2a@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. januar 2025 ob 13:46:05 Srednjeevropski standardni =C4=
=8Das je Raphael Gallais-Pou napisal(a):
> Letting the compiler remove these functions when the kernel is built
> without CONFIG_PM_SLEEP support is simpler and less error prone than the
> use of #ifdef based kernel configuration guards.
>=20
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


