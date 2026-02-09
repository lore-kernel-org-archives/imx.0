Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A73644C6;
	Mon,  9 Feb 2026 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631501; cv=none; b=XajY61Y2Fbd7RVfNVtOeutf3ZRv8F/Td485bUGV9EDTFAvxK62NBXY8L42XbNEr/12oJ1q+FsUTlaQJn1ffDvfb47W3ikjB2rXxyiKZIhOcohmyfhzzh7bmYz86vwJ+ZpChy+8x17jGQ7+9Zy4uPQ7ta8q2Tic05kJx2CMS1US8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631501; c=relaxed/simple;
	bh=HWKJIQNONMVQSZ4SSnN2RacPR7HLBIc33yAACZJdKz0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=aph7xFA2d13Q35pFr9I1o23zdX6VKOVZTBv+q+oK2QdUtqtxmzqdeW2i6MvvkzRnU38B1Z16OPZKpUz073vN49uqrEev2peL8y9DqfzQgCjJ5EKrbcYXOVT9SMAyxIg5k6I7MW2jTGdmIW7l373MClwc8hl+/7heMiwrgy/nnaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1fn5+pj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1fn5+pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14559C116C6;
	Mon,  9 Feb 2026 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770631501;
	bh=HWKJIQNONMVQSZ4SSnN2RacPR7HLBIc33yAACZJdKz0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=f1fn5+pj4ITHRHHkNblo7H2WXpzkCo+/DzDlxL7FmJtxlsv6yqOKShGFCPbomxUEv
	 4BXxWvLJfM16FPKdItEfenlgWxuzWZb2fm6oqeUTepDzJGKt2mpnwf/T5SwwgVKls7
	 c8FCtV5qxr7mSS+jn36NGGRVRyVMsptDQBqiLBvhqTgo2t2o8rWnh3olVawVy5lRhO
	 9gWERGs8+x4+C7Kwx+j+moooorCRMJTJQrGq1ghoVgeTRLP+ES6ZAA+bRo8/t0Q6lL
	 Sm5FF+CrIvVo2FgGtBPID7SNlr+7/d2KhpX0vS2C573ph4gbkCep8HIXGfqYFFYUCF
	 4hRuMTd/5dedA==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=96026a0e31e1c8ea8b7c7b82368b053a9042163358dd4836ab796c2f20bd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 09 Feb 2026 11:04:57 +0100
Message-Id: <DGACHCLD50YM.14CAK78PEJ6O3@kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR
 sfdp fixup for mt35xu512aba
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <han.xu@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Haibo Chen" <haibo.chen@nxp.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20251223-nor-v3-1-09e26797a8b5@nxp.com>
In-Reply-To: <20251223-nor-v3-1-09e26797a8b5@nxp.com>

--96026a0e31e1c8ea8b7c7b82368b053a9042163358dd4836ab796c2f20bd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Dec 23, 2025 at 4:01 AM CET, Haibo Chen wrote:
> Find two batches mt35xu512aba has different SFDP but with same
> jedec ID. The batch which use the new version of SFDP contain
> all the necessary information to support OCT DTR mode. The batch
> with old version do not contain the OCT DTR command information,
> but in fact it did support OCT DTR mode.
>
> Current mt35xu512aba_post_sfdp_fixup() add some setting including
> SNOR_CMD_READ_8_8_8_DTR, but still lack SNOR_CMD_PP_8_8_8_DTR. Meet
> issue on the batch mt35xu512aba with old SFDP version. Because no
> SNOR_CMD_PP_8_8_8_DTR, micron_st_nor_octal_dtr_en() will not be
> called, then use SNOR_CMD_READ_8_8_8_DTR will meet issue.
>
> Fixes: 44dd635cd632 ("mtd: spi-nor: micron-st: use SFDP of mt35xu512aba")
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--96026a0e31e1c8ea8b7c7b82368b053a9042163358dd4836ab796c2f20bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYmxSRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iCewF/VSY38d3rTvpLro4TmcOw0yK8cmKoLAm4
bJ2MOYpPmdS5hWjK5OJnXqCT9ur7qtLgAXsHJpY3Ck9DzjtgsRtJRnXY74pnT7JO
9YYdBz9Da8f/M8trY6b36LNnS90qyaPGMik=
=GaJr
-----END PGP SIGNATURE-----

--96026a0e31e1c8ea8b7c7b82368b053a9042163358dd4836ab796c2f20bd--
