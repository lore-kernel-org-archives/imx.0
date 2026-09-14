Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938ED353A94;
	Mon, 14 Sep 2026 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398593; cv=none; b=F6Q7Jf3HqQF2cjx/jIGLBIcWGOIBc9ntfbitSb9pluOGt2W7p/1tFBvUiT1eUYSj0Io/AB4DeTB5+8jTi2BDG7S1HNlhF6GN2BvTKbCXkCXrgRTBd1Mw+x55OZr4Etym3c1pJ2qnEm5dRPAlLUQlWtXr7AbbM9fv+I8PQOp3Oro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398593; c=relaxed/simple;
	bh=P1SV/Kl+DaWinZ9PQIQFV2ccqHOzHwLcHnMTQj59jKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ow/PRQHhAJkv7Cq2dISjVdVjMJbtxhwUDfW71crIp9WsqBf+0Wu/slB9cr2GEQKDOu5c0XjRYrAVWmxKrPyMOnrEKduSArs34yPTuogP+zcjj8miPMhTrzBtpPoFAbw2SSV1oi5Vkyu8GTJAS2j9SCtKAft+xoQeSg7icIgP/IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNb8XWqC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNb8XWqC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADB01F000FF;
	Mon, 14 Sep 2026 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398591;
	bh=Kp9SMreYAwrLLd3C+k6DxKByfXv6m4kvU0zr11BgQYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WNb8XWqCQsChRRR+ma06xkfeRRhetY/FpANusm2/OefLmC5iBHd/wFvJIcIjMXxkZ
	 veJ9FxJ+vsJKXD/Cd0PRm6CNckkzzHVE+p4wftxsKhC9/oZoNgyfSqRdCj87h485O3
	 7tHcNA3b0ujvkn8AyfQmS/MrMXd5Si0aWGFyQ6noUWLjKFtx1BppBQ3yP0kaLm5mjN
	 +nyO+C9onTrHUQUTeXha7fxfT9VKI+/CceDcle/IRU7Z/tTUY+q7HnCRls8EIXJWsB
	 QbVTP18SLN38PTCKrLLnJ1mC/exjhiNLRtbQoLXq2ufulZA41BW2FT4faJ/b2Que/I
	 hrupxJQA1r9TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v51 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:09:50 +0000
Message-Id: <20260914150950.CADB01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The firmware-busy circuit breaker can be permanently disabled if a=
 recovery command times out.
--

commit 8efdce1526b5b7fd05d241f2ae2a7a89f4376e43
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index b5d3421c09878..519f24d24a859 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static void se_clear_fw_busy(struct se_if_priv *priv)
> +{
> +	struct fw_busy_info *fbusy_info =3D &priv->fw_busy_info;
> +	struct se_if_device_ctx *dev_ctx =3D NULL;
> +	unsigned long flags;
> +
> +	scoped_guard(spinlock_irqsave, &fbusy_info->fw_busy_lock) {
> +		dev_ctx =3D fbusy_info->fw_busy_dev_ctx;
> +		fbusy_info->fw_busy_dev_ctx =3D NULL;
> +
> +		if (!dev_ctx) {
[ ... ]
> +			atomic_set(&fbusy_info->fw_busy, 0);
> +			return;
> +		}
> +	}
[ ... ]
> +	scoped_guard(mutex, &dev_ctx->fops_lock) {
[ ... ]
> +		if (have_snap) {
[ ... ]
> +			fw_api_specific_ops(priv->priv_dev_ctx,
> +					    (struct se_api_msg *)late_rx_snap, true);
[ ... ]
> +	se_release_msg_if(priv);
> +
> +	spin_lock_irqsave(&fbusy_info->fw_busy_lock, flags);
> +	atomic_set(&fbusy_info->fw_busy, 0);
> +	spin_unlock_irqrestore(&fbusy_info->fw_busy_lock, flags);

[Severity: High]
Can the circuit breaker be permanently bypassed if a recovery command times
out?

If fw_api_specific_ops() triggers a cleanup command like se_close_session()
and the firmware is still hung, that command will time out and call
se_mark_fw_busy(). Since fbusy_info->fw_busy_dev_ctx was set to NULL at the
start of this function, se_mark_fw_busy() will claim the slot again and set
fw_busy =3D 1.

When se_clear_fw_busy() finishes, it unconditionally sets fw_busy to 0
here, but leaves the newly armed fw_busy_dev_ctx populated. This leaves
the system in a state where fw_busy =3D 0 but fw_busy_dev_ctx !=3D NULL.

If this happens, could subsequent timeouts from user-space ioctls fail to
re-arm the circuit breaker because se_mark_fw_busy() sees a non-NULL
fw_busy_dev_ctx and silently returns? This would permanently bypass the
fast reject mechanism.

> +	kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-imx-se-if-=
v51-0-4a7dac612cb5@nxp.com?part=3D5
