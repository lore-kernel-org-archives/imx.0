Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2FD1CACE0
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480242; cv=none; b=aAjZb/8GAcd9R0vlCcQ8Txud77G8p5oSbFc1guyvO6TZhRoFD7VEuQW/DT88ja2v7rKVNyrjF/dCNcXQWVX9Pl32aJK715nSwydLd5h+ACDvoeNSC4NpL/9k5Fex60NCmynthFYf5KkEcFJS4tOc17SkCR8mfa4pQdpdM6FSB1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480242; c=relaxed/simple;
	bh=2rKsatq5LG+9IKHuStVw7bDmC0tFVIV2dLq/aDxa/bM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uclW9wo19Zi3u65F6Zo73exk5aMAjwGZuH5Q1VzJLO597rk6RYTSPPG6UZ814EQrEHQB1lZwgJaUCvNfXsT74kxB2xtFPM3zszWQZ4ppFDnSuOOZv3tdNqepOmZbq6iI5NY9EMOL0wjoecgV+h1DjkQfmIXDTvo5kueTm9bV4ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=dHtuGpsh; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="dHtuGpsh"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t6uxT-00APgq-0K
	for imx@lists.linux.dev;
	Fri, 01 Nov 2024 17:57:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rz0ryjT9mPDcej02Hk6SsCveNSUKvfeMX0qnfVx6BcQ=; b=dHtuGpshL5PlID52fzj6TToJtB
	voL1NnNpNpigoGyWGbG1JIHgxlYkjHE07feIqQSWiFQ4TLqEjZANCHWP7+drN0m0hFsEj+uZDgYjG
	oEKIs4ZbmTlp6UGJkxopWOmAlJR7HcQHCVGUUi9/udSAE4H9vrcyFzgIRN6I1myLXajOjJ2erqw86
	2XOLj1Ua1l1Qrdm8sYu3Psp++nGNAY50w2oazW6cAkZvI7qLzhvWIGN+yhhZ7BVwzATWnRroG7Pqs
	k6MQJhLIEI3s0CWqFb+j+LLCAC4FAJU4Ih2eFUZVtKoMCWrg5nb47Kun60Q4qidMPojx16jEebAr+
	GtKgcKAA==;
Date: Fri, 1 Nov 2024 17:57:04 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ARM: dts: add Kobo Clara 2E
Message-ID: <20241101175604.20bc5427@akphone>
In-Reply-To: <172986441097.1907834.7871985467741599221.robh@kernel.org>
References: <20241024142206.411336-1-andreas@kemnade.info>
	<172986441097.1907834.7871985467741599221.robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; aarch64-alpine-linux-musl)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Oct 2024 08:55:18 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> On Thu, 24 Oct 2024 16:22:03 +0200, Andreas Kemnade wrote:
> > Add a basic device tree for the Kobo Clara 2E Ebook reader.
> > It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
> > are not ready for mainline yet.
> > 
> > Changes in V2:
> > - improved commit message about devices without binding
> > 
> > Andreas Kemnade (3):
> >   dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
> >   ARM: dts: imx: Add devicetree for Kobo Clara 2E
> >   ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E
> > 
> >  .../devicetree/bindings/arm/fsl.yaml          |   8 +
> >  arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
> >  .../dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
> >  .../dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
> >  .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 514
> > ++++++++++++++++++ arch/arm/configs/imx_v6_v7_defconfig          |
> >  2 + 6 files changed, 572 insertions(+)
> >  create mode 100644
> > arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts create mode
> > 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts create
> > mode 100644
> > arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi
> > 
> > --
> > 2.39.5
> > 
> > 
> >   
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in
> this series.
> 
I think they all come from existing dtsi.

Regards,
Andreas
