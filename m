Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A22448D18
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115988; cv=none; b=u48cBTmlIhaloaFZ530fRktcscHIw4qEOlFI55cK3oMk5+QIbF1QLRfB80BACscQrmLSxOEApILaTMDG+9s4YT++8EE7mzhNydDf4Y2sZn1+NFTxmaXvlEQXIdlB6e9/8SRe2eY33JfsSPwreVJwx/w7bbwLpl5Tny3OTlzQFNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115988; c=relaxed/simple;
	bh=Oo9xbLZsoZKX6EXZrgsb36k3Hj/YptABMNQ051uPiUk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=karglzNCCOSlGS9eAIhybyth3xXKwIAp8zQQdTbKMDMwSECO3glCroaVocdyAe04qNYLfYKzFyFpSb4gBCqGqjRulgtXJVARjCjhbB7vaTrveV5USwrHHQgQRJMSyZeIIaphY8Vw5Ad4BUyQV7BlFyIf9Jg5riPoo2FpaU5C94Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E18VYdKR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E18VYdKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651A81F000E9;
	Wed, 15 Jul 2026 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784115986;
	bh=ekrBjfIl7BjbkDN6Q+ueSSQFmNTt7ZNCEjtHU0p4KW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E18VYdKRWLZqCtm3cdmzo/OaKBBkxmDaXVxfRyvPyYaB72rH6T7ij3ggr7odssQIC
	 gAsI74Ewm0RH6ZGJgqaHppupuFU6A3I0NulnY9hYpGFl2BMBwDFaxzSXo5ho4+UBdf
	 +MzuKkjJqvCgilsDery0DhzSVWxq7bYatbzGc4YAec7WA/gWD0fvSm5OWN/zfV8+QV
	 Nhr6/6lQaOqKZGHBUtl00QrW+yy7lImlhzBCzSU2BpSwCm69ONVnjDaYTuT9IZ7f0F
	 DFrNd4PVvp0GSIsXOzHig+EU2L3JdJVKVuRtEzfLG3cf06MX00cNRfFWXY5CHclrDX
	 Bqg3/21lU55Yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] phy: fsl-imx8mq-usb: fix typec switch leak on
 probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-1-00d95e270e4c@nxp.com>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-1-00d95e270e4c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 11:46:25 +0000
Message-Id: <20260715114626.651A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The Type-C switch callback `tca_blk_typec_switch_set` can be invok=
ed after the PHY driver is unbound, leading to a Use-After-Free of the driv=
er context.
--

--- Patch [1]: [PATCH v6 1/6] phy: fsl-imx8mq-usb: fix typec switch leak on=
 probe error path ---
commit 5e0093cfdd6e9dd648ed3549eb93bacb54164be2
Author: Felix Gu <ustc.gu@gmail.com>

phy: fsl-imx8mq-usb: fix typec switch leak on probe error path

This commit fixes a typec switch resource leak when probe fails after
imx95_usb_phy_get_tca() succeeds. It transitions the cleanup of the switch
to use devm_add_action_or_reset() so that it is properly freed on both
probe failure and driver removal.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index b05d80e849a14..9a33c06d6fc39 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -173,9 +173,9 @@ static struct typec_switch_dev *tca_blk_get_typec_swi=
tch(struct platform_device
>  	return sw;
>  }
> =20
> -static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +static void tca_blk_put_typec_switch(void *data)
>  {
> -	typec_switch_unregister(sw);
> +	typec_switch_unregister(data);

[Severity: High]
This is a pre-existing issue, but does typec_switch_unregister() guarantee
that no consumers will invoke the .set callback afterwards?

If a consumer acquires the switch using fwnode_typec_switch_get() and holds
a reference, it appears typec_switch_unregister() removes the device from
sysfs but doesn't revoke the consumer's ability to call sw_dev->set().

Because imx_phy and tca are allocated with devm_kzalloc() during probe, they
are automatically freed when the provider unbinds. Could this lead to a
use-after-free if the consumer asynchronously calls typec_switch_set():

tca_blk_typec_switch_set()
    struct imx8mq_usb_phy *imx_phy =3D typec_switch_get_drvdata(sw);
    struct tca_blk *tca =3D imx_phy->tca;

where imx_phy has already been freed by the devm teardown?

>  }
> =20
>  static void tca_blk_orientation_set(struct tca_blk *tca,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx8mp-usb=
-phy-improvement-v6-0-00d95e270e4c@nxp.com?part=3D1
