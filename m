Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5AB3C2B8F;
	Mon, 31 Aug 2026 08:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164835; cv=none; b=rLIrgcK26LlQA3IhzrPuRmC5hYzwk9sb7Bgc+2G1SkPjSIAoWoEJPK0TQChxfsbLVjIixdQdeAVqPtWDD2AGJVhIYFVWrQUzuJ0vXAheVMwPL9mTmEvhlEkNoeruR6LHtqnh+Zj0VOKaTGQAZrfqenhg2QCX4tD/R8gySYpwim4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164835; c=relaxed/simple;
	bh=tGYvf++Ra40kkkdeX/Hkc0DZoyi8J5wxF2iZMJ+M4sw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R51r6P5eiorg/tE1o2Qh1AEwPevjDDbun7qhqOw+7YBhx+uULsqCh2ypSq4Mb44OB9qttnBTvg3k3YTqUbuewF6WHZy00572EUnwYMcmcn/jaQzmhbwi+pXTxkM6BrlZ9+3hVNk6VgoiINafB3huCrVmpxGIbA8R4q5AC1MYnJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UfDSSzYp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UfDSSzYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035A41F00A3D;
	Mon, 31 Aug 2026 08:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788164834;
	bh=DCqC6tEU5QVGatP2a5rEJRXD3/F/+lGDygXx3+EbVpE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UfDSSzYp9saK/RjS7beI+l1UHeLo55rRAQexn9q6Iefo+bBaK10iTeJwHbojnyd8R
	 vSF8FLMu+/82ksesz7HMPIDtokHbFhN964/pQVhF4dBtRG8PlpoQbJdVsqTJ7fn8G+
	 wqy7ztbhS3Lmoc9RQQ/c23E7QIn6kG6ESh9wjMdED1qVzOhJxHiI3YcTqWi3lQSx7j
	 B0hLjr0E34jJd97dLSIxAuqoK/vlOWgW3Rtm+fWW6MForTBaLXr/iS68rE4BXc7FIh
	 1XGX9F1Q6hbXlKKnE/yZAk5ltGKSwAR4t8P7vnCRd9/h2YMVrSgPnmDSJDDzpAfiEm
	 +1yx2G+206zfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/5] dt-bindings: arm: fsl: add compatible for new
 Skov i.MX8MP variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-4-e2e635452ba9@pengutronix.de>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
 <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-4-e2e635452ba9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:27:13 +0000
Message-Id: <20260831082714.035A41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible string is added to a 2-item schema block, but it=
s device tree uses a 3-item compatible array, which will fail dtbs_check.
--

commit 431593d91ace715961413533bdc962a1b95958b2
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

dt-bindings: arm: fsl: add compatible for new Skov i.MX8MP variant

In preparation for adding a new device tree variant with a different 7"
panel, this commit describes the DT compatible in the binding.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 55d0b682a7305..aaa9d18a241f8 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1147,6 +1147,7 @@ properties:
>                - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP clim=
ate control with 10.1" panel
>                - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate contro=
l without panel
>                - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate contr=
ol with LED frontplate
> +              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP =
climate control with 7" JuTouch panel

[Severity: Low]
Will this compatible string definition cause schema validation to fail when
dtbs_check is run?

The new compatible string is being added to an items array under a oneOf
branch that expects exactly two items (the board string followed by
"fsl,imx8mp").

However, as introduced in the follow-up patch, the device tree defines three
compatible strings:

    compatible =3D "skov,imx8mp-skov-revc-jutouch-jt070tm041",
                 "skov,imx8mp-skov-revc-touch",
                 "fsl,imx8mp";

Could this cause dtbs_check to flag the three-item array as too long?

>                - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP =
climate control with 10" JuTouch panel
>                - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate=
 control with 7" panel
>                - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate contr=
ol revision C with touch panel

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-v7-0-topic=
-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de?part=3D4
