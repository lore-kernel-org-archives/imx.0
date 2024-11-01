Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FBF158553
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455816; cv=none; b=VdvDq35shBPD3G+0iZgtFZDTwgNQFOGFXID8U8XZiX1Q/d/kjSSbs5Nbaz1rBTIYHVmk/meINuuyCLW98AXIrLxlu99KHo1zGgusGkduYNwj1yI6W2iSTDf4C6H1y0P9Ehc4fJMA/Le1wEIDsKvD5zhL84Y0bo3UsE2vY5uM5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455816; c=relaxed/simple;
	bh=aCzU2pKJxWFOb45ZYQ2ZqmMz8q1Qchx8NwVefQgRO6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLvh1sX2wdrQdv0669mWQRlwIlVPr92Fz9O94JADq/qv7tyorGzNYYRLJr9WDF9H9s9q3G+QnoIMCJGl+57gJcvL9EXfOFBwsMzFf1PxffCyG5L4xbl+htrX69jJBcaTDf/loJ38y710SbQgLIY/vjB6hwF7pd1eUW9cBwXV1W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=e1JdzxSR; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="e1JdzxSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LY3owCT+fxzpVsdv6gZVjqkezE1VdfXtNd84/LlaGZc=;
	b=e1JdzxSRYWVsfLiA7wpOUEa7KufQ2DsmxD4xMbw4TFsMJC5FG6mtuDHbgAKkAZ
	8F43R3mX8RSfZDWfBIaH0S08M2V5xLi6uUjZbntlVz4TzGc2VyBV0SBF74GiwhFN
	4WN3W2VAq1Nz+7Epha2KaEU3HAxwb3y8HzkdgnV/1I+z0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAX_kDtqCRn8lNkAQ--.13729S3;
	Fri, 01 Nov 2024 18:09:50 +0800 (CST)
Date: Fri, 1 Nov 2024 18:09:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx6sl/sll: Add the "fsl,imx6dl-gpt" fallback
Message-ID: <ZySo7JhlYmEPpgd1@dragon>
References: <20241023190002.1183938-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023190002.1183938-1-festevam@gmail.com>
X-CM-TRANSID:Mc8vCgAX_kDtqCRn8lNkAQ--.13729S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1rKFyftrW7XryDGFy5CFg_yoWfGrbEq3
	WkWr1UWr4DAayjq3Wjy3s3JFWfJ3WkZr48XFW3K3yDXa45Cr1kJ3y8Xa4UX342vrZIqFyj
	k3yUJr1UXr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0Y-e7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCKZWckj-1HagABs5

On Wed, Oct 23, 2024 at 04:00:02PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Per fsl,imxgpt.yaml, the i.MX6SL GPT compatible should be described as:
> 
> compatible = "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";
> 
> Do as suggested to fix the following dt-schema warnings:
> 
> timer@2098000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx6sl-gpt'] is too short
> 	'fsl,imx1-gpt' was expected
> 	'fsl,imx21-gpt' was expected
> 	'fsl,imx27-gpt' was expected
> 	'fsl,imx31-gpt' was expected
> 	'fsl,imx6sl-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> 	'fsl,imx6dl-gpt' was expected
> 	'fsl,imx6sl-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

