Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D822423A
	for <imx@lists.linux.dev>; Fri, 29 May 2026 02:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780023067; cv=none; b=s1/oTZYYW7m92mhegfNjNhSCrTZ27382U4/8XyD2RsF+lxGSXMo9q3u/QW1O14CfnhuihNQxQCkCngFO4LZgRxNA7mr29rguG2c1AIMgbXjacF0RcNoTh7rmzBkEsfgykvUCYAg5yyHWaf34sA4dQOrr8h/TQlrg19qx6a8npsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780023067; c=relaxed/simple;
	bh=SgNRsXrDL1ms7O1U1CAbLUUt9a/w+x6GicifI95jRAM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sm0V8u4rZCfpQTKTW3/FbjhJh8KnDa2hy3/+Q1Cpr81TGmaZQkxOnmdSNVQQ3ofoGv2JslzosJU0g5DcvyqkCOyTMTjc8Cq21qrgssyXql1bUASsp/NrfGgT7ApBJ8r9M171CxS8y4zyU6c9yXs8IeuiHKmhxJD1GkssPJLCnOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8bjeofW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8bjeofW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B6D1F000E9;
	Fri, 29 May 2026 02:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780023065;
	bh=UhEmoB9ciFTWWYarxm6W6SZ25RU1b7vAEVhWaJSldBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m8bjeofWiTNedG8G/30ZsRWBMHSOeVhWX0+xspIjx1uEjcOUptMg0YMFroC8mnksN
	 0cfcMhvUeyMIOxTR+ILp84buRbecJNVRWMNxIu4gAMusqCuVS7HzFyw4ygfvARTlAZ
	 ewV3k4P1fl7WCXiZDxRrIOBrvHA9HIe5pxTqw3ODYyEDSPde90ZejOjAQ5w5y9ySA1
	 vl7Oi/waWZRXy2kp9QEU90+HCCvCeUQUlqXj+9pUmpoaWhP51vAnYpOdzc92PWCjqV
	 cLScFzaENr8ngu68QAcODCOgQ9dZeL66PVn4y1JrRoV6iRk0x/Guf7HhSdceuctAxR
	 9TirdjKTjqYow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] remoteproc: add common wc-ioremap carveout
 callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ben Levinsky" <ben.levinsky@amd.com>
Cc: Frank.Li@kernel.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev
In-Reply-To: <20260529021637.2077602-2-ben.levinsky@amd.com>
References: <20260529021637.2077602-2-ben.levinsky@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 02:51:04 +0000
Message-Id: <20260529025105.B4B6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The error message in `rproc_mem_entry_ioremap_wc` uses the `%pa`=
 format specifier for a `dma_addr_t` pointer instead of the correct `%pad` =
specifier.
--

commit 49a6ae6c09ebb61591d4b795ceaf406223e63c34
Author: Ben Levinsky <ben.levinsky@amd.com>

remoteproc: add common wc-ioremap carveout callbacks

This commit adds common subsystem-private helpers to avoid open-coding
carveout mapping callbacks in various remoteproc drivers. The change
centralizes the ioremap_wc and iounmap operations along with their
error logging.

> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remotepro=
c/remoteproc_internal.h
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h

[ ... ]

> @@ -122,6 +123,31 @@ rproc_find_carveout_by_name(struct rproc *rproc, con=
st char *name, ...);
>  void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
>  void rproc_remove_rvdev(struct rproc_vdev *rvdev);
> =20
> +static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
> +					     struct rproc_mem_entry *mem)
> +{
> +	void __iomem *va;
> +
> +	va =3D ioremap_wc(mem->dma, mem->len);
> +	if (!va) {
> +		dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
> +			&mem->dma, mem->len);

[Severity: Medium]
Does this format specifier match the variable type?

The %pa specifier expects a phys_addr_t pointer, but &mem->dma is a
dma_addr_t pointer. If phys_addr_t and dma_addr_t have different sizes
(for example, 64-bit DMA and 32-bit physical addresses on a 32-bit system),
vsprintf could read the wrong number of bytes and potentially print
unrelated data in the error log.

Should this use %pad instead to properly format the dma_addr_t pointer?

> +		return -ENOMEM;
> +	}
> +
> +	mem->va =3D (__force void *)va;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529021637.2077=
602-1-ben.levinsky@amd.com?part=3D1
