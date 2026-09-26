Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532FC30C359;
	Sat, 26 Sep 2026 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432013; cv=none; b=FkXXFSF/xrJYOKBQSWngDs19ojLkkDI9V6PkKpLeVNTURzWtERPTqd3mLeTiljS0ZpPlYvSGnGQdGJMVL4DD9gV7h2EL6Ae97AcN74Vg+qfOZ+M72rMxx+j9YBWnyFNIRvKkPSdt0WvC0qhoamK8xUGz9IEYTfMrnfio+91sdy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432013; c=relaxed/simple;
	bh=xL4jL0qYn10t9N1GRcPcwdg7BihfKXb+LMCnVJw98Y4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mV+YPL/jfUZn9KZnQhjwfhSZu/51rOri8M51VyYb1w0voUypzhfKbrEQjbpCXYXa+rmEXVJBn9o5lxpBe+5ZjVrc8pEsMDhsSM7xV56mHVvcFohuJ0e9p0M9PTqtfhbBLMlzy/TXqcQ+e4p0ZBnFawBdC1mE44EK+ZvP15ue3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLGFEW5J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLGFEW5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9E41F000FF;
	Sat, 26 Sep 2026 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432012;
	bh=gP9lKKJmIaQMLobwgJ6hx1ZgrUELDKL2eU/+uJL75Qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XLGFEW5JJX6jrItDqGdSGnQnKAtBrugJfJv9/ZQO7Wm8OtqP4EGrUHqoBbIvKbnTU
	 TCPg73zzbLn6f6KV9Q69uCGEyMzusbZyfJTaqG4ExviXTn4cIbt0aSiCTbNvk214ld
	 ZxXNltWkuXvr7CYv0wD48wwz36ZHQiBU1HmceilywxK+sNig9J6jD/FxJZL8zjBg/S
	 AbeEGX50bd2Qkyf784jx0lOfRhYxSyitR0Hlmnh/tG/57G8BjAdwrJqJmhd4dXmVKk
	 ZDngLGIc7UzHLq4rE2zUuUo9mOnoAiJwar8/J/z04Mgyw+TrGh8QbOXppMWqS87jvb
	 itGJXb78TtBDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 02/11] dt-bindings: net: micrel: Fix RMII clock
 select property type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <6580cb8231c0ccada44d3e510374f6c21b65d283.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <6580cb8231c0ccada44d3e510374f6c21b65d283.1790344389.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 14:13:31 +0000
Message-Id: <20260926141331.9E9E41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: phy: micrel: of_property_read_bool() triggers warning when =
reading enum value
--

commit cad5067d21d36b9ce88edbe220886c31a7f2803b
Author: Stefano Radaelli <stefano.r@variscite.com>

dt-bindings: net: micrel: Fix RMII clock select property type

This commit modifies the micrel,rmii-reference-clock-select-25-mhz device
tree property from a boolean to an enum containing an integer value. This
change satisfies dt-schema requirements for properties ending in -mhz.

> diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Document=
ation/devicetree/bindings/net/micrel.yaml
> index 6fa568057b927..a1f876dc00de2 100644
> --- a/Documentation/devicetree/bindings/net/micrel.yaml
> +++ b/Documentation/devicetree/bindings/net/micrel.yaml
> @@ -63,6 +63,14 @@ properties:
>      minimum: 0
>      maximum: 3
> =20
> +  micrel,rmii-reference-clock-select-25-mhz:
> +    enum: [ 1 ]

[Severity: Medium]
Will changing this property to require an integer value cause the driver
to emit kernel warnings during probe?

The micrel driver currently parses this property using:

drivers/net/phy/micrel.c:kszphy_probe() {
        ...
        rmii_ref_clk_sel_25_mhz =3D of_property_read_bool(np,
                                "micrel,rmii-reference-clock-select-25-mhz"=
);
        ...
}

Because of_property_read_bool() explicitly checks if a boolean property has
a payload and triggers a pr_warn() if it does, updating device trees to=20
use "=3D <1>;" based on this binding will cause a warning to be emitted on
every probe.

Does the driver code also need to be updated to parse this property as an=20
integer instead of a boolean to prevent these warnings?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344389.gi=
t.stefano.r@variscite.com?part=3D2
