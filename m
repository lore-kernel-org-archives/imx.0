Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999711F03D9;
	Sun, 18 Jan 2026 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768718415; cv=none; b=qKEWfNcH+p2+ofOQ8zMZ2cvqCOlpWErNOJYlHHAXxoS5aIjKas0W6txfisVAndtTobbJgcDiqD++8HinlaDuADq0HNGWnoDkIvukwhnn85xdkYoq4BVbfMiQYgG/voUYrv6Xe14t7EtI6VdyhN1fEEauhpKt9MYRuvlE5ENaJzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768718415; c=relaxed/simple;
	bh=J1shmd9ZBF8R2kobwL2x7PTcHhmwOR0KgYXn2xOGb6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQaq0dabvXmsUVt23JWEkIEmM265OA9NLoSzkx0p9cw7zZAnd56ZsmX3a4Rani7+jx0qMsW8aM+31B6RK1MsCGcSl3oF7WwqCU1pNcj6XIb0zwRr5yM1T6vMwL0eSj7dYpvbHte+yy3iqBLtZQ2pJhxHKRUgQ6TjHPWobvD2ceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZL0CYZI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZL0CYZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEBFC116D0;
	Sun, 18 Jan 2026 06:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768718415;
	bh=J1shmd9ZBF8R2kobwL2x7PTcHhmwOR0KgYXn2xOGb6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZL0CYZIPC0SYkbjhXKxMy9b4QHDWX0zaqamPCMFQzKC8mkU+8eTH0U2X7HQ+YslT
	 HTUqePAXEHAdG6nDx2xRGLodpn4j7iYGg8xVXRMjE4nz0wcUBkdCjr0SSoxsKhWoj1
	 o1nstiQMS/ujqsxKD+OPLOlI7wK3IsoTjDq4VFRx1DHS9v36MS7/Mb9dAOv+2hXqIy
	 WLoULrnXTEOonlxGUdVA0qJ2kIxvKLSnwG1WF3yoLvmMxW5rAqPW1i1LrGgzoGXs7i
	 gKwvCIUSPwMFSS/32oPBdLOLc+4jrFmo8Is21SHXYJNDjkV+2O5+EKXiyhpaIujYML
	 uoIYjLoM7YJ1w==
Date: Sun, 18 Jan 2026 14:40:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Lei Xu <lei.xu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, justin.jiang@nxp.com,
	qijian.guo@nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH v3 0/2] Add device tree support for NXP i.MX95 15x15 FRDM
 board
Message-ID: <aWyASKKyzN34xKyn@dragon>
References: <20260116-127-v3-0-3dc49545a745@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-127-v3-0-3dc49545a745@nxp.com>

On Fri, Jan 16, 2026 at 12:56:12AM -0800, Lei Xu wrote:
> The NXP i.MX95 15x15 FRDM board is a compact and cost-effective
> development board based on the i.MX95 applications processor.
> 
> This patch set adds device tree support for the board:
>  - Patch 1 introduces the DT compatible string.
>  - Patch 2 provides the complete device tree description.
> 
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> ---
> Changes in v3:
> - Add a blank line between the cpu and codec node definitions.
> - Link to v2: https://lore.kernel.org/r/20251217-127-v2-0-67cb12e56242@nxp.com
> 
> Changes in v2:
> - Switched from 'xceiver-supply' to CAN PHY nodes using 'phys'.
> - Added CAN PHY nodes for flexcan2/5 with shared silent-gpio, removed reg_can_stby.
> - Updated MSI/IOMMU mapping comment to match the i.MX95 15x15 FRDM board.
> 
> Link to v1: https://lore.kernel.org/r/20251207-127-v1-0-5a2eeb69f150@nxp.com
> 
> ---
> Lei Xu (2):
>       dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 FRDM board
>       arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board

Applied both, thanks!
