Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F671F91F6
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076372; cv=none; b=b4oRC3mBk8H7FC5CpKirUhNiBm6ccU1vsPGelnaeaizUf+pXyCCy1Q9ZNYmfYuTOPKGpBCKlsPlnnpnkSS5g6ORjpqQJhmyEmqFj8dumMVQ2t27nc1SjFXu72N4UPpUeiGUz/8oJ2hYvzZmHnmz8co6ARuYp1e9XzXZ5eKc0udw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076372; c=relaxed/simple;
	bh=gWo7Ic6vXryTpsgNAWjpVGqE92dtb+2mfmmyB9Ga91c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z6103tcXEodkKnPMJF0j/jpLA3sAOscaao6QNsxJ2Sii84PR39U5fTo64Wv91zFWqijCVaVZ1TSp3YEDOnMKhed2B5t2tvnK3lAXSvlWJsnCieBc/OOkZrP/8p3J4Hx213m9NA++Aihjj3AWsw3m5j86Vt0m8zLqAuOGPhIAKWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/IAvFUE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/IAvFUE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103B51F00A3F;
	Fri,  3 Jul 2026 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783076371;
	bh=qQwMPLheEAO10XFR6ln98RVZIFkpCCMDRgmGHQ2Eknc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/IAvFUESjAWABmnJFGV6GJeQn7lsl6cS2WYwqyX0RcTGuJ9dx9clI2n6DPqtwIKE
	 jpW3geQ8cmd3bwtRD5Vv4EagZIz2d86clkUkCAf9ophV4hDegQ594w0JCv60/64wxH
	 d+4i8nr26gYjrqJlfrFzBnpxBPFRS3q1/xUT8HydSf2Z9pjonUIov/cYukujYm7C0C
	 xD4wnpFehu/4NeCWWkxti5Vx1eeXQFMN+kPr2Fc/Uw61QkWgk/wLwau5kUoDWEZ2Ba
	 1Gwd1ckQVa2e2d61bKmvEyrK469SYux4Q4gBQX7XsxtkxHIHf/sYpvmTXFSrwm288X
	 5U/4V4NeB60fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, imx@lists.linux.dev, linux-i3c@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <7b85402977d59f7f3d28f15fa7005bbfafffbe20.1783074850.git.tze.yee.ng@altera.com>
References: <cover.1783074850.git.tze.yee.ng@altera.com>
 <7b85402977d59f7f3d28f15fa7005bbfafffbe20.1783074850.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 10:59:30 +0000
Message-Id: <20260703105931.103B51F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dw_i3c_ccc_set() fails to use dw_i3c_ccc_map_err(), resulting in=
 inconsistent M0 error mapping for CCC SET commands
--

commit 0ce229b1e86f48f8bc79433bee08c7da0909bad8
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

i3c: master: dw: Map CCC hardware errors to I3C M0/M2
   =20
This commit maps DesignWare I3C master CCC hardware errors to I3C M0/M2 err=
or
codes. It introduces a new mapping function to handle this translation and
updates CCC commands to use it.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
[ ... ]
> @@ -781,10 +800,9 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *mast=
er, struct i3c_ccc_cmd *ccc)
> =20
>  	ret =3D xfer->ret;
>  	cmd =3D &xfer->cmds[0];
> +	ccc->err =3D dw_i3c_ccc_map_err(cmd->error);
>  	if (!ret)
>  		ccc->dests[0].payload.actual_len =3D cmd->rx_len;
> -	if (cmd->error =3D=3D RESPONSE_ERROR_IBA_NACK)
> -		ccc->err =3D I3C_ERROR_M2;

[Severity: Medium]
Should dw_i3c_ccc_set() also be updated to use the new dw_i3c_ccc_map_err()
function?

It looks like dw_i3c_ccc_get() was updated to map M0/M2 errors, but
dw_i3c_ccc_set() retains the legacy hardcoded check:

drivers/i3c/master/dw-i3c-master.c:dw_i3c_ccc_set() {
...
	ret =3D xfer->ret;
	if (xfer->cmds[0].error =3D=3D RESPONSE_ERROR_IBA_NACK)
		ccc->err =3D I3C_ERROR_M2;
...
}

Without using the new mapping function here, hardware errors (like CRC,
Parity, or Frame errors) during CCC SET commands will not be mapped to
I3C_ERROR_M0, resulting in inconsistent error handling compared to GET
commands.

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783074850.gi=
t.tze.yee.ng@altera.com?part=3D3
