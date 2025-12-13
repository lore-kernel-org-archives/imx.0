Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B341B86C7
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 04:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765685316; cv=pass; b=dEXwET3qJO8r8Lf0bdc1NezftNhQX/NVvmJ7aP5jZGAKi+Wp20T4pgAEmJoIm2gkI6QiTBGnK2MjZ0r2W7N27fd2oM3aMnQ70QroKonYn14nRsaz+sewy4ecsYfL8wciCGFj6m/nCqu5qFOVsGTjvM8V2CmOW97lVq2nyc+7reg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765685316; c=relaxed/simple;
	bh=hmb6xGzMv/vH6oVI3SMboBWtIvQmnF78TVg9dy9oviE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0QWYxDEKdjSLq+n5xVy/l/+AsX6hYx+3BGU2YcoYoqkF7oYOpSd9AcMGgZ418SQS1XCQje4hpG34Oeq+MAn76neklu1MNG+cZwlMJ9Jbz7ccQ2fIx7QkcBFCpjSmsUS3kI1uy36wsf282KLU/nKIKF8qSKENXgb2Y4YavYt5uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=YotBkIpW; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=Ri6RM4lR; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="YotBkIpW";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="Ri6RM4lR"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-00nh.prod.antispam.mailspamprotection.com; s=arckey; t=1765685314;
	 b=nabM7FZK7nOK/PBnLdbYIOozinvSAj7W1AgcFx2hW90s5sqxwc5/I9KWyhMx+0jYR257jnMmqe
	  hPzefwIeIDNeUhwC1ize289/6avUfYlfBcRBLC9zTTUfvsWdLPY+PM5YsOFmIa7po9vxQajgUM
	  CQa/AqRPbUXd/KPRLVt00ul8SAVaUQGENz7o4geCvEGBViTB/W5wF72NeVdYRLG3WtZ6XnukK6
	  7sfEoIziAZ/9cfuQkq/VxZ1k+Cc3NiZzAnhK1bA3fvtVXvNHgBro5HDf12kek2iCY+VnJAs8Q5
	  xpICZEwSGv10FXdzRlyQQfijqac7jE5CkvCG8vXcytx+jA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-00nh.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-00nh.prod.antispam.mailspamprotection.com; s=arckey; t=1765685314;
	bh=hmb6xGzMv/vH6oVI3SMboBWtIvQmnF78TVg9dy9oviE=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=HgMIZcYM6ef0qo9JYPkYBliJzyAxW18r7nTkpFrE2wKgyiY+so5CedZGYQ+YMGUZ/4QIkUJJBF
	  7VdJdrzQYpvN7yV5P7YUbqoePb2IfEPqJ1WsXoin/t2MnGJGEdABMKuWM4YEoLeWnXpwC/Wg6T
	  tdCwuKKLfOp6BGK+/UyEek64FWHPkjQNMfmZ+cNLdTBvBVi9VAZg4jetQRIvv/sncmY9SWsC++
	  HN8TLLxBaS9KibtHJ9SgXv8a/acnq+SK5kirDTsdBlgq1IR+x011PKJgiOHpW21/5bGJGN5anj
	  r1IPB5uDGalaFHflZRg2TLNxlKiWedTvpIFrZoOv8aZATA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=M3/2Us+WWEmXNyI5R2qYS3uBblMDLM430KkbIZTR+8w=; b=YotBkIpW/+d94NT/yoL4O1r/dX
	+RmhTKYDADpE7UIf1k6Lh/nFUVJg8saG2A5WCVN24b6MMKv1MP3/4y7UsBrRDVjT6Y33Z0z6EFYz9
	VIwnjm4dX5X45MITR6rxK1F14SlitnfNMkAOIMsJOmdikVM62JhYUeNdeAeaQ604qEiM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-00nh.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vUQva-00000001Bbj-0yAh
	for imx@lists.linux.dev;
	Sat, 13 Dec 2025 14:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=M3/2Us+WWEmXNyI5R2qYS3uBblMDLM430KkbIZTR+8w=; b=Ri6RM4lRUWlOMF73nov0tmlpyF
	rKJCZyuJiZCK4EQVCAbXGQ+rwflVAs4UV2C3dzokjULimNv+FyO+nNrqPtdQnNqPjlmwDTyosy0qw
	HqvokWHF96TwwmqK5uZblUSc3fK7404hq0YVu5m5kpPZUxYmbpii+wMxWR7k6LcHiG1g=;
Received: from [79.34.194.176] (port=60557 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vUQvM-000000004in-18K8;
	Sat, 13 Dec 2025 14:48:44 +0000
Date: Sat, 13 Dec 2025 15:48:42 +0100
From: Francesco Valla <francesco@valla.it>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com,
	Tom Zheng <haidong.zheng@nxp.com>,
	Steven Yang <steven.yang@nxp.com>
Subject: Re: [PATCH v2 0/2] Add FRDM i.MX 91 Development board support
Message-ID: <aT18yj7c27_buJSe@bywater>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 551b0b1c0b68fd49f6a7bff60f181bd9
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vUQva-00000001Bbj-0yAh-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-00nh.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Fri, Dec 12, 2025 at 11:31:32AM +0900, Joseph Guo wrote:
> FRDM-IMX91 board is a low cost development platform based on i.MX91 SoC:
> https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> 
> Add device tree and dt-binding for FRDM-IMX91.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
> Changes in v2:
> - rename compatible 'frdm-imx91' to 'imx91-11x11-frdm'
> - rename 'sw-keys' to 'gpio-keys'
> - rename 'user_btn' to 'button-k'
> - drop lpspi3 node
> - rename iomuxc 'grpsleep' to 'sleepgrp'
> - move dt-binding patch before the dts patch
> - add board page link in cover letter
> - use CAN PHY to manage the stby gpio of flexcan2
> - drop realtek property
> - add pcf2131 aliase
> - add bootph- property for nodes should be kept in bootloader phase
> - add reset-gpio and assert for eqos and fec
> - delete unused alias
> - Link to v1: https://lore.kernel.org/r/20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com
> 
> ---
> Joseph Guo (2):
>       dt-bindings: arm: imx Add FRDM-IMX91 board
>       arm64: dts: freescale: Add FRDM-IMX91 basic support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 904 +++++++++++++++++++++
>  3 files changed, 906 insertions(+)
> ---
> base-commit: 73f1e611b076de705c2f1c26cfdfc5b8e96f4733
> change-id: 20251114-imx91_frdm-add2b2c07e78
> 
> Best regards,
> -- 
> Joseph Guo <qijian.guo@nxp.com>
> 
>

Everything is in good shape, the only non-working thing is button-k3 
(but that was expected, as a small hardware modification is required
to reroute the phisical button from system reset to user function).
Not a real issue, at least from my point of view.

Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it>


Regards,
Francesco

