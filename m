Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDB11E9B08
	for <imx@lists.linux.dev>; Wed, 20 Aug 2025 03:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755660447; cv=none; b=QLoGwz1dFH2VItZ5JuI/7MBcvbqC7K2KDwSKgIJD8OVGi6PAC9W0/ua/Eme8Fr+aFDkiXeegZHFSfxoIhSkmBYmnNfq+MEa4U2FO9FmU2mKRQV1RGC2F3fVfIN6daVPqaG32wlUEGQQh7byPgsWqdmh19zGlj2shafjeDGT22Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755660447; c=relaxed/simple;
	bh=NxxNs+ArdxuQ+n3QEJzsPfm2GrNFXrcdjyVmnQdNvgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slL1AuiWxtwfKltBeNENDcUT9Uqs7p+g7r2SqPDOFT3DBYwCkH5NPYneym/CRqVjQZSo/bgxDcMXBWZ7ard9alyGs4gBaJ6wJEMTxaU85RumC/fX6UpoYgvGrrC5WucJfJ4QxuMkTKu0Fd4PsDD5Xk51tVahXI4VyLUH67qrn64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bWQCXMnO; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bWQCXMnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GE3Jq1Ciq6MhAAQc1qJ6fcK35clkEtk0uKnaYwyaufE=;
	b=bWQCXMnOjqJWDF2BQzcu4GZvEAoe36Pm4a4n1lGck9ucw68xhs/iPWxKgjrGab
	O0XVc6RR5j66vkaEAmWBiLTKE93rRTtUb93U4OVmx36Q6rkHta4pQRbDcMEOKRXT
	40KV+XQpJU7QFIloQRZ1Kff4xwLVFyzG9T9Nf3/b8LAVE=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXSnt7QKVo47L+Ag--.63175S3;
	Wed, 20 Aug 2025 11:26:53 +0800 (CST)
Date: Wed, 20 Aug 2025 11:26:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] ARM: dts: imx6-display5: Replace license text comment
 with SPDX identifier
Message-ID: <aKVAeyQ6iXU0-zl5@dragon>
References: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
X-CM-TRANSID:Mc8vCgDXSnt7QKVo47L+Ag--.63175S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryDAF1rtF47GF45GF1rWFg_yoWxKFbE93
	y0gw15tw4SgFW0krWfCF1avasrKFWDZr12qw1FvFsrAF98KrZ8u3Z8Wr1qvrn8Xw47Jr17
	CF15Ka42kwnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb7PEDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARuvZWik7SLzbwAAsP

On Wed, Jul 09, 2025 at 09:32:44AM +0200, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lukasz Majewski <lukma@denx.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied, thanks!

