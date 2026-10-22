Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657238;
	b=aJ3RMhydAhiv8vTqeF5ZumOlw0T27BWWaty4mNuCR6rx280l9AtyKkUveiG9rpg2JjqP
	 j8KwOrnpliLjph6D30xRlSN5HFlAKW0AAysg8iruac2dY49t49mUqm+2VRACx+EfF3NdL
	 FPLREgxXsOTI58FnATNG1YdH+e1wB5cvUPDzInVabWjONFYhPaQc/xNM/9BAqHIwq5iBn
	 xLhdOlaSqL8MZ2zWJpSh9Cj97F7yISVWiWw2SK4gh010M8WTn9k0c3QNo3atwT/0yDs8X
	 6V8ESaLZEaWMa7PMu+wn0O2+bT8fZ7Xout3nQHn8eDQGG/Gjt17fWsqqYyrKic3eJ/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657238;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bDtM4VCT9qH75VAmwcVPKU1j/ARJ88VLmfiMwC7/QV0=;
	b=r5cSSGAAwraPGw5SJCFyhjjRnKVdibXzsgKmkcQKqFe4PIj5gfoi8SZF2JqCV99XqSjw
	 VoUIn7xGvO8p4v8P4WdNUnvEuKqcxk2LX491rYyRGZI19kgX9ZJ36FXm1i0oyRhwZUx8n
	 mW/dGghRLB/s01lGYGSzHN8YhOhpwqOfb6k6Pz/aP9vBg02rt0QkSSdhfqdnYgHGsfCxo
	 u5uSqm1SUMp9ZepTF5c5iNZGxrnz5qM42+8z8FP6bOS3yatW9Zs1zwqWAgUJVT9KYa2as
	 42c8gDCtLp9b3cuvB7yMzHQ6igxzY68JarVuCzrreIYjHpvUj/L3sTBo2Xb7C1Zuf4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVHfMsw2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900F2606A31B
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 08:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YVHfMsw2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B0B1F000C1;
	Thu, 22 Oct 2026 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657238;
	bh=bDtM4VCT9qH75VAmwcVPKU1j/ARJ88VLmfiMwC7/QV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YVHfMsw2oDk5siAc1CUpNiUqXAWAvQNzWLNvu/OZ5A6CQ616vYmhZuE6vYlBy6HzV
	 Oqo2neXnVj3gkF2DWlCFBsYBI+k9EZVmGaxBV9gxAtP0tJRjkQ7+aVWYA9rUr+16RT
	 8SQaM+Ls6jWnJhh6T9wNMSLJr/G56oAmt3TDIq9Pgr/i2Sxriuz0L8LvNC9JfOu7v+
	 x/hqUoGvbbEUwrGpfNsaszdGceSinRcGoxT08RvWc/I1+QJxk7vunjDfU2KSia9SU/
	 7EzVO3tbWXnFseVgbwx8C31pV3MYXKSEGazJuEj2JjHFReYYuvMl08YDXdQGf+KjuZ
	 AEGF4i6G43JVA==
Message-ID: <sashiko-outbox-181158@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: clear the default read_sr2 opcode for
 xSPI Profile 1.0 flashes
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, imx@lists.linux.dev, michael@walle.cc, "Haibo
 Chen" <haibo.chen@nxp.com>, Frank.Li@kernel.org
In-Reply-To: <20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com>
References: <20261022-spi-nor-fix-v3-1-bffa00b75c27@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 08:20:36 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: spi-nor: read_sr2 left set for 8D-8D-8D flashes without Pro=
file 1.0
--

commit ef4079e3aea2014890e08df31ea4d8775a392f81
Author: Haibo Chen <haibo.chen@nxp.com>

mtd: spi-nor: clear the default read_sr2 opcode for xSPI Profile 1.0 flashes

This commit clears params->opcodes.read_sr2 in spi_nor_parse_profile1() so
that flashes with an xspi profile 1.0 table do not issue an unsupported
0x35 register read when running in octal dtr mode.

> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 4a3f82e97cef8..722eeff71d0df 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1344,6 +1344,17 @@ static int spi_nor_parse_profile1(struct spi_nor *=
nor,
>  	 */
>  	nor->params->hwcaps.mask |=3D SNOR_HWCAPS_PP_8_8_8_DTR;
> =20
> +	/*
> +	 * The xSPI Profile 1.0 table does not describe a Read Configuration
> +	 * Register (RDCR, 35h) instruction, and the single-byte RDCR default
> +	 * is not usable in 8D-8D-8D mode. Drop the SR2 read opcode for these
> +	 * octal-capable flashes so spi_nor_read_sr1_and_sr2() degrades to an
> +	 * SR1-only read and spi_nor_init() does not issue an unsupported
> +	 * command that the flash never answers. A manufacturer driver that
> +	 * actually needs SR2 can install its own opcode in a later fixup.
> +	 */
> +	nor->params->opcodes.read_sr2 =3D 0;

[Severity: Medium]
What happens on octal dtr flashes that do not publish an xspi profile 1.0
table, so spi_nor_parse_profile1() is never called?

Specifically, some batches of the Micron mt35xu512aba lack the profile 1.0
table and instead configure SNOR_PROTO_8_8_8_DTR in
drivers/mtd/spi-nor/micron-st.c:mt35xu512aba_post_sfdp_fixup():

	nor->params->hwcaps.mask |=3D SNOR_HWCAPS_READ_8_8_8_DTR;
	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
				  0, 20, SPINOR_OP_MT_DTR_RD,
				  SNOR_PROTO_8_8_8_DTR);
	...
	nor->params->hwcaps.mask |=3D SNOR_HWCAPS_PP_8_8_8_DTR;
	spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
				SPINOR_OP_PP_4B, SNOR_PROTO_8_8_8_DTR);

In drivers/mtd/spi-nor/sfdp.c:spi_nor_parse_bfpt(), params->opcodes.read_sr2
is initialized to SPINOR_OP_RDCR (0x35) and remains set when the quad enable
requirements field contains a reserved value (which
mt35xu512aba_post_sfdp_fixup() notes is the case on this part) or
BFPT_DWORD15_QER_NONE:

	params->opcodes.read_sr1 =3D SPINOR_OP_RDSR;
	params->opcodes.read_sr2 =3D SPINOR_OP_RDCR;
	...
	default:
		dev_dbg(nor->dev, "BFPT QER reserved value used\n");
		break;

Similarly, non-sfdp flashes initialized with SPI_NOR_OCTAL_DTR_READ in
drivers/mtd/spi-nor/core.c:spi_nor_no_sfdp_init_params() enable
SNOR_HWCAPS_READ_8_8_8_DTR while leaving params->opcodes.read_sr2 set to
SPINOR_OP_RDCR from spi_nor_init_default_params().

When spi_nor_init() switches these flashes to SNOR_PROTO_8_8_8_DTR via
spi_nor_set_octal_dtr() and then runs:

  spi_nor_init()
    -> spi_nor_cache_sr_lock_bits()
      -> spi_nor_read_sr1_and_sr2_careful()
        -> spi_nor_read_sr2_careful()
          -> spi_nor_read_sr_ll()

wouldn't this still issue the unsupported 0x3535 register read in
SNOR_PROTO_8_8_8_DTR mode and fail probe or resume with a controller
timeout?

> +
>  out:
>  	kfree(dwords);
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-spi-nor-fi=
x-v3-1-bffa00b75c27@nxp.com?part=3D1
