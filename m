Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A112D949C;
	Sat, 30 May 2026 00:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101941; cv=none; b=egXO0qOsqQD9y3c63xrz7XHb8rqyM0nVd2mpM56gAcnRJAszrFjIeeqkUCGMPMvXGqJMU+PHpcnQvAOahLJMBMKZkZ6TcHV8q9DqDBtIvwrukOLzfnSo4qB0gIsbW0nMp1P3/dpTT53heeHSnQYBZ2R7NiR2LVvGvP282HM7KYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101941; c=relaxed/simple;
	bh=mDTjoYAMHPNsNKg+UJXkneJdqb4XyxRt+oryPID1FNY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RzDPA5H8I/NoxnGLXyFuLIg7S/viuQZbNLRMqTty8Zs/ftwq6oxWDD8w5CndoVUDveCS5z+wHQCHYWGu5Y5j8ycYDWAoEOUp3Ru4Zs3488mEoryhqqwBEsjwhkUA6NTFxgjoCq4Cnikt8b4qdeoM3XEf/nDCQBuqK4/EIuYGy6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5wpJSQv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5wpJSQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747721F00899;
	Sat, 30 May 2026 00:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101940;
	bh=if2wG8mIhL3ETWmdGxmnvfcmHyyINgszPMRptMkFy0o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b5wpJSQvDyysEBaqr8wrld97bgpz2EyPdtRs4Y5UxOzRKHMBAN5mSBA8vpGk4t5Lw
	 PYwFlLQ8j8Mq7QkXZ02Ktd4T5lzgh26ic6/p7DCahvzPGkb5zvKIdV9Y+bE0q5IWQ+
	 50XotPYIBMycavptDzYFxtgukJirgTckvjrYVu9ktFUGAliB6tOia49Z70OZkw1D6i
	 oDdk8EznUsv7hLmHtpmTy7n26cfDrkK1+6bxqlgkPTBhIAAOdv0iTjs+0zUx021Ccx
	 WXoI6NNIl/v/DpWOwxRU0QpvB+w9Rma4ghztPCWqU5pw3DwSSuhkOhvErD4j7bTd//
	 eu2KIBfVboeUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/23] i2c: pxa-pci: use platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260521-pdev-fwnode-ref-v1-11-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-11-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:40 +0000
Message-Id: <20260530004540.747721F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] OF node reference leak when replacing direct assignment with pla=
tform_device_set_of_node().
--

commit 97e00c5939b668c9a126c1fc7447ee82d933bd92
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

i2c: pxa-pci: use platform_device_set_of_node()
   =20
Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

> diff --git a/drivers/i2c/busses/i2c-pxa-pci.c b/drivers/i2c/busses/i2c-px=
a-pci.c
> index dbd542300f800..92a0647f08c69 100644
> --- a/drivers/i2c/busses/i2c-pxa-pci.c
> +++ b/drivers/i2c/busses/i2c-pxa-pci.c

[ ... ]

> @@ -76,7 +76,8 @@ static struct platform_device *add_i2c_device(struct pc=
i_dev *dev, int bar)
>  		goto out;
>  	}
>  	pdev->dev.parent =3D &dev->dev;
> -	pdev->dev.of_node =3D child;
> +
> +	platform_device_set_of_node(pdev, child);

[Severity: Medium]
Does this change result in an OF node reference leak?

Earlier in add_i2c_device(), the child node is acquired by breaking out of a
for_each_child_of_node loop, which holds a reference to the node:

	for_each_child_of_node(dev->dev.of_node, child) {
		...
		break;
	}

Previously, assigning pdev->dev.of_node =3D child implicitly transferred th=
is
reference to the platform device, which would eventually be released during
device cleanup.=20

However, platform_device_set_of_node explicitly acquires an additional
reference via of_node_get:

drivers/base/platform.c:platform_device_set_of_node() {
	...
	pdev->dev.of_node =3D of_node_get(np);
	...
}

Because the helper now manages its own reference, the original reference
held by the local child variable appears to be unconsumed. Should there
be an explicit of_node_put(child) called after platform_device_set_of_node
to prevent a leak?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D11
