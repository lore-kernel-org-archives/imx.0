Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB47231F99C;
	Mon,  1 Jun 2026 23:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355596; cv=none; b=GQE3L6gPDrF6aeoxguqt38EnuTHMukhMdKtTFbARK3L5OFu1gtJc1tkjX+qPwM5nP8xJ9M6n4h6YNjCAjeKcxNjN7p8ni96xfyiTd040y0E/ySVX/JUT1sk9YykDg0IwigrluAY52neCto49cql8/XG2PaNTxbh1djItotlM/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355596; c=relaxed/simple;
	bh=AA7yMsMs1sp95/rAmQFYi61U9As/7rivHHSQmnuZWtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDAS5WWCdA9KWaA4xdGr5or/O++rTegVIlehhmNSV4wuYTIhRn+zdMMWNzh3zY8qisadGlQq+PEBXxifQQF2MxLPzo/RsIB1kQyPra4lr0hrSAox8AajK959v+sFb1/AqHMAGLfLNmB+sunPo8adN2zMdd8UGiAQXk1l91u4cXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeXj1njD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeXj1njD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FE71F00893;
	Mon,  1 Jun 2026 23:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780355595;
	bh=uaxZFaXKrmIFYBt6dWwzrs7nCg1sSc/qtCvI5zGQOIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CeXj1njDTZ9QYc9JvUDDE+waayylRN3SNsTJPudXFsXdbc/Jti6T0wDI0VunUE302
	 3N/iKGYu2roQtMTfTOrB4y/WJQJ70LBObOJ2uDsZUeZxN3SHD4xLMMCL+7V8+qmeKC
	 vYMIrjQTEmW5K1kaO9u7LIbpL00Bkn8hPH9agh56sc+tBLmp/tp199JHYQx51nvtz0
	 KzATeZA7dTXygwASJbTODS0a6H3Y36iIHNaSByWV0n/Gm/VCl+kjLJbBcMrzWdJgCa
	 Lm9D3W2mg+Xe5cbi9mVpzslKIvhdXAI2jRrBc5kRN9EF5E+dpMDfO2ebpmil7clTUN
	 xouYJrYkj7V4Q==
Date: Mon, 1 Jun 2026 18:13:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Conor Dooley <conor+dt@kernel.org>,
	Purism Kernel Team <kernel@puri.sm>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robby Cai <robby.cai@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>
Subject: Re: [PATCH v2] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example
 endpoint label typo
Message-ID: <178035559437.165333.7105933627406631706.robh@kernel.org>
References: <20260519113824.91533-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519113824.91533-1-laurent.pinchart@ideasonboard.com>


On Tue, 19 May 2026 13:38:23 +0200, Laurent Pinchart wrote:
> From: Robby Cai <robby.cai@nxp.com>
> 
> The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out}
> endpoint labels, which is confusing for an i.MX8MQ binding. The labels
> could be removed as they are not functionally required in the example,
> but they have a documentation purpose that brings value to the reader.
> Rename them mipi_csi_{in,out} to avoid the confusion.
> 
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Drop imx8mpq_ prefix from label name
> - Update commit message
> - Drop Fixes: tag
> ---
>  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

