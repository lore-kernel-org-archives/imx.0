Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83440E8FC;
	Tue, 30 Jun 2026 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824361; cv=none; b=almmQaUmGmrJ/nU+5q9eU+/n8MRxIqdoNfmulfvfPK9yhMNDz5IHg6lsh5QquYqBshb2fd5+kKjTm4WvmUyUFI3nTUzOGL6OwpSHxFTRuWVHYo0PDwFUTuXOAD+d11IJWqd2DS0Fhhh/c2CzzRFY5JE8YIeBuySadst04Y0dGww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824361; c=relaxed/simple;
	bh=3kBg2PjjmE0TBKwBUhnNyknDcQoTJIVumhmaImOHMCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m0RBnIiab3/tICwndo4ao1Wks4hZ3nehkr6aMOFK2+an1cN/+LKnWXukbf83gbk01icaXswkqsHP8J7Yy3xB22SOzpd7rvqkRp3Lltwr9o9SQ7GOuXX5wu/4j9XPwS67llh87HY5CS7kO3+pLI4+qYHZn1NXwh2I95/+2SKNF/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PV8eECoy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PV8eECoy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840771F000E9;
	Tue, 30 Jun 2026 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782824359;
	bh=eT/NrjMfHUOh9JxDx0GBXr0mxclZpM0Jhk4lcfoTkF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PV8eECoyJDd92LRqZhdHM0AajSSNjDxWVXk2zrleNDfksBveVFq1zC1op054ENFHg
	 axRfbFTNNsm2pjMWrz00Joya57vX+XciXMtdAAxYYbUXXJpdqX61r6Y7SlDs+UhVIF
	 gHyi2ks2mKLmjG+BTN5YdxwLmYF5dd2tBHzuKoXprAjuY0Q4SAu2Bbaa1yi4ZymQj6
	 UN9CFT0kabM5NDryKlc7kKE2xMM/pRdJRYZejGxnanlTVy0qUliXu0AtCFPgzlY8L7
	 Hdfpbm8PMVC+S/gyGwxEAEye/avO+oi7mOskOI3g7MHR33iTBlp9nLAqYpHmITpivG
	 zIfsSdfhBll4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/6] pinctrl: s32cc: add/fix some comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630125403.546375-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260630125403.546375-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 12:59:18 +0000
Message-Id: <20260630125919.840771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Typo in the newly added documentation for `struct s32_pinctrl_conte=
xt`.
--

commit 5f6126070deb7810863589eba4923acc7b178405
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

pinctrl: s32cc: add/fix some comments

This commit updates documentation and comments in the s32cc pinctrl driver.
It documents several structures including memory regions, gpio configuratio=
ns,
and the main private data structure.

> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> index 56be6e8d624e0..2a32df932d8a7 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
[ ... ]
> @@ -79,20 +85,22 @@ struct gpio_pin_config {
>  };
> =20
>  /*
> - * Pad config save/restore for power suspend/resume.
> + * struct s32_pinctrl_context - pad config save/restore for suspend/resu=
me
> + * @pads: saved values for the pards

[Severity: Low]
This isn't a bug, but is there a typo here (pards instead of pads)?

>   */
>  struct s32_pinctrl_context {
>  	unsigned int *pads;
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630125403.5463=
75-1-khristineandreea.barbulescu@oss.nxp.com?part=3D1
