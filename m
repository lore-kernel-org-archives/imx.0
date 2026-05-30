Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F420A2D1911;
	Sat, 30 May 2026 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101948; cv=none; b=j18ayXBL9raiGKbYnb8hj0D7AvEJz0pgK5Qh4bTHpfjft0MBKHWrp5NiZVGnRUQkjhAuOHaYjPbRrdVzdwTleUz+HFG+iWYmk5HC2IRgcUc2yeQ/MHiBydRtdu0HjOM3yninKy8E2NuDN9ksejSGbb6MdIUv/RPnOoEB50hBfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101948; c=relaxed/simple;
	bh=wVln5OQ7+gkZifbLILPh4MfEA2l7Apd2ycEP2QwHr5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qyp8KEjm5KDPHBMEJrS9LgW/+GQlGzmb5OqQqMz83NtvduGkJaVi2IJOZiA8gRWVN6T3jGKJPKsODKmN2oEvG9Nt0IQMo0QOif6ELoh6DM2Xf8oYqW929goFTx2agC2WvpMKrC4mMZ6vRSsDxEIJhMBWLZgYe04zpe/jg/UkrtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGD/4Rqc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGD/4Rqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32AE1F00898;
	Sat, 30 May 2026 00:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101946;
	bh=tDfb+lMLAJ2U+K+yfmJhEMLXjytz+nFBMSSBXRbwMQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QGD/4RqcPkwAOJAAmF9V/XKtlWhG1fFoMxUD8/biIH3HpIb9NYyvco/8wB/AoUGr/
	 i+wOSI+n5GD7O8yvqcSQKSPTqSeeMccCew1PKGJzEQv8AaQz/0BsXsTwlssR86IvFr
	 B5iPmLeGHo65Hrn6lsqFrpe8aUQWfWOQih2gCg9S4yXc5dun/+ZxvnOLtbG5FAsdKj
	 6J58yjWXw6v7ZpINQm2CdBxORjd3JyjEpw2/KpaeS4Gd1UlnRt4OsM8AMwR5rfrgAb
	 8LpPjwGhDh41RR7Q6UIcFojhKbQ8YggIFBLUqG4cZDUaAR7MJ91rkp6Ly/Njl1De5s
	 bL+OkimaGU4+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/23] net: mv643xx: use platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-17-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-17-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:46 +0000
Message-Id: <20260530004546.A32AE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Directly assigning a `devm_kzalloc()` pointer to `pdev->dev.platfo=
rm_data` leads to an invalid `kfree()` upon platform device release.
--

commit 8b40f4373a03093beb86a0174e83ff04d8438e9e
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: mv643xx: use platform_device_set_of_node()

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

> diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/eth=
ernet/marvell/mv643xx_eth.c
> --- a/drivers/net/ethernet/marvell/mv643xx_eth.c
> +++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
> @@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct pl=
atform_device *pdev,
>  		goto put_err;
>  	}
>  	ppdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
> -	ppdev->dev.of_node =3D of_node_get(pnp);
> +	platform_device_set_of_node(ppdev, pnp);

[Severity: High]
This is a pre-existing issue, but does the driver incorrectly assign a
devm_kzalloc() pointer to pdev->dev.platform_data elsewhere in this file?

In mv643xx_eth_shared_of_probe(), memory is allocated via devm_kzalloc() and
directly assigned to pdev->dev.platform_data. Because the parent pdev is
instantiated from the Device Tree, its standard lifecycle release function =
is
platform_device_release(), which unconditionally calls:

    kfree(pdev->dev.platform_data);

Calling kfree() on memory allocated by devm_kzalloc() is invalid since the
devres mechanism adds a hidden header, causing the pointer passed to kfree()
to be offset from the actual slab object, which can lead to a panic.

Furthermore, on driver unbind, devres frees the memory, leaving a dangling
pointer in pdev->dev.platform_data that could trigger a use-after-free or
double-free when the device is eventually released.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D17
