Received: from vinatta.cz (vinatta.cz [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672793DEFFA
	for <imx@lists.linux.dev>; Wed, 27 May 2026 18:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907091; cv=none; b=VMd7Yl9yL2F+P9cebbBqNB6BMkQj9z3eGIri3Kzor2j4gyV5OAPjJZB4rNacd2nvozzpdk8ev6bL7PQoY5WI8IeFEWpVynENdYlhWls4rIq4QjwS7d153++N8BulVdfldxcmLaptKgQ+a6yD2ofQGV1K5FHbRPnNA8mUO1CqoCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907091; c=relaxed/simple;
	bh=ApEPioN6Lb4OKyOa7Ff37Nv+Yg/r+wxB4CavphylJVQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:To:From:Cc:
	 References:In-Reply-To; b=Ve9IJVypEd4DwdOG+qE/LIQBDzmzTJuSqd/+jEyGyj37J6Mv7y3imZVaejXLF5t3x4hXAFxRb+k2bKJmtrWQCPFpNpg98IrQZrm+b6TBu+WNAFIFYPdKBNRcrUj6RJgCezF88nn0dXczqctSIl+r25WlnAUYhvwyf+2C96L3Mqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=vinatta.cz; dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b=CZPrCZhI; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinatta.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b="CZPrCZhI"
DKIM-Signature: a=rsa-sha256; bh=kpx6Uj9RIdUNjK8W3CnmyMzyh2ekBIwrGqDnhdzKB20=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1779906099; v=1; x=1780338099;
 b=CZPrCZhIXkDoHB0cMhVJm/JiciH7dzJdwyLBNIe3/8l0Zq3QV7VFjYO1LEd+kDuYAthVAc6v
 9Phsze4RHJ9Wiy9dWqZUi5r11Ec++f5qsA7nGRjusmk7hxln5DUEsOKnpA2/zvZ9LMdttYtwoyk
 obUMhAA8pyd2d3p8TJdxtRngXAsD4MSuHOA2w5iCmS3mJjwGMFQ4EIGNj12WNFNtf7i78IRXvpe
 JEqKD5JLfzCf1QT+W+0p1tE0PQQ7dibqrscIPMku5iDYLpWuWEeYveIaDWU/huyQb4ixLw5hd7h
 EVuNnF/o8bxGM9wtY1p5oWRroCkzvfJ9ffBm6K/KgWwcQ==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 4f3f7766; Wed, 27 May 2026 20:21:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 20:21:38 +0200
Message-Id: <DITO1XL17NWQ.31DQEIXADGBND@matfyz.cz>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "Matti Vaittinen" <mazziesaccount@gmail.com>, "Marek Vasut"
 <marek.vasut+renesas@gmail.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Samuel Kayode"
 <samkay014@gmail.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
 <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>

Uwe Kleine-K=C3=B6nig (The Capable Hub), 2026-05-27T12:47:45+02:00:
> diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88=
pm886-regulator.c
> index a38bd4f312b7..7328cd1cf265 100644
> --- a/drivers/regulator/88pm886-regulator.c
> +++ b/drivers/regulator/88pm886-regulator.c
> @@ -373,7 +373,7 @@ static int pm886_regulator_probe(struct platform_devi=
ce *pdev)
>  }
> =20
>  static const struct platform_device_id pm886_regulator_id_table[] =3D {
> -	{ "88pm886-regulator", },
> +	{ .name =3D "88pm886-regulator" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, pm886_regulator_id_table);

Acked-by: Karel Balej <balejk@matfyz.cz> # for Marvell 88PM886
