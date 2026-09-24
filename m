Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8067947F76C;
	Thu, 24 Sep 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255461; cv=none; b=MAhydyWQc2s3L0UUH6hfCNN86HzG3jv9df/fNkt2eL+8glD23Ke0xVoxr3k/lIrHAXTx0lBInXFYK4+tTTrk+bOO6ZtmHOI+h7bjoset3CXtmzq5kWQU1FLgD/uk1ZWZbWjSxrVFJL5/WMeqKbmun2khCPYMJlQyMqLNOG8p9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255461; c=relaxed/simple;
	bh=Kt1xF+vojZo0Os/m98Dh+tvp+b2jYMeFiteI81OEg2Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bNYwMd7Y9X6x4xdcGoN3t3hYD2/LYTWwHEMixrbCn+G6RBwV//BWe/lsrkoz6WK3ZxnYbWagGPxqY+KvOWoGjF/C/Qxu1MKd88T4ATP60NjtmZ5Revt7qU+4AytMqhaSPrNusxHRH+fad692DpdRNNJ1ZJvYbfFox3jIOC6GIBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv+lXxbQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv+lXxbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3611F000FF;
	Thu, 24 Sep 2026 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255460;
	bh=jFQEbtSBRfeEaDK9XYnVq9As9XqEtkmlEiq05JFXgAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nv+lXxbQl3Scgr1NGQNVA963FgtOYnOPyB2iqTwy60qLIPuyqrHvpRk3wYmdHH9hC
	 eW8mwT8PWOsMkx3FjzwOrMMLeEKd8pZf44K2sqbYQpBstMOYwGK1Aj0EEbqmEg5hnV
	 8oQw+5a42Nro3qLWFOaEyQf9g5oo3OHUgJMjAGldJvni8mLrpbvjimyHh55c8ufNf8
	 0N6exsvTPcPVPps9ShRyVOnnl/K4ZTpkGwX6nIaX1GhiSY66PecRZaXwYp1809rNBP
	 V3Iss30udncvDN9yAYPKM8XDkKyGyBcJVaZNPHQ+KZ7IacoEKR6ywvmK0JlE+Wr1hU
	 +6KYw1+xrs0wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924130453.196299-3-benjamin.gaignard@collabora.com>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:10:59 +0000
Message-Id: <20260924131059.AF3611F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: removing deprecated compatible string breaks ABI va=
lidation
--

commit 3baa6281627fab6fa7ca3eb8e9793abf829e4442
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu

This commit removes the deprecated nxp,imx8mq-vpu compatible string from the
Device Tree binding after driver clean up.

> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml =
b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 19528262810a5..69619d2c86fa0 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -14,12 +14,10 @@ description:
> =20
>  properties:
>    compatible:
> -    oneOf:
> -      - const: nxp,imx8mq-vpu
> -        deprecated: true

[Severity: Medium]
Does removing this compatible string break ABI validation for older hardware
descriptions?

Device Tree bindings describe hardware and are generally considered a stabl=
e,
OS-independent ABI. While Linux driver support can be removed during cleanu=
p,
shouldn't the schema retain deprecated compatible strings indefinitely (with
deprecated: true) to preserve backwards compatibility?

Removing it entirely means existing or out-of-tree Device Tree source files
and binaries that still use the nxp,imx8mq-vpu string will fail dtbs_check
schema validation with an undocumented compatible error.

> -      - const: nxp,imx8mq-vpu-g1
> -      - const: nxp,imx8mq-vpu-g2
> -      - const: nxp,imx8mm-vpu-g1
> +    enum:
> +      - nxp,imx8mq-vpu-g1
> +      - nxp,imx8mq-vpu-g2
> +      - nxp,imx8mm-vpu-g1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924130453.1962=
99-1-benjamin.gaignard@collabora.com?part=3D2
