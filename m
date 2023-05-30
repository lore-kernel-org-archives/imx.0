Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF9B17FE6
	for <imx@lists.linux.dev>; Tue, 30 May 2023 11:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1126C4339B;
	Tue, 30 May 2023 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685447484;
	bh=/DJWZk52w/CRCgdgwPF7vDBbCZ+KdntUX0Ru4LAw0Lo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=U/1qr0abqzGX8NBWtv9qnYEM2kiVD7vvfGlJcg0qqr8BbSu+O/HWthU5mJ0lUrb+z
	 p0OicGNYR2FJntEI1YETybWSOyu0DUuP/MkxN4NpQGCUtjsFsCdRW/PDhXDIPPmA+K
	 Y7B1R+2mrqOZzp0RzyFoKyAEiY+RjLg9aCCLdRVtHjzumcmcoS5uUVufEBhY8kqS8m
	 l7m1/cAubvHH2AWAcKUS6zVFMNy/vUYQcqbRR9lERlWyN+cLj3BVxiWN57Q84StVV5
	 Q9/9aW7wDWtYB+BNkGoZYailTAxN/B/nah40UvUEjzSoG5dh8mqI1ywN59bOjPIZGu
	 lwPDAMi4lncaA==
Message-ID: <85a2fc54-836f-4513-6922-bb40506d99d3@kernel.org>
Date: Tue, 30 May 2023 13:51:20 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH 12/12] dt-bindings: fsl-dma: fsl-edma: add edma3
 compatible string
Content-Language: en-US
To: Frank Li <Frank.Li@nxp.com>, peng.fan@nxp.com, joy.zou@nxp.com,
 shenwei.wang@nxp.com, imx@lists.linux.dev
References: <20230525200148.1015154-1-Frank.Li@nxp.com>
 <20230525200148.1015154-13-Frank.Li@nxp.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230525200148.1015154-13-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/05/2023 22:01, Frank Li wrote:
> Extend Freescale eDMA driver bindings to support eDMA3 IP blocks in
> i.MX8QM and i.MX8QXP SoCs. In i.MX93, both eDMA3 and eDMA4 are now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/dma/fsl,edma.yaml     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested.
Please resend and include all necessary entries.

Best regards,
Krzysztof

