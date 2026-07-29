Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5FC43E091
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312356; cv=none; b=W/b0R/zEJd5+2aPhQUi8iKWujShoq4szJZEwIp251GAWwCIn8nzAjo6Jt99iIwmXeSI20iSHJF3xF4qzXP4Y0b2qpbQgtI0SYMi8q9YkbPhyw/0O3ReYo01a0YLdazBvbDMwziU00wgZAgvL2d/f473kOi6mLLgHQDKUGd7Rs/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312356; c=relaxed/simple;
	bh=Z7foTjmsjGs37BB53UI25EWq9NlNn1+kCTT7vwTbdkA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uKycKwLFouSBEMHKSZ62NdwjeklS6TJplFAyPK8rR0FdhxMYccwf7dON0pkcFtvG7d8ZbssGNI9qbeqx9k63DoSq5Pso5FUsDcNr7Wdi6jR5/PXntRgZGA6YFJIQVzufguVrZ4ig5yC+7kESgy67wyRB52w2YF/FWSmP8dJ9iJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bVqCxwN9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bVqCxwN9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2DD541A12EE;
	Wed, 29 Jul 2026 08:05:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDDB36039A;
	Wed, 29 Jul 2026 08:05:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6731D11C14A9A;
	Wed, 29 Jul 2026 10:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785312340; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2lOcs+UTw4dmBloNALI7qAVSlEXtyPQR37rH78D+i/o=;
	b=bVqCxwN9tmkJZHooqpLflcnipllDTeApHDS43Wkq+JUrUrmHB/HNCQCE2xxH5DADd3i8HM
	hZVA1yRYWaOXJbHVEJ2IR1rBBt6AiQLhy5UsKbEXE8Z/46D6VvGrxDMPpN6PVOCbGE2+U5
	yux3fRBm5zIpf3jFTjbqZ2Je9KPoLe/f5XNg5G4luFUTfyV7398WnCLA19Fr1ahpEWnXL2
	0LwRYpirYPLTESRKVq4AL882zx+tX5KfDsqGme9qulBjS0PAOc/h0ODF62KhUoRIIPWpxj
	ubP6nKLSiWgYhw2v0wMjW5DACMWWLTaMqyvWUe8OytndfIaA2wpxQrqBkeXWlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: han.xu@oss.nxp.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  imx@lists.linux.dev,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: add debugfs entry for BCH geometry
In-Reply-To: <20260727-nand_debugfs-v1-1-7cba1ceab5ee@nxp.com> (han xu's
	message of "Mon, 27 Jul 2026 16:09:08 -0500")
References: <20260727-nand_debugfs-v1-1-7cba1ceab5ee@nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 29 Jul 2026 10:05:36 +0200
Message-ID: <87jyqenru7.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Han,

On 27/07/2026 at 16:09:08 -05, han.xu@oss.nxp.com wrote:

> From: Han Xu <han.xu@nxp.com>
>
> Export the BCH geometry parameters via debugfs to aid debugging and
> provide the necessary information for legacy kobs-ng tool. The debugfs
> directory "gpmi-nand" is created under the root debugfs tree, exposing:
>
> bch_geometry  - blob containing the struct bch_geometry fields
> raw_mode      - flag indicating raw mode status
>
> The implementation is guarded with #ifdef CONFIG_DEBUG_FS to avoid
> build failures when debugfs is disabled.
>
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/raw/gpmi-nand/gpmi-nand.c
> index c1f766cb225aa..3ceb8df7f8f93 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -7,6 +7,7 @@
>   */
>  #include <linux/cleanup.h>
>  #include <linux/clk.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
>  #include <linux/sched/task_stack.h>
> @@ -732,6 +733,26 @@ static int common_nfc_set_geometry(struct gpmi_nand_=
data *this)
>  	return err;
>  }
>=20=20
> +#ifdef CONFIG_DEBUG_FS
> +static struct debugfs_blob_wrapper dbg_bch_geo;

Why do you use a static variable for that? This should be dynamically
allocated otherwise if you ever have more than one device you'll have
strange results.

> +static void bch_create_debugfs(struct gpmi_nand_data *this)
> +{
> +	struct bch_geometry *bch_geo =3D &this->bch_geometry;
> +	struct dentry *dbg_root;
> +
> +	dbg_root =3D debugfs_create_dir("gpmi-nand", NULL);
> +	dbg_bch_geo.data =3D (void *)bch_geo;
> +	dbg_bch_geo.size =3D sizeof(struct bch_geometry);
> +	debugfs_create_blob("bch_geometry", 0444, dbg_root, &dbg_bch_geo);
> +	/* create raw mode flag */
> +	debugfs_create_file_full("raw_mode", 0444, dbg_root, NULL, NULL,
> NULL);

I am not sure about the _full suffix, bug debufs_create_file() is enough
here, provided that you give a tangible variable to expose.

> +}
> +#else
> +static void bch_create_debugfs(struct gpmi_nand_data *this)
> +{
> +}
> +#endif /* CONFIG_DEBUG_FS */
> +
>  /* Configures the geometry for BCH.  */
>  static int bch_set_geometry(struct gpmi_nand_data *this)
>  {
> @@ -2282,6 +2303,9 @@ static int gpmi_init_last(struct gpmi_nand_data *th=
is)
>  	if (ret)
>  		return ret;
>=20=20
> +	/* save BCH geometry to debugfs if CONFIG_DEBUG_FS is enabled */
> +	bch_create_debugfs(this);

You need to call debugfs_remove_recursive() in the removal path.

> +
>  	/* Init the nand_ecc_ctrl{} */
>  	ecc->read_page	=3D gpmi_ecc_read_page;
>  	ecc->write_page	=3D gpmi_ecc_write_page;
>
> ---
> base-commit: f97bdc8ec1dc7b33781a702eeba55326c206be56
> change-id: 20260727-nand_debugfs-74d6d6ba52df
>
> Best regards,

Thanks,
Miqu=C3=A8l
