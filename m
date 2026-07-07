Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885683081BE;
	Tue,  7 Jul 2026 09:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416010; cv=none; b=MRFtNnIMkKUTLghD+QuZ67p+/oKDyrVs8wPscdBxOOj3+rFqvi1oOBroMciAiEvkVmhfSg52Jp9ma7shRhxf4B+X28aLjbobqwChYH3GhNO2dnyJQp3SpRAIP26atUjrVITVwNruwA0G36p6nYoMwk7SsP989SPKpDlGiGcJ1fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416010; c=relaxed/simple;
	bh=P+qnuMnPVKw+S23mG/afUWlqNmPjA3vhnVWukRopopM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Js3TSEdQH+FNawbsmUoCqwZiRiveOYWOb+FCNLac8SY+exgvQM2Cj17RFe9b40XuqhJ2ApKiiavM9DUQEWjZI18PISiDe0Y53cvRZx6tXPmm11+Szk+QVoXCYA8Jrls4QmuW4d1Z60V5r/d6VBXXMSXeI7geZdWm4Sqi49SxFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zr9ck7kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zr9ck7kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E771F000E9;
	Tue,  7 Jul 2026 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783416009;
	bh=iVBy8jeipDQv0VjKFpZMos1H2x/2c1BmEL3GceFJcmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zr9ck7kIZm7xRnpPD8Aj5GOCMoUsHanv/xNtOLTnEib3zgtRk5xt4/3cf4MpoeVVI
	 3zMj2as2jJIJ7IiZM7H8wUK59homfqUURh64KljlqGROgHwEINCkhUWKqKyxwajiTN
	 c0zJPttGrA4aP0MFxmEno9JIJXXJshf4yz7BJJ0uS+rzFXInI6Cw1oSQajcmMZjnq7
	 Q6MdRVqt0X6UcRWhYqZHntKrvgBW4jlf9iSk5paYBro3coqZ910s68qfxzHHrYHEii
	 HDFlm6TEvMcOOJDKq9ti16f7X9/8x7AmBxVN2ZsvWZwkHhb2fVBwUIaC0f9mx6UXaM
	 pj9m9PSza1q/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for
 TQMa91xxCA and TQMa91xxLA SOM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>
References: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
 <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 09:20:07 +0000
Message-Id: <20260707092008.B7E771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch introduces duplicated and repetitive text in the dt-bindi=
ng description block and contains a factual typo in the commit message.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for=
 TQMa91xxCA and TQMa91xxLA SOM ---
commit 3332dfa95ce8d051969053f3ea74bbf075143869
Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>

dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA =
SOM

This commit documents the MBa93xxCA starterkit mainboard for the TQMa91xxCA
and TQMa91xxLA System-on-Modules. It adds the corresponding compatible stri=
ng
and updates the board descriptions in the fsl.yaml binding.

> TQMa93xxLA and TQMa93xxCA are two series of feature compatible SOM
> using NXP i.MX91 SOC in 11x11 mm package.

[Severity: Low]
This isn't a bug, but there appears to be a typo in the SOM series names he=
re.
Should TQMa93xxLA and TQMa93xxCA be TQMa91xxLA and TQMa91xxCA since they use
the i.MX91 SOC?

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 86876311ec59a..84c4311cf7c30 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
[ ... ]
>            soldered on an adapter board or for the connector variant
>            MBa91xxLA mainboard is a single board computer using the solde=
rable
>            SOM variant
> +          MBa91xxCA mainboard can be used as starterkit for the SOM sold=
ered
> +          on an adapter board or for the connector variant to demonstrat=
e parallel
> +          display and majority of interfaces while MBa93xxCA starterkit =
mainboard
> +          is focused on communication interfaces without display support.
>          items:

[Severity: Low]
This isn't a bug, but it looks like the new description block duplicates the
existing phrasing for the MBa91xxCA board instead of replacing it.

The context above this addition already contains fragments like soldered on=
 an
adapter board or for the connector variant which seem to originate from the
older description of the MBa91xxCA board.=20

Could the previous, redundant sentences describing the MBa91xxCA mainboard =
be
removed to avoid duplication in the final schema text?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707091424.1702=
245-1-alexander.stein@ew.tq-group.com?part=3D1
