Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D043C043
	for <imx@lists.linux.dev>; Fri, 29 May 2026 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080572; cv=none; b=JGXj9TkXTKY5l4FIialSatqmHXbLehu018IO2ShkjJTTxDt5il82PiZjCQp/GclPUy4Lo0El2epkA8jP7e+crabJVY3xQAdtw22MwUVMEOeXAOxwLRpEQiaM8ADBAUCcHz66BqwkYrUuVcLVoZmYmZunqjsyByL2l2EgpNZEmSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080572; c=relaxed/simple;
	bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jba5/AAI+ldJK5stmOHg33OCxbmQcECZuwH/L4cMPBiB3vx6xWf36R2V2x4ENkN9roWj1Ya1xF7AbC8C5WuPmU0BbgLEJPDeMPqVcjlwVloDAC0c14nwDJclBzZgLbHVAqrWfrmsrXv0fpFy3j+lg7aL7E7zI8DGYA7ueySlpps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PD1+0bk/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PD1+0bk/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso1083534f8f.2
        for <imx@lists.linux.dev>; Fri, 29 May 2026 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780080565; x=1780685365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
        b=PD1+0bk/ZAOkeLnTZm/VFpzdhb2+bN6p07JJytdACkgE+R1GQsBxNrzkeYSRPF0oUT
         kkVo5+ugCO9q0bRbSQNithxkrxOdRIn+WoC36gXBmqMJ/xy4FHJYWJh3fRWTBC3kRAqQ
         e4c5wNttTJuPk9cz6Gl/73mxhQe47gPar6ay2XVi2+VcWc0OlgO7SaGAd1VW3J2C4kHA
         Nxm8zFK14FwNp4goZGE+LH2iYeriZ92BhMKMEtfjZwdKLr6dzmEx583VL/2BP9cGMnxk
         bfAjqwldVN7aB4fSE8Lj62l7VSTqfqimz3y1mC192oR4gIlR30r+tnlAbAHpgUbyESP+
         sEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080565; x=1780685365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp4vtffxigjSJ7RW/i4Jgv4QK66o94cv0dvcll4cQ/M=;
        b=AxGexkROPr9TrIHzE7qePVEtULc3dE3dVKCabzGFbp5+kRv2FahplJbdwShMiIeHc2
         X6Yn8/pSRrR9CogP8bpq3oUTR2xweVPR/uWC2ImVzAWLjSSrJfOXRaDNeTsUVO4o0gfA
         5Isk/UiT5btqeeS53/uBB5514r+uW+VmitMGsErEh13IS+ivhb17D2KlWR/9uusoKbKE
         c9fPUWU8uBiVkSdl5CUjbFNfTI3c/y7Gqg8hiyNyUI+xoBSZ7/6/gpd9tBNtz7DidK3K
         224Z7XEEB2fUyPjI8tUWqL+OJ7W7+3PCHxnBtQOc712Q4Iy+K9euM7YJrPbVl1dTADcc
         VVcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wMl2sl4DURNzWuPLmPLeNTmZQAIREg6UT42C+40FdWanc3rt/cYtShWyx9loiBX7+WXk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyjfaONuS7g9Qv1zUNBV1YNHVwa4N4U1B/tWsiu5FD8ouGn91I
	tqigHt0Uxd9P3ofhj6SeYyItK/MMo5S/h4diVFmZc/YXixB2IcD25pAafQxhwhfsdn8=
X-Gm-Gg: Acq92OGtCDXBvoN/bHKjSstu4YRTB1dpXZbEeOz+YQrQ2Cu3AC2hMhYELfF3wSoIMPI
	x2uhJUNZ9o7yorkeb1Q4m3EAQ5OKWg+eMeUHXkoeh+OP+S7wEPR3/PshBtGyJ4XwsXHSizyni4/
	ABfZF34pUCbCrC7rkF7xYtIAx0hxee6OtEEA1TgeePAdkp1wf/ZJyAjGQjXmD4+zsl0WKFJCWb5
	2JecmPwjAQlNU3RZqR31gKDATQBBhLstX/fK/hvBTyQHyYMs3Z6kdBUaxBkkffSeJUErXgDFxNU
	ybm1lt7sxC2uXRhnse+oWyw9CmJLtR2l86Af/NqAPHwRd+YfAyeIWYlaWEi48QYRs/EBADjC0cF
	RUQAX1sSuzKo6nYnssFG0cYXe3Dc9oNwhZFzOMnN8hkceG4zZmXYA4f/ypTtGxPVLaymzAchWJo
	wFjq0NDu1jIXMfxzhiB2NWJSdtAaaurte293r4+ig=
X-Received: by 2002:adf:e609:0:b0:43e:aa88:f1a1 with SMTP id ffacd0b85a97d-45ef6b92502mr1248001f8f.30.1780080564532;
        Fri, 29 May 2026 11:49:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef34b47eesm6096276f8f.9.2026.05.29.11.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 11:49:23 -0700 (PDT)
Date: Fri, 29 May 2026 20:49:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Amit Sunil Dhamne <amitsd@google.com>, Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
Message-ID: <ahnev6lMK5tiUybP@monoceros>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
 <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzwfvojoqum2whq2"
Content-Disposition: inline
In-Reply-To: <DIV4J6UGUQGG.28KL8EGBZWJSJ@ubuntu.com>


--pzwfvojoqum2whq2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
MIME-Version: 1.0

Hello Joshua,

On Fri, May 29, 2026 at 07:29:08AM -0400, Joshua Peisach wrote:
> For macsmc-power,
>=20
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

Thanks!

> (I'm not sure if one can "Review-by" a specific section of a singular
> patch, but also the other changes in the patch look fine to me, so
> consider it reviewed as well.)

I think what you did is quite usual. The restriction doesn't make it
into git history this way though. Another usual idiom that can be found
often in git-log is:

Reviewed-by_ Joshua Peisach <jpeisach@ubuntu.com> # macsmc-power

(intentionally added did s/:/_/ to not make tools pick up this line).

Best regards
Uwe


--pzwfvojoqum2whq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoZ368ACgkQj4D7WH0S
/k7D9wf+K/Kbjth006e5cY3RbjoS8K9jW3NQ01G+VBxY+lHExj1dG+49FF1HI8kt
qfulP3y/YdWSh2JA4Iu/NK5mHfXtx3IWR9T8IuNyDfXpEJECZipp2WG77R9slfko
t4zpckQ+iaOMoUDYB7CB93ltVHaeYHp3Y079Vm1cylL5z2/tessr8YqNr+o5lP/l
c/36Uyh8+f0J9Vm+OEsK5r4lyPA9YxyotfCCx4qbxxAjgGbQUW+rj6MZgm5AGfmK
rcXLESM1abNV6atU3liVQQQhtTPw4t6YXGDZVfGZbyMLtuZTrVZKCQF24odWnbJ6
juiDjaO5lCkS75qD+EK1IeT4tTF/hw==
=+SnX
-----END PGP SIGNATURE-----

--pzwfvojoqum2whq2--
