Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D82920E0
	for <imx@lists.linux.dev>; Fri,  7 Jul 2023 05:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757CFC433C7;
	Fri,  7 Jul 2023 05:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688708357;
	bh=xBPm47qwm/R3ZNc2QjZomvgZ/cgbmFd7MZsL2fkoulU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNUVNKXmdUUfk4RlxPpaO5Jq0p6oZSwsjyZtEei/1IN3yJrvVarowwN/joh8OQ4ax
	 KwneTnBsmHUIujC+5osd497Vrbo4/f/SP+eZEfrbsnZlIVJzLpJXkgXQDRP71sHpDm
	 NpKewcNRCMXpbJX83u6Pu0X62M73eCV9HwTDvbrzPnejcZaska0qdHdHpWyRTiWdUf
	 d/WQlGTIadfHJbAvOGW4KJMoMm7ehqNisu9F6qTHJ00h8laDPsFVOeKAKqmtEV3Bs4
	 CipOHL8+L+8pj8GksRt6sts3Solpu67m9MYqAfNYn10QGreL0VXea46/7zACOqqHR5
	 VtRnY8AYqs9OA==
Date: Fri, 7 Jul 2023 11:09:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, peng.fan@nxp.com, joy.zou@nxp.com,
	shenwei.wang@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH v9 02/13] dmaengine: fsl-edma: clean up EXPORT_SYMBOL_GPL
 in fsl-edma-common.c
Message-ID: <ZKelAeBE/gDI/IAs@matsya>
References: <20230620201221.2580428-1-Frank.Li@nxp.com>
 <20230620201221.2580428-3-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620201221.2580428-3-Frank.Li@nxp.com>

On 20-06-23, 16:12, Frank Li wrote:
> Exported functions in fsl-edma-common.c are only used within
> fsl-edma.c and mcf-edma.c. Global export is unnecessary.
> 
> This commit removes all EXPORT_SYMBOL_GPL in fsl-edma-common.c,
> and renames fsl-edma.c and mcf-edma.c to maintain the same
> final module names as before, thereby simplifying the codebase.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---

>  
> -MODULE_LICENSE("GPL v2");

Why drop this?

-- 
~Vinod
