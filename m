Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A741D4C1;
	Tue,  7 Jul 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430707; cv=none; b=CReDWdFZvadny/lTvOpO0bVmei7evj0iKCOceAnYyHFquoIxjJxoY1xMIKWSibFlDDwoz2Ix2gtBygAuxZqyBcSpySSTYj1CWAE9MsXCpJEe2e9U8QceEsEw3jPwSJPEeMewR+6R2nF5KYZt8ZFcub2qs0QrQi5PxF3e9C1yV1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430707; c=relaxed/simple;
	bh=4CASNmAXohnTPsJYPMGP6uwhkCLVlpmof8tPI1UAjjU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hYo8B61cUE+gX1zedsy2xTf1YYZmf3i9aJt4Av1VdmXBLbTWoXrBCGC8fGRtp3fZAY/1/lNA5Ir0CsmaAbzCx1qczEnsbpK2GmsHXaPik6V2batWIudotFb+GeOn3cKNxMfnSo26hF0pLNvhLgLuLxZtN6sJIqV7JsVMNPwXsb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXn3BDny; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXn3BDny"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E75B1F00A3D;
	Tue,  7 Jul 2026 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430706;
	bh=4CASNmAXohnTPsJYPMGP6uwhkCLVlpmof8tPI1UAjjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXn3BDnywSp55a/ybkxG8YD6kLaOR9ZGtgm/yLrV0YCfZOmZVRSYRiSSdDQBIPwXT
	 dTy6qAyTgRJ9AkaoS/TJJPmoNK8tQ247Jg+Fidjg576QuRveSbiLNVLAbvlTxmmUF1
	 Fp32dQ6nDGvUMtkS/VNTejJbDa1r/xgBz0mX8O3mgrsz0bvqLylDv0YpCIO2Iz4vy8
	 JZpFgojF1G6GI1CQR9l+5KOdM8WhruUHEjGSZ0e2zozimSQydtdvMcIXQYXFpVMEdW
	 M4PJ/NKR80uOmv1j+eMRXvqSBwSycSrIx1vo9lyh37T7V0wzF8unJeZyqU7ATKjaIJ
	 gnfGVJpBivaUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 17/20] usb: chipidea: use
 platform_device_set_of_node_from_dev()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-17-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-17-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:25:04 +0000
Message-Id: <20260707132505.1E75B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node from another device for
> dynamically allocated platform devices with the provided helper.
>=20
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Link: https://lore.kernel.org/r/20211215225646.1997946-1-robh@kernel.org
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D17

