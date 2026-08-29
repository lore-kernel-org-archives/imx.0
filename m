Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E482E229F;
	Sat, 29 Aug 2026 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033101; cv=none; b=p3vpzF/li8rKx0meHTSu8X5BChSP6fwGzqS+7RfcRn4eAtYUtGmT/nv4mfK+7hGUEc5HdX29JI/cHxh9KPjTSmIwL9bN+c/3p2N/1ZoRV3fcgD1TvGUcSrTvYFeXNT10au40fvCSAmOQEh+Xed0zq1D6GEYlP4g/65RngyTxLL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033101; c=relaxed/simple;
	bh=vcEdv8gVDGWakMB9d9nJW+l918+iVnLF8v7yAV52jQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B+ectT2ERB7ToETBZBoqy+P3D+dT46irf4+oIBUmMMw6We76OuBpYcsoHvaRbddzm+lROkMvpfPIdfJgc5W0sTDVzl8c4IwfVfm3UhWoH5E97DCrF8IuAeEUpvcEBlgBtevoKfRLpHNG0i+3R7cX8OkUlsZ9wEP8gVnqJCjcCkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9atAtEb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9atAtEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA1F1F000E9;
	Sat, 29 Aug 2026 19:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788033100;
	bh=5qYTPydlQ7iswVozSBwTGzl2I074B+Jrza8i28ghGLY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T9atAtEb6d8YEZ5/2/tAE/jjCZsKc4Y1Hpg+lt50GxF9cwLAjbXI10Yd1jc1fMupF
	 6VxmGleEiGquV9ZiIDSaWOPUxC1rVdcEk3BVsU7t+bjD+i05ysW98+EQtRnJAsPxCh
	 ERf0BYdNkT2B4mTDsxUG1aYFRBr+nlTDbmfHIv32pnkZB3NoLR7cSbQd/03ps1mzWb
	 PTHdrvPJzilykdrerUHHfev8CALLJP79DMqgXVBqGGyILzbYvzltciGcVSzP6KBpg3
	 6NMKI+SSyAGp7mLG+B8twjaeQ9CEm5tqLYKticC6ZJ8kswjoKADBSyFXlJ7e0/gUzq
	 ozO+QZGOL8aHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: fsl: Replace tabs with spaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260829194203.108240-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194203.108240-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 19:51:39 +0000
Message-Id: <20260829195139.BBA1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly states 'YAML files do not use spa=
ces' when it clearly intended to say 'tabs'.
--

commit fc1bb72fd79fb94d419615999bc4d406ae05d524
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: pinctrl: fsl: Replace tabs with spaces

This commit replaces tabs with spaces in several Freescale pinctrl YAML
bindings to resolve dt-style-check warnings about tab characters not being
allowed in DTS examples.

> dt-bindings: pinctrl: fsl: Replace tabs with spaces
>=20
> YAML files do not use spaces, even within the values in DTS.  No

[Severity: Medium]
The commit message states "YAML files do not use spaces", but given the pat=
ch
title and the actual changes replacing tabs with spaces, should this say "Y=
AML
files do not use tabs" instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829194203.1082=
40-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1
