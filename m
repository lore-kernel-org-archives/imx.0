Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4E217BCA;
	Mon, 18 May 2026 18:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129208; cv=none; b=GikIzx1qsPxphE3n6Gz++YAzwj+EsmQAq/oB08UG0tYcT6Qh9TeAnW7fJny1tZDpP+tLadgxIlmnWKPIrY9S2b0Gx9bKHIIhNFPnaidQkWWtGZ+WLp918LO9fnx6swV8odNKK4g4JuBRg2GGq+yz3NAw1sLthjESRxxmuiRD8ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129208; c=relaxed/simple;
	bh=LGKGSMUN4o8qJprgckf5sju9UjIfUozUpvum/hvdi4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gsf0hXM6dmy4L+U3svWDur0ye7kR+jlC+3xYRPC9b3kglA9NcsqwFPhpE4YQtAI5p/f7lYahlXAU05Cw+hnpyTILxxYjlxMGxUZgeTiIA0OCiawrYg3oq6T86p67kwGpczdC4R0Rfmn7hk6XX8gp5D02mVK8eyUyDwToOl1uzyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgFJPYUR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgFJPYUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13424C2BCF6;
	Mon, 18 May 2026 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779129208;
	bh=LGKGSMUN4o8qJprgckf5sju9UjIfUozUpvum/hvdi4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cgFJPYURhIOG9dJmQHfBDUx+U48eMNN16jXyMNo+FCMHw+qrLbkKBw0ur62totE8y
	 owDOudIJi520iNEHAd6F3zSdx11g75JJZvxiv0TKQvonsshJo0WJu6M+vMesLv+2rX
	 ri101/DuQAEEjp8Jy5zqcqqwH1DvGmAtRGHKdq23MRnfBJ3qEwAGkQMD4HKQlbZDR6
	 T/6h5jp3tfZTPzVAaKwW3QNDtSoxzuA3jtyeSxXi3i5v7gBlqUYn+DAixJBT3ffPZS
	 rW7NGZLqwwjQKqAduDh2D6uzxlCVEhW2ztl7/wE6DVaUqG62EfkCKa7CFmpCV7uHNt
	 Al7uAY48tKFcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/23] drm: bridge: dw_hdmi: Free IRQ before CEC
 adapter is unregistered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260518180206.2480119-4-jonas@kwiboo.se>
References: <20260518180206.2480119-4-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 18:33:27 +0000
Message-Id: <20260518183328.13424C2BCF6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Freeing the shared IRQ before masking the hardware interrupt sourc=
e creates a race condition that can lead to an unhandled interrupt storm, p=
ermanently disabling the shared IRQ line.
--

commit 860a0518c5583dda606c670b609794b60e6bc07b
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Free IRQ before CEC adapter is unregistered

This commit explicitly frees the IRQ before the CEC adapter is unregistered
to prevent a use-after-free issue. This addresses a KASAN slab-use-after-fr=
ee
report triggered during device unbind when the devres release action frees
the IRQ.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/=
drm/bridge/synopsys/dw-hdmi-cec.c
> index 9549dabde941c..67a2a242d3ca9 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> @@ -309,6 +309,7 @@ static void dw_hdmi_cec_remove(struct platform_device=
 *pdev)
>  	struct dw_hdmi_cec *cec =3D platform_get_drvdata(pdev);
> =20
>  	cec_notifier_cec_adap_unregister(cec->notify, cec->adap);
> +	devm_free_irq(&pdev->dev, cec->irq, cec->adap);

Does this sequence create a race condition that could result in an unhandled
interrupt storm?

The dw-hdmi-cec driver shares this IRQ line with the main dw-hdmi driver.
By freeing the IRQ handler before calling cec_unregister_adapter(), the
hardware CEC interrupts might still be unmasked and active.

If the CEC hardware asserts an interrupt during this window, the shared IRQ
line will go high. The remaining handlers on that line won't clear the CEC
interrupt, returning IRQ_NONE.

This could lead to an interrupt storm, causing the kernel to permanently
disable the shared IRQ line and break the main dw-hdmi driver's functionali=
ty.

Should the CEC hardware interrupts be explicitly masked before
devm_free_irq() is called?

>  	cec_unregister_adapter(cec->adap);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518180206.2480=
119-1-jonas@kwiboo.se?part=3D3
