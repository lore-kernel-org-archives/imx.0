Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780303B6343;
	Tue, 16 Jun 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611589; cv=none; b=XiBv3WqV5qHMXh7mb6uVOQHHlAWY155VkjFYHRDinTnoO83H6dythxuMsSPWCdpFH1V+AM0L+qdveEVEY5aqfJGsjomJtSoImpivQWZGI3NPrSD3LlBNswEntZNKxPcz+ZMlJ/ae1FwcWB5hZxEzpFAqmyVoHXot9bzO9FCqGn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611589; c=relaxed/simple;
	bh=PujpRlZMoCWN5ZOuyOAZRelXQ0pddD1lnXJ1N1gE1/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bzLJkrMk3KXPtNUAnDQwXyc8fe/pBqdXqSoXBcRdeWR5RhzxrTUiPTiRwy/80K+ByIOiBTLQLQdDWNRsihprai2jhS46H2OiCeHW58Rc0X6t4XVsj9cltfLes8wQgTUIe+XlEq4gyTlkVui1K4eK6pjp9UxYtpMdDSfja+rz5lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XIbbflt6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIbbflt6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBF51F000E9;
	Tue, 16 Jun 2026 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781611588;
	bh=5uhrnBQ7jbUDqK0gjEuD/BGwmbz7RtkXEIRslpv/dxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XIbbflt6udyOUwz4E9c+vXHf4p7N70hzeoLVPJoZpxC82Qk8w7ilPBjZA6ZV63jxX
	 z25kwYXqcq6p8ttd5myxM4AABEqVoX7JdaGBncUVUUGBqacL0Ou5juNA9JgceQ6DIW
	 fQBsl995N0tgXqOi0imrVjfXsQQyxz8KLLdgox0psxhGpESjEcK48/PDSgJYUhHLVJ
	 Ljp5vuBGKstsQCMTVqzqkFvqPOrgV1usgDS+FBgpKPFEZHEj9qiaNcWEmkmxHuK2px
	 RLtRdL9q6ugmGEbQ4EtaMQhBVDxiViZjecvUTHDMyI2UXdNGmp++3DrluQVUw2+Ta+
	 wSEEkSMS9WHzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] nvmem: imx-ocotp-ele: Remove the FUSE_ELE type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-7-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-7-cb7f3698c3e6@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:06:26 +0000
Message-Id: <20260616120627.8DBF51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] ele_msg_send_rcv() fails to clear waiting_rsp_clbk_hdl.rx_msg =
on error/timeout paths, leading to heap corruption and NULL pointer derefer=
ence by the mailbox callback.
- [High] Missing kfree() on the error path in imx_ocotp_reg_read() causes a=
 memory leak of the dynamically allocated read buffer.
- [High] Missing device link between the OCOTP driver and the Secure Enclav=
e (SE) device creates a Use-After-Free risk for priv->se_data.
--

commit 59602650186437e4e8ff55bf4112fcec530ec2ab
Author: Frieder Schrempf <frieder.schrempf@kontron.de>

nvmem: imx-ocotp-ele: Remove the FUSE_ELE type

There is no use in tracking the fuses that are only accessible via
ELE API and the current lists are incomplete. If the ELE API is
available it will be used as primary access method anyway, otherwise
the fuses not listed as accessible through the FSB can be considered
invalid.

> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index 92cc061b9b347..3d6fad149ed5d 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
[ ... ]
> @@ -111,7 +110,7 @@ static int imx_ocotp_reg_read(void *context, unsigned=
 int offset, void *val, siz
>  		}
> =20
>  		type =3D imx_ocotp_fuse_type(context, i);
> -		if (type =3D=3D FUSE_INVALID || type =3D=3D FUSE_ELE) {
> +		if (type =3D=3D FUSE_INVALID) {

[Severity: High]
This isn't a bug introduced by this patch, but looking at the earlier
part of imx_ocotp_reg_read() where the SE device is checked:

	if (priv->se_data) {
		ret =3D imx_se_read_fuse(priv->se_data, i, buf++);
		if (ret) {
			mutex_unlock(&priv->lock);
			return ret;
		}

Does this error path leak the dynamically allocated read buffer 'p'?

The function returns immediately without calling kfree(p). This could
allow repeated failing reads, such as from nvmem sysfs, to cause memory
exhaustion.

[ ... ]

[Severity: High]
This is a pre-existing issue, but looking at imx_ele_ocotp_probe() in
drivers/nvmem/imx-ocotp-ele.c:

	priv->se_data =3D platform_get_drvdata(priv->se_dev);
	if (!priv->se_data)
		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
				     "SE device not ready\n");

Is there a use-after-free risk here due to the missing device link?

The driver caches the SE device's driver data locally as priv->se_data
without establishing a device link (e.g., using device_link_add()).

If the Secure Enclave driver unbinds independently, its private data is
freed. Because this driver remains active, could it pass the dangling
priv->se_data pointer to imx_se_read_fuse() during a subsequent read
or write?

[Severity: Critical]
This is a pre-existing issue, but looking at ele_msg_send_rcv() in
drivers/firmware/imx/ele_common.c:

	err =3D ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
	if (err < 0)
		return err;

Could this error path leave a dangling pointer in the global state?

The function returns without clearing priv->waiting_rsp_clbk_hdl.rx_msg
or dev_ctx.

If a spurious response arrives later, se_if_rx_callback() copies data
into the freed rx_msg via memcpy(), which could cause heap corruption:

	dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
		se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
	...
	memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);

Additionally, if the message times out, dev_ctx is set to NULL but
rx_msg is not.

Would a delayed response crash in se_if_rx_callback() by dereferencing
se_clbk_hdl->dev_ctx->devname without checking if dev_ctx is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-upstreamin=
g-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de?part=3D7
