Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906252BE639;
	Fri, 15 May 2026 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876035; cv=none; b=BP5Fm5wMTbdcJWTdtWwikAEdNZOjoQxjsqHX2RLBdawkgPHwLePPcXc/Cvj0LTccJupyGZ+Hm5XDmvetuzL07Xv+GEjUeGY3hi8/NVj4fyBQ0Oyo3wfBhwYhiK2C3nEiWbx04Gy/pQMi3xMuMRSY1ukvdbj/EjJyAqlriPgyqEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876035; c=relaxed/simple;
	bh=XG6aG8p+9EFzyM79pK1EYGPw2r3vm5VMkqiS2VrNnU0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oEoOs9qfhQ4G4WsmVz5f+uZhN/bLeixoVWqLUZ7lkJ+fJE1YK+pY7sbeSKKKWD3YkYZk1ln0z91X6hBkE9iUBwxqsQ58RhgFR5hAm5XxMHXg/EFaLsDGeXixvkKx1AJKR/kxgIerlXCwrtIfFl2t4sjISwM2SFXA942MPsW3Zyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wos76SoQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wos76SoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E168C2BCB0;
	Fri, 15 May 2026 20:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778876035;
	bh=XG6aG8p+9EFzyM79pK1EYGPw2r3vm5VMkqiS2VrNnU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Wos76SoQJtrLDuUOPii9tZnMDsEGRih1hjAKGNajmdpNH18YOs6vrQNyu+8tUM10y
	 n1mponLsOxS738uSZrEEnPiD8UruVoiIabQAkf95ceKEKQu+0XVbrbgQVtzWnmSKA3
	 ZnTbW15FRK8I0t8H/0vpxgc7SjNaD1BA12DtECoSDzXwCIDJFJShSnLRvAYnhPpuEI
	 tFdyyoYcNjbap4V8q+9Anu92LEwWLCe4a1h8+IZ8y+i/EATq0JyIBYwvksH3wYwC1t
	 5bo/Cr7o6uBniDFkcEFp4woZiXlaDe3F94CLsy0itinjADrUOEuF1PH3Dt2p+ngbr6
	 Bf0gi7Ab2eIdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: display: simple: add avic,tm097tdh02
 panel
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260515195935.2415466-1-Frank.Li@oss.nxp.com>
References: <20260515195935.2415466-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 20:13:54 +0000
Message-Id: <20260515201355.1E168C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit adds the `avic,tm097tdh02` compatible string to the d=
evice tree bindings schema but fails to add the corresponding driver match =
data in the `panel-simple` driver, while the schema incorrectly rejects fal=
lback strings.
- [Low] Typo in the commit message: 'compatilbe'.
--

commit 6c3fff393da11c29533acb6535efaaa08a1b9910
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: display: simple: add avic,tm097tdh02 panel

This commit adds the compatible string for the AVIC Optoelectronics 9.7"
panel to the simple panel device tree bindings schema.

> dt-bindings: display: simple: add avic,tm097tdh02 panel
>
> Add compatilbe string avic,tm097tdh02 for AVIC Optoelectronics 9.7".

This isn't a bug, but there is a typo (compatilbe) in the commit message.

> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 3e41ed0ef5d51..80e7c6420b289 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -63,6 +63,8 @@ properties:
>        - auo,p320hvn03
>          # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
>        - avic,tm070ddh03
> +        # Shanghai AVIC Optoelectronics 9.7" 1024x600 color TFT-LCD panel
> +      - avic,tm097tdh02

Does this new compatible string also need to be added to the match table in
the panel-simple.c driver?

The panel-simple.yaml schema restricts the compatible property to a single
string since it is added under an enum. If a device tree uses only the
avic,tm097tdh02 string to pass schema validation, the driver will silently
fail to probe at runtime because the string is missing from the driver's
match table.

Conversely, if a device tree relies on a fallback string to ensure the driv=
er
probes successfully, the schema validation will fail because it does not
currently accept an array of strings for this panel.

Should the schema be updated to allow a fallback string, or should the driv=
er
be updated to match this standalone string directly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515195935.2415=
466-1-Frank.Li@oss.nxp.com?part=3D1
