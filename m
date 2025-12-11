Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C562749E4
	for <imx@lists.linux.dev>; Thu, 11 Dec 2025 01:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765418156; cv=none; b=AWchGpJUuuZcE9KQIJRj1075XuXhmrtE7Yh6d0yCGXy/hT3x5TjFxYY1t7aYcFO1bA3k5Itwqfr8EVqyLHJ3RhkaIPtXNwsLrx4svIz55erv6CiOLta64bWFgHAuSU6Jw4u6z5kZMC2qzvjENsg05NYcQg8Z/6dTmlZyZ5s7nJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765418156; c=relaxed/simple;
	bh=zv/vPGvH+GlU5R0Nma7xKjoV2AR7w+pzdH7A6UiWLnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/dpfiKAVV2kWCwk0UrTVDAAKrN+XEf2IBmzpbMjHJhyNBoCyrP78uAkWy1+dUxyT2x0yHjYI1oyXchSjFjFwOD5OyI75PEUGD4iab+pdoukiCHBCrCzZFbh8F/MHPiQzG7rcW0jz7xghN7wVEqsRWVQ4ccRvQM8RHUsG+sU2LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C089A1A0372;
	Thu, 11 Dec 2025 02:55:46 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 940691A0271;
	Thu, 11 Dec 2025 02:55:46 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8E1761802213;
	Thu, 11 Dec 2025 09:55:44 +0800 (+08)
Date: Thu, 11 Dec 2025 10:55:44 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
Message-ID: <aTokoPlN-II2qA9V@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
 <20251205-imx91s-frdm-v1-1-afd6cd01c299@nxp.com>
 <4b29cc46-28a1-45f1-b24e-548513178884@kernel.org>
 <aTkTz-5QoB8BuLs7@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
 <a252e741-aab3-4fec-ae8f-38634d071d77@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a252e741-aab3-4fec-ae8f-38634d071d77@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Dec 11, 2025 at 02:16:55AM +0100, Krzysztof Kozlowski wrote:
> On 10/12/2025 07:31, Yanan Yang wrote:
> > On Fri, Dec 05, 2025 at 09:21:55AM +0100, Krzysztof Kozlowski wrote:
> >> On 05/12/2025 09:03, Yanan.Yang wrote:
> >>> Add DT compatible string for NXP FRDM-IMX91S board
> >>>
> >>> The FRDM i.MX 91S development board is an low-cost and compact
> >>> development board featuring the i.MX 91 applications processor.
> >>>
> >>> Signed-off-by: Yanan.Yang <yanan.yang@nxp.com>
> >>
> >> Are you sure your Latin name contains '.' character? Or you just copied
> >> login?
> >>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> >>> index 68a2d5fecc43..82f28be401b8 100644
> >>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> >>> @@ -1412,6 +1412,7 @@ properties:
> >>>          items:
> >>>            - enum:
> >>>                - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
> >>> +              - fsl,imx91-11x11-frdm-s    # FRDM-IMX91S Board
> >>
> >> Anyway, this was sent, or something almost the same.
> >>
> >> Align internally before posting duplicates or at least explain why this
> >> is not a duplicate It is not the job of the community to coordinate how
> >> NXP employees should work. Srsly, it's NXP's job.
> >>
> > Hi Krzysztof,
> > Thank you for your review and for pointing this out.
> > 
> > This patch set is not a duplicate of the FRDM-IMX91 series. It introduces
> > support for a new board: FRDM-IMX91S. While FRDM-IMX91S is similar to
> > FRDM-IMX91, there are hardware differences that require a separate DTS:
> > 
> > - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > - Single GbE port (FRDM-IMX91 has dual GbE)
> > - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> > 
> > These differences were described in the cover letter and commit message,
> > but I can make them more explicit if needed.
> 
> I cannot find anything about it in commit msg. Look, you wrote:
> 
> "Add DT compatible string for NXP FRDM-IMX91S board
> 
> The FRDM i.MX 91S development board is an low-cost and compact
> development board featuring the i.MX 91 applications processor."
> 
> so where is it? About cover letter, I usually do not read them, some
> maintainers skip entirely.
>

Hi Krzysztof,

Thank you for the feedback. I’ve added the detailed description in the DTS
patch. For the DT binding commit message, I’m planning to update it as below.
Please let me know if this looks acceptable or if you have further suggestions:

The FRDM-IMX91S is a low-cost, compact development board based on the
i.MX91 applications processor. It is a cost-optimized variant of the
FRDM-IMX91 board, with notable hardware differences that require a
separate DTS:
- 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
- 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
- Single GbE port (FRDM-IMX91 has dual GbE)
- PMIC PF9453 (FRDM-IMX91 uses PCA9451A)

Regards,
Yanan

> Best regards,
> Krzysztof
