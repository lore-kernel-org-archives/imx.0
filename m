Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642561;
	b=cFnHfs6SUWxlE8slie/eia1+tO1ydr7xmXspDMn+tNQLtfcO/QftI5u4PY4xT8gidNmP
	 u05xHnftYXqEgkT9T1d5OXSf5ZI8cySLMvHDkiZnWinl7oH0yDSKT28o3ptINSspZWIKP
	 nw4FMSu7bS2GUV/CB+1pBQxz1z23Tzs0ESmqHnT/cKyql6ytLN+lA/HpSAdgTrkPPcfXt
	 r8suwkCX+J/O0q5NTDecUUkAFB677eVTBXR7op8AHo71+M3yw3DgvBA/trWlIXNxLD3zn
	 ovqTLj5rvjIlDlOrEA6ppuDLoHw8KuMHYTONBknVXHtjn8+wsfKgbI1QyJM28Xw8slw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=;
	b=yEya7Ei+NAzJJBnUU8X8eIQoYedXtlgC2LMxaMddGBZzQLACppZlSeo/Vl/peJHf3OzS
	 Vl0+MiZwXsCsJiYTfJz/gviNOjsFzUOlBOSBODJNV1AFoO3xdOn2y2fbLEKcAyHnvbpNj
	 JPc+W9irDVD2FON5m1iBZ6J05UDKBze6ZEH4+KQbW9/Eopy+9vq2vPhpyUzOrIaiWrnA2
	 /BsXRKJBc3eGTFJ0SGv7fjN+5PnpX1ybp6sEICXMd2rahEm1els8QouSbmvcFBEUNFuJK
	 lsahRXODci06Hbqt9kaM9QjzSw50r17GWNdi/ldXzO1lcNVZua4So0JSKMGUnVe7ihg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z5tXuQMT;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29748606A912
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 18:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29748606A912
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z5tXuQMT
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso2639972a91.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 10:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793642560; x=1794247360; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=;
        b=z5tXuQMTcpqYrYPXknPywUmN1JrAo2athpW2wXs/p5fWy9z72zn3BvhTdMes79U2nS
         zM2SX/F268YVLkU7UQdjDzXh0CilbwjGiJ/M5JKZa6gqOE3CYCQcVm0XUkCzoikfk3rT
         /ppYbagngHPblR+Kr0MGyJwvPJWL4qe0gqCYE8KFVgRCG8vNl6ATrLYm3LA+bQ09voVn
         8zEGRArFFkNDL7s83IcQGYvpqrkVxVDN/nr1QJDQYBSlrzR4bPGzcyHg1n8etTQhEGTl
         OLzROPhnxOLBGHpyp5EiweZMN3GCPfiyFnz/l/W1/ckmpQ/COf1tbgJe8yKyvG/rhsb3
         HpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642560; x=1794247360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjUwlJYpmWg4mChaZqQtsUzChcNIv0kOIN66bk7+k2A=;
        b=vJGMlCOQyrUdER+yByX1ko86dH4H/HKAXAxMSPYNbVRzVkXanSiB6g1W/+7bvCkjxG
         hmAD70L4+43dDNBz1wl++8j4nx/EFQxfTXGbIeTz2ZYfQCg3NNXvR9EBMFsrIp/owIde
         s+2zEFi661CiH4VgdNqq6p9mkX2/tc6/xgUpNlBbkb7uf906tZTucU+lNkhhDcs2Dwpp
         Y0JMOTaJXcfzs+Mw28OL9ZVI0ybjgL7eFHxa+qS9WSf0g/Y/8FFkddkVbIBf3jQL+Az7
         pzWTjf03lSHCsBQHcAmM60hviqQ1x36qg96MlKtXB/lCQgWFqWSLgtq40BgmcErQY15g
         1zXg==
X-Forwarded-Encrypted: i=1; AKwUvByRWhwk8zNF+F3DVf2p6wkaiSaLR1s25Hfu6xz/Vw77X/vpxo11ff+rIs+0qqype2jMVN4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LPSjfuCQyiWHFW47XZFyXNsx4yIFPgirqzvpj6/FJ5zM4U8Ux
	4dZoAMrSKgi1W+IqLONsb/xioT5qzFL9xfJIxgw4pbRKp0PHAKtadudccBy5wuBmSs8=
