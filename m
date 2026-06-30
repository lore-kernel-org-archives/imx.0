Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A30FBE1
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826360; cv=none; b=CNQe+LMoVrTZlqShtpUT9XfxS/fVY9VwMx0p+aFdTgJiGQolS3Ri5mPGuo32aXBMdf0/WtO1ICDw6yI/boY8XwhuGnKeOly3istF2Vgmvbb1SwuOsnE3WB5dST9bV+y+lafIq0JsMqahicN0O2iSo+Fb0aaNGDqD+LiVyo72xec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826360; c=relaxed/simple;
	bh=sFyFZ6Ldt9QRXxGKE+h2a8AJi/4KFTYgKEQNZxNcsC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cC5EDuZhcFfbEzP8VMKtUdgn2GLUELrgI/kLzh+kLluFyFjLMMvY0WUtt66PuDFOTGonY0cvJkE0EKYjYLN+ckYEWm9Pu3DWOOFfShvZnvA0Zo8o4kxPhVmk7ROLuCaTHszGtLOP5d5VSuQVurebyFm1PWV0vwNUT35ROJKtB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0RQccYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0RQccYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C2F1F000E9;
	Tue, 30 Jun 2026 13:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826359;
	bh=2dkwaG2W0n5IF8ebld/gTIYJzHqfTLyc7271ZpPci9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A0RQccYsZ7JXvF+3dSby5nJstiiaNrr5mA2HYQpq6BGT3dH4GJFBz56C8WxKkhxph
	 A3s9Rg+WdzX18L4qGF3G7SDrLuNx85UqCaGOLqQOhzEuycj+ERVy1LGlFWLfNX+CGZ
	 O1zGwRAQUGqDJ7pj0vB4IuuArpLIEc+AEaAGRD73dc4O7jW0aXD5N2Y5e8Maz7Yl2X
	 gSM0OCozHTjTQrl4OLR38Y139bACN+XjuVwx+w+l1ZoJILYR1tW/M4fbQPOtnS6sWu
	 bzQqxT3SHNM46JuJ5mQ9sqzUPxzbNFXWskBQsRxnD73oJI93TZO5coGk9oNEES4S0o
	 +MSqOYCbbS5pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-i3c@lists.infradead.org
In-Reply-To: <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:32:38 +0000
Message-Id: <20260630133239.42C2F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented behavioral change and silent bug fix
--

commit 5afd5fbee8dc926110284bae98310b5970134131
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

i3c: master: dw: Map CCC hardware errors to I3C M0/M2

This commit updates the DesignWare I3C master driver to map specific
response queue errors to standard I3C error codes M0 and M2. It also returns
-EIO for address NACKs and introduces dw_i3c_ccc_map_err() to centralize
error mapping.

> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i=
3c-master.c
> index e659ede79fc03..27d2025fcf041 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c

[ ... ]

> @@ -743,10 +760,7 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *mast=
er,
> =20
>  	ret =3D xfer->ret;
>  	cmd =3D &xfer->cmds[0];
> -	if (!ret)
> -		ccc->dests[0].payload.actual_len =3D cmd->rx_len;
> -	if (cmd->error =3D=3D RESPONSE_ERROR_IBA_NACK)
> -		ccc->err =3D I3C_ERROR_M2;
> +	ccc->err =3D dw_i3c_ccc_map_err(cmd->error);

[Severity: Medium]
Is this an unrelated bug fix? The commit message mentions mapping hardware
errors to I3C M0/M2, but it does not mention removing the assignment of
actual_len from the transmit operation here.

> =20
>  	return ret;
>  }

[ ... ]

> @@ -783,8 +799,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *mast=
er, struct i3c_ccc_cmd *ccc)
>  		dw_i3c_master_dequeue_xfer(master, xfer);
> =20
>  	ret =3D xfer->ret;
> -	if (xfer->cmds[0].error =3D=3D RESPONSE_ERROR_IBA_NACK)
> -		ccc->err =3D I3C_ERROR_M2;
> +	cmd =3D &xfer->cmds[0];
> +	ccc->err =3D dw_i3c_ccc_map_err(cmd->error);
> +	if (!ret)
> +		ccc->dests[0].payload.actual_len =3D cmd->rx_len;

[Severity: Medium]
Does this silently add the actual_len assignment to the receive operation?

Since moving this assignment from dw_i3c_ccc_set() to dw_i3c_ccc_get() is
not documented in the commit message, should it be split into a separate
fix or explicitly explained?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782824628.gi=
t.tze.yee.ng@altera.com?part=3D2
