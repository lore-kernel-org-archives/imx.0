Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2177C20A5C4;
	Sun, 13 Sep 2026 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303006; cv=none; b=LzC12rY1w1Y7lvF8eutVc22bvhCAnheYuyrij7Jn8P65H7KRrFzE7gj3oJtGS0HguBZpC1w7YmaObnvvE2ZJ22XKDDt45zcRWHzo9MTd27Y1otBE6cUGHofsyW7LgkwiLY6wQ+TKdWr8aleLHJrbAXfWK2nLnF0peRdsKxM5XN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303006; c=relaxed/simple;
	bh=1ssd5Yr2qT7IaMhW0fYIUvaWYJrAfokPMc0SmNZpqCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tYbJC7mKrP6kTV7uMjn2iz/C150tpdlj28SMXFIkeSY94ldZOZObui7hKA6S5QJwGyPylthocOyD4LaypnJfxZr+HQDv7LX3BbPVpZ85MuaY7/KMoDFAShV1uNeRIhyk3Jfp7Czp6AyF/6amC3/hI5ApEQoWG2Up1W+gVM7VIAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZKZSJ07; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZKZSJ07"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456621F000FF;
	Sun, 13 Sep 2026 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789303004;
	bh=beuAr0PMWvUVSQrOiwOaO94HdL2BIYJYpR5pWD0hU+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZKZSJ07YoU0FX8exkJ5geEuTfX3eF5/do24Rb/g8vz/UzghvbE7BwMoc3Vv9mR4o
	 KBUjEJwiYdCCxDmxNzk8LYsaXSCDmB7ZxLXO1+fL/Hp6NCAUAbmnniCH5LTGKGHRwA
	 Ce5iwWZz+kzZlvmZmnLWvdTzo0TPYoD32igJDM0l8u59rX5EvPSiu/W9cWCmijGaBb
	 bgggo7ObVV5BJ/ssAtp3Y88Nxgxa5DB+BA1TAowlmgXhebX5/iUxXYyYqjUcD8KHZL
	 mPgq1n6JQSjF1BDbueuK47WSLnFL/Dw0FVPVjSAXibn/BJCby/emB4sOmUjy80Skdb
	 ngqK1dJeMSKBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: Use consistent indentation in the
 example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 12:36:43 +0000
Message-Id: <20260913123644.456621F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Undocumented modification of node name and removal of node label in=
 cirrus,cs42l42.yaml.
--

commit 5295b0f4ddd7e74d1f23eafb35de82eb0e0a7330
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

ASoC: dt-bindings: Use consistent indentation in the example

This commit corrects indentation in several DT binding examples to use
consistent 2- or 4-spaces spacing, resolving dt-check-style warnings. The
commit message also notes a generic node name correction specifically for
dialog,da7219.yaml.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index af599d8735e26..ab4c7d22dc0eb 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -199,28 +199,28 @@ examples:
>    - |
>      #include <dt-bindings/sound/cs42l42.h>
>      i2c {
> -      #address-cells =3D <1>;
> -      #size-cells =3D <0>;
> -
> -      cs42l42: cs42l42@48 {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        audio-codec@48 {

[Severity: Low]
The commit message explicitly notes: "While changing the lines, correct also
node name to be generic in dialog,da7219.yaml."

Does this patch unintentionally also rename the node and drop the label here
in cirrus,cs42l42.yaml without documenting it in the commit message?

> -          compatible =3D "cirrus,cs42l42";
> -          reg =3D <0x48>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913123234.9998=
8-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
