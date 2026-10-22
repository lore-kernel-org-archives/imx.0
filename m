Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689611;
	b=PpTm9M3+o39m7iIrCB4Ff71pWUiYeT7xlxDXRzWsqhlLOeJSpM3VcyHFm0gJ3b4DLdT4
	 O+7wWd8J49yGa2Dh/0w3H7Igmsgluae8SZZCdGbK2Yf67wEJNcCO25BcQ/mBmVDLBavNq
	 TM4eQG0vWaw9GTzTPZaQ0EgbGIML8/U2BbnSRoQVWDhIqp4eF8rOaE1xb8K7XppPPmKdM
	 tjgeM5HhOju9HbcboYs0IZ3NEs5wRYERY1e5gG9SRfW7Jjxrkh1UING59FKL86RAkCGeM
	 6JUKxv82e4x51Zv7Jty4e1Z9I1jHmxLOoMFhe4wlQJ69xbsuc+jNSmOXI8XB7pBvfmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=;
	b=nnhmuP5mVfLSIOMZ+UJo49OY/htYYR8zEvMvzUa//BH9jDRrQNqv+tia5CeuYm04vSEQ
	 znBIo/cMuxkKEEr3P9j9a3KgG5Gm7ia4mL5mhr8bOZwmxKTkOUzg5MbUly+HXnyC5OftO
	 ZGsrbE7KkTu4qNmi0L0bpKVIBZtffFXdTNxJ3d25ugKY/20dOFWxgBP8JQf5H/Rv2yXW9
	 3KrC1DwjMyDE6LhUBzKyZUYByxVoIK/Gr3BEJqD0x310vIq8h11PspujbvdfQ+b2rUd99
	 bj1JhgX/uLJ6Hh23sxQrmBFbU26gGj9Aw6Q0cmLm6vRlIB9ywNxuke3yDqAGI9NyB8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xDw9ObgX;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D134606A31F
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 17:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D134606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xDw9ObgX
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so731724a91.1
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689611; x=1793294411; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=;
        b=xDw9ObgXZA8KxG4x5dWajv8kJu2iX4u0pewkTlXh2DTodjLOTiQDBLVA3dyZrwFF8O
         B7lB/DHqThCI3oNUrTk/1YCCLOy6DFSwYGQQekUdiEj8szHlqJyq0z0/IXLDlxsFqH7O
         GobnZdUZZMQ6padLZCWlUrqr0xYQBzC8dyraLvggC6ELNZLi1oy7YclXn524eSbtYGvb
         AFxlA0HhBvufzSDy24XvsL4xXww3lCNozaIIZvv8AI/xyOgGlJxCqUznaQ1gVX0QKBKl
         QOlJvIjkvu7jsxOQndZZp9uvOgw8iCgV2xcz+WdpMiHHybpuOT4dQ+UFibmbf7ppMf9Z
         aoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689611; x=1793294411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7/WaXkP8DG3CQRRArbHcSvJScSIlpQ65Ll/fOy8LWE=;
        b=SFt17+cLZm9Bfdt1f2R99wb8bVenXgoL7EwYgK8O6LaeYZOFLSQUOk9zmuzinPRKik
         UYRNWjT94p71ff+YkzJawG3dZj9cBtQC8vm6KEkCzccVv7h1TCInMTF4awnpbhIrGEHe
         PXWR/WaKzcIMO2YyJx7YQgv1mgwUGgrSwxJU/3/LNTjVuyHRkccYqLN31cyYppcPUv0q
         t/0S5pL6KfWS0na1duyiebxMkdCqfuYxYM+YYMnQH27zsHS7a1U522OyJhZ3MPKearIF
         mI8YNsLY5uaL84WU1R93ylDmzdniAf+e9UIS0oxewSs/bWcsJ24jnuQIDkQUyCw+BkH2
         wMzw==
X-Forwarded-Encrypted: i=1; AKwUvBxLDJ3xyHl8zOmJ+aqp4qde6Q1FFByeEWptHJ2l3V61QNpx6GV7qJpftY7dqSThjlO+BfU=@lists.linux.dev
X-Gm-Message-State: AFq9FYIZeteRUaLgUA3crkPw4QWZzgTRi3kKgDYFooOUAqdVRuCX1D3G
	LGD5TnrMA0vTAGLEdtzeduNBoCuhgdCdghHLrQiaQ2PxlGn/ePSXLOOMBRvi1TBlLkk=
X-Gm-Gg: AYBFou2G6WY38Abhin/Muu6lejQ5D6ukoT27fofZlb57vIU8gYWJnTz+hUgb+ZQQbio
	eF7Bz4GCKOqLNhus3AzkQ+TtSHPknO6whPyZZwX36DcIeiIy4MVr2Ger0HQla1VEapNmG+QalSx
	3PGwgrx708QhIdYaweO9m+OcA2jy+TnlsgJ7cenNYNrRyybX684QGnJH5i9aOz+DXTE4C1TWqrH
	2Prtcea4cDmQVTZM8fUO/2R3RejgNK8r3C7S4q1GhezJEK3GAjI10u3byEwxI0R4+Dshy25+Z/V
	qE7ix1amsLiFoHNkfr5u7fx/rIGrboaDS3JSYrV30mlaiscR2d78hvjYSlYpARmx9AEFn03iToT
	JVFEYU2IpfDdCLeY6f40oWvu1ZeJ//HfxeQt0wPTfGZgGTzd59p35ineThDWsOwvgAErTzLu080
	S1d7SVPJ1JOFnXpZvPQZj+xblHd0qoJx9NJTH4EEQ4lHg0tA0T50Iu8oiYDW6fjdkewQ8HbbGC3
	f5MXPLH5WvGn7Ch62sQi3KelEnPtpuCqIFfJVS0yxycmnZB4oaeaUG1Bdg=
X-Received: by 2002:a17:90b:5109:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ada6c9d358mr1613182a91.33.1792689610544;
        Thu, 22 Oct 2026 10:20:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48bcb45sm4942014a91.16.2026.10.22.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:20:09 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:20:06 -0600
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
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v7 0/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI.
Message-ID: <atpFxtFoI7IUR9fS@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
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
In-Reply-To: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>

Please change every occurence of "hidden" with "implicit", here and throughout.

On Tue, Oct 20, 2026 at 12:50:20PM -0400, Frank.Li@oss.nxp.com wrote:
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI.
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
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Prevous version
> https://lore.kernel.org/imx/ail0sH1UhnQBPRkr@SMW015318/
> 
> ---
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
> Laurentiu Mihalcea (3):
>       dt-bindings: remoteproc: imx_rproc: document memory-region-names to avoid hidden ABI
>       remoteproc: imx_rpoc: use memory-region-names to avoid hidden ABI
>       arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
> 
>  .../bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++
>  arch/arm64/boot/dts/freescale/Makefile             |  3 +
>  .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------
>  drivers/remoteproc/imx_rproc.c                     | 32 ++++++++-
>  5 files changed, 125 insertions(+), 33 deletions(-)
> ---
> base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
> change-id: 20260915-memory-region-name-f950eea2b78d
> 
> Best regards,
> --  
> Frank Li <Frank.Li@nxp.com>
> 
