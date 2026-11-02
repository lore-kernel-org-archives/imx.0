Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615567;
	b=KW3YDkSerVb/ooukymEhpsmT5fgFEDPntzQ2ON3Arr2+OcTeneXAQjjN6vlvZKz5yHxC
	 D9HPE1StZUINyFJ019e+3FVzvWJ/9jYPyNfqgMKbRAAkawXqRv2ioCkLY6S3/u73zIMn+
	 +HkB5W8mIOvzNUFU8J728y0vPWHFZneLltiozGC+u+kajXHksuysVVlG/Q4tn0LglfJuZ
	 WxEGYKuunEAVA9ErM/r10PkkPecrYdgOL/cZJx2S+aez8Llwj6jm3FTchVzZYl5E9mxmk
	 9ukQPxcBZkTwLvp33/vyqKEB7tcowst78er07HyGFaj70tW19eVnLP/4+918ZsIljbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615567;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=b951GRh3OyZuDeBi2fZgolgFQnAsTEZKoxHa/uDK9yY=;
	b=hCGriOOVZ5Twwj/iqiqPBAr2YrIQrGNg/SQkgvh5siCyrl7i51b5oCISUuc6nhvupVnJ
	 GEw2XcvEnVsZIdVeXvqwzbRoCoB6NxZzGx+jmSIY0eyYQ/jHM1h4wbVq/bYsP9nXNcyjh
	 dY29Rkp9M8z8PDRKYSq2ec3bsVLScU+FVfmLErSayz4UsTXbMip/rlBeaiIdRMvNkCbXS
	 WaPHJAaw6zj1k0qaXCpME/QtaMRNklNdx//7eWNcTcPc/jkrztbsjP9TsHn2s68ueKCBz
	 gbEhi+NjLjzEeLlPk5BoEOdQdVWK9KyvVEEsmFACd/GiGl5UaG2OKqA52+1Bl8XW0MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VM1U1GGG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC206606A326;
	Mon,  2 Nov 2026 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VM1U1GGG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4231F000C1;
	Mon,  2 Nov 2026 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615566;
	bh=b951GRh3OyZuDeBi2fZgolgFQnAsTEZKoxHa/uDK9yY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VM1U1GGGSk4otjPrjmHD9R/k5vzCy7BFkoHWWCZ3HM9kp3d+J3YIhtTCMLWhD/MEw
	 sFPtgHkXW9c0KYK1L3g6xeR4nYtdvu8BuysPV/HTDQmifCuOsM7jDGj3R2qqOSUFMH
	 WLc9IcHzmOk9LevqqlwW6oj34QiYSe2Ar8NyD3A2GlrsVpNO0b69BSKrZde65J7nO0
	 gmgJk+jeFAyOnpZxKxevmapHQ42MS8TwVb+w/mpII7Q94Ygj5+7sjHra0z5kvjWEqN
	 3788puuadYRSFwL2FR0R0hxQRKDNmEdK5bwxfZLcXQaHAQgCzzulDQP/8ilp1l7EA5
	 uh7oUc/Jdb5dg==
Message-ID: <sashiko-outbox-193263@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add ADLINK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dinesh kumar v" <dineshkumarv85@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261102102653.272056-2-dinesh.v@adlinktech.com>
References: <20261102065645.121046-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-1-dinesh.v@adlinktech.com>
 <20261102102653.272056-2-dinesh.v@adlinktech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:32:45 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: vendor-prefixes: adlink entry added out of alphabetica=
l order
- [Low] dt-bindings: vendor-prefixes: Author and Signed-off-by email mismat=
ch
--

commit dba9f5e74cdb4e9777b31ecece91c151c0904cf4
Author: Dinesh kumar v <dineshkumarv85@gmail.com>

dt-bindings: vendor-prefixes: Add ADLINK

This commit adds the adlink vendor prefix for ADLINK Technology Inc. to the
device tree vendor-prefixes schema.

>     dt-bindings: vendor-prefixes: Add ADLINK
>    =20
>     Add the ADLINK Technology Inc. vendor prefix for device tree
>     compatible strings used by ADLINK hardware.
>    =20
>     Signed-off-by: Dinesh kumar v <dinesh.v@adlinktech.com>

[Severity: Low]
The commit Author email address (dineshkumarv85@gmail.com) does not match t=
he
Signed-off-by email address (dinesh.v@adlinktech.com), which triggers a
checkpatch FROM_SIGN_OFF_MISMATCH warning. Should the Author and Signed-off=
-by
addresses be aligned?

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index c981a133753e9..eee3764fab51e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -70,6 +70,8 @@ patternProperties:
>      description: ADI Engineering, Inc.
>    "^admatec,.*":
>      description: admatec GmbH
> +  "^adlink,.*":
> +    description: ADLINK Technology Inc.

[Severity: Low]
The patternProperties list in
Documentation/devicetree/bindings/vendor-prefixes.yaml specifies:

  # Keep list in alphabetical order.

Should the "^adlink,.*" entry be placed before "^admatec,.*" rather than af=
ter
it to maintain alphabetical ordering?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102102653.2720=
56-1-dinesh.v@adlinktech.com?part=3D1
