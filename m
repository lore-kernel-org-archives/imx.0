Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B2E3E3C47;
	Wed, 24 Jun 2026 20:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334622; cv=none; b=etRbfGNv+P2dQof0TOohfDxttJcOZ4hvk+hhs9Rr2dzAw8dEqmT8ZdaEYGCfaUFcQLnyvCloQoZdRHXfS7qxtdBo6XRyGrnuGN/KiOevHsAh+kbZsDu3kWFisg7gLlV6/MtdMjZEHF1RkQCNcxQrl2QE3SMwDO8zBlXKHTfGIhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334622; c=relaxed/simple;
	bh=ZFg4gWniuY2FkpKpwsLJrlXtY4QHa6XKiXxpiHV4jqI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T2PWAK9hJ04JSaDJNZ7HzT/HL7pE2WCTPWkaCNZ9CZaJyNJ5ZDSTv/+s12G6l+zPPGM4AEx/ARE00V3HbwSpnpYeP6mOCm4Sb2jTN0ONEA2XlB0OScEkSmiP7gYizAQP20B50p4C23hzgHGQkiBa5CAHxUE7U0kyhxBIcy9Yd4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYqtU5jT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYqtU5jT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63B01F000E9;
	Wed, 24 Jun 2026 20:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782334620;
	bh=2nGRFAaV5wbacsyupEqzn3lqUR0s1RZunjhmlx7s1mA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UYqtU5jTe57BC30ruUOINeqJYJD7sVJIrexFetEZVtzFfS7jBql3Z94Q8lIbhFfsF
	 k3HeJHXptXBbIV5iEePbJ4DoAd0ZqhiDiNKEG6gCsXd6VTX5WxyXGmaOBx+05/Yi+t
	 4/x+OppGKQEjybn2WBeocYSRFZSJWmPTHTyyQAMnG6ZswWADZ3AwnnxCwZsPQai/tw
	 tEUJL2vO687seASlOhBjCFGGZXh0OvE4Gcn2XXGcGTFlm3eivzwDazYf2u4AlTAXmv
	 /SMMdPdRbYLzLpmV4Ueez1X/6JbWNr8bekAn0QWBi+SgKRvVoyjpmJA9DjvRtSelAO
	 4sCiQ0o7oGUPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/9] media: mc-entity: Store parsed V4L2 fwnode
 endpoint in media_pad
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 20:56:59 +0000
Message-Id: <20260624205659.C63B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Captured fwnode endpoint contains a dangling pointer to `local=
_fwnode` if the caller drops its reference after parsing.
- [Medium] Embedding a large, V4L2-specific `struct v4l2_fwnode_endpoint` i=
nto the generic Media Controller `struct media_pad` breaks subsystem abstra=
ction and unconditionally bloats memory.
--

commit 7acfb56349845d6638c963825f0f6b087ebaa54d
Author: Frank Li <Frank.Li@nxp.com>

media: mc-entity: Store parsed V4L2 fwnode endpoint in media_pad

This commit captures the parsed v4l2 fwnode endpoint information directly
within struct media_pad to allow reuse by consumers without reparsing.

> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index d9b72cd87d524..4a3785cd9f370 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -20,6 +20,8 @@
>  #include <linux/minmax.h>
>  #include <linux/types.h>
> =20
> +#include <media/v4l2-fwnode.h>
> +

[Severity: Medium]
Does this include break subsystem isolation? struct media_pad is a generic
structure used across several subsystems like alsa, dvb, drm, and iio.
Including a v4l2-specific header here appears to tie the generic media
controller to v4l2.

[ ... ]

> @@ -240,7 +243,7 @@ struct media_pad {
>  	u16 num_links;
>  	enum media_pad_signal_type sig_type;
>  	unsigned long flags;
> -
> +	struct v4l2_fwnode_endpoint vep;

[Severity: Medium]
Is it expected to embed this v4l2-specific structure into every generic
media_pad? The v4l2_fwnode_endpoint struct is quite large, and
unconditionally embedding it adds memory overhead for all non-v4l2
entities that do not use fwnode endpoints.

[Severity: Critical]
Can this cause a use-after-free regression with the fwnode pointers?

When the endpoint is parsed, v4l2_fwnode_endpoint_parse() assigns the
fwnode to vep->base.local_fwnode without taking a reference count. This
was safe when vep was a transient stack variable, but now that it is
stored persistently in the media_pad, the caller might drop the
reference.

For example, if the caller iterates using a scoped iterator:

drivers/media/v4l2-core/v4l2-fwnode.c:v4l2_async_nf_parse_fwnode() {
    ...
    fwnode_graph_for_each_endpoint_scoped(dev_fwnode(dev), ep) {
        ret =3D v4l2_fwnode_endpoint_parse(ep, &pad->vep);
    ...
}

The scoped iterator automatically drops the reference to ep at the end
of the iteration, leaving pad->vep.base.local_fwnode as a dangling
pointer.

Later access or pointer comparisons, like in v4l2_common_notifier_bound(),
might dereference freed memory if the fwnode is deleted.

>  	/*
>  	 * The fields below are private, and should only be accessed via
>  	 * appropriate functions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-imx8qxp_pc=
am-v6-0-4b3f45920d2f@nxp.com?part=3D1
