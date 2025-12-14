Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483C29BD94
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 22:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765749811; cv=pass; b=tIhPuhDxoU0vGKtVzkmsYkNlmC+QjUfuTZlZ9X/HzbmeCx8y6LN1gGPEl8mj16KcWYVb3mLez2EIn+jiVymO6HY4awOWXrGuwMbPlG8Q16FUZBK1LK37uNOFTAbRc1wJj1Zz7noImUTwaDERGVgFbM9r7M+b773sQLiogySMFQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765749811; c=relaxed/simple;
	bh=cVXolmIhuEAIzMtZ7d7H4m9GWbghCHHoI5tvljqLXVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjgnR2+E9GAoVWh6JX9eq6KG1qqHzxBJ1rfZEGOIxadEFXLA4JqGnG9iIA+NxJQVkoSU7369ESc5jVoZAXWR9n8Ms5vVpgOEM6lMQMWzpf+ytU/RZ3Ih5ck1ayXpeQRO8I0ZbLZ/PUH2Sumf8//fz+lSE/jZH6rR6M7c78zQaOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=wLpSJy10; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=nwslf0FT; arc=pass smtp.client-ip=185.56.87.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="wLpSJy10";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="nwslf0FT"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-swd7.prod.antispam.mailspamprotection.com; s=arckey; t=1765749809;
	 b=DEIsfr+TZQA84mywg4B/rLDjYoR6VmTRjAAcSny/KKZZt4NGRMa7QvOKdutw5Ml7XS6Q4XN5Vh
	  XFFE9/hlXGkWbHzfIZ1L/Nmz4Vsy1IB3f6BgnVrhAZF/9s+vQLOWOgBmvWiPeJFeD6NJqdBMvf
	  ctRijNpZRz2QPJznyGILM+JZn9tGaPSoQEElgcL5EoVxlLyJftrjqsdBtufuVWzoDOuHoKvl69
	  C2mvr26rJXgezg0jvalx4Q6DeNAQ2cprl3cEP5tmUGdFQ15rJ2bKnfQZ+kCH+XBJG/mh+y+WQ8
	  89wp4S8sIcxVOBCffD9onZGn81kG5qUDcqMwix2RgcueDg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-swd7.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-swd7.prod.antispam.mailspamprotection.com; s=arckey; t=1765749809;
	bh=cVXolmIhuEAIzMtZ7d7H4m9GWbghCHHoI5tvljqLXVQ=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=UrxucBxfJhsPg7UJ/n2BrNEVgKAuH0AeaxKaF4N70BrNOgkgHI/RX+17GUOLybbOeY2k4scxfg
	  uXFyoGkmetL1FFrDFY/x/LuTtftCMMfaBe9kTSyS3gL7+b0tVPXK5bO4eQK/+VArbtFn9R0vfh
	  +QnQSTvLSJpHZjVz5Y5Spwuq46MEErbKAKlMNc0TfDx/KevkoajGGb0gf/STV2NIHmf0xSm3d2
	  oIBnK/gWG0QNfkZygY9FhqZV10nwfmd5WJL9wPImC6gmXzDWx2V46Ac3BNHCCxe0CrFDeDHi+F
	  S3jxnMU5OqEOLL8M3U+JaP5jGTglLwhkARi9h1RUXUQaPA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=iyaP5lR+UMf82Qks9pPdWf5XfzExxxVhhBQJM/0Gj6c=; b=wLpSJy10cQ+ihHxow4Bw76zuA2
	q9qb/qa+GV6GVEbgGHDIHwUBOwWKEom0Wv67hNS6x/wc9yHK2MTcvEJFzNqBzxMu/uX/Wg1mSFeGa
	IXHkedhNqI1FRd3gYWEeuH6rHz8jaj3KAJHxvwLBu3g26Afa8LIOvMWD4G/tX/NRsrtg=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-swd7.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vUuBS-00000008cDP-3HyC
	for imx@lists.linux.dev;
	Sun, 14 Dec 2025 22:03:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=iyaP5lR+UMf82Qks9pPdWf5XfzExxxVhhBQJM/0Gj6c=; b=nwslf0FTSvzy1JPX0PEPfe95JY
	AbhGi8R2VFfgfS4b9fiJctKkzUtkq7tFdiVpJonYeEi3op/CjnhaEJlH6fJBmP3rWch5rTf5iksra
	ndhvnv2IT2pv2rypR3vHD7dxXa85QEBXLj1tBIzhnMhpOPGAluHXT3is/9I1zbJSd6Og=;
Received: from [79.34.194.176] (port=59972 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vUuBE-00000000CVM-0NDd;
	Sun, 14 Dec 2025 22:03:04 +0000
Date: Sun, 14 Dec 2025 23:02:58 +0100
From: Francesco Valla <francesco@valla.it>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 3/4] arm64: dts: imx91: Update file name with dash
Message-ID: <aT80EhkC41d7BSZs@bywater>
References: <20251212-imx91-dts-v1-0-2bb3c13762dd@nxp.com>
 <20251212-imx91-dts-v1-3-2bb3c13762dd@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx91-dts-v1-3-2bb3c13762dd@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: cac76209b49bf94073650b741c463ce7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vUuBS-00000008cDP-3HyC-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-swd7.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Peng,

On Fri, Dec 12, 2025 at 05:16:09PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Update "imx91_93_common.dtsi" to "imx91-93-common.dtsi" to align with
> others.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91.dtsi           |    2 +-
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 1187 --------------------
>  arch/arm64/boot/dts/freescale/imx93.dtsi           |    2 +-
>  3 files changed, 2 insertions(+), 1189 deletions(-)
>

The new (i.e., renamed) file is not there, so this is not working.

Francesco

