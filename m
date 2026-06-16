Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BDA3B6343;
	Tue, 16 Jun 2026 12:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611571; cv=none; b=geHW3a68OJ8rnT1VfnmKoY5G3cqr32xUKnYKjGr1aP9AkGGeRmCfvwV4YmXMSLSFL0yWjoU8vDJ+0B3Tk95SqT+RlTobpHJp8XqsP3Kr9XfhlXmVmyKmQGIYEalOcZjijsVGuc6bBaHiW5BHunzHwuI1HUNJtxbRDSXA+bDtVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611571; c=relaxed/simple;
	bh=SiD3E3NQVJJfRKATfQlXSt1E12UhJ696gRV95o9Xg4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rcanT7zx7604OrlrM6fF9uW58TBuoEaxjMiYgygIywn8wmHaN89yJ/6v336DbWPjzUm2ICxMY4Z3FK4n+UTaNC0jKnbPUnPRMJDT5mr7GX/gol8X5GyZqHTH6wGv5hzNtxDnM691hxnNO8tAxUtkyKpt5wSd1pHtltjnaiBpZ9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0z0GL9k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0z0GL9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C3B1F000E9;
	Tue, 16 Jun 2026 12:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781611570;
	bh=BHMokT7vQ2T/NKHus/5Qa8x60rAP/cYJnE4zfdMtqJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B0z0GL9kbw/aQYIy1hjk70sq3G/71YpKaJrjOg1EFjEb7yYnvQIz/Qn/U3kI1DKtl
	 9azttA4mFkVgef2BnhIv1mIediVtUosK/E1n5Ctrlxq//qviFuHhbhl+yiqPBF2fU3
	 fFgpCwrV7VUAk7KGm1pSmDwYGTmjdKMyFoZjOf9HP7dOC4YfzCnqnH6OtZCN3lwmV3
	 a/TUQPpebUM9R30N3vqonTgNwfwwnw6JN9G3SQcEyuBMMEk1JtEKXvIEpAPZdhySfr
	 8VG52GeSAm8ys8S+mPjCFzNJu/mMZl+fWwbOqlxe8upzLlbIqCV9Ryd9yfBJaOM5By
	 d6B/1cBAymhow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP
 fuse access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:06:09 +0000
Message-Id: <20260616120609.E7C3B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A timeout or interrupt during `ele_msg_send_rcv()` leaves a dangli=
ng pointer in the asynchronous mailbox callback state (`priv->waiting_rsp_c=
lbk_hdl`), leading to a NULL pointer dereference and a Use-After-Free heap =
corruption upon a late firmware response.
--

commit d740730d233516ecbc0d56af8b1a5f692696bbf0
Author: Frieder Schrempf <frieder.schrempf@kontron.de>

firmware: imx: ele: Add API functions for OCOTP fuse access

This commit adds the ele_read_fuse() and ele_write_fuse() functions to the
ELE S400 API to provide read and write access to OCOTP fuse registers. These
are exposed via imx_se_read_fuse() and imx_se_write_fuse() for use by drive=
rs
such as the OCOTP S400 NVMEM driver.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index ec718d322abcd..281d223aa1447 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
[ ... ]
> @@ -303,3 +304,124 @@ int ele_debug_dump(struct se_if_priv *priv)
> =20
>  	return ret;
>  }
> +
> +static int ele_read_fuse(struct se_if_priv *priv, uint16_t fuse_id, u32 =
*value)
> +{
> +	struct se_api_msg *tx_msg __free(kfree) =3D NULL;
> +	struct se_api_msg *rx_msg __free(kfree) =3D NULL;
> +	int rx_msg_sz =3D ELE_READ_FUSE_RSP_MSG_SZ;
> +	int ret =3D 0;
[ ... ]
> +	tx_msg->data[0] =3D fuse_id;
> +
> +	ret =3D ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg,
> +			       ELE_READ_FUSE_REQ_MSG_SZ, rx_msg, rx_msg_sz);
> +	if (ret < 0)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but will a late firmware response cause a
use-after-free here if ele_msg_send_rcv() times out or is interrupted?

If ele_msg_send_rcv() returns an error, it clears the dev_ctx but leaves the
dangling rx_msg pointer in the shared callback handle:

drivers/firmware/imx/ele_common.c:ele_msg_send_rcv() {
    ...
    if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
        err =3D -EINTR;
        priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
    }
    priv->waiting_rsp_clbk_hdl.dev_ctx =3D NULL;
   =20
    return err;
}

Because rx_msg is managed with __free(kfree), it is immediately freed when
ele_read_fuse() returns on this error path.

If a late response arrives afterwards, se_if_rx_callback() will process it.
It first causes a NULL pointer dereference if dynamic debug is enabled:

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
    ...
    dev_dbg(dev, "Selecting resp waiter:%s ...",
            se_clbk_hdl->dev_ctx->devname);

Then it unconditionally copies the response into the freed rx_msg buffer:

    ...
    memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
}

Does waiting_rsp_clbk_hdl need to be fully cleared (including setting rx_msg
and rx_msg_sz to zero) on error paths in ele_msg_send_rcv() to prevent this
memory corruption?

> +
> +	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_READ_FUSE_REQ,
> +				      rx_msg_sz, true);
> +	if (ret)
> +		return ret;
> +
> +	*value =3D rx_msg->data[1];
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-upstreamin=
g-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de?part=3D3
