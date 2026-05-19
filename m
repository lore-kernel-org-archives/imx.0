Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C913E3AFCE7;
	Tue, 19 May 2026 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203167; cv=none; b=gB/oYcfz8DDbpr5Zdj1LckzrApq8FVgahjvq2RyIRYBwM28C9cA6VoLTuifw+rnR4X4KdEriE9pGeifofrkDiRG6+DrgVPNIrivzRo0koaomVMHm4KfvPlHw97xTG4CpBQ0fKeJqk6+i2WJXRKe5KmEIhyXgsYw4T0qHJtg6UxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203167; c=relaxed/simple;
	bh=DMFV9uBMZekgXlaVW/Eg6OWqQPHj5WhH0ysdpCmCSsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j/U/EqhQvMRXo5xX6b4wm2dV3j34XheBhW6xrBYFHQzqNUsiXuFrZiitby7byLbOaVDI1YAT5/hixHGIAge58rPGcvmHJe9hETVpotOMMkyzYGXDxgE4iP1GvDYWqOeF4Eq9j2kTiAACxvaIAlTnpuTLJ5L2tzrVJVuEVWlULPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLYS9NID; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLYS9NID"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E5AC2BCB3;
	Tue, 19 May 2026 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779203167;
	bh=DMFV9uBMZekgXlaVW/Eg6OWqQPHj5WhH0ysdpCmCSsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mLYS9NIDpjzBuXGupRQTNIXW+MdlHM35a8Bt/FinIvGWie9+hDAtAKLwvR7VIpY9x
	 vkMsBAbfCPDl0JvWCDZRFJyiDlutaeVKWto77amlT6M5/6GgbP8wplPQnLlNq4E9jA
	 +kPFvdq3crnpLqY0g1i14l96K5cjbTz6GutH4y5LnP2PuRnTXsYtWZA20BUC5s5vTf
	 E3AD+rN2AO9wIRsimiiLSgt06//hsNddq/Y/zmd43DdkFTHaB7GNt8zlSdZC2stSJs
	 lOzgURlvm/DbtVILqr7ZELhKoXU/7+NINQCz65fUdilzPZm0QEA02Dtpnuv9nZyIBx
	 DPVYtL69A5ivg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 1/8] soc: cadence: Create helper functions for
 Cadence MHDP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, imx@lists.linux.dev, neil.armstrong@linaro.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260519-dcss-hdmi-upstreaming-v23-1-5615524a9c63@oss.nxp.com>
References: <20260519-dcss-hdmi-upstreaming-v23-1-5615524a9c63@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 15:06:06 +0000
Message-Id: <20260519150606.D9E5AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Buffer overflow in cdns_mhdp_secure_mailbox_send_recv_multi() due =
to ignored bounds check.
- [High] Mailbox size validation bypass and permanent FIFO desynchronizatio=
n for opcode 0x09.
- [Medium] Mailbox RX FIFO is not properly drained on error paths, leading =
to permanent desynchronization.
--

commit c962067d82ee12edcd834501898758652f04fb81
Author: Sandor Yu <Sandor.yu@nxp.com>
soc: cadence: Create helper functions for Cadence MHDP

This commit introduces mailbox communication helper functions for Cadence=20
MHDP IPs. It adds support for both secure and non-secure mailbox access,=20
along with register and DPCD read/write helpers.

> diff --git a/drivers/soc/cadence/cdns-mhdp-helper.c b/drivers/soc/cadence=
/cdns-mhdp-helper.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/soc/cadence/cdns-mhdp-helper.c
[ ... ]
> +static int mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> +				    u8 module_id, u8 opcode,
> +				    u16 req_size, bool secure)
> +{
[ ... ]
> +	/*
> +	 * If the message in mailbox is not what we want, we need to
> +	 * clear the mailbox by reading its contents.
> +	 * Response data length for HDCP TX HDCP_TRAN_IS_REC_ID_VALID depend on
> +	 * case.
> +	 */
> +	if (opcode !=3D header[0] ||
> +	    module_id !=3D header[1] ||
> +	   (opcode !=3D HDCP_TRAN_IS_REC_ID_VALID && req_size !=3D mbox_size)) {

Does this bypass apply to any module using opcode 0x09?

Looking at the command definitions, DPTX_TRAINING_CONTROL also uses 0x09,
which means it would inadvertently bypass this size validation check since
the module_id isn't checked here.

Additionally, if this check is bypassed and the firmware actually sends an
mbox_size larger than what is dynamically read, will those unread bytes
remain in the RX FIFO? Could the next mailbox command end up reading those
stale leftover bytes as its response header, breaking synchronization?

> +		for (i =3D 0; i < mbox_size; i++) {
> +			if (secure)
> +				ret =3D mhdp_mailbox_read_secure(base);
> +			else
> +				ret =3D mhdp_mailbox_read(base);
> +			if (ret < 0)
> +				break;
> +		}
> +
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> +				  u8 *buff, u16 buff_size, bool secure)
> +{
> +	u32 i;
> +	int ret;
> +
> +	for (i =3D 0; i < buff_size; i++) {
> +		if (secure)
> +			ret =3D mhdp_mailbox_read_secure(base);
> +		else
> +			ret =3D mhdp_mailbox_read(base);
> +		if (ret < 0)
> +			return ret;

If readx_poll_timeout() fails during the read, does returning directly here
leave the rest of the message stuck in the RX FIFO?

If a read times out or fails, could the next thread to acquire the
mailbox_mutex parse these leftover bytes as a new response header? Should t=
he
FIFO be explicitly drained when an error occurs to maintain state machine
synchronization?

> +
> +		buff[i] =3D ret;
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +int cdns_mhdp_secure_mailbox_send_recv_multi(struct cdns_mhdp_base *base,
> +					     u8 module_id, u8 opcode,
> +					     u16 msg_size, u8 *msg,
> +					     u8 opcode_resp,
> +					     u16 resp1_size, u8 *resp1,
> +					     u16 resp2_size, u8 *resp2)
> +{
[ ... ]
> +	ret =3D mhdp_mailbox_recv_data(base, resp1, resp1_size, true);
> +	if (ret) {
> +		dev_err(base->dev, "ModuleID=3D%d, Resp_CMD=3D%d recv data1 failed: %d=
\n",
> +			module_id, opcode_resp, ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Response data length for HDCP TX HDCP_TRAN_IS_REC_ID_VALID depend on
> +	 * the number of HDCP receivers in resp1[0].
> +	 * 1 for regular case, more can be in repeater.
> +	 */
> +	if (module_id =3D=3D MB_MODULE_ID_HDCP_TX &&
> +	    opcode =3D=3D HDCP_TRAN_IS_REC_ID_VALID)
> +		ret =3D mhdp_mailbox_recv_data(base, resp2, 5 * resp1[0], true);

Could this dynamically calculated length exceed the caller-provided
resp2_size buffer capacity?

Since resp1[0] is read directly from the hardware response and could be up
to 255, this might result in writing up to 1275 bytes into the resp2
buffer. Does this need a bounds check against resp2_size to prevent memory
corruption if a misbehaving or compromised device sends a large value?

> +	else
> +		ret =3D mhdp_mailbox_recv_data(base, resp2, resp2_size, true);
> +	if (ret)
> +		dev_err(base->dev, "ModuleID=3D%d, Resp_CMD=3D%d recv data2 failed: %d=
\n",
> +			module_id, opcode_resp, ret);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-dcss-hdmi-=
upstreaming-v23-0-5615524a9c63@oss.nxp.com?part=3D1
