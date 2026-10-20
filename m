Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792476816;
	b=O8ztxOdyDwNM2FMssZbtMjdu+Xo/VIDmHJt44e5zkI1MTZ4Kk5M+I2/XLuFi+qB42yTc
	 nRu7jPCndCRTGKZ9Gtyfpx9I+CCQQ/FkKUC1v0cPXHf1ySqo0a8qIwOKNk86G/Crb0wOd
	 SD378oHYvfAP9t4bCecgwEizIMQRoRi31a3lBepeVT8xKn6u4wA19RCnbK1rscG2kuQoE
	 1UDzMy84I93YoJPaH9+wLNhxuIqN48c4kDbOeQjyyKIPeSOtjplK0d6XpBpgOJEr2+dYP
	 FYxucZVppLedCNxVNUkTd6o1rj2KseXxgXnx3ISb2aqkWMQB3RT55Bl1pZOGntjL64g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476816;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=;
	b=RSpUVwG4XGyVFgxg6sp2NxEL4OhFQM3febJkhtJ7vUrthYqQsgDWfCj0eJAmPqg6DL7Z
	 eb2UsWINxgiN0gdldHqsFf3UL3OGKBzTv2WJylfFEaNp/Xn6jYs4vVmjLCgljWDF0HTMt
	 TTOpr/JFN2VDYsqz5RtbpSQC6ZQwD0LfpFMPHBFYKMbl+4vMT33hGg0BNa+5pZ11vzxTt
	 f5g6bBHTp0dguIlG8S3Ql1er+Z/Aeh2Z2JW70/YUgWOi8cd44Z7TaLxL7k8qgdg5tRISf
	 OhXoCe0tiPwf96WeuycMovCDMxBRDGB+JH1UCrrS5oH7yHIVYvu024a6eUEodINWtlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=BDwYEB0W;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Lu1GRVPG;
	arc=fail smtp.remote-ip=185.56.87.4
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDC3606A322
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 06:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDC3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=BDwYEB0W;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=Lu1GRVPG
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; s=arckey; t=1792476815;
	 b=WNvUpp4vx1l69v5SAoy6iH1ia5vXotjx18MTniscYYR9fZgbYADi1ro8Qy+84F9vcbHpKJwTtz
	  wr2awIguhKbgfKHWrHHbYRP5c77WCgMFENpISPXPnmlSVpd7q6sPSgotpPhj3hd2Msmv7PJB5M
	  8Px4zOD79FLpcLaN8wJALNzf1Hfp9uFe+OenmgpdVWduF0856nID07xuQKRy2A3PtFMJsDd8/c
	  zfYXkAoSgEb3dm3lM2eIvrJSXCUEHWbFsbnjdtpgLTg2/wcjCgo7gX1V1kLOrtY1hjodZAZZWp
	  RwwGt5RycRcPOr+mvlFYv0XcKjXZsniN0ww42m+3uxdV+w==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; s=arckey; t=1792476815;
	bh=BLyVi9noksr977RBj4Cms4tPuxnqjRaYZqn2pFov1I8=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=w9rUkBbouqrw3zB14GCQKN46gv5DRTGw2j1aQ3dTiJRN6qn1tqGLJA9az1/wwH/hl2nuuQZKCE
	  AUfY7GixIf5vShx1RoV0/Bw/U/wKz+1S6Z+KKF5qpD32H3hoOOeBOUXzHlpyxeNOQGGgb75rMG
	  E/uHWFUD24J1SyZXGRw64SEpIdwAR7Ws7c57IqrJWb6rAzF9F/Dh276f9YhbVxY0hatOAG/GPb
	  cf3CftPl47zsQsR1iCKEPqC7F+64FdMnyGY11Ut+udHeLeHMNve5hSVJRJoG52BXzf3hIBy7Gu
	  5GgjzsHnySmvQEqYW5wmf2/zPOE6VBm23V18sPdbe11mgA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=; b=BDwYEB0WdpMSYAxs8NKGT9yqHH
	qFn3WAuMfTf6xDLQBOCkQA72mZlm7Lab3mC4LDS8s0E6S9nuurLtcVgFGWGikCxkVYbSMXjsnIzVs
	oZnQb3moDB5kXfa72pUl9C5JBq6+9WX+EDX2HCzH/iy7oCNmCU1srKc+9pvGPpA1p3MA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c54f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xJ36F-00000005kW2-1mE2
	for imx@lists.linux.dev;
	Tue, 20 Oct 2026 06:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=VBod7zScKYToVtl6NM7uKvGih1bUiQG6dq4Lml4LGug=; b=Lu1GRVPGNdmlqmsYH5zsLHzoUD
	w9j7LpHN9aAToa+3AdoDIDlTFJZuelB/VAauhlvvjFMElg6G+qCBXQO/Zf3+sPVC9QqpJ7g85SQWQ
	4xkAWIvKObsXe0uveYUhD1ZKj7JBvyjSPOIkiRw1J3crjBYNmE99zI+w5opamT2rKI3g=;
Received: from [82.89.62.246] (port=60683 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xJ360-00000000CBU-2RNP;
	Tue, 20 Oct 2026 06:13:12 +0000
Date: Tue, 20 Oct 2026 08:13:10 +0200
From: Francesco Valla <francesco@valla.it>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <atcF6uQh0LE1UzNG@bywater>
References: <20261019-memory-region-name-v6-0-2e46b2e7d667@nxp.com>
 <20261019-memory-region-name-v6-2-2e46b2e7d667@nxp.com>
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
In-Reply-To: <20261019-memory-region-name-v6-2-2e46b2e7d667@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 70cb3b80dc2a3e4722b7395af5bc37d8
X-AntiAbuse: ID - 70cb3b80dc2a3e4722b7395af5bc37d8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xJ36F-00000005kW2-1mE2-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Laurentiu,

On Mon, Oct 19, 2026 at 02:55:49PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 581bb07f5893f..714c3615d1884 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -28,6 +28,25 @@
>  #include "imx_rproc.h"
>  #include "remoteproc_internal.h"
>  
> +static int imx_rproc_rmem_to_resource(struct device_node *np,
> +				      int index,
> +				      struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +

The position of this code here seems wrong - please move it down in this
same file, near the other functions.

With that fixed:

  Reviewed-by: Francesco Valla <francesco@valla.it>

>  #define IMX7D_SRC_SCR			0x0C
>  #define IMX7D_ENABLE_M4			BIT(3)
>  #define IMX7D_SW_M4P_RST		BIT(2)
> @@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");
> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> 
> -- 
> 2.43.0
> 
>

Thank you!

Regards,
Francesco