X-Gm-Gg: AYBFou3kQ/Bcfn5/R4g7FFcIkC7s6Y/VT7I1zA0AVSCq/W05yfAlxtwLRvXEHFutaJW
	M69RI9Z/tOTtKhAav1zMtF4xov5Ykv6WYwuULyV4khIwnCYWHEK3qbYRPlwqdjx9zt+MxuAw4Jo
	mfRkkNBOzk2Fw5siQvI854TZtGKhycNTUOQTgOCMFQaRhLarkKFD7NJIzp53Ake27VH9gLb5soF
	U42gtCVTlgru5vEPwqOkCxsd9JB9QlplOciAPInz0tihsw2ELsygvS/e67shC+vGxYksm2Ft9kD
	JKXu5KZHXxTXV5kkG0kyIaslauyFdDDTB94vp7fM3qHuevd8dKUEk31ZAyjrjSxkYoi7S522+fr
	N0uPebNS1WlXx8w/KoV/LZd5bKOZby8MvJNna2DopYuoKCe3tIyn0mpIYKREoYxjPniMG/oABlb
	g74Z5xb0JzcMfm9NwFR9uGLtK8xEDR+Cc/rCmXA0uyiakRYvjB3I+L7DC9iMjhmOlbV1ajRHJpq
	TlYYkWlYK+PUFV2/7rIohfB73Rvy/uInKPhZ2bPho5c5vgNCvM9PllPPE3mry5qktWCFxkvwXoi
	/eQjVsbcqHup1kIdifKMS6vR0ldDRD4=
X-Received: by 2002:a17:90b:53c7:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3ae89559e5emr5539384a91.5.1793642558875;
        Mon, 02 Nov 2026 10:02:38 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:810a:982d:b93e:e497])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f37e7esm8969537a91.1.2026.11.02.10.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:02:38 -0800 (PST)
Date: Mon, 2 Nov 2026 12:02:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v9 0/2] remoteproc: imx_rpoc: use memory-region-names to
 avoid implicit ABI.
Message-ID: <aujQO2gXhYx8NTwK@p14s>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>

On Fri, Oct 23, 2026 at 03:52:48PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a implicit DT ABI.
> 
> rsc_table: rsc-table@90000000
>            ^^^^^^^^
> {	ret  = <0x90000000>;
> 	no-map;
> }
> 
> m4 {
> 	...
> 	memory-region = <&rsc_table>;
> }
> 
> Current require node name have to be rsc-table, but no any binding doc
> to restrict it.
> 
> Since memory node names are not constrained by the binding, incorrect names
> can silently pass DT validation, as seen in examples using "vdevbuffer"
> instead of "vdev0buffer" ([1] and [2]).
> 
> Add optional memory-region-names property to define such ABI. To keep
> back compactiblity, use "optional".
>

Applied.

Thanks,
Mathieu
 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
> 
> ---
> Changes in v9:
> - s/hidden/implicit/g, sorry, missed at v8
> - Link to v8: https://patch.msgid.link/20261022-memory-region-name-v8-0-ce5ce514a550@nxp.com
> 
> Changes in v8:
> - remove dev_warning
> - remove dts patches
> - Link to v7: https://patch.msgid.link/20261020-memory-region-name-v7-0-1413d5928340@nxp.com
> 
> Changes in v7:
> - move imx_rproc_rmem_to_resource() close to caller
> - collect Francesco and peng fan's review tag
> - Link to v6: https://patch.msgid.link/20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com
> 
> Changes in v6:
> - collect rob's review-by tags for binding
> - move imx_rproc_rmem_to_resource to c file
> - dts move related memory region node into overlay file
> - Link to v5: https://patch.msgid.link/20261015-memory-region-name-v5-0-abc358b39a96@nxp.com
> 
> Changes in v5:
> - fix binding region-memory-names's pattern
> - add vdev1vring0 and vdev1vring1 at dts
> - collect pan peng's review by tags
> - Link to v4: https://patch.msgid.link/20260917-memory-region-name-v4-0-260755920ebf@nxp.com
> 
> Change in v3
> - rephrase commit message and cover letter to correct descritpion and
> reasons.
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Mathieu Poirier <mathieu.poirier@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-remoteproc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Laurentiu Mihalcea (2):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid implicit ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid implicit ABI
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 ++++++++
>  drivers/remoteproc/imx_rproc.c                     | 29 ++++++++++++++++++++--
>  2 files changed, 38 insertions(+), 2 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
> 
> Best regards,
> --  
> Frank Li <Frank.Li@nxp.com>
> 
