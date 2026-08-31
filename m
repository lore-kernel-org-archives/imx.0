Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8172B3955D7;
	Mon, 31 Aug 2026 21:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212514; cv=none; b=HeqNDgX4TFq//f1IC9VR5Ct+/pUe/AbVOpkdpwtL1NvPxzjmXGYp7olsxw5g9gzIX7X0kHtNVk6g16IcHESwkxoNHJiktx7s/PeXA4qBo2U5IsQzEagqx04uePp90tUdzLnpZVuyl+Z0Sfl3HgqyqCKOz/thFZVZfqBnM67bikg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212514; c=relaxed/simple;
	bh=qaV1tTloGcys7j3cgzp5dmXEaVc5v5QwO7uVaKVw0JM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PmujJnSzcIkvSgsnkpEjUWP5tiGbMLe3WfM4O/BggSwe2WM3U03O2/iED1tEGSl9ZYAwcZhJFvBt24gBAH6NridPFi91BqdzklWR8yizx8CE1fVAaNe4zVLT3nEonE5DU+KnclAbm4gVJbZfpptKdzgXchgxSjteAKg/nQNx928=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H2Cl36Xc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H2Cl36Xc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00371F000E9;
	Mon, 31 Aug 2026 21:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788212513;
	bh=TEEmGKDjyqxS4qnXRtE4P/e+M/1XaA5wZcIfKpKTX0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H2Cl36XcRboZBYSxpbuIlyimZBwJnRvX0ygDjydb/r2wplHhS3ZC6Xfablt6os+HW
	 H8FeoKABYjDJB3vxYE5sFDZVrQicGVXJNRCsPfH0oUH50ixgL0E6Rszt9WULwBRQp7
	 d58wd8m0KrlLXhm/J4E1xOFUq5suODDCvi/cNJ9sjA0OKP4x7PvwLG2Xqim+1Dceov
	 JqfkroAI9Qvn+8jAnxsXlKyrZ98L89zzRL/sHFq1EQv2reNxHDnZpjFfJZrpkUH37J
	 H7GpciXXI2lt6k0d65S+4RF3wHPuCR65XtXixUVO5GK9aTpo+wpCpSZTgtTKxir1gf
	 76fsH/CmcGiQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa
 fallback to dlg,da9052
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
References: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 21:41:52 +0000
Message-Id: <20260831214152.E00371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces an inconsistency by explicitly allowing the le=
gacy fallback compatible string `dlg,da9053-aa` with `dlg,da9052`, but omit=
ting `dlg,da9053` which uses the exact same pattern.
--

commit abd213140dc2339cb1dfe32c3ccb7bfd92c4ba9b
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: mfd: da9052: allow dlg,da9053-aa fallback to dlg,da9052

This patch adds a fallback compatible string schema allowing dlg,da9053-aa =
to
fall back to dlg,da9052 in order to resolve a legacy platform check_dtbs
warning.

> diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml b/Docu=
mentation/devicetree/bindings/mfd/dlg,da9052.yaml
> index 1103a8cc5cea4..d1d23c7c4d0c2 100644
> --- a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> +++ b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> @@ -18,6 +18,10 @@ properties:
>            - dlg,da9053-bb
>            - dlg,da9053-bc
>            - dlg,da9052
> +      - items:
> +          - enum:
> +              - dlg,da9053-aa
> +          - const: dlg,da9052

[Severity: Low]
Does this fallback allowance also need to include the plain dlg,da9053 vari=
ant
to completely fix the warnings?

Looking at arch/arm/boot/dts/nxp/imx/imx53-smd.dts, the pmic node still
relies on the missing fallback pattern:

		compatible =3D "dlg,da9053", "dlg,da9052";

Without including dlg,da9053 in the enum alongside dlg,da9053-aa, won't
the legacy device tree node continue to generate a dtbs_check warning?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831201522.5129=
4-1-Frank.Li@oss.nxp.com?part=3D1
