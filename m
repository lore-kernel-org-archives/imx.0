Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16A2BE656;
	Fri, 21 Aug 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315938; cv=none; b=N0WyAN5vcOp3jaHOg5/ssRy+TUsuwapfMOh2ci6QKa69O6ukE0LgyIIYBxwOoUugJYcfFmMW3V3zTWi7eg2ECukpAPVl3+ilvrS7EL4l1NzhqmTiO9qUIHs1c/ekwAOnVy/K6Xv4DQswU+nZ37TBU3JT9vpL3D6uOr5v6B4dM4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315938; c=relaxed/simple;
	bh=GCEFGiPO3MHhmHxwDGkpwPvFrj5mIubwUnV14EH4BoQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=poQMZm2Kb2wvrnCoXtAy+TbWPGPFvcTCmJsydgWM1Pjt7FFeS+fpV+E8KeOI57wq/8nMK8vlXbUvgL144NczMlEkWfzjqLSHjYTXBczkakEeBSEtqXs35vIbku5231zUKOvVU7T8lELoMFZZxBB80N9tH4g81GPW4ywVhP1b4nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PP8XESvv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PP8XESvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FC71F000E9;
	Fri, 21 Aug 2026 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787315936;
	bh=PV5I+BNxFs3MEOuJ/45AMiLb+EVE9pjT9Q4dsv5AO9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PP8XESvvZ0QzsVuWdEZdjo5OM6GALBqrrqtJeIBq/l0RVOas6mfuAuq/kvylL6zxL
	 xbhcs0JJniz9KxPtGIMZs2yjpgdj+GYYsuTDsNV2wOcyspOxJKmUdLKso+84r7O9cC
	 Ek4gQs52z8KCpSSotb/N9nNmTuat2UQW8PkBC5AxJcyp6Akdish7srHWCgjmB3LK7B
	 9pi2x1IPJxEff1xdrqR75jueY2pP56ZaY9RXBKGwMaJK9x4M8GELRT4xXIsST+EXXS
	 EYWkPKiiE7/kc0goHF+O8QYpLTIiQs5QVOUCJKUzyIUFQJJ6S0MJqfbVAR9aXQuE3M
	 R4PBWbMzTxRFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7
 boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>
References: <cover.1787314780.git.stefano.r@variscite.com>
 <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:38:55 +0000
Message-Id: <20260821123856.26FC71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Mismatch between commit message and schema definition regarding =
v2 WM8731 hardware configurations.
- [Low] YAML formatting violates the 'indent-sequences: true' rule, causing=
 yamllint validation failures.
--

--- Patch [1]: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-=
MX7 boards ---
commit 52d9fb69ce3c9933762d9090a8a1790cd333bffd
Author: Stefano Radaelli <stefano.r@variscite.com>

dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

> Both the first and second hardware revisions are supported, with
> eMMC, NAND and WM8731 configurations.

[Severity: Medium]
Does the v2 hardware revision actually support the WM8731 configurations?

The commit message states these configurations are supported for both hardw=
are
revisions, but the expected compatible strings for v2 (such as
variscite,var-som-imx7d-v2-emmc-wm8731-mx7customboard and
variscite,var-som-imx7d-v2-nand-wm8731-mx7customboard) are omitted from the
v2 enum in the schema below.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..20a225420d20b 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
[ ... ]
> +      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
> +        oneOf:
> +          - items:
> +            - enum:

[Severity: Low]
Will this formatting fail the kernel's yamllint checks during
make dt_binding_check?

The block sequences (- enum: and - const:) under the items: keys are
placed at the exact same indentation level as their parent mapping key. The
indent-sequences: true rule requires them to be indented further to pass
schema validation checks.

> +                - variscite,var-som-imx7d-emmc-mx7customboard
[ ... ]
> +          - items:
> +            - enum:
> +                - variscite,var-som-imx7d-v2-emmc-mx7customboard
> +                - variscite,var-som-imx7d-v2-nand-mx7customboard
> +            - const: variscite,var-som-imx7d-v2
> +            - const: fsl,imx7d

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787314780.gi=
t.stefano.r@variscite.com?part=3D1
