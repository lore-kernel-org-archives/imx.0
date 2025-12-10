Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2952459FD
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 06:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765348315; cv=none; b=P5u9dR1W3lHZDM0/pVTCgNoElc/zhLhbTLccZWYun3QkNC4O5glpXe6c0mVvrd0lHvzokMNLWHITNLNtrcXRBIaxlPuIHKVytLP4kCQt184yNiijS6o8BuPHKrUvuNitsyhp8f9/Uu6KX1241aHgN+3uBfA2CI5W7Hg9dQGIzBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765348315; c=relaxed/simple;
	bh=75TBUh/jYlMS6urs8M3jEeJtKFl6k0PscVrtLz17bjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEGl2xS06YN8iGoc04gbbs1kT4zQShwwJFw5abQwtwiRlRrKiXQOIB5MYNrBgr2Bu0tCXAZa08qiHc0tWrnVKumwXIs84BA9MRhcuUXgxagADi6QK58tGYUKlH4W5jvMYLm3VUKYjATNTHPQFft2jgUQGmoAtwOewS7urGnFYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DCBCF20161F;
	Wed, 10 Dec 2025 07:31:46 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A57BE20129E;
	Wed, 10 Dec 2025 07:31:46 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6D69E18000A4;
	Wed, 10 Dec 2025 14:31:44 +0800 (+08)
Date: Wed, 10 Dec 2025 15:31:43 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, yanan.yang@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
Message-ID: <aTkTz-5QoB8BuLs7@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
 <20251205-imx91s-frdm-v1-1-afd6cd01c299@nxp.com>
 <4b29cc46-28a1-45f1-b24e-548513178884@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b29cc46-28a1-45f1-b24e-548513178884@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Dec 05, 2025 at 09:21:55AM +0100, Krzysztof Kozlowski wrote:
> On 05/12/2025 09:03, Yanan.Yang wrote:
> > Add DT compatible string for NXP FRDM-IMX91S board
> > 
> > The FRDM i.MX 91S development board is an low-cost and compact
> > development board featuring the i.MX 91 applications processor.
> > 
> > Signed-off-by: Yanan.Yang <yanan.yang@nxp.com>
> 
> Are you sure your Latin name contains '.' character? Or you just copied
> login?
> 
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 68a2d5fecc43..82f28be401b8 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -1412,6 +1412,7 @@ properties:
> >          items:
> >            - enum:
> >                - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
> > +              - fsl,imx91-11x11-frdm-s    # FRDM-IMX91S Board
> 
> Anyway, this was sent, or something almost the same.
> 
> Align internally before posting duplicates or at least explain why this
> is not a duplicate It is not the job of the community to coordinate how
> NXP employees should work. Srsly, it's NXP's job.
>
Hi Krzysztof,
Thank you for your review and for pointing this out.

This patch set is not a duplicate of the FRDM-IMX91 series. It introduces
support for a new board: FRDM-IMX91S. While FRDM-IMX91S is similar to
FRDM-IMX91, there are hardware differences that require a separate DTS:

- 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
- 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
- Single GbE port (FRDM-IMX91 has dual GbE)
- PMIC PF9453 (FRDM-IMX91 uses PCA9451A)

These differences were described in the cover letter and commit message,
but I can make them more explicit if needed.

Regards,
Yanan

> 
> 
> Best regards,
> Krzysztof
