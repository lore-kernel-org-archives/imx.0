Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B89330FC35;
	Fri, 12 Dec 2025 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765531546; cv=none; b=AYpOIkhAr69AVYYWvP1YG5+rlHauAjt2ggtGTxiPw6ZmYe1CkaPzcAaqj58xX0E3vxV/N7qD+UU2EuySxJdvtc/8N74oFJFkv7QFOj7Nhr7bDos0ineBtrrUlzAjOfdaH17gHklfuhub+vYiy/epin54Ox0Z83gQySbnzEohKBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765531546; c=relaxed/simple;
	bh=PsC0jPL32+OxjFDO3F0wqbNBNzmD5Mpq1C7BEYINTX8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=epaJm0fI/y+Cap2Ok4f7C1QVk598/GFPApZb/5GsMfrYW/3E/9LJaYaBgg9+nZ7LMqVwUHNo6o8lyHi3VSKZdu+r4RH5MpsyY4IYgUc4O50kT53BVDxjEu7ukcRgm09u+NkS3sMQBVIC2owRRt+Oh3KXC6sglGgjWAm0PE5lvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5g14ODV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5g14ODV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE36C4CEF1;
	Fri, 12 Dec 2025 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765531545;
	bh=PsC0jPL32+OxjFDO3F0wqbNBNzmD5Mpq1C7BEYINTX8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=s5g14ODVsVQuLsKByoqfVwsp2iuxh2PYM2HB8JAJH7WcTutu8C6HoClkR7bpc5Zp8
	 SuBduq8C5Ddy+/KYH1+yBHnuv8EOtgkv6X9kRFetVA9gb573twgw3/qIwff3PjvG+4
	 2dowTEvVX7EFIWVt4bUQ4BRYuBtNp12Fh39jFL72xOEo+SWVjggt20LI3PFk20BxVj
	 PAWTHnJwhwSgiYLdshSxw+wlE/jmys444iPmk/a/L6q8SwDiHD+Ly4QmzjNhxqhaUH
	 JZ56SrU6qY6I9TxSAppqtMehSsLe9USNq08nTu2QK3jDEG3ROEVYSQLvkPRBGqcjkN
	 u61F1AyhgZC8w==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=3759a324e6980822d98f2dfa09b77aec6cb4e78c1068306cb8c39afa62fd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 12 Dec 2025 10:25:40 +0100
Message-Id: <DEW4P4X1DBYG.1Q3T05DX2784P@kernel.org>
Subject: Re: [PATCH] Revert "mtd: spi-nor: micron-st: use SFDP of
 mt35xu512aba"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Han Xu"
 <han.xu@nxp.com>, "open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER"
 <imx@lists.linux.dev>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bough Chen" <haibo.chen@nxp.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20251212-nor-v1-1-20a5a381979c@nxp.com>
 <DEW3M3BQEGIW.3AFGPPSCBGI16@kernel.org>
 <DU0PR04MB94960504A809674A265689D690AEA@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94960504A809674A265689D690AEA@DU0PR04MB9496.eurprd04.prod.outlook.com>

--3759a324e6980822d98f2dfa09b77aec6cb4e78c1068306cb8c39afa62fd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

>> > Find two batches mt35xu512aba has different SFDP but with same jedec
>> > ID. To make all batches of mt35xu512aba work well and support OCT DTR
>> > mode, back to hardcode the flags.
>>=20
>> What are "batches" in this case? A new revision of the same flash chip? =
Why
>> would they use a different ID then.
>
> Hi Michael,
>
> Yes, seems a new revision of the same flash chip. Anyone from Micron can =
confirm this?
>
> What's the normal way for vendors to update the SFDP? Seems also need to =
update/change the ID.

No why would they? It's the same flash, but with new/fixed SFDP.

>> What's wrong with the parsed flags? Both support SFDP, so if you really =
need to
>> fixup any flags, please use a fixup callback to actually fix them. But f=
irst, what
>> will go wrong?
>
> Yes, sorry to lack this information.
>
> For mt35xu512aba chip with label 0DA15 RW303, the SFDP do not support OCT=
 DTR read/write operation,=20
> but still has one .fixups =3D &mt35xu512aba_fixups, in this fix up, it co=
nfig the OCT DTR read operation, so
> finally read_proto =3D=3D SNOR_PROTO_8_8_8_DTR, but nor->write_proto =3D=
=3D SNOR_PROTO_1_1_1, then has
> no chance to call micron_st_nor_octal_dtr_en(), when there is read operat=
ion, use OCT DTR read command
> meet issue.
>
> With this revert patch, I test mt35xu512aba chip with label 0DA15 RW303, =
OCT DTR mode can work well.
> Also test mt35xu512aba chip with label 4KA17 RW303, OCT DTR mode work fin=
d too.

So both support actual octal mode. Then please fix
mt35xu512aba_fixups. IIUC, you can just use
spi_nor_set_pp_settings() there, to fixup the supported PP mode. But
please add it with a comment describe *why* we need that fixup.

-michael

--3759a324e6980822d98f2dfa09b77aec6cb4e78c1068306cb8c39afa62fd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaTvflRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gbPQF9G1qyDa4nQuHRqM3qKWeKDsR6FJbNiMrL
ybjOG7ZdhDPF31zt3TZSZCDINxJRkQDdAXwPvKHwauEWpvXvnsgGyjJ7qaTZze0T
vbY+5EHdQIr0rvQAVFIcozXMEmB1epVcIaE=
=xqBm
-----END PGP SIGNATURE-----

--3759a324e6980822d98f2dfa09b77aec6cb4e78c1068306cb8c39afa62fd--
