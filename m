Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173148;
	b=B4rTDszXWY3qYZmqWsSm/4JDIXVrIAkkJQIB0RyxQHRzsbZIrRtG/tGYi4rRNGVKECHt
	 0cwWnNnHNms71HC6ygQZ/7e2BfnEtNevx1oO6ZeMh4c3orYhAj4pDvdhuggN3bmP63aF0
	 0KARw4SYyxZqUHeJOpY2CeHmmcLZEp2AJmXLT8D/tA9k+PN/mSjt/52F7aw+Pgpz+2lbU
	 +wprcLGcfQ0H/EfAloK9+UBb1brfSSN0ViF2gE/dEyrSMtPsLYh9UlUfgzQzT7qeHK+3T
	 VLbQ6EjFHNITt0V9949YkY2BdqO8NMeX9/43g8xPDZ5eW777motjUrF4YvthuM3lSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173148;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ipGPJTAmcQ5YwpJhMZE+pQllFOmuCMNVdw4f3GXRRMM=;
	b=AX0NgVL7ljjVXLWglDAL3xneficQrhFPOL57lkRfybvZrk58IqEPIoOhCzxbt2EofCGp
	 iHmkkLnSLqft3hocxvzJx13a9z5qdbVm5JtDt/uHlAdXo4cWXqh4xj4lnbghvYpQ/a8fI
	 tUZiXZq4POe3pd+XxFpwLs4MeowxC0FWJwj3MGSjv/WEeauWdaMVnDjNq4neLOFX6QIx9
	 Ya+mTetW5tZ8n1/33OdInFZD6c4tS+n38IbeSw48O1OdrcNIF5QVnFXsGa4UrTX1mBmcJ
	 nPuF90/4BXm6e+IGjS6Wz+VF5B6ipDTj3XfA1pptcbeMQRY2vg9yw4EjcQ+5ZPUfpig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lp9mN2uC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B035606A333;
	Fri, 20 Nov 2026 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lp9mN2uC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8FD1F000C0;
	Fri, 20 Nov 2026 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173147;
	bh=ipGPJTAmcQ5YwpJhMZE+pQllFOmuCMNVdw4f3GXRRMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lp9mN2uCyMjoG2C2M8hvPHIAUzAfUB/MbTq3HrczhjrtfCRY6lkXCTYmfU2iWGNXs
	 RGiAD3c0YgZXDW8njARpxEJiWbyNBY4Bjpg440sNlhRPKcBBIWfYSz7Eoy1mnkFYlN
	 nQLLL7UI9fhiOc0Hhsc/OlnoQHdu1bhOrzSy3e/jAzkTZmSsN+45tyUuugq3WcsDie
	 e3/YhwnMIUDA0li1x1vgMnqvvvoLm0mwpUecGkIETW9ByZuWdoJkoEBHEv5GpuVTBx
	 KjUO5LDvlyOn21j0kPMVpRSiMXYq7i2Iv/FenR7yAlZzyF1VdcqJ/5TOEYm0XT7Mhc
	 qz+Mo65T+B8oA==
Message-ID: <sashiko-outbox-224997@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add i.MX937 FRDM board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261120-b4-imx937-frdm-v2-1-5e27ceec02df@oss.nxp.com>
References: <20261120-b4-imx937-frdm-v2-0-5e27ceec02df@oss.nxp.com>
 <20261120-b4-imx937-frdm-v2-1-5e27ceec02df@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 11:12:27 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: arm: fsl: commit log says fsl,imx952-frdm instead
  of fsl,imx952
--

commit 42f4f6eed8a4edf16ac9cee36f90e0ee040c6e5d
Author: Joy Zou <joy.zou@oss.nxp.com>

dt-bindings: arm: fsl: add i.MX937 FRDM board

This commit adds the devicetree binding for the NXP i.MX937 FRDM board,
including the fsl,imx952 fallback SoC compatible string.

> Add the fsl,imx952-frdm compatible string to reuse the existing
> support and avoid code duplication.

[Severity: Low]
This isn't a bug, but the commit message mentions fsl,imx952-frdm instead
of the fsl,imx952 fallback compatible string added by the patch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-b4-imx937-=
frdm-v2-0-5e27ceec02df@oss.nxp.com?part=3D1
